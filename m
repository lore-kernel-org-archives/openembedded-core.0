Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7B2C71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 05:32:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.23771.1750051962854783049
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 22:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82629f7152=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G4r1Yi016367
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 22:32:42 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4798kkh64n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 22:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIGljmBGnvI1902YvdaRc+J6/VeYMYOIIgZUNtHaFNyBpX8tWvBw7JaQ20aGK2SB4U1Df8wvzM9bciGvZjgrYiuOJYctRBeBprxMOetKeplDkldwEJedLpdYDUwrD7SYAodk8y3Ofh6VTt7yBLSTjTTHs3Bq5pm5ff7dVfKPWHI0Ickh1s28ve/zQ9wK+T+6adxdFyYa43xdchNvEqC9vivHSYTjI/VQDoS9RvwcFjPB8atRkxDwAzs3WHrkEEsZuZ4eug8K7409Uu9VsUDgW4NhdE+FkOKwfqQ4lU4NT8y2w7GEZVK95ooNvU2DQjpnSdcW8oHe9SQ6VaLtLIiKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LDOX+7g9B4JYR1GourYSHYYX8fGAmG+6/wcBjJZMbs=;
 b=GieuZtZbV8/PSjsaI0uAeQTayAo7jehR0hGdt6yVBFDKSRSQ2YQiJjosUGEglT7woSkkt3Tn2UOOzV2q7eKVL1ZNkCASYcxBCzCxSV6jcVT63svzJEO2Te2D5TQQhxNEdIN5dwXIa07/bY4om8jiggaNawvsMjxplWLwLSG0fh1eYj0qFlno8VtSaCjeJYC8wKlTXx4Jgna7wNDD8WShjcIQEyqkN7TLfgvvDEO4sqij4YaQPoQ2o/U1iJEztfEuSIgHT05qlBXYP6pyyvuyBVl+0VTm9N10vIPdyg3u46W761FASGZcc0WCXU9VP+6wjFFyPdpFPlcQcwvNrgg++w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH0PR11MB4950.namprd11.prod.outlook.com (2603:10b6:510:33::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.28; Mon, 16 Jun 2025 05:32:39 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8835.018; Mon, 16 Jun 2025
 05:32:39 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] net-tools: Security fix for CVE-2025-46836
Date: Mon, 16 Jun 2025 13:32:25 +0800
Message-Id: <20250616053225.3591427-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0121.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH0PR11MB4950:EE_
X-MS-Office365-Filtering-Correlation-Id: 01241cbb-17f0-44bb-05fb-08ddac973581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U1ZTL0x3b0hxdDNPcEdveCtrUmRPUDlsNXJ6SzE5a2ZFVGg4R0hoQ1pVQUlC?=
 =?utf-8?B?V25tM2dEaWxMMjdQeUMrZC9KeEdUWVNGQUpPQ0h0QmhLSC9hdDc4UFFtNDFa?=
 =?utf-8?B?YXhSVHVPbHlVdUZFd1dLNU1qdFJZL2xhT28yWS8vWU14OTY3YUVhWmJ5YzNk?=
 =?utf-8?B?STZxSUYrQnBvcUV6dUxsZXphR0JJQ3Y5aHk1TjlERXhzTEczNDFzT2FRVEtZ?=
 =?utf-8?B?TzMwdHZ0cEtkTDhLYzc5ZUhHMjdwWWNkVzBqS043cmNzZDdBMVdEaFZISjcx?=
 =?utf-8?B?U0k5dEFidGp5bndEb09sbFpBdEV5eUU2TUFkMGVOZEZWamYyUVRzdVc0QnpS?=
 =?utf-8?B?UEFLTnRlY0pic1pVanE1cTZFTEVmR1dKWnpDWW5zMW5yTjdZNGYzOXQ4T0hP?=
 =?utf-8?B?bXR0RkdtbFJlUW0vb0dNWmJWc0ZWc0grSXoyeWg2cXpUNG0xUGFJUWRlTTg0?=
 =?utf-8?B?OEk3WjZxcHhDZlBoRjk5ZVlTTFdIbDJGeEd1UTI0N0E0S1JWMjJ2Ym9OTi84?=
 =?utf-8?B?UGJKblU4dEE2K1NkVFovZWFTdTBZQ0M3NkF2SG1yUDRmMWRSbEc5TUdiNWVi?=
 =?utf-8?B?QzhPTCtFZmplRmJkaGRhRjlSd05qLzd6QmFWSUxDQXNFK09GeUJGZjZYYnRr?=
 =?utf-8?B?ZkdiM3EzMWFRK1hES3d1cWFYRytlZFpTbkF2WUN3Vi9WKzBwYk9lK2poWHND?=
 =?utf-8?B?MEdDRnJhc1pWUElFN0VtNWxRMXk4TUMxZEtOL0JIM2dSRGVKT3lpdGxSbGhv?=
 =?utf-8?B?aXg3ZmsvYThDTlNyRDVlTi9mREVlNCtGVzN4SUQ2cmd4RzRpcnlBaFBrOExE?=
 =?utf-8?B?NmN1VlgySTRxbEdYUmpkZ3dxSUVtUnFoSFJoR0tIOERJeGxpQVB3dnNxczBr?=
 =?utf-8?B?SUphcFQvZzRHRFRodnF5Z09BRlQxZ3A0aTJUbXV6bHlDYkNwYUVJcjR5U2c3?=
 =?utf-8?B?c1BtcUpLVzJNTHl5K050SXlFOUFKZ1V0YldkVVQ5eWFETUMxRFRyZ1FZRUxY?=
 =?utf-8?B?RHVWN3MzWE5BOGp2Q3d1RTg5WStMcWdJVkgrMnJsNkEyQ0ViYnZib2JJTEpK?=
 =?utf-8?B?NHNWV253OGgzOTBpdk45YnBKL1VZeEQwQjdXajlRR2lvSU1DVVFiRkg1czJa?=
 =?utf-8?B?RUFOT2FWUG9rREgxVXkvd2tMendGRThxZkMyczgvUGJWTUFaMk1lK2VQUjRh?=
 =?utf-8?B?c0pvWk9RaXM2M3FUSy9YdzVQYXNyZ3Bsajh3VkFxaExNcyt1cUVOZEhGamdx?=
 =?utf-8?B?bzF0NE5SMlhObTNuZWxVbGZTRmlVU2lSay9lVE1pV05tb3EvSEMzRWljOUZR?=
 =?utf-8?B?cW9lcUZ0b0pISGtsemxwaXpVZmFCT2lUSVBYd2VYS2xPQ1U2TDdiaHpVU2dV?=
 =?utf-8?B?YlU3R0kvK2JOcmdjOUhqWHBlcGhSMXNpQldXd0h2Zk9sN1ZKWk5mWUxHZE5V?=
 =?utf-8?B?ZmV5Ym4yYk5xMkJ2a3Vkc1gyT2REK2lBVXllaS94T2t1UFhsSXI5ZThpbzNi?=
 =?utf-8?B?bWFZNzc1Y0pFS1NPVFY2SE9kYmRqaE0wMFE3SFR0N3orZXh1NncxMDZ0MGpx?=
 =?utf-8?B?TkZ3SEtpdG5odnpTa1JETFB6bDVheFcwZGtPV0RVeU5QRG10TTdLNUdBd3Nu?=
 =?utf-8?B?Z3Y2Qm1XUmtEdHp4WVlNQTRhYlNkNFFoWWF3QUNXUTF2ZlB6WWZKQmk1Z2lZ?=
 =?utf-8?B?SWhITXd1cnM2bm1SRzRVenNVbitWTFN6eWR2TitwSEFMQWNUM1MrOHVYZVVh?=
 =?utf-8?B?YWVraGwraWQwa0lXazlTVnVmQ0pzT2pzSFc4T2lzS3JMNTZqTzgveDVqKzR0?=
 =?utf-8?B?blJQYXgyc0FDcGNFQUNsckh2TnlDenlEaTFtSG96eGJnQ1VVWTBKdXQxQWg1?=
 =?utf-8?B?NUJHRTFBUUlwMkxVK3lldHJ6QjFHRElxS3lRUHJJNEVDS2xFekNEek0zM1U0?=
 =?utf-8?B?QlFUUnYvdUhGdWg5aFJLT0ZsdFl4QmRFZkEwQmd4NzhkSlhtTGpVZ3BLUmNL?=
 =?utf-8?Q?DKaGIwo3JLvLJP6vEOOrSzdbEhZXCY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QlBIRzc0WG5NalRZU01FWTlPenZWa2pycE1wbFo4VGw2M3B6RmRxMDhVM2pT?=
 =?utf-8?B?QW40VzZwQytZcE9Jb0lRTEljZ0FWY3FxTWx5Kzl2TjZ5SDBDUUNCMld3cllE?=
 =?utf-8?B?VExyaWZ6RThSTldwTFZBSnZDM2V5VjdWM1NCZ3RCQkFwMmNjNnRNSm9weFBs?=
 =?utf-8?B?L01pYjNhQWdwUzJTVUlEUHQ1UitUeFYxSFdoYXZaSmpnbkJVV2VkTjZuZTF3?=
 =?utf-8?B?ai9wRGxhSlJnNXA3ZE9BbDlqZ1piS0NpLzVUUXJaeFlGdllsYjMzTG83UzBI?=
 =?utf-8?B?RWVPL0gvdDB5bXFEVlo4RW1xMzRzOXdJUzM0bjJrdUlqTU5kd0NDdmxwdU9x?=
 =?utf-8?B?RjJRK3V0MW5HWUFYUFZOSWpFRjdYeU1UZ1Y3eDE4QUh2bS9tSk5VSzhRbThE?=
 =?utf-8?B?Z0F0ZlpCQ3MxaFpkUmVmZXhSejR6QnB3dVRwTkRHRUFxb2c2ZmlFUUlVVG81?=
 =?utf-8?B?QVlocG1leWREVXBLZFVNSGl1ZjJKdzVnUlFjNmduaUc1b1BhVVk2WXJCUysy?=
 =?utf-8?B?c1ozUk56TktydkJlakcrVGx1SXlBdkhPajlUUzI5bWZDbG5WeXBTdWdmYlNI?=
 =?utf-8?B?eFpCWU1lQ3BSWkY5a2JLVU53dzc0QjN3Mm01bFRhK1pRK2R3RkFpSTlHT3JT?=
 =?utf-8?B?b0FGdmJyQm1TdjNzVkpSSHc1ektDZHpFUGNhWk0zZk1ScWJzZ3ZjSm8vRzZS?=
 =?utf-8?B?T1N4aVZ0K0Y2WG44d0gwWnRwdXhPMzRaMHNuS1BtZS8yckphMWk4VTJqRk5t?=
 =?utf-8?B?SGMvZEN4WjlMUEJ1K2RKaHNNbEZ5RjNBSE1NNjM5Znp5TG9HRHNSOVh5NnYz?=
 =?utf-8?B?NWJRWnFwMGZ5UUt6ZnpUaFpiWTE4WlZkbDJ4cnQ0N3J4Z3hrVHZKK2ErbG1Y?=
 =?utf-8?B?SlpHMit4Vmt3NVhxUEpHdXlTNlQ3ZlRkMXBFa3BoTUhkQXpZK0pXTzhiZndq?=
 =?utf-8?B?ODBWSWdJeWh1SkZPYzBGK2tVR0xjQUZjeWIyNkJObG53TUFRSzd4ZWdLTmZZ?=
 =?utf-8?B?SjZmWVdkeXRkaDRnVHlvMVBJT004SWg2OVRPVmxjSldHMG00TzRhN1Fkdk5p?=
 =?utf-8?B?WHR6QlI4dDh3dTVkd1FESVM0T1dSbUsraTRqLzlmQ0xWcW51VTNKRnB6LzZC?=
 =?utf-8?B?Q3hiTGl0WjMrSGtPMSt3SEdjWjJWV1k4NS9WMVlmOGtTL0NLWDdwZkZWdDlN?=
 =?utf-8?B?MU5OaVVXVytYQjBoTEdJV0ZQZEMyaFhtMzhwN3VWZVVJd2xDdFZqVCtpV3Qr?=
 =?utf-8?B?cjJ4WmtITEtSZEZlM0VSTUNibTZJaUdvOU1OOUt0MDkyQnhyZnBWY0RXQjNK?=
 =?utf-8?B?dTRjQVpJLzlNZEdzQ2tuVjY1dklGeEttZDNoSnZZN0dnWkpITWZ6cUZDSjBC?=
 =?utf-8?B?TVFRYXExNzgwRXkrNk1kVnN2by94cG9QNmlQTzd6d2J5WUFkL0tOUzRlSHJR?=
 =?utf-8?B?alpjVEY5Yk1kd3p6T2EzZUcyZ0RhcXk3cEx4S3F3Wi95bUFGckFnOU5neVd1?=
 =?utf-8?B?OFdyQWRwYkdudElkQlhxa3VvNWtGVm5wemNld21reVRoZWRBekE5L2ZjL0ho?=
 =?utf-8?B?MXJoZDg4bEkrUzB5VnJvSlp3MVcyL2FXZ28rNUwwc3BwbEd4WkpHbWd1aVpq?=
 =?utf-8?B?RkY4aDlYejZDaTNxcDIxTWNwdkgyUDljajE3Ry9vNVJHU0c4QnoxcExZWFZU?=
 =?utf-8?B?MVJuRnYxbG5qNW9BL0tpZ1VJTVA1bGZURW9RYTl4aGZtSll2UlQydDZDbEZo?=
 =?utf-8?B?UnZDa0wraUhvcW1GYXFDMnFEdVhXeXhBOU4ybWNGTlJTMzM1TWk2amVFWm0r?=
 =?utf-8?B?RVdFR3dyUkVSRWlqMHdrTTBIRHRzdzNoMzBUZHhaWEIzTWJCaDBTbDFEeStD?=
 =?utf-8?B?K1JhWjlBb1hUNTljTXo1NzhnWkVhZDBqeVU5ZFEzdnlJWnJRb0pGYllvZTFF?=
 =?utf-8?B?WDBRTC9iT29IQ29EaVZTK1lMaWJ2Nmw5V2UyT0MzcWZ2SkNQZFh4MXU4c1lI?=
 =?utf-8?B?ZUl0Vko1RDBlN0Y2Q09KcDMxemtXTzY4ZTFXZ3NjN1B4WExWR3dDUElhVUVP?=
 =?utf-8?B?byt2anJnQzZKQlladXU2TUtSUUJXODU5ZUtIb0x2THM3VzVFSFU2aDdzWGRO?=
 =?utf-8?Q?qfM+VCW+sifDxHTW9DP3jGzWE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01241cbb-17f0-44bb-05fb-08ddac973581
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:32:39.5899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0XaH0U9qbN5dy9AzcksRS0Y0f1v/8XkwnQ4LcFIsa+JSX5FZCUC40ISc/fBl2JDVMQ5Pmj+5q6cHoykvEetZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
X-Proofpoint-GUID: ShT40ZnwkInpSH5kKF1U0kY3rN4cGJwe
X-Proofpoint-ORIG-GUID: ShT40ZnwkInpSH5kKF1U0kY3rN4cGJwe
X-Authority-Analysis: v=2.4 cv=MaFsu4/f c=1 sm=1 tr=0 ts=684fac7a cx=c_pps a=kGn1I/FbrZpDzHfxqj10lA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=2z1OXlWFAAAA:8 a=6RGDHLEMwk7n6fM-XBkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=SNRPda0NjyR9MlWdJ_lJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzNSBTYWx0ZWRfX6tKet+jzJ/Iz CHtiYlMTncjC9MKDWnlP6qZsvMUEfauQ45Vo26tsAgAJ/kVNZbKq0n0G4WURjbTUYtU8VY1VWvL LkpTG3qQylRUYPNQxThvHuGJKimJlsxhpzqPxtJu6CcR3sm5m+LdLg11HFvLuKeRX1G0/sBw8Zj
 rfRpp9DRaqc+v2bwNWAq6seJgKmXolexF0awvxL1+w6Adqt+W9ImONY8krGlH3/EFOS+jhH5Lt4 2Py6hkMkI8ra8ytsPmEglvg72hxtSMPIG1JmleQO7RIqHqubZ9gTN67OXns0rAukMDN9ToXb8Nv Uai4mr8gL8vp9toV1S7dm0gHVeFwjnz0nkw78W1Fn1duBXhc8JToVDQb8SlFjkE6Qh2ZQCDMyAc
 Bx4IXGIEd1x8BtpXbUd5wnaJH2HSnxw94e8p6D5qH5PtCZViGM2tmNbqC8Nk2J8sYnv0j/vf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506160035
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55G4r1Yi016367
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 05:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218768

CVE-2025-46836:
net-tools is a collection of programs that form the base set of the
NET-3 networking distribution for the Linux operating system. Inn
versions up to and including 2.10, the Linux network utilities (like
ifconfig) from the net-tools package do not properly validate the
structure of /proc files when showing interfaces. `get_name()` in
`interface.c` copies interface labels from `/proc/net/dev` into a fixed
16-byte stack buffer without bounds checking, leading to possible
arbitrary code execution or crash. The known attack path does not
require privilege but also does not provide privilege escalation in this
scenario. A patch is available and expected to be part of version 2.20.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-46836

Patch from:
https://github.com/ecki/net-tools/commit/7a8f42fb20013a1493d8cae1c43436f8=
5e656f2d
https://github.com/ecki/net-tools/commit/ddb0e375fb9ca95bb69335540b85bbda=
a2714348

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../net-tools/net-tools/CVE-2025-46836.patch  | 129 ++++++++++++++++++
 .../net-tools/net-tools_2.10.bb               |   1 +
 2 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-extended/net-tools/net-tools/CVE-2025-46=
836.patch

diff --git a/meta/recipes-extended/net-tools/net-tools/CVE-2025-46836.pat=
ch b/meta/recipes-extended/net-tools/net-tools/CVE-2025-46836.patch
new file mode 100644
index 0000000000..5ddd0585bc
--- /dev/null
+++ b/meta/recipes-extended/net-tools/net-tools/CVE-2025-46836.patch
@@ -0,0 +1,129 @@
+From 7a8f42fb20013a1493d8cae1c43436f85e656f2d Mon Sep 17 00:00:00 2001
+From: Zephkeks <zephyrofficialdiscord@gmail.com>
+Date: Tue, 13 May 2025 11:04:17 +0200
+Subject: [PATCH] CVE-2025-46836: interface.c: Stack-based Buffer Overflo=
w in
+ get_name()
+
+Coordinated as GHSA-pfwf-h6m3-63wf
+
+CVE: CVE-2025-46836
+
+Upstream-Status: Backport
+[https://github.com/ecki/net-tools/commit/7a8f42fb20013a1493d8cae1c43436=
f85e656f2d]
+[https://github.com/ecki/net-tools/commit/ddb0e375fb9ca95bb69335540b85bb=
daa2714348]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ lib/interface.c | 63 ++++++++++++++++++++++++++++++-------------------
+ 1 file changed, 39 insertions(+), 24 deletions(-)
+
+diff --git a/lib/interface.c b/lib/interface.c
+index 71d4163..a054f12 100644
+--- a/lib/interface.c
++++ b/lib/interface.c
+@@ -211,32 +211,47 @@ out:
+ }
+=20
+ static const char *get_name(char *name, const char *p)
++/* Safe version =E2=80=94 guarantees at most IFNAMSIZ=E2=80=911 bytes a=
re copied
++   and the destination buffer is always NUL=E2=80=91terminated.        =
     */
+ {
+-    while (isspace(*p))
+-	p++;
+-    while (*p) {
+-	if (isspace(*p))
+-	    break;
+-	if (*p =3D=3D ':') {	/* could be an alias */
+-		const char *dot =3D p++;
+- 		while (*p && isdigit(*p)) p++;
+-		if (*p =3D=3D ':') {
+-			/* Yes it is, backup and copy it. */
+-			p =3D dot;
+-			*name++ =3D *p++;
+-			while (*p && isdigit(*p)) {
+-				*name++ =3D *p++;
+-			}
+-		} else {
+-			/* No, it isn't */
+-			p =3D dot;
+-	    }
+-	    p++;
+-	    break;
+-	}
+-	*name++ =3D *p++;
++    char       *dst =3D name;                 /* current write ptr     =
     */
++    const char *end =3D name + IFNAMSIZ - 1;  /* last byte we may write=
     */
++
++    /* Skip leading white=E2=80=91space. */
++    while (isspace((unsigned char)*p))
++        ++p;
++
++    /* Copy until white=E2=80=91space, end of string, or buffer full. *=
/
++    while (*p && !isspace((unsigned char)*p) && dst < end) {
++        if (*p =3D=3D ':') {                    /* possible alias veth0=
:123:  */
++            const char *dot =3D p;            /* remember the colon    =
     */
++            ++p;
++            while (*p && isdigit((unsigned char)*p))
++                ++p;
++
++            if (*p =3D=3D ':') {                /* confirmed alias     =
       */
++                p =3D dot;                    /* rewind and copy it all=
     */
++
++                /* copy the colon */
++                if (dst < end)
++                    *dst++ =3D *p++;
++
++                /* copy the digits */
++                while (*p && isdigit((unsigned char)*p) && dst < end)
++                    *dst++ =3D *p++;
++
++                if (*p =3D=3D ':')              /* consume trailing col=
on     */
++                    ++p;
++            } else {              /* if so treat as normal */
++                p =3D dot;
++            }
++            break;                          /* interface name ends here=
   */
++        }
++
++        *dst++ =3D *p++;                      /* ordinary character cop=
y    */
+     }
+-    *name++ =3D '\0';
++
++    *dst =3D '\0';                            /* always NUL=E2=80=91ter=
minate       */
+     return p;
+ }
+=20
+--=20
+2.34.1
+
+From ddb0e375fb9ca95bb69335540b85bbdaa2714348 Mon Sep 17 00:00:00 2001
+From: Bernd Eckenfels <net-tools@lina.inka.de>
+Date: Sat, 17 May 2025 21:53:23 +0200
+Subject: [PATCH] Interface statistic regression after 7a8f42fb2
+
+---
+ lib/interface.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/lib/interface.c b/lib/interface.c
+index a054f12..ca4adf1 100644
+--- a/lib/interface.c
++++ b/lib/interface.c
+@@ -239,12 +239,11 @@ static const char *get_name(char *name, const char=
 *p)
+                 /* copy the digits */
+                 while (*p && isdigit((unsigned char)*p) && dst < end)
+                     *dst++ =3D *p++;
+-
+-                if (*p =3D=3D ':')              /* consume trailing col=
on     */
+-                    ++p;
+             } else {              /* if so treat as normal */
+                 p =3D dot;
+             }
++            if (*p =3D=3D ':')                  /* consume trailing col=
on */
++                ++p;
+             break;                          /* interface name ends here=
   */
+         }
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-extended/net-tools/net-tools_2.10.bb b/meta/rec=
ipes-extended/net-tools/net-tools_2.10.bb
index 7facc0cc8d..d8090b88d2 100644
--- a/meta/recipes-extended/net-tools/net-tools_2.10.bb
+++ b/meta/recipes-extended/net-tools/net-tools_2.10.bb
@@ -11,6 +11,7 @@ SRC_URI =3D "git://git.code.sf.net/p/net-tools/code;pro=
tocol=3Dhttps;branch=3Dmaster \
     file://net-tools-config.h \
     file://net-tools-config.make \
     file://Add_missing_headers.patch \
+    file://CVE-2025-46836.patch \
 "
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1


