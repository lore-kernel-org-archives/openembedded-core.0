Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9BFC2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 07:04:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2298.1719471840289205453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 00:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=69087085fa=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R4q9Gg001704
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 07:03:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywktwvqyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 07:03:59 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45R73wPi023439
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 07:03:58 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywktwvqym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 07:03:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsWrtY6OvQdTMPfSXlgmn8dWVMMhU60m4YmC2rnMx0i9acq4DX8RMyYB/ddKyMRjzFvK5RGERBsKwFbp6yNIMnvZDe0MYxE67eVJfkjIMw3+loKqQD0Aw03rbAwiXHzxNz+W+wp1ZPJTfnKVkAkcsxwJKJj3OYnaes0guAoch4VWilELXEzBMOtAxg8GXs8BOhrqDc0o0/ak3VDhh1npnT2GqtxUBY7eO/CyNfC1pYgncaSxX9dAY6k8nFZyBpkJIeY+wnFeukKvOJSfo6Gzgere4U44AVA4jsEcyBVn1mJTqLGu9HFZ+FIAbcQ+u6KFSrhPw3BmHCcLY6DuguV55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXD/T8Y+uFvKxsxSoEOXOee5u3iyMorFwIK2+oEUuhM=;
 b=V+iIL4LgbByyRt9hR6Sj6WxYMhJR6fSDUPfFWtKPZdjm0BHGm3CR8uEtFJXW1gVRHfv0KF6fWzK4swWQILMWe4LPIbt8iOB1gyl54mMq39rZefFhe0QfA8yZSBoVZeQ+55hXbip38Su/M98tipWNDtNcvMf2GfpW7Mbk600QggsdOYuqXVHatXysb9nlP34lhEU3RljQwd3srN0RsSR0eZadHQ2XSaiFm6aWUCMiGyFEEWKJtm//fdrLy7xc8j+jBHFHky1dkbzTPisXkueLN+9dJGa+1svMrrjl/xZzycAen3P00y8q2o43z31h73InBNV7N3oM/eQ6N+I1dY91Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SA3PR11MB7528.namprd11.prod.outlook.com (2603:10b6:806:317::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Thu, 27 Jun
 2024 07:03:56 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 07:03:56 +0000
From: mingli.yu@windriver.com
To: openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com
Subject: [PATCH v3] acl: Fix nfs ptest failure
Date: Thu, 27 Jun 2024 15:03:39 +0800
Message-Id: <20240627070339.2066255-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=utf-8
X-ClientProxiedBy: TYCP286CA0265.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::17) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SA3PR11MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: e7550fe0-3bb7-47d3-95a9-08dc96774fb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R016THVaeTBtYlNELzc4SU9FQXdoelUydzRhbUJuVEtabGpWZVdEVnFQVi96?=
 =?utf-8?B?SWpWN1VadFU1bUFmLzhSZXZncTgwSXpPYkdxWXFDQ3FYV01ucjQ2TEdYTVFw?=
 =?utf-8?B?ZmVtSGFmUm1NQkdwM3pyZVRLZHpiVUJOUUk5VGpzaWV1eWlRVmx4enk4WnRT?=
 =?utf-8?B?RnVjY0hBZ1V1Q2xkZEVSUzR3bk1TMlNWb0Y3TjJSa3BwczlxWTE3cWxEMzQ3?=
 =?utf-8?B?RDdYZm1RaXlqMkk3YWhqc1Q2UXRGZGZjTDhRN3dUbE5Zakd3TGhBNTZER0tO?=
 =?utf-8?B?OWVib2RIVEUvS215eHZBb3grcEFmNlF5OWJSZGhyekhmTXB5dGhsZjZoNFFy?=
 =?utf-8?B?UlRxT1BrT2VvOXQvWEpoRGdBTEt1WWJFM013eEZhM0o4emdHT1lpaHJBWmNn?=
 =?utf-8?B?amk5eU5QbnNVa0JOdUtRN3NNOEg5UzhCUHEvS1NtM1pqZXVETDV6b0xwUC9n?=
 =?utf-8?B?QkNLRzBFdTNCK2Z2NFdqWW43a0JpWnhjUU1TR0RGVXlxZTVHNlo0WVMwUmpO?=
 =?utf-8?B?Ry9xNHBGY3BnQ01iOFEwYWVOV3V1eGxVTkRncGYrQVN2U1NaZ2FqN0IrcTVJ?=
 =?utf-8?B?bStJUlVEMFBsTWFUa1VEK0ZndTNEV0xxckxyU3EyRDJkUGJBRTE3ajh4cWtp?=
 =?utf-8?B?RlNNOGt2QnR3VHlZOG94VHhDUTNyNDlGUFJaVUJ2NDBsZDZTaXp6amQzbnU0?=
 =?utf-8?B?L2dXajU3cHFJTEJ2eVlkTmtGQWU3bVlRU3dTWWxYb1ZOVE5XeGk1TUhGb3hs?=
 =?utf-8?B?clpDeG8zWS8rMEphcjgzUVVJSEtWaWNmTmtBMXJJS2Q5d0xNQlJ3dkJWYlhZ?=
 =?utf-8?B?Y1hvQlRLaG9xbTB2MXdMVWsvRkd1ODRMcDRoOVY1aFNKK2IvRUhyM2RqQzIz?=
 =?utf-8?B?ZFFWQTRKTlFzOTkzYjdXQVVlMlRIcEMweWhMRmJ0bmhBS1RWYm1KSXdXUjBh?=
 =?utf-8?B?dXBCVXZSaHlPazAxTmpXNzNNSWVIdTRaYzIzRHFremlaQ3dUcnpteFR2L2xL?=
 =?utf-8?B?M1NDWWhuMW8wWDV0Zk1KZkVObHF4M0cvZld3MFNNOUloY0JhVEZnczhlTzIx?=
 =?utf-8?B?c1QrZDVqeDI0V3VucndXVVVXUTBzdDQxbXRBSGlhdkJ4TkdYNUhGMzRvamV5?=
 =?utf-8?B?UmhSQTd5M1dWRVJnWlRsY3F0MHpLRnJMeHRiVlpER2NGR0l3RWJNN1k1cUc2?=
 =?utf-8?B?RkxaTHNxVUtLTEpiUHRsNVowTmdRV25UKzh6b2ttTm1HRlFWZmdxWStpMWpN?=
 =?utf-8?B?dmFWRVBUV0x2U3oxNUwwUGtXQmZtVDhDVFBLS2VaRkRUcUsyMGxiV1U0NTBz?=
 =?utf-8?B?dUdmc0N2dkcxQTBDRHVhMHkxTTRvUGtjeWozQ3NPYW9wWDVRN2U0VWFCUjR2?=
 =?utf-8?B?NTBYZGdiLy8zalhNdnJpeFFFWExsVnV0THViZVBEMjJpTTRLdmpwa09hYm1L?=
 =?utf-8?B?eE54ZFZPTlAyTEg3UFlNSVFWcWF0bW1MNUxIRWZoamZIUnVUaHQwckZKTzRh?=
 =?utf-8?B?Zk5sWmZ2UzEwdERIb2JQTzJOZGw0K0hpdzFCd3I5ZmRYaFVVdmlYZ2xSSUtq?=
 =?utf-8?B?bmhVZm42elJlQ1BwRWlFVnZzbmRoQldJTUV1dGl0RmhtUDA5YmsyMlAwdGk2?=
 =?utf-8?B?UkVwaEN6MHEwOGphZDdDMDhmOVNZaDd4dkZkWGwxMy9ZWGs4dGg1aXp4aHli?=
 =?utf-8?B?ZGNLZ2pmblZTSDNNVERqSlhORmYwZlJuZFNxQ0cxbWlWcHpMcVBPN1VkMFcv?=
 =?utf-8?B?MDAwREdKaUNWay9jejVBNklXNFE3em40Z1pRTGRCYndJMk1DTEYyS1VRREFr?=
 =?utf-8?Q?Xmb0LpKf2C7F8YdHfM8rwqbNMqiCx/aKrXyfc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aXYvT2NRRjFIWWVCN2FGdUg4YURLd1VEYm5qZENzQ1pEY3ZRd0pUY010MXN6?=
 =?utf-8?B?bElRU0dhRmJzYzRsdDl2MHk2d3RQRTd4TWFIMFl3b1JxMHVqaFhBdGlwdnRV?=
 =?utf-8?B?MG1IVkhjYnM1N0J4dlJobjV3cE91b2dnUEQ0OHRRT1NIRlQ3NEFmQ2U5bUty?=
 =?utf-8?B?OGpxamtleW9DOFN3aGRhdndNZWFEQXMySkplZWFJdE5NUkRiS0FZejBoRy9m?=
 =?utf-8?B?N3V0U3VjVjZzM1U2ZkpxREtiMVo2a2FtREFDZVU1TkJYWkhHaUU5ckpXOW9x?=
 =?utf-8?B?Ym91Q05hK2x1MlFWczJEQkhhSXc5bDlOais2U1E0L2ZYTjVBcXR0ZzJLdnN6?=
 =?utf-8?B?UVl5Y1JhR2xlU3l3S3QxazMvN2Zpc1BaeklIV0lxTURONzA2WFZxTnZ0UlNG?=
 =?utf-8?B?bityTlpud3NpQWthRUc5UXRURXB3aU0wTm9DSVFMako2OC93RjFtS0RHWG90?=
 =?utf-8?B?UWc4VUtzc29MYnNzVGFJQzAxU1NJSWd5NUVoN1RHanB2RUo5M3dFM3dHQ0Nv?=
 =?utf-8?B?RmwyVW1MZUpFV0VBMXFTQTUzK2pVeVMvclFYQkk3UjVQOE51UG5JYUhWUDAy?=
 =?utf-8?B?MXlrU1VDUUJlbDlrZTZ6c0RsaXl0amo2aTFhcWppMldrb0REa254c1NtZ2g5?=
 =?utf-8?B?TldqeDZURTQwK1pPUG1rbUw1UHErajZHUGZyd0NIT0xUSVFpUUx5cHVCRVEv?=
 =?utf-8?B?eXB5aFo1cEk1NUhubXlyQWZ2bDBxWmd2enN1eHJ5WXExNk5rd0Nja09IRmdO?=
 =?utf-8?B?VzRFdys2cDJwUCs2czNiWGJBWkRsTjI1TTBhNnBnQksvS3dUL2dRQUt0c2pS?=
 =?utf-8?B?MEtoTnBQNTNwQlJDZU9CR2llM2lady95NWhlTjIrOTRQRkw5UEdHT2lRNzBu?=
 =?utf-8?B?UnBQTC9uSFpGeStuK0xuYWNNeVNaQWxCcmtKdkIwV2VOTzdNNGVmbnM0V1d3?=
 =?utf-8?B?aytxNmZzQTdNMUZXUmV6VzdBMjdkR2VtY0FCZ291ZVRwSlQ4VEdFMVFWY1Fp?=
 =?utf-8?B?L3QxTGNKM3JoRWUxa2M5VmV6bERmcStXaVg0VmNLL2hRalMwRkxtRkFoUjAx?=
 =?utf-8?B?TnJtSkliYTNpOStaUDJRUEZmWE9KZmFPd2pNT0FtcjY5VG9GNllrQUE5a3Iw?=
 =?utf-8?B?MmtuRklWRjZUdkx2OEtZOGl6c1RoQ2pXNG9pYnRnZnFPSXBSS24vME5XMk5Z?=
 =?utf-8?B?ZDdibFJvT1hSMWtYOHp2WGt5azZZMVlsV1BlcmlqVGFPN096a1FMQTAwTXl0?=
 =?utf-8?B?dEV4TE5IQnBXMWNhZm9pVjBNYjRNU0tZbmtvZ2JjRzFoUFFTNjVtalhjSzNM?=
 =?utf-8?B?OW9iNEFrbi9odU1uWU1BZUx3cU1TWnBmOEhEU3N1U291dTBWejY4SXRQL0Yz?=
 =?utf-8?B?cU43ZDBpcnh4OStlbE1LckRkck90SjJzZDh0b0xGU3VpaGs3bllTQjU5M2pl?=
 =?utf-8?B?QTVVdjFqeHhZalc3TUZTK0pOMzhVUDhGZWlZSWg2UDRRNzFmWnBCTTg5TVBO?=
 =?utf-8?B?TFN3eWg3ZHNDWWdxQU45dUxHQTducUVGdmNqY0xnbVZ6dWE4bVZITisrVjRN?=
 =?utf-8?B?bENSc3hkYWZKL1oxVkswMFAvbTMxU2dQVGtTTEU0V3NBTGdNY0hKcFBkRzhs?=
 =?utf-8?B?TmVpZG1VVjNYa3lmai9veEdEZkY0TStzL2h1N3J4VjQyL3hzcHhTaEVYVDZH?=
 =?utf-8?B?bEtVV2Ezc2phT2RFYlRtTG9mTUFTRTZoa00xd0M3SzZJbVZkVVh0blVGdlN2?=
 =?utf-8?B?WUYvRGtNTmdxa0lkdTVocHlrTDZKSWMrQW9xWWZpVWw4VmRZaThtRFZmM0k0?=
 =?utf-8?B?L1dOZkViRjVwNnBEbkFPZXBCa2pzOW5KaUhHUXdqOTd6Y1Vub1JFTGI2c2Jx?=
 =?utf-8?B?OERkNXBsRGE4T01pOW52U25LZVQrdGlvN2hPTE1tSVBTQngyTkMzbUVQaXMz?=
 =?utf-8?B?cUVmQk1OSGw4WSttVG9TdGF6TGsvR1l2dDJmRG5GN2RZWWRjOCt6bVVzditB?=
 =?utf-8?B?bTNraG14aDlHUXJ5SlNIY2Vyd2VYMlYrdjErWWxzUmFZaFNTYW1lTnZxRG9t?=
 =?utf-8?B?cHhKRy9lTmRCVlJZampmV0ttQ0ttRVpNMTFmS2ZRZDhkUS9xOHErNDd3Vi93?=
 =?utf-8?Q?+NfarauLiekyizAMu2LGr9WGe?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7550fe0-3bb7-47d3-95a9-08dc96774fb9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 07:03:56.4513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crtoQvdXnUTS4xLCn0KxRxrGtZh3V5Ex1HLxdXCsK8ga0ykl5jl0P5LuU5UznGJ20ZkqDWwsDCt9QYvdE1+bhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7528
X-Proofpoint-ORIG-GUID: c9hMz_F8K6Bi1LUhriFwuMC_F0faMPDk
X-Proofpoint-GUID: 1Qgdd-_PtjFuMoll2UMPHu5KPgqIyLKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_03,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406270052
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45R4q9Gg001704
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 07:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201188

From: Mingli Yu <mingli.yu@windriver.com>

* The date such as "Jun 13" should take 2 columns, so the expected check
item "test/sub2" should the column 9.
 # ls test/sub2 -dl
 drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2

  Corret the check item to fix the below failure in the test/nfsacl.test.
  [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}' -- fa=
iled
  drwxr-xr-x 07:23                      !=3D drwxr-xr-x test/sub2
  -rw-r--r-- 07:23                      !=3D -rw-r--r-- test/sub2/blah

* Use the abosulte path otherwise we won't find the expected file blah.

* The calls to getgrnam_r would always fail because the size of the
buffer was smaller than the minimum (170000) specified in the test
implementations of getgrnam_r and getpwnam_r.  Use test_get*_match direct=
ly
because getpwnam and getgrnam should never fail on ERANGE.

This commit fixes the following failure in the test/nfs/nfs-dir.test test=
:

[16] $ su bin -- failed
su: user bin does not exist           !=3D ~

* Add attr which provides getfattr to RDEPENDS:${PN}-ptest to fix below
test/nfs/nfsacl failure.
  [19] $ getfattr -m- test/sub -- failed\n'
       'Can\'t exec "getfattr": Nosuch file or directory at ./test/run li=
ne '
       369, <TEST_FILE> line 24. !=3D # file: test/sub\n'
       'getfattr: No such file or directory   !=3D system.posix_acl_acces=
s\n'
       '~                                 !=3D system.posix_acl_default\n=
'
       '~

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...s-nfs-dir.test-Use-the-abosulte-path.patch | 46 +++++++++++++
 ...s-nfsacl.test-Correct-the-check-item.patch | 51 ++++++++++++++
 ...0001-tests-fix-getpwnam-and-getgrnam.patch | 67 +++++++++++++++++++
 meta/recipes-support/attr/acl/run-ptest       |  2 +
 meta/recipes-support/attr/acl_2.3.2.bb        |  4 ++
 5 files changed, 170 insertions(+)
 create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.t=
est-Use-the-abosulte-path.patch
 create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.te=
st-Correct-the-check-item.patch
 create mode 100644 meta/recipes-support/attr/acl/0001-tests-fix-getpwnam=
-and-getgrnam.patch

diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use=
-the-abosulte-path.patch b/meta/recipes-support/attr/acl/0001-test-nfs-nf=
s-dir.test-Use-the-abosulte-path.patch
new file mode 100644
index 0000000000..c48ee9f820
--- /dev/null
+++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the-ab=
osulte-path.patch
@@ -0,0 +1,46 @@
+From e87562e4e03450e380bd1ce8e11c561e8f9653d2 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 17 Jun 2024 11:22:21 +0800
+Subject: [PATCH] test/nfs/nfs-dir.test: Use the abosulte path
+
+Use the abosulte path otherwise we won't find the expected file blah.
+
+Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-de=
vel/2024-06/msg00001.html]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ test/nfs/nfs-dir.test | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/test/nfs/nfs-dir.test b/test/nfs/nfs-dir.test
+index 33e5f5f..7216a6e 100644
+--- a/test/nfs/nfs-dir.test
++++ b/test/nfs/nfs-dir.test
+@@ -14,7 +14,7 @@ EXPORT_PATH =3D> the path that is mounted at the worki=
ng directory.
+ 	Make sure the file can be accessed before.
+=20
+ 	$ su bin
+-	$ cat test/blah
++	$ cat %{EXPORT_PATH}/test/blah
+ 	> blah
+=20
+ 	Set up a situation that triggers the bug.
+@@ -36,12 +36,12 @@ EXPORT_PATH =3D> the path that is mounted at the wor=
king directory.
+ 	fail with "Stale NFS file handle" or "Input/output error".
+=20
+ 	$ su bin
+-	$ cat test/blah
++	$ cat %{EXPORT_PATH}/test/blah
+ 	> blah
+ 	$ sleep 3
+-	$ cat test/blah
++	$ cat %{EXPORT_PATH}/test/blah
+ 	> blah
+-	$ cat test/blah
++	$ cat %{EXPORT_PATH}/test/blah
+ 	> blah
+=20
+ 	Clean up.
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Corr=
ect-the-check-item.patch b/meta/recipes-support/attr/acl/0001-test-nfs-nf=
sacl.test-Correct-the-check-item.patch
new file mode 100644
index 0000000000..f990ca4a31
--- /dev/null
+++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-the=
-check-item.patch
@@ -0,0 +1,51 @@
+From dfc6328f02821f9c6703f764ec6f53cf81daaab6 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 17 Jun 2024 11:00:43 +0800
+Subject: [PATCH] test/nfs/nfsacl.test: Correct the check item
+
+The date such as "Jun 13" should take 2 columns, so the expected check
+item "test/sub2" should the column 9.
+ # ls test/sub2 -dl
+drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
+
+Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-de=
vel/2024-06/msg00002.html]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ test/nfs/nfsacl.test | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/test/nfs/nfsacl.test b/test/nfs/nfsacl.test
+index 4f37322..dfcc323 100644
+--- a/test/nfs/nfsacl.test
++++ b/test/nfs/nfsacl.test
+@@ -8,7 +8,7 @@ The test should be run on an NFS export mount with ACL s=
upport.
+ 	$ echo blah > test/sub/blah
+=20
+ 	$ cp -rp test/sub test/sub2
+-	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
++	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
+ 	> drwxr-xr-x test/sub2
+ 	> -rw-r--r-- test/sub2/blah
+=20
+@@ -23,7 +23,7 @@ The test should be run on an NFS export mount with ACL=
 support.
+ 	>
+=20
+ 	$ cp -rp test/sub test/sub2
+-	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
++	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
+ 	> drwxrwxr-x+ test/sub2
+ 	> -rw-r--r-- test/sub2/blah
+=20
+@@ -31,7 +31,7 @@ The test should be run on an NFS export mount with ACL=
 support.
+=20
+ 	$ setfacl -m u:daemon:rw test/sub/blah
+ 	$ cp -rp test/sub test/sub2
+-	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
++	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
+ 	> drwxrwxr-x+ test/sub2
+ 	> -rw-rw-r--+ test/sub2/blah
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-ge=
tgrnam.patch b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-=
getgrnam.patch
new file mode 100644
index 0000000000..2fea254fec
--- /dev/null
+++ b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrnam.=
patch
@@ -0,0 +1,67 @@
+From 6398d3fe7a766b4e3cd15bb77fd0f15f7dba52b2 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Luk=3DC3=3DA1=3DC5=3DA1=3D20Zaoral?=3D <lzaoral@redhat=
.com>
+Date: Wed, 19 Jun 2024 11:11:30 +0800
+Subject: [PATCH] tests: fix getpwnam and getgrnam
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The calls to these functions would always fail because the size of the b=
uffer
+was smaller than the minimum (170000) specified in the test implementati=
ons
+of getgrnam_r and getpwnam_r.  Use test_get*_match directly because getp=
wnam
+and getgrnam should never fail on ERANGE.
+
+This commit fixes the following failure in the test/root/restore.test te=
st:
+
+[21] $ chown bin passwd -- failed
+chown: invalid user: =E2=80=98bin=E2=80=99        !=3D ~
+
+Fixes: 3737f000d3f17cd283f51eeacac21a71a3472053 ("use thread-safe getpwn=
am_r
+and getgrnam_r")
+
+Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-de=
vel/2024-06/msg00000.html]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ test/test_group.c  | 2 +-
+ test/test_passwd.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/test/test_group.c b/test/test_group.c
+index 96dd612..42d6b07 100644
+--- a/test/test_group.c
++++ b/test/test_group.c
+@@ -136,7 +136,7 @@ struct group *getgrnam(const char *name)
+ 	static struct group grp;
+ 	struct group *result;
+=20
+-	(void) getgrnam_r(name, &grp, buf, sizeof(buf), &result);
++	(void) test_getgr_match(&grp, buf, sizeof buf, &result, match_name, na=
me);
+ 	return result;
+ }
+=20
+diff --git a/test/test_passwd.c b/test/test_passwd.c
+index 9428bf8..97f2673 100644
+--- a/test/test_passwd.c
++++ b/test/test_passwd.c
+@@ -119,7 +119,7 @@ int getpwnam_r(const char *name, struct passwd *pwd,=
 char *buf, size_t buflen,
+ 		*result =3D NULL;
+ 		return ERANGE;
+ 	}
+-	last_buflen =3D- 1;
++	last_buflen =3D -1;
+=20
+ 	return test_getpw_match(pwd, buf, buflen, result, match_name, name);
+ }
+@@ -131,7 +131,7 @@ struct passwd *getpwnam(const char *name)
+ 	static struct passwd pwd;
+ 	struct passwd *result;
+=20
+-	(void) getpwnam_r(name, &pwd, buf, sizeof(buf), &result);
++	(void) test_getpw_match(&pwd, buf, sizeof(buf), &result, match_name, n=
ame);
+ 	return result;
+ }
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-suppo=
rt/attr/acl/run-ptest
index 3af75c84fe..bc7947c3ad 100644
--- a/meta/recipes-support/attr/acl/run-ptest
+++ b/meta/recipes-support/attr/acl/run-ptest
@@ -6,8 +6,10 @@
=20
 mkdir -p /tmp/acl-ptest/test
 cp test/test.* /tmp/acl-ptest/test
+export EXPORT_PATH=3D"/tmp/acl-ptest/test"
=20
 set +e
+rm -rf test-suite.log
 make test-suite.log
 exitcode=3D$?
 if [ $exitcode -ne 0 -a -e test-suite.log ]; then
diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-suppor=
t/attr/acl_2.3.2.bb
index 6178473873..5ac085c322 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.3.2.bb
@@ -19,6 +19,9 @@ SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
            file://run-ptest \
            file://0001-tests-do-not-hardcode-the-build-path-into-a-helpe=
r-l.patch \
            file://0001-test-patch-out-failing-bits.patch \
+           file://0001-test-nfs-nfsacl.test-Correct-the-check-item.patch=
 \
+           file://0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.patch=
 \
+           file://0001-tests-fix-getpwnam-and-getgrnam.patch \
            "
=20
 SRC_URI[sha256sum] =3D "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73de520=
5bac0bf6058a2f7c"
@@ -65,6 +68,7 @@ do_install_ptest:append:libc-musl() {
 }
=20
 RDEPENDS:${PN}-ptest =3D "acl \
+                        attr \
                         bash \
                         coreutils \
                         perl \
--=20
2.34.1


