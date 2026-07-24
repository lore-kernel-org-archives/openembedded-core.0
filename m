Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72A2C54EFC
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 20:04:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27390.1784923485135981018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 13:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=O8F70u8z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1665965d86=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OJjjkG2457569
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 13:04:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=4+0dxCybc5ePyEfvH4ko8Y4mCaOMbfKRW4IO5xEUdAE=; b=
	O8F70u8zyQL++4kdONqSJMWNScMZzUeDNub4kmayMk+OZbcalgpMBo7T2S2UMXow
	qKpH+6blnypjyFuIScE2KJ67AwaeCAY49X4fgQN0eaLLte/vQhw+quXKrdJFC1eQ
	tY19+ZgB1fG4IfHSeTjtDvqOBJoHA5D6Znq4tMmPkCCDSGctF5/Lo8YPmK/PFTbY
	F1dnV2CmthjU/y87p3HeGDdRY+YOEwc1DXDrldFJnwk8sG2/85emMqS3tmMFLbgW
	ioGnGOqARwH0gbx1mA9GNebD5gooXTQZr5wpatNmyr84SS22sn2z/maKwv7huFRW
	lZhaxTs/smvRLQWsVmXh5w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010014.outbound.protection.outlook.com [52.101.56.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fjt3u5g7p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 13:04:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOpfTy6CqoA2vZ1nSnkyxm5C66STd3z/+WkmCG+OkCP9De1/dSxgCY0Oz/Bo0HehRgs4Jpc2mj+lFBM0QW6OSAL5Xqs0RI/oL45A90hJqRFttrgu6AeRmAAiI32UqlEzg1QtOVMt00Th7T8B4bfi8Za4QgHtPuxzismVsbZTjTAev8aUVd+H1Fpk20tHH99E4zS25ofQPOXAFnPcYPFYMjJ8SiWt6/zr9a0q1FnHaIzs0YwHOtcvnmP181zlUdv5pGpYnhPkrPJrirUXLyCIpHiKEsaS7eKB/jdaGknT9wdS+zi5PuavvYOF5u4eL2W6OwJdJiYTEuzACO+dtAlahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+0dxCybc5ePyEfvH4ko8Y4mCaOMbfKRW4IO5xEUdAE=;
 b=aD4ZrIRvDnRF9cZQeQr/vahec/b3VI95liLqKD2ZCRzkKQIPoolYIC/5Xv+4L3Zi4f4jlF+1Db381brZJHKu6Tf3maOxyp0k12FXS4pSWnVEqqBDISwLNNfqLhfpQyyTjsIf4D988Ty3uiOWaVP2rLkXme9y/8McQN+vUmd3uCni+rjuiZfNFZcIUsaaQZ0ssrYoE0nw6DzSgcI8hmYkvgciFfiJocQsVLiIRqkMCZBhV31kZ8AN1ijn4BSGKHLv35Wy/IYIRx2gxSkPKQpdT5JeQQJEXlTi1fT7MpmhqSM4Fr1SHNH0Pgvj5Z116krk13W+1a1HOwAznW0DdLHKzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 20:04:41 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 20:04:41 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Cc: esparlin@cisco.com, mathieu.dubois-briand@bootlin.com, mattware@cisco.com,
        peter.marko@siemens.com, randy.macleod@windriver.com,
        sumanth.gavini@windriver.com
Subject: [PATCH v9 4/8] lib/oe/package.py: Filter out /usr/bin/pkg-config file dependency
Date: Fri, 24 Jul 2026 13:04:19 -0700
Message-ID: <20260724200424.954199-5-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260724200424.954199-1-sumanth.gavini@windriver.com>
References: <CANNYZj-hrPf-CVJwTaEJ6dgUuWnipYKKiPZ3r_t1_HPYhCKvYg@mail.gmail.com>
 <20260724200424.954199-1-sumanth.gavini@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::8) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 0504fb6d-1891-4708-7483-08dee9becc46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|38350700014|6133799003|56012099006|10067099003|5023799004|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	TgYQOgCcRR0uEwCjkCNkb4UoSKeMtwvjr/uK+XCLpBf8veMs/cUjJ0Zxtp21b4QxS5u/mEve1BP4VdzwZjk+a8zaW5OhrIdgQ59r+Pe1fT6JZ2Gtu+/8EDwP3PdUL3rq15nwLYhIwhyC89FdabeWDwSW5TRU53AFBBkjNId7JTRVsDJ+1nR2a7bbtgGWyCrnwdofJK7nVdqWEwoKRyEwGkyRix/bWLU9CcC+4Fyr60i5LUCdhpNW6m6k0xzbfKUTiOfnW9MERVforqCP6B1sw8lQCJNoCdST2KCBhT33TTKMIo5IPjr02Yq0AN6ReN4aHLx7y72E/m4k4Dw/dzJBhHCWZ7RpPHhIXiwZ1y6p2iPq82E/3Ai5cXeGHLLKI9vF6DzebAPppcCMDACeG9bzSD/fUOpQtESGsqiTj1L2kNRsItH+j/Gx9yjpF5k6k63f6uV2EYjeqaArN+ASXZrYxSgnwgLcMwO2OET4TTV9i+XgaDyqhXhuzNJ7A3SoteDdGKTJPOsxwg9SZqpt4Stf6vWpBGFgwX/vt7iMKnvursvr2n5qIEDooZ3ALl/TRvufFKFzOKbfjBGfTyLPo7BDofAM54SgUWR5HV9khK5g+V4uFmX6+7KFZjTDA/XhMPK9Di4iBYtmizwqE2JdHpSywBa1bJ/QHutpbpPHyRB/t+gQaHgY3GDLQCHwBw/42XTI1RDQwujFUCk0tk0OE9+S06z0pl6EYMjLZDUtmv4grpc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(38350700014)(6133799003)(56012099006)(10067099003)(5023799004)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RnJRUHVtM2Y4Y1pzU2tiQi9NZHNnS2NCNWg2MUFiWGIzd0tPQjQwdVZ3WVNE?=
 =?utf-8?B?aXpjOVBWbmx3d0xzNkdva2N0eFJSM0Fsc3I3aFIyR0tyV0Z0a004Ym90L3Vr?=
 =?utf-8?B?MElxVWZoMDdkKzlnZnlhWE9hRncxalNPTzVZQ254MUFrajdSU0t0dk52bHVP?=
 =?utf-8?B?QUQ4NG5JREIwUHhadUdCRjkxUUpDMTNOTSs5RWNrbzNidlhaMVVYNWtrcWcy?=
 =?utf-8?B?Q053MlFrYkpwYUVCdmlHdngyNmNneDBXNW1kZURyYWhzNlU5SitweExXMkhP?=
 =?utf-8?B?YUVDUzloTlZxNUt4M0pyWVlLbnBwZ05lNEJnOFM0bFVINmppZlpsYlo2c0Vh?=
 =?utf-8?B?L2FRVnJIWUx1bTNndGNGZnRUamtSU0h4aEhKMWpvTlJ6TjZGMkRPZlpGbjlj?=
 =?utf-8?B?Z2FjLy9vd0dXRWxTVUJodmdKZUIwS2JLSStDYWtzTnhnYTNPL0dKcS9OekQz?=
 =?utf-8?B?dXJxWEljUUFNdzZzc05INHNoN2NIVjZqOHdFOXVVZndPOVpEVStNL1RSN1RF?=
 =?utf-8?B?WGxRNm9BYXBaTzJETEV6c1VxNytTQzZNVmdONW1BY3lxRmVJZ1Q5KzZmcGdp?=
 =?utf-8?B?TCtqSEV1eFRyVGZhbk1Fc01pUjFUUEFxTjgyM3p5VkpYZnU5N3U1RFM3aUFP?=
 =?utf-8?B?U084YlUrdVlYQjdPcnR4YWhPY2ZDVmdZUU8yNG1yT0dqWG5wVWdldjdiMWt5?=
 =?utf-8?B?YWNwWElzUEloNTFvNFRHMlBwaEg4WlBsOGlFcnc4MDh4bGtuQWw5b3dlSjlu?=
 =?utf-8?B?MlhMTVl1ZnlyT08yZ3E2SlREUEhSOGpFQVFXWUZoTWpwZ21sSVhDT2FLUUg0?=
 =?utf-8?B?LzRDdWtNSEJ4emwrQXpsS0dYSE1pa2F1TExqVy9XR3JrUVZ3dW9KZVJEU1lG?=
 =?utf-8?B?YklIRWltOW1LV29Va3ZUeTFFUHBOQzQ3S2t3dkpVcTlRR2p1RzlDS1FCUlRt?=
 =?utf-8?B?K1ZXK1NKSy9Ra2ROT3RONkRhM3NJSE9nWk14QnlmWFZFSXByc1VZbXJIZmZG?=
 =?utf-8?B?Y25kNWdsQUROcDk3bm4xN1h3TDZIQ0gyb3JFR0ZWS2dSOTVKdnZCR3dPRzU5?=
 =?utf-8?B?OWUrbTBUaGVGMjIwZDBJTjRCbW9Sci95cG1meVkxWVBYa2NtdjVqcm1BaWVt?=
 =?utf-8?B?SVgvUEMwRk9Za3cwZWMwODYybTBLb1p2VEFvZVdUZ1F3SHZhc2pmNlZzTEpv?=
 =?utf-8?B?ZnQvMlY4RWJTcHJOamtsa2VLdWdZaXF1Q3pmTFNUYUorMzNvNVBtdTVLNlpB?=
 =?utf-8?B?Zjk4VmVDZFVqTnhqV1FMQSs2TmFLVGIyK0RITlVhZmNyWERkZFkwbGhpVnhw?=
 =?utf-8?B?emFtMWtmOVdRUnd6aEFNUUE2bmFEMWd4ZGxDU2dDc3ZKVE5zTnJBN3NYemJu?=
 =?utf-8?B?TjZuVUFPK0M2UWRQUW1TbDFlOEZrQUM0NnZxOVJOTUdVTXJDOFc4L3pHRy9n?=
 =?utf-8?B?K0FSN3lzOXNBbHU1TTFhQ00zWGcyTEpNZXdMNTRRTll3UG1uai9kUjBWcW9l?=
 =?utf-8?B?dHpKRG5zVkRWOTM5eGNJbWs0b3VsQ0V0cHo1c3JnTzVMdGhqTWVpakRGZVJZ?=
 =?utf-8?B?eW40dU82clo2aWhXUm56ZFdnYzJpdXl5cVZkZWpCRXdIaHN6dVh0UnVhMjJl?=
 =?utf-8?B?cmZQOUt4aHFSc0tMdHpId1dnVXR0L29nS3I0UURiSXljelJIaGVpZmcvSkhl?=
 =?utf-8?B?RnJpemhxcGxxMnd2ME9NaG9rKzJSa29LNlluTG1MT3RJdTBlZXVRNmNlaGIz?=
 =?utf-8?B?SHdUR2ZDYUNRS1dZMHpIeDMvZzlHWlpsMUprVE02Q0hya0NoeGxnb0hLWkdX?=
 =?utf-8?B?R3NvNzVFTUo3OVpYNU9ndkNqRkdaL0dqVUxGeHJPQlEydXpHaWhlbDV5L0ha?=
 =?utf-8?B?V2N5Tm51LzdXNnpOQkovVDlndkl4V05NeVJxN0ZHaXFNam5YdnBXUHR5TGZm?=
 =?utf-8?B?VExscUlOZmd5b3h1ck8rbWlmOEVDclExS1VKaWR6VVp6Ym13RnRzVlVtajQ3?=
 =?utf-8?B?MitadkxvTW4rMTlodjM2SVdnNnJQeGtYNjNMNnVqNTJZQlVaSUZDM3h6RWJs?=
 =?utf-8?B?YWI0Q2s4ZDkzRzNoaVl3VVd1VGRYT0lOU3h2RlZaYnZVclQ3L3R5bkVhVS9N?=
 =?utf-8?B?VXRGc054RzFVUWpSbTR4aHRNNFovaWNnZUl6UEhwVFA4UlZNMWlOM0UyQzBP?=
 =?utf-8?B?M1lMbHQ4MTR4c3NpVlRPV0JlN1JPb0J2aGVGU1c0VElxa2xoa3pZbW1zZnNn?=
 =?utf-8?B?d3k1OEJ5YWdjNWt1aSs2aWg5WVpKMDI3bU1Ua0RzdlU3T25Bc1g3WTdWU3FM?=
 =?utf-8?B?SlovVWNxejdEV2JZbDRYWkMycFJUR1NoTkVnWXdEbWQvaWNqVU5nRUoxM0Jy?=
 =?utf-8?Q?DjLsZ2x73AAZB8cc=3D?=
X-Exchange-RoutingPolicyChecked: 
	BoAmEbyO4xKozjZcMEwtW5XPYLMQfIq7R295YV48AI7s3zc4dZNevrA6QZ74xZGb50x0fr37l4IE9ozzUQOJyo6SpgmvGXBw1LBCalWbff7sDNHXF/YRCFM+y44xEXTiE6CVGQCkbVasEjraN2q/ZWPOsNkvwnh1q5u8QFQ7fhBitkRz8fj0ZfPvrpeqU6gU8SG70mg9IkzFHifDd8vkMr3X2TUNkPx0PDRlfMJ9rhfJvtlHgcgl0Lx6YEv+MjmK9Kz4ctfbOZYssGuA/+ShjBOWvx9aHWQcruAa8Vx6g/g1NinjeNW4AKdzsxCNz9XyWWiAyxvXEEjHHfSWwzK8uA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0504fb6d-1891-4708-7483-08dee9becc46
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 20:04:41.4911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQEamQfbJkD9L2bOno32641FBOANVbAqNMWqsMJhSBHRjETfGWTNLO2FjCD0+H9vbjc9QXqZ2LiSJJWfeM1Ln335VPZtDWxd6PpPrU/fO0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE4MCBTYWx0ZWRfX098tYe6KYCp8
 U7NWmswkcOqf6lcCZUXM1tn8ZCKl1sNgNDEt6p3KngvY5ea8W9t/lkx8/wsesfwTKlAZkn2HyN6
 qF5hQ+VrN+rVTJKypKHAsebqLD4ZQGvAUapSWrKZM8vN+O8DOT0cVgIsz88pPkxISTeY6XqkLaU
 4LrgWMsktoWge45iyT4przSd7hOHzhWLiCE7a0nndf4HB7sOWo7pm6XfxH0BpPuz5JNYg12DQIK
 0QrLFc2AT0KNPEFWg2apBVriAHw7FT3yLLhUFbeZoOi2Nc1fucLTayTNgtOf67hi12CdJJoeGrx
 UiXwg/2QjKNsw2cjtl4sXZYrsfa9ytxP50UJw2YweinZY00lRez4LzKVKnOARpbNQ6lAmA2M6jn
 KbplmJVXjUppArGIT/i/S40aGb5dBW4wSuDmrqQB9/NxXG5ZsqvTXMscEPcW2vNNVb6H6FKzjch
 FOJqIhKVCn9mZLEV6nA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE4MCBTYWx0ZWRfX8D4NJLCpvHce
 N5KcsvLRLVJOYCKOlCQy5WJOgAv7vJ/LxgKUZpxJ6g2O3UOB5iujp2p7OON8bNRItwdgUyuid2E
 9OVkpAY0g+0VRXc8PxdqwsjVQVXYBmLuu6kkFyCrsqVzugjZDTA9
X-Proofpoint-GUID: ghQF21bf6VaufXSxWTpvQI3iqFp5oS-f
X-Authority-Analysis: v=2.4 cv=U9yiy+ru c=1 sm=1 tr=0 ts=6a63c55c cx=c_pps
 a=A0MaZ9OvLBUdx9ibaoeqQQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=t7CeM3EgAAAA:8 a=cXaodKgrPycq8dEL5jgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: lpVNTDtoSk9_LLjmlkyCA3h4TpnJGfo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 66OJjjkG2457569
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 20:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241945

RPM's pkgconfig.attr fileattr auto-detects /usr/bin/pkg-config as a
Requires dependency for any package that ships .pc files. This causes
every -dev package to have a hard runtime dependency on pkg-config.

pkg-config is a development/build tool used at compile time to locate
libraries and flags via .pc files. It is not required at runtime on the
target.

Without this filter, do_rootfs and do_populate_sdk fail with errors
like:

  Error: nothing provides /usr/bin/pkg-config needed by
  python3-dev-3.14.6-r0.x86_64_v3 from oe-repo

This is triggered when IMAGE_FEATURES includes "ptest-pkgs" or
"dev-pkgs", or when building SDKs, because -dev packages are pulled
in and dnf cannot resolve the /usr/bin/pkg-config file dependency.

The fix filters this dependency at package generation time in
filedeprunner(), consistent with the existing filtering of python()
and perl() auto-dependencies in the same function.

Note: pkgconfig(foo) symbolic dependencies (e.g., pkgconfig(glib-2.0))
are NOT affected by this filter  they continue to work correctly for
build-time dependency resolution.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 8ccd89a190..d210b4a73b 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -253,6 +253,20 @@ def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
             if dep.startswith("python("):
                 continue
=20
+            # Ignore the file dependency on /usr/bin/pkg-config. RPM's
+            # pkgconfig.attr fileattr auto-detects this as a Requires fo=
r
+            # any package that ships .pc files. However, pkg-config is a
+            # development/build tool used at compile time to locate
+            # libraries and their flags =E2=80=94 it is not needed at ru=
ntime.
+            # Without this filter, every -dev package would pull in
+            # pkg-config as a hard runtime dependency, causing do_rootfs
+            # and do_populate_sdk failures when pkg-config is not
+            # explicitly included in IMAGE_INSTALL or TOOLCHAIN_TARGET_T=
ASK.
+            # This is consistent with how we already filter python() and
+            # perl() auto-dependencies above.
+            if dep =3D=3D '/usr/bin/pkg-config':
+                continue
+
             # Ignore all perl(VMS::...) and perl(Mac::...) dependencies.=
 These
             # are typically used conditionally from the Perl code, but a=
re
             # generated as unconditional dependencies.

