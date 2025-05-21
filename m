Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D05DC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 03:28:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2908.1747798117977365343
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 20:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7236463a26=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L1Derd016585
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 20:28:37 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfs8qud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 20:28:37 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54L3SaY1022042;
	Tue, 20 May 2025 20:28:36 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfs8quc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 20:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfxPpAJ6XttZnakz6kXvnfnoPK9YvrdIbes1i2iyF4jx0rXx6plT6yaE0GoJXCWvUnl+cDBqgXlUHGZJ/bCcHW2/8Eb0Btueyr9F0O4Zx+tdBF8uI+extha8hus5hV0LwsteTnkq86nEk7Tpy+d4TG8ELX0P3ksFwhChKtfsxPVE5Vqa2LOG3XI3TdT1TwR1YjfTv3rP7GG8Li67UllkNcD69ANpHobBkl1jzAdhPE8vfDjPmUeXcYnONIfbHbJbbshISoLLT526FMMwx5rzAfs1ycuAep5LYC7mfOKDIs3UemLhN7vXdnucQs5mgTs3WZ1qI5bmTNIAXP6Y4RirrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6ZvyxLl5w9dxpwQYBX82uOWBszVQ1P2yy9cCLDoEkI=;
 b=fvq5dCQOBQwAFfihbChkqTGreek0aQ7NnFJrZMNoCr/akpsLAJ6SXpV5TDW0PQ9QVdxer1piSQoyfpS9ho4BokLFWjgvZj0Kh4cUF8h/PTRJimxkBjXsfUBLdcedzVgl2T+HLHlmOpxTX8TOiGhgbfJR5d2/y0yiWIPn+dwrm3/b9O4Xr/qdBDbkkQ6pxTRLpHo4HQqD0vCQ/u7UjpQCJpQnQ+Dya2Nz/7ZnYMMwM5PxSJsD7+Srd2BTuEYo4StpNMyF+zv6rGAD6bYU+o6sJqxPCswgNkvtkh9gKppEHeuo9LBpiETb36/gyIbjoLXdaZhxbcVCAKbOJdZojpmFHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by MN2PR11MB4567.namprd11.prod.outlook.com (2603:10b6:208:26d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 03:28:33 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 03:28:32 +0000
Content-Type: multipart/alternative;
 boundary="------------p73Ha03qJRnDSLyDuMk1Z9NK"
Message-ID: <3fe8a12c-d5f5-43a9-b325-2cf2bcfa8a4b@windriver.com>
Date: Wed, 21 May 2025 11:28:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/4] libxml2: upgrade 2.13.8 -> 2.14.3
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org,
        "Marko, Peter" <Peter.Marko@siemens.com>
References: <20250519081000.2298461-1-hongxu.jia@windriver.com>
 <DA02WU2YGQPI.3KXN4YKUA7LDR@bootlin.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <DA02WU2YGQPI.3KXN4YKUA7LDR@bootlin.com>
X-ClientProxiedBy: TY2PR06CA0047.apcprd06.prod.outlook.com
 (2603:1096:404:2e::35) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|MN2PR11MB4567:EE_
X-MS-Office365-Filtering-Correlation-Id: c59f5379-d1ee-4c10-801a-08dd98179022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MThRMUkrZjlEemw3elRHWlQvcW56akl6OWRlRGJaTjJCM1VLUzNhYTJlckJp?=
 =?utf-8?B?cFo1bVorM2h2czcyZGFhUGJOVjhCZmQzMGVrOGZiUkdBL2FjZW5KaWoyNloy?=
 =?utf-8?B?ZVF5bXNicTdBdnJRVklZZ0ZESm5BWFluWWpFQ2lMekk0N0h5b1pndzFKNDcz?=
 =?utf-8?B?S1k5bmppK3hFT21JazZWbEllMElzNVk3aFJRVzBQRHhVMG9RTnd5TFgyZ3hz?=
 =?utf-8?B?TDJiUFAzaG1BbU5UWjUyWWl4VGVxZEIxdkNuL1lGMnBZazdkcStXeWJlU2RC?=
 =?utf-8?B?TmVmMWUyYnJsS2Q1VXRscXhhMXFHREZyYWNIVlh6VzlUWXdkNU9DQWZTMmpB?=
 =?utf-8?B?RnRCaWZaRkZOaUdCMWNYR0tacHFaaE9rYkhFQkpOUHF4dE03OU5pOWhqQnV1?=
 =?utf-8?B?dXMvUFducE5BQUJKd0pYRjdEdHI5NWJDZDhKTXhHL2kvWnJJTFNZS2Y2eGpy?=
 =?utf-8?B?QXBUZC90UVhjZVBkYUZhSWpLbTVSOVJLT3JXd2pxR0xMQTRkLzBYMU8wMWlq?=
 =?utf-8?B?TVFWTFBFbTVTZG9XRkVQRjhOdjlMNWpXRzNybUh0R0syU2Nld3hpNUhSZm5I?=
 =?utf-8?B?dG1TbVR5TkZnTGZXSGwwYmZ6emlUVlFXbG1HbEhBOC81NzNmVGltcWp1ZDlR?=
 =?utf-8?B?MWZOUTltTGY2ckJyK2ZudGRVRlEvRnlkNnNRbldEa2NJSy9HRldkYWlxd1c3?=
 =?utf-8?B?YW5naVdtaGloTkNndTNzZjloODNRM2FUM3FaZk5SRm8vaC9Yc1JnS1VNYVg1?=
 =?utf-8?B?cVRSbWxCMzcyeFpqZzk1MEVKWHNGVUZBRkRMMkY5bFBEN013WHFmV1RtWlBH?=
 =?utf-8?B?TXVOa1hmM2JPZmpkMXg0T3dOV0FDNkZsM3V5VkVJeURINWJyRzZUTThrSHJh?=
 =?utf-8?B?Q1QrbVJNYmpONFQ4dE52UEZiQU8vcHQ2R0pmSFZYRjBtSzJ3a2ZCZmptQkFU?=
 =?utf-8?B?R0daSEZkMTdDUk5UU3dVUCtJOHlZNG90SnlvT2d2QzVXTkM5MGw2QndtdTRo?=
 =?utf-8?B?VUNHNllBcXorWkgxQjFEYUxoRktVVjVySHVlWVRYUTlMejJyOHJKY1l5N2lv?=
 =?utf-8?B?MnNWSVJsRGd0cHNDaENrTFNETXhiWUp3ZW5hYjJLMTl3T1hwcDA5bjdpWnJi?=
 =?utf-8?B?N2lKdGdWNGQrV08rMmdyYlpsWGhUdXdUcGZ6TG5CcFpmaWh5eGxzMHNkZ3VT?=
 =?utf-8?B?Y1VKc09KNVJwTmQrRExIbUYwaUswem9iU1BFdit2TnozZU1za1lReDF3cDJ2?=
 =?utf-8?B?Uk8yeExCaVl3cFRxQU1iTGdMYlpwcVk5Nk41RTdlRXZmS1RiTjYvTk9RSEJl?=
 =?utf-8?B?SFp2SWVRbFpicmI0L1llRkIzQVpYcmpvWGlWdG9FRGV6ZUtmQ2U3cWg0TWNV?=
 =?utf-8?B?M0s4bHZoaTN1VU1JWS9FMC9sWnFWMWQ4MzFodS9BTk5rZTMveHpEWUswc21n?=
 =?utf-8?B?TTRjVGg0WlV4YlNrcURwZlZya0tESmNBTXV0UU5BTWIrcnJCVkdrTVlUT2Vl?=
 =?utf-8?B?WEtPWkRYN1RWQ29Dd1dON2d5WElhT3lhWVRhbWZzRlg1TXFRd0I0ZUM3d1FT?=
 =?utf-8?B?MlNKUHV1TGN2ZitjREZoRW9JSk5TM2dJVjlISXNwNjg0UEw5U0l4eElVYVpV?=
 =?utf-8?B?UGpJMzFYbWFaMmhDby9aQ200a3VLaWp6aXJEaGJqKy9EVkJzdW1pT0ZhbTRW?=
 =?utf-8?B?WUFUQTNDaUo3SElTdzVIY0lpa0RYajBKUjQ1VmFNMnpCOEI5ODJBMkErcEVW?=
 =?utf-8?B?eGlTd2MzQTZYYUpiTjBnMzRXRHZ6YTl3UDFROTlnU2ZPd3FNQ3NnRVJCQ3hm?=
 =?utf-8?B?M0J5b0wvdEF5Y29GUSswYTAwTFhHdGhES1lvLzQ1ZXVENDJURDRKZk1pTWpJ?=
 =?utf-8?Q?toBhctc5VnDiF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eFRyZVBQdFhlN3J5ZEtUZE15SU9LaGJlSzV0MHIzRFB2SGVpYkVUOTIwUkx4?=
 =?utf-8?B?Y1c3eU9HMUo3WUdoemxwOHBMUjFRd3JSRnN1MXM4SkdPVUFjRmIrdTdQeVY3?=
 =?utf-8?B?YXBKQ3lLWkJLZUJoRFg1M1RIV2lkcTBuVHlLVkk1S2lrR21SdVBHaEMxUVhZ?=
 =?utf-8?B?Zlo0QjF3bVVRdW1nTXY5ejFhTWJydzZiUUYybVlFWW0rRHRlMFhqNEtseHdi?=
 =?utf-8?B?Q01zWnROSFRtV2ZCSjU1Q1A2RCtMUDdkRzl1TjcyTEhkYU0wVDBETytPcWd6?=
 =?utf-8?B?T0VWZHpGcXBBb3JvYlFic1hnc3FteFBhRlBzZ0NtZzlHdlVuZSt1dkdEcGtQ?=
 =?utf-8?B?SUZUaTVyVDk0d3p4eFZqdk9MWVM4WnZ0WDlpNkFUMnJsUEpGRW1KTGY4a0hp?=
 =?utf-8?B?QlZjTUdRdUN4K3A5eitlSEJTb3NPRnR0OWg4YnBtVmltSlQyenRxNE5KbWZw?=
 =?utf-8?B?Wkk0VzN4TGFjeEVSY3hhcWltTWRPZjBIaWljV1pjQVVCYXY3YnRwbFk3VEVv?=
 =?utf-8?B?ZDlXR2REbjFPV05KVk1xVDlGWWxZbUlPb0hSa2UxVXRKbFYxS0JwUjhTbk8y?=
 =?utf-8?B?VWdqQk56aWI2TEVBNDdvekJ2elduZm5OV0FSbHJ1cWx1cmdmNlRnSVBWNWhv?=
 =?utf-8?B?eVorUDNETHVXRS9QbzlualhoNHMrSzB5dXl5MHRkTWh0K1JOYmhmYURRUkdy?=
 =?utf-8?B?MlA1YjNGNDZkbnlwRWVmRWExcCtxNHZ5eTlIaU83dEVoamMxWHp4NzJ4SDYw?=
 =?utf-8?B?WTVkbHVxbkFrTWtWKytTVzJNN2dtU3lwMVFHT3U4MGZqVmhDSHVGYndUVi8v?=
 =?utf-8?B?YjZ4TGl5SldKY1F4eFNDSlNDQisxeHNaN3NaMUZuMnB1c3QwZnNUYk4ybUpC?=
 =?utf-8?B?OEh4NzhBNzBkMjZ1cmZFNGhFV1pHWTcxMnI5R3FxcGlGaWNsS0V4YllNTWVt?=
 =?utf-8?B?VzBoTWpYRjV6Sm42cHJtdHhRaUxtODhtKzkxaUc3ZWFSaVl5N282a3QwYUxa?=
 =?utf-8?B?U3RBTGZEOEx5ejNQWDAzRXFiSys0SWxqVldONWo4NEd3MDFSOHdmckJzUjVG?=
 =?utf-8?B?YXp0S2hCaUI4ZUorUENHaVNRRVY0YVd0WTRZNFBpT1hTbCtOUXlwVHFvRlJO?=
 =?utf-8?B?TnNpVkg3RWV1cVVRTVgvemllTzcycmd1WGYrckhMTFZJWUZhbnVQb1Q3ZFp3?=
 =?utf-8?B?dklOdUFOdVR4UUg0K2hDNFg0UFFTbXBBS00vOE9pZEttSS90MjVJSEhUQTQ4?=
 =?utf-8?B?emp0NWxreFlYa1U5VUxvMkhkR21iVWU0anh1Y3ZBamErKy92RzZBRVluUkpJ?=
 =?utf-8?B?Q2I0cW5MM3VsN0hTZHpFZldQOUllZFMzSG9OSW5STE5TWmlMcGJFVGwxY09Z?=
 =?utf-8?B?Q0IvN3A1Znh3S1hVdVQ1M2hVRStIQXNuYzJmRFZzTjhTUGlhUmwyNndZWGE3?=
 =?utf-8?B?bzhid1RQQkd5YzUxRnJNSGhLS1FEY21SWHJndVR1bVZtc05vdWU3K2YvamFj?=
 =?utf-8?B?MEdzOTloNGk3d1A2eFlYRVZiaHR3WHdTeWg5M0JrbkRDR2xJT1pFTEpLdllP?=
 =?utf-8?B?OGJWKy9kWVRQbVE2aGlSS1NJSTBpNW16Q3E3TjF4M2VsaXV6QWpkK0lTTUhr?=
 =?utf-8?B?cFc4OE5DM1BDVFp0aXF0amZYZHRDUncrTHB2V0pxNWlLa01KNHhhSlI5anEw?=
 =?utf-8?B?eDhyL1VDVXBwbWZjazFmNHFUaTF6NTI1OFIrZUYrRFExemJQa09BQTkyK3RQ?=
 =?utf-8?B?dGRleEcwT3BWZU1USHRYdmxqZ0tWRGR5aFdBQ3JDS2txLzNFTWczMm0vRW1u?=
 =?utf-8?B?S0loN0R6dGxJWFV6QTRFNWp4WWFabTdxNzk3Q0wyckpyeGs1V1R5RStiampv?=
 =?utf-8?B?N3NPWFM0TTZXbkR1b3VKdGZtWGt4NFJVVjVLaTkrVTdnSzBMMVpWTFNabm1W?=
 =?utf-8?B?UWRFZWh3SGFNSFlqak1JTzJjeXB0TmdOSVdTVUlSUDNiZDExVTUvTWRLdUo4?=
 =?utf-8?B?TnlDeDVhc0FLSW9NOVBmTml1SytDSjRhcStRRkQ1enJTZnpBRm5xWTdCWmZs?=
 =?utf-8?B?RkhiMWx5N1dFUHoxVmRPbTZmQm02VjFDUmNzTm5mT1JBTjhKT3VSdmZlWnlk?=
 =?utf-8?B?dmtHT0lUYlh1Rks1OExoVEpXdEFtS3BvRFRKWEpPbVBtMTlZQTZiZ1U5RlF5?=
 =?utf-8?B?aHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c59f5379-d1ee-4c10-801a-08dd98179022
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 03:28:32.8827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrLK5ni8wYZRx6xgXSFO+/jczbIvT/A9QeiE3Kscgz9An1fT7Co2DFvy/7kg6Cmtx7LoqdMOsf7xqeL6GNDob/sfrLXNaucCDKdVD7uOhbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4567
X-Proofpoint-GUID: yuk-vTdB-jzbmAcgN5KILOIag0kFF0Je
X-Proofpoint-ORIG-GUID: MT1WtnN_pOVkVFMqv90F0rPgNAqPt7NY
X-Authority-Analysis: v=2.4 cv=KJNaDEFo c=1 sm=1 tr=0 ts=682d4865 cx=c_pps a=joO5rFOndlhnht97C4Lqsw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=GHR8O2WEAAAA:20 a=iGHA9ds3AAAA:8 a=a5LkSv8FAAAA:8 a=NEAV23lmAAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=X1S6rXcTnAv9j2MNFhMA:9 a=QEXdDO2ut3YA:10 a=m9p5bXcFLgAA:10 a=LVVdaqqDU9W9cF4QaU8A:9 a=xgulG8FN5qT56a1X:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=E2cWBXyb0kjxxB1PlMdk:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDAzMSBTYWx0ZWRfX1FITpIlZj/wA 4MbtsEsR2tQue4dJawxiWdmpXBfHsizt/MG3MJgYyaBEq5Ru5ugEodLzAWH2NaVBgSIcs5T702P mnjkl/bnKF2FeDo3pianCzo9ebRlyWbSRAihuUfxJve/eqRXKEWvFxLm6kBgF3ADhKK8VKqJSqn
 9bcQHsovU5PmWvIBv3glYyIjRFvzMvI8wfYanQS4SsCv3pdWOx7V9JDamAm+3a+HCD3WSUJfGxT fn9AF+ljPgvAP+gIPM1eTpIwS+7pYBmU22mAsZorV6cTD1yXUZlWPyAGbWauldEqyDw83AIAUDr keQx1LRImgsGAcWmZw4PCJRLNOuTK7gG85C1Q6Xu+i5czuoqHg2HJekM6iKAestUGMJm8IRqrxw
 OmxvssB/u1jNeroHpZMkd8Lo3T4wUaPW8lcbNYuOAWCZxaxgnSvMNFMB5q0SlPuEN2mw1eWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 03:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216963

--------------p73Ha03qJRnDSLyDuMk1Z9NK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/25 18:52, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon May 19, 2025 at 10:09 AM CEST, hongxu via lists.openembedded.org wrote:
>> - Rebase install-tests.patch
>> - Remove --enable-ipv6, due to upstream [build: Remove check for IPv6 ][2]
>>
>> License-Update: Mention contributors in Copyright [1]
>>
>> [1]https://gitlab.gnome.org/GNOME/libxml2/-/commit/4bd66d4549b2e8925a752e0daac3a189d2fec8f7
>> [2]https://gitlab.gnome.org/GNOME/libxml2/-/commit/dc6f55cf6e03ae63a40e3af9ad6879821558d6a7
>>
>> Release notes:https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.14.3
>> Regressions
>>
>>      reader: Fix reading compressed data
>>      parser: Make undeclared entities in XML content fatal
>>      save: Fix XML escape table
>>      save: Fix xmlSave with NULL encoding
>>      Revert "valid: Remove duplicate error messages when streaming"
>>
>> Bug fixes
>>
>>      save: Fix serialization of attribute defaults containing &lt;
>>      io: Fix linkage of __xml*BufferCreateFilename functions
>>
>> Build systems
>>
>>      cmake: Fix installation directories in libxml2-config.cmake
>>      meson: Install libxml2.py
>>
>> Improvements
>>
>>      parser: Make xmlCtxtGetValidCtxt depend on VALID_ENABLED
>>      html: Avoid HTML_PARSE_HTML5 clashing with XML_PARSE_NOENT
>>
>> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>> ---
> Hi,
>
> Thanks for your patches.
>
> It looks like the libxml2 upgrade is breaking the build of lttng-tools:
>
> ERROR: lttng-tools-2.13.15-r0 do_compile: oe_runmake failed
> ERROR: lttng-tools-2.13.15-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/qemuarm-alt/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/lttng-tools/2.13.15/temp/run.do_compile.60377' failed with exit code 1
> ...
> | In file included from /srv/pokybuild/yocto-worker/qemuarm-alt/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/lttng-tools/2.13.15/recipe-sysroot/usr/include/libxml2/libxml/parser.h:25,
> |                  from ../../../../lttng-tools-2.13.15/src/common/config/session-config.c:29:
> | /srv/pokybuild/yocto-worker/qemuarm-alt/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/lttng-tools/2.13.15/recipe-sysroot/usr/include/libxml2/libxml/encoding.h:173:7: note: declared here
> |   173 |     } input XML_DEPRECATED_MEMBER;
> |       |       ^~~~~
> | ../../../../lttng-tools-2.13.15/src/common/config/session-config.c:432:15: error: called object is not a function or function pointer
> |   432 |         ret = handler->input(out_str, &out_len, (const xmlChar *) in_str, &in_len);
> |       |               ^~~~~~~
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/1633

Peter has reported the issue to upstream lttng

https://bugs.lttng.org/issues/1427

Upstream replied:

```

This issue has been fixed upstream in lttng-tools master 
https://github.com/lttng/lttng-tools/commit/1eadd115f621b19937dccfc849234d2ae4063234 
<https://github.com/lttng/lttng-tools/commit/1eadd115f621b19937dccfc849234d2ae4063234> 
but has yet to be backported to stable-2.13

```

I've compared lttng-tools 2.14 vs 2.13, it is hard to backport above 
patch to stable-2.13, upstream lttng-tools rework the source code from c 
to c++

My question is should we upgrade lttng-tools/-ust/-modules to 2.14, it 
seems no stable release but RC is available,

or ask upstream to backport the fix to stable-2.13

//Hongxu

> Can you look at this failure please?
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--------------p73Ha03qJRnDSLyDuMk1Z9NK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 5/19/25 18:52, Mathieu Dubois-Briand
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DA02WU2YGQPI.3KXN4YKUA7LDR@bootlin.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Mon May 19, 2025 at 10:09 AM CEST, hongxu via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">- Rebase install-tests.patch
- Remove --enable-ipv6, due to upstream [build: Remove check for IPv6 ][2]

License-Update: Mention contributors in Copyright [1]

[1] <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libxml2/-/commit/4bd66d4549b2e8925a752e0daac3a189d2fec8f7">https://gitlab.gnome.org/GNOME/libxml2/-/commit/4bd66d4549b2e8925a752e0daac3a189d2fec8f7</a>
[2] <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libxml2/-/commit/dc6f55cf6e03ae63a40e3af9ad6879821558d6a7">https://gitlab.gnome.org/GNOME/libxml2/-/commit/dc6f55cf6e03ae63a40e3af9ad6879821558d6a7</a>

Release notes: <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.14.3">https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.14.3</a>
Regressions

    reader: Fix reading compressed data
    parser: Make undeclared entities in XML content fatal
    save: Fix XML escape table
    save: Fix xmlSave with NULL encoding
    Revert &quot;valid: Remove duplicate error messages when streaming&quot;

Bug fixes

    save: Fix serialization of attribute defaults containing &amp;lt;
    io: Fix linkage of __xml*BufferCreateFilename functions

Build systems

    cmake: Fix installation directories in libxml2-config.cmake
    meson: Install libxml2.py

Improvements

    parser: Make xmlCtxtGetValidCtxt depend on VALID_ENABLED
    html: Avoid HTML_PARSE_HTML5 clashing with XML_PARSE_NOENT

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hi,

Thanks for your patches.

It looks like the libxml2 upgrade is breaking the build of lttng-tools:

ERROR: lttng-tools-2.13.15-r0 do_compile: oe_runmake failed
ERROR: lttng-tools-2.13.15-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/qemuarm-alt/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/lttng-tools/2.13.15/temp/run.do_compile.60377' failed with exit code 1
...
| In file included from /srv/pokybuild/yocto-worker/qemuarm-alt/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/lttng-tools/2.13.15/recipe-sysroot/usr/include/libxml2/libxml/parser.h:25,
|                  from ../../../../lttng-tools-2.13.15/src/common/config/session-config.c:29:
| /srv/pokybuild/yocto-worker/qemuarm-alt/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/lttng-tools/2.13.15/recipe-sysroot/usr/include/libxml2/libxml/encoding.h:173:7: note: declared here
|   173 |     } input XML_DEPRECATED_MEMBER;
|       |       ^~~~~
| ../../../../lttng-tools-2.13.15/src/common/config/session-config.c:432:15: error: called object is not a function or function pointer
|   432 |         ret = handler-&gt;input(out_str, &amp;out_len, (const xmlChar *) in_str, &amp;in_len);
|       |               ^~~~~~~

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/1633">https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/1633</a>
</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">Peter has reported the issue to upstream lttng</span></p>
    <p><a class="moz-txt-link-freetext" href="https://bugs.lttng.org/issues/1427" style="white-space: pre-wrap;">https://bugs.lttng.org/issues/1427</a></p>
    <p>Upstream replied:<br>
    </p>
    <p>```<br>
    </p>
    <p>This issue has been fixed upstream in lttng-tools master <a class="external moz-txt-link-freetext" href="https://github.com/lttng/lttng-tools/commit/1eadd115f621b19937dccfc849234d2ae4063234">https://github.com/lttng/lttng-tools/commit/1eadd115f621b19937dccfc849234d2ae4063234</a>
      but has yet to be backported to stable-2.13</p>
    <p>```<br>
    </p>
    <p>I've compared lttng-tools 2.14 vs 2.13, it is hard to backport
      above patch to stable-2.13, upstream lttng-tools rework the source
      code from c to c++<br>
    </p>
    <p>My question is should we upgrade lttng-tools/-ust/-modules to
      2.14, it seems no stable release but RC is available,</p>
    <p>or ask upstream to backport the fix to stable-2.13</p>
    <p><span style="white-space: pre-wrap">//Hongxu</span></p>
    <pre class="moz-quote-pre" wrap="">
</pre>
    <p></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:DA02WU2YGQPI.3KXN4YKUA7LDR@bootlin.com">
      <pre class="moz-quote-pre" wrap="">
Can you look at this failure please?

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com">https://bootlin.com</a>

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------p73Ha03qJRnDSLyDuMk1Z9NK--

