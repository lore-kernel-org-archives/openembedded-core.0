Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B12BC04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 08:11:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.56007.1716192661437958092
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 01:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5870edb5a7=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K5PlDO003963
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 01:11:01 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y7bx6rq1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 01:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUvQAWGEeIF+8DT0RKTcdwE0SQhwLcVkUaSsWLWRzCC1aluYYYaGRgCOEg3RG9zROG7TCMY1xMzhwY1aV2ni4kCbs13keNI/iiD9aiPx7GwFXIy+jf8SEO5NvI1xzVWSsKmtwXbYnz/sy1+HdiA2jNUzVTMuqmRTmIiganC1JEGjapNuAW6XJUSbiJFsES+NhcZwyyy1gDuereFbWWBtaUPxW6pLB1hPWQa+jhTG5AE1cLtGFgP4kw+EPIXDxvx/hMbG+dnlVTsSk9kGtLO7oKuSxyUiwS6Wb5Et+35MFY35pjX/ADGmp3rhxOu33SQ9gQtlMr4dD7M9IMtZanx2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuEzdyG6EU5rcJV1o5l1A7t2/4EdlOZgCoN0E3NW9GY=;
 b=PL8/bxzfst1PiCoLUYbarAmdCeYVS1X0rEsWjTCuqiXdYNQTsZhNBSF4P465fDRomSd+WDCxOHDt1mUI4RSNaAgtKQ40PJHGsnkkcIqQLLf9Pq6tU6/IHKvTKhm/Vtkys/BcO7X6IjTZdGfw9XzlMizQ253S+SpXR+Aw45R62WDuB+59tVevWzJAxRyDJde8TXA5EH1OKqVcIFBR1/qM+40H6Ju6r4ML5G8R82Ee3GICFzUhXsvOtzR1Uaf60Z10q62D+ogiqE6/5orOw0Y+KcDxOykjRrY3ROCXlimb75ZxU7E0kaa/LmN97u3y0riZG7Nk7YUSvUglnXwbgXDLUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB4882.namprd11.prod.outlook.com (2603:10b6:303:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 08:10:57 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7544.052; Mon, 20 May 2024
 08:10:57 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/6] systemd/systemd-boot: upgrade from 255.4 to 255.6
Date: Mon, 20 May 2024 16:10:35 +0800
Message-Id: <20240520081040.2380736-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB4882:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff493df-3778-452d-90cf-08dc78a460a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|376005|52116005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eW5WRGFmb2l2R0oxNXRRZzJDcHJjcGdhMU9udm1qMVQ0VWdrTmYrOHJ1V1Na?=
 =?utf-8?B?WmJyT3Zxek9UWlg2cHFYQUdtQkt6dTRTTGJxRVdsQlpCekxUT1dKZW9ObUpi?=
 =?utf-8?B?SXI3NlF6YWpiZjlvN3ByTW5tMHdYbTlzMTY5WlQrck9saVJjdE4zVEZMa0d5?=
 =?utf-8?B?QzNQUnhzNTg2UWs5alpYRitob2NvalJ2U1Q3aUlXYUtWOXN6b2RHalYwTzU1?=
 =?utf-8?B?QkdwblFFeFUzMDdEbzNpQ0NjQlk3NjdUTWtpZFQxV0pIcHN2RXIvbklmWjBC?=
 =?utf-8?B?WDFuMzM2RUhpcGkrZVFJV3RjcE1UaGdFRGpwSTFzRUZYaWQ0a2FKWm82bkxs?=
 =?utf-8?B?Y0dyeCt2U3ZpbnJFM2ZIQ1d3MHc0c25UNHRNSlVsa2p5VlJuOThKNCtWTjhB?=
 =?utf-8?B?K1djTkQvajNvUWpmYXltY0d6OXNQZG8wQjc4VW95MElRWDlzNmY3UkJEVHFs?=
 =?utf-8?B?M0N4YjhhZnN1dlg3OTg0S3YyTVdaUndWTFlCNnZ4dkJOVzNyZGhxUW9EczVv?=
 =?utf-8?B?UmtYMnRtdXB1MjEwVmdpeVFpZ2ZQNk5HNi9tUkZPU3BoVUNLMzZ1NSswQ25a?=
 =?utf-8?B?MklnakFRaWdkZnBzNVF3Y1ZyMGh1R3g0bmdmTzNIQXdjd3lBbkNlWldHOSsy?=
 =?utf-8?B?YUFHckFhaHVkUVRlQ2JpUU1yTkRJeFhheFg1bkdvMExzbEphTVZYcFVoQk1q?=
 =?utf-8?B?c0ZwQzZMQU80SzlDNE1LbXF1d1NjNkxBelpRN1JYUk5Mcmd6L2hIRllaTDZq?=
 =?utf-8?B?LzBkbU5udE4rZjBFSzNXZjFRUXVpK3FzS2N4eWlTK3ljUmRoUTRsODk3Qkcw?=
 =?utf-8?B?SU1qWGJVY1ViOFp2R3FlVElnZVJYTlNpZnRicUZRYThVWTF1WEc4TnlZZ3Ry?=
 =?utf-8?B?c0lzSHVONHJESko0aWJSbXQ0WmtJZWNoLzVFR1lTbTJjd2d2Z3pBR2xCUkl6?=
 =?utf-8?B?SnJMYWo4T3lpeFo4NWpSeENnaXphc0pXY0FZb2JYNWZ4SWlEZ29mSWlpbmpQ?=
 =?utf-8?B?QWR2VzBFK01ydTJ3dXhzaWwxaEF0bVIvWWZRNnk3a3VDaE8yNTZ6UGZOTWxq?=
 =?utf-8?B?aGs4MERGWkt1a21IQnl1NHgxMkJJZitidzZreE9tSW1qclFHUEFkV1VkUXBE?=
 =?utf-8?B?WDRFWjU1TDFMeVVCcytjUzhpSWFiQUprWUp3ZEVvM00xeGk4VE8rb21JUkVV?=
 =?utf-8?B?Uk43Uk0rcFFJOVl3cUE4OXI0REdCeTBTZHU3dksvVG1hZnIwcjNNaFpCUVRI?=
 =?utf-8?B?Tm0zeDZwcXpHZHpxdEF2UnhWWUp0Vk5xL2txOHlKVjhTVGNVT01acGhYQ04x?=
 =?utf-8?B?elFRRTBBT2Z0TVNMRTljeVUvdjRSUHJ5WmdZQzlJMFA2SVlJWmFRMGlEdFNO?=
 =?utf-8?B?UXFrQWIybExIbm8xWkZFY1AxZDJwelp3NjBZVzNxaUxxT0lHbWlmelExZVJx?=
 =?utf-8?B?LzBCUE54Zy9XQVZmR3B5VGxkRk9aS3NKcStqOHpNUlZabjY3VEVFRkVzR0l5?=
 =?utf-8?B?cGoxdzNKay8xbk5jNk9hZlpmOHJHVVlXUTBGNnRSbkNDUXFVNjJqN25XT2cr?=
 =?utf-8?B?SGg2U2tFbER1RVBZaWgvcnMrZ3pvakF6Ym9RdVVVV3huenZwN1BneS9jbkJh?=
 =?utf-8?B?QmpYdXVqbzA1NWc5Y3VlR2Y4S1ZIeUNTWWpaQi9TUFJmb01HTEFiRDJVWUhI?=
 =?utf-8?B?RCsyNDJOckFsazBSeE5FYWlMNDFEMjZDQ2N6UUJvaWtuWTdERmZaU3psc2pR?=
 =?utf-8?B?ZXdjcHdiSlBGRHhuNmZJQ3k1WGVBcFlVcmFxWDJFMnlSeXJNYUp2UTExMC80?=
 =?utf-8?B?VFFwYTRPQkNlckF1enpzdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mno4ckU1WlVDbkViT2hDL2VBMzQ0WUJWKy9CNUNGS0tRNWN4dUtVN0FzMWU0?=
 =?utf-8?B?anpCUm1VUURENWpZOTF6T25naFlwYVBjYXNSbC84QzVkVlBzRmVMSEZuTWxF?=
 =?utf-8?B?cGN3TWVHUEt2d051RHpDckM0ckdONkdsRWFzUnE4SFJuQlJURGFjdmlicklF?=
 =?utf-8?B?MElneXROSGRxd2xsRW9OSmdkNGdiR2NkR0V5d25XdG9xUHl1cko3Tm9JRXNX?=
 =?utf-8?B?UW1SOW5sZjFqbmRPcWREcWZ4ZUZlRU9ZcFIzQzZsdHl1UitjZzRwRHFSckF3?=
 =?utf-8?B?VGhINEJqMXNmTGhHUFhSRkpWUGVBVjZ3d1NvWnNJclJVWXl5a2QwUWttT2dK?=
 =?utf-8?B?bzJvK1QwZkR6S0tpNlBpWHY3cWlVRy9ya0RFMmtSbEMzVXJVK1FRRVVkNFBG?=
 =?utf-8?B?Q0xLcGZRbGR2V0pLelA5K0JLUnRsTTRvTWRmSWtQWFk5N1hvelhzMjJ3UGhh?=
 =?utf-8?B?c2hIZW1ZdExYb2tTQi9aTUtYcTV5V1hHdW91anh3N2dRK01lL0ZLbmNlMHZw?=
 =?utf-8?B?enRvMHlpRHpzTldDSXplV1dJcUpTT2ZXS3RCeGJCODdSMEMrMFVSVHlSeUZ0?=
 =?utf-8?B?WFJhUFpWREtreVFnajZmRVVkZlpORHdjem1maG1RV3dUSHNtY0E2UnNoNGhl?=
 =?utf-8?B?ZHFPMlVYOUR6d0FiYVZ2N3plRWY4T2d3WDNkeTRpcm42MHZoQTJmWVUzZXFJ?=
 =?utf-8?B?SndNRVdvR05qUVFqbkdlWndBUFJqM2hGaTRlWXZiRDR1WkowbklqSVJ5RUtY?=
 =?utf-8?B?bkM3M3R1dVdjcS90RHBzbHpPaEN5RDZ1MzBxN0g2NXpGczNDWE9TK0tDZmNF?=
 =?utf-8?B?QWVPWFZsV203czdaMzQxTkRFYU4vVFFuSkFOdzYraTQzTnpxWmc1SVNiNWRm?=
 =?utf-8?B?ZlVSZmQvaXFWQUZSOGpZakxvVTRNdVc2OUpGN1dKdW5ySzUzSk1rVi9aMU5O?=
 =?utf-8?B?ZG5KRzhVZHJ3TDFKQnUzT1dSM3N2MWVadk9OUWJPUDMxU0JKTU91SkdGTmJN?=
 =?utf-8?B?WkkxQUtMQjFwWDNOblpGT1NKQ241dC9RNXlqbEF1clQ5SXpSSUxPRnluWXZB?=
 =?utf-8?B?NVNXUEI4ZGZXUjc5enQ1NVZ2Z3Z2cEM1UmdLSytrazlURzNlZUpONkNWQlVn?=
 =?utf-8?B?Wi9MYi9jd1JtNnZhRDRiZkU1cktnOURQU2hyVWxQaTZnYXlFVmUveW9jK1Jp?=
 =?utf-8?B?R2pCNzJ1NlVvL3A1cG4vdzk5Mnppdys3U1d2R3dGaUltcVZpUjQ1bGZJbUtu?=
 =?utf-8?B?UmNLdFhJU2ZuSjlJazljZ0J0c3lxekNhak1IUUwreFN5QURUOXBrblNPY0tO?=
 =?utf-8?B?R2RvWUNEV05vcGxNR2Q3cUJCNVBmcEpqN2t4TEw0YU5TVExBT0Y2RE15UFR6?=
 =?utf-8?B?MkRrajdYZkNiamY0K0c0NzFtNnJnQklzdGFuOHZKZjkyamR0SDNrUlFxKzBh?=
 =?utf-8?B?UFJjZnRlcmtnNlQvUEVrOUNMREo3K1lkSjFjSTY4OUpvTjhNVjNoU0pURlIy?=
 =?utf-8?B?SWVQOTlIQU05QVpLZ00vRWpaUG5RWnFZb2hoRllwYWUrZWQ2NW52SThqNTQ0?=
 =?utf-8?B?MWhQb21PTGdQZ25HMUtHbFR2TlpBYWFjdmJVRVhubHFjSHBtT3lRTFB4SzA2?=
 =?utf-8?B?NHZvYW5LSUZBQmlsK2ZjSStKZDFJbjBlNmZVbVdhZkc2aERVRDh1enpVUWhY?=
 =?utf-8?B?U3R2YnJ0b0MvLzFrbXdTNG1aSXkxWjhCWkoxaEtRbHVYV1BrUUIvNEpudWVM?=
 =?utf-8?B?V2diOG5YQVh5YjdTSXd3cmZlMGc5L3JDYzdKNTBWTGFYQ05tcTJjQ3VMdUFC?=
 =?utf-8?B?cUxoT2Z1QzhnaEo0K25VUWhqb3h0RDZ2QkdnUVlGU2NMZ1I2Q0R2N2s0Wjdh?=
 =?utf-8?B?WTlYSFphMCtHdHd5aVd2TndPbnduTU1LTXdycEVHZXg0VFJ2WG11bEdGK0Vq?=
 =?utf-8?B?Ym15YmY2cFpYUG45RlJ6QUV1ZDlSV1V1MEFCZm4xbC9RTk1kYzEyai9BZi96?=
 =?utf-8?B?SGYvQnVtQUx4WmVJTmp3eS9nY3VLeU03eU5PQ2NHUUI5WDRuTnFLc1djeW93?=
 =?utf-8?B?dmQ4KzRSenBKR0g4U0ZLRWNxa3F4NktBbTJoVEt6TVljNzZBWW5XdnNidkZr?=
 =?utf-8?Q?a6/V5RVc0Vc2axMiHLhSme8GE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff493df-3778-452d-90cf-08dc78a460a3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 08:10:57.5746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjprwqOwHyLGhEVtD93kjXEIUnLySm72aCvyMsALEuSbbENMguCTbKmkqJ+jQROqCx1S/ZEBAsdbTv6YAbTspQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4882
X-Proofpoint-GUID: vzYNHVfFxlDjciJoXwl4nVQ1g055A6PP
X-Proofpoint-ORIG-GUID: vzYNHVfFxlDjciJoXwl4nVQ1g055A6PP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_04,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200067
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 44K5PlDO003963
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 08:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199556

From: Chen Qi <Qi.Chen@windriver.com>

musl patches are refreshed to avoid 'patch-fuzz' error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ..._255.4.bb =3D> systemd-boot-native_255.6.bb} |  0
 ...md-boot_255.4.bb =3D> systemd-boot_255.6.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...1-missing_type.h-add-comparison_fn_t.patch |  7 +--
 ...k-parse_printf_format-implementation.patch | 13 ++---
 ...tall-dependency-links-at-install-tim.patch |  9 +--
 ...missing.h-check-for-missing-strndupa.patch | 55 +++++++++----------
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch | 14 ++---
 ...005-add-missing-FTW_-macros-for-musl.patch |  7 +--
 ...06-Use-uintmax_t-for-handling-rlim_t.patch | 11 ++--
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch | 11 ++--
 ...patible-basename-for-non-glibc-syste.patch |  8 +--
 ...implment-systemd-sysv-install-for-OE.patch |  5 +-
 ...uffering-when-writing-to-oom_score_a.patch |  9 +--
 ...compliant-strerror_r-from-GNU-specif.patch | 13 ++---
 ...definition-of-prctl_mm_map-structure.patch |  7 +--
 ...-not-disable-buffer-in-writing-files.patch | 35 ++++++------
 .../0013-Handle-__cpu_mask-usage.patch        |  7 +--
 .../systemd/0014-Handle-missing-gshadow.patch |  7 +--
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch | 11 ++--
 ...ass-correct-parameters-to-getdents64.patch |  7 +--
 .../0017-Adjust-for-musl-headers.patch        | 17 +++---
 ...trerror-is-assumed-to-be-GNU-specifi.patch |  9 +--
 ...util-Make-STRERROR-portable-for-musl.patch |  7 +--
 ...ake-malloc_trim-conditional-on-glibc.patch |  9 +--
 ...hared-Do-not-use-malloc_info-on-musl.patch |  7 +--
 ...22-avoid-missing-LOCK_EX-declaration.patch |  9 +--
 .../{systemd_255.4.bb =3D> systemd_255.6.bb}    |  0
 28 files changed, 111 insertions(+), 185 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_255.4.bb =3D> syst=
emd-boot-native_255.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_255.4.bb =3D> systemd-boo=
t_255.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_255.4.bb =3D> systemd_255.6.bb=
} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_255.4.bb b/met=
a/recipes-core/systemd/systemd-boot-native_255.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_255.4.bb
rename to meta/recipes-core/systemd/systemd-boot-native_255.6.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_255.4.bb b/meta/recip=
es-core/systemd/systemd-boot_255.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_255.4.bb
rename to meta/recipes-core/systemd/systemd-boot_255.6.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sy=
stemd/systemd.inc
index a35db5091e..8bda47dd38 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaab=
aa882bbe \
                     file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd25595107900=
8b364516c"
=20
-SRCREV =3D "387a14a7b67b8b76adaed4175e14bb7e39b2f738"
+SRCREV =3D "5810c25792d4268282dd3892af1a253b690423c9"
 SRCBRANCH =3D "v255-stable"
 SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dhttp=
s;branch=3D${SRCBRANCH}"
=20
diff --git a/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-co=
mparison_fn_t.patch b/meta/recipes-core/systemd/systemd/0001-missing_type=
.h-add-comparison_fn_t.patch
index 2aa5dee6b5..49871d16a8 100644
--- a/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-compariso=
n_fn_t.patch
+++ b/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-compariso=
n_fn_t.patch
@@ -1,7 +1,7 @@
-From 01195eb9f7d59139fb45df506ac6b3968c14a57f Mon Sep 17 00:00:00 2001
+From d4b0bb9c7651017985fdd75469f37c34ce2f2c50 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
-Subject: [PATCH 01/22] missing_type.h: add comparison_fn_t
+Subject: [PATCH] missing_type.h: add comparison_fn_t
=20
 Make it work with musl where comparison_fn_t and is not provided.
=20
@@ -56,6 +56,3 @@ index ae91534198..7f67eea38b 100644
 =20
  const char * const catalog_file_dirs[] =3D {
          "/usr/local/lib/systemd/catalog/",
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_pr=
intf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0002=
-add-fallback-parse_printf_format-implementation.patch
index 900a931632..593d6261e1 100644
--- a/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_printf_fo=
rmat-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_printf_fo=
rmat-implementation.patch
@@ -1,7 +1,7 @@
-From 872b72739e62123867ce6c4f82aa37de24cc3f75 Mon Sep 17 00:00:00 2001
+From 776913624aaf696a3b2920b8d7506b3aae042bf1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 22 May 2021 20:26:24 +0200
-Subject: [PATCH 02/22] add fallback parse_printf_format implementation
+Subject: [PATCH] add fallback parse_printf_format implementation
=20
 Upstream-Status: Inappropriate [musl specific]
=20
@@ -22,10 +22,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
  create mode 100644 src/basic/parse-printf-format.h
=20
 diff --git a/meson.build b/meson.build
-index 7419e2b0b0..01fd3ffc19 100644
+index 187e7b216d..c4694a9ddc 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -725,6 +725,7 @@ endif
+@@ -727,6 +727,7 @@ endif
  foreach header : ['crypt.h',
                    'linux/memfd.h',
                    'linux/vm_sockets.h',
@@ -34,7 +34,7 @@ index 7419e2b0b0..01fd3ffc19 100644
                    'threads.h',
                    'valgrind/memcheck.h',
 diff --git a/src/basic/meson.build b/src/basic/meson.build
-index d7450d8b44..c3e3daf4bd 100644
+index 111253e3a5..bdaa2fc5e4 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
 @@ -183,6 +183,11 @@ endforeach
@@ -429,6 +429,3 @@ index be23b2fe75..69a2eb6404 100644
 =20
  #define SNDBUF_SIZE (8*1024*1024)
 =20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-=
dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd=
/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index be231cf6b2..4c73c924ef 100644
--- a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-depende=
ncy-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-depende=
ncy-links-at-install-tim.patch
@@ -1,8 +1,8 @@
-From 29a58009a172e369ad7166e16dab2f4945c6b0d2 Mon Sep 17 00:00:00 2001
+From 661a34c3de30d4ff4a2a62c9a0573c6ce55424e4 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
-Subject: [PATCH 1/2] binfmt: Don't install dependency links at install t=
ime
- for the binfmt services
+Subject: [PATCH] binfmt: Don't install dependency links at install time =
for
+ the binfmt services
=20
 use [Install] blocks so that they get created when the service is enable=
d
 like a traditional service.
@@ -74,6 +74,3 @@ index 6861c76674..531e9fbd90 100644
 +
 +[Install]
 +WantedBy=3Dsysinit.target
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-c=
heck-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0003-=
src-basic-missing.h-check-for-missing-strndupa.patch
index 5595b5bc23..f09f2114d3 100644
--- a/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-fo=
r-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-fo=
r-missing-strndupa.patch
@@ -1,7 +1,7 @@
-From 87f1d38f40c5fe9cadf2b2de442473e4e5605788 Mon Sep 17 00:00:00 2001
+From 843c6c94bf6a29eaceeefafa420cd86a32e844d2 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
-Subject: [PATCH 03/22] src/basic/missing.h: check for missing strndupa
+Subject: [PATCH] src/basic/missing.h: check for missing strndupa
=20
 include missing.h  for definition of strndupa
=20
@@ -75,10 +75,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  51 files changed, 62 insertions(+)
=20
 diff --git a/meson.build b/meson.build
-index 01fd3ffc19..61a872b753 100644
+index c4694a9ddc..d376b76afa 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -567,6 +567,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
+@@ -569,6 +569,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
  endforeach
 =20
  foreach ident : [
@@ -87,7 +87,7 @@ index 01fd3ffc19..61a872b753 100644
          ['gettid',            '''#include <sys/types.h>
                                   #include <unistd.h>'''],
 diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
-index 5ac9f904a9..99d5122dd7 100644
+index b2032adaa5..ee9201826d 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
 @@ -20,6 +20,7 @@
@@ -111,7 +111,7 @@ index 18b16ecc0e..d2be79622f 100644
  static int cg_enumerate_items(const char *controller, const char *path,=
 FILE **ret, const char *item) {
          _cleanup_free_ char *fs =3D NULL;
 diff --git a/src/basic/env-util.c b/src/basic/env-util.c
-index d3bf73385f..16b17358ca 100644
+index a97651d7af..09fa601250 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
 @@ -19,6 +19,7 @@
@@ -123,7 +123,7 @@ index d3bf73385f..16b17358ca 100644
  /* We follow bash for the character set. Different shells have differen=
t rules. */
  #define VALID_BASH_ENV_NAME_CHARS               \
 diff --git a/src/basic/log.c b/src/basic/log.c
-index 1470611a75..9924ec2b9a 100644
+index 7a443005f6..eed69a48ee 100644
 --- a/src/basic/log.c
 +++ b/src/basic/log.c
 @@ -40,6 +40,7 @@
@@ -251,7 +251,7 @@ index f9014dc560..1d7840a5b5 100644
  static clockid_t map_clock_id(clockid_t c) {
 =20
 diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
-index 0c0b4f23c7..68fe5ca509 100644
+index 12dfdf76fa..e66332519a 100644
 --- a/src/boot/bless-boot.c
 +++ b/src/boot/bless-boot.c
 @@ -22,6 +22,7 @@
@@ -263,7 +263,7 @@ index 0c0b4f23c7..68fe5ca509 100644
  static char **arg_path =3D NULL;
 =20
 diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
-index 4237e694c0..05f9d9d9a9 100644
+index 8a9570fd21..ac4202e5ce 100644
 --- a/src/core/dbus-cgroup.c
 +++ b/src/core/dbus-cgroup.c
 @@ -25,6 +25,7 @@
@@ -275,7 +275,7 @@ index 4237e694c0..05f9d9d9a9 100644
 =20
  BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", CGroupTasksMax=
, cgroup_tasks_max_resolve);
 diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
-index 4daa1cefd3..2c77901471 100644
+index 2d05ba7e1d..61a7de0037 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
 @@ -42,6 +42,7 @@
@@ -287,10 +287,10 @@ index 4daa1cefd3..2c77901471 100644
  BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output,=
 ExecOutput);
  static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input=
, ExecInput);
 diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
-index d680a64268..e59f48103e 100644
+index 7bb026af48..a86128e40c 100644
 --- a/src/core/dbus-util.c
 +++ b/src/core/dbus-util.c
-@@ -9,6 +9,7 @@
+@@ -10,6 +10,7 @@
  #include "unit-printf.h"
  #include "user-util.h"
  #include "unit.h"
@@ -299,7 +299,7 @@ index d680a64268..e59f48103e 100644
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
 diff --git a/src/core/execute.c b/src/core/execute.c
-index ef0bf88687..bd3da0c401 100644
+index 8dbdfcf369..531bec4c92 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
 @@ -72,6 +72,7 @@
@@ -323,7 +323,7 @@ index b8e3f7aadd..8ce8ca68d8 100644
  #if HAVE_KMOD
  #include "module-util.h"
 diff --git a/src/core/service.c b/src/core/service.c
-index b9eb40c555..268fe7573b 100644
+index 42fffbbd67..80a8d05a19 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -45,6 +45,7 @@
@@ -359,7 +359,7 @@ index 016f3baa7f..b1def81313 100644
  typedef enum MountPointFlags {
          MOUNT_NOAUTO    =3D 1 << 0,
 diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remo=
te/journal-remote-main.c
-index da0f20d3ce..f22ce41908 100644
+index 2d380bc7a7..d3f5612728 100644
 --- a/src/journal-remote/journal-remote-main.c
 +++ b/src/journal-remote/journal-remote-main.c
 @@ -27,6 +27,7 @@
@@ -371,7 +371,7 @@ index da0f20d3ce..f22ce41908 100644
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
 diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index 7f3dcd56a4..41b7cbaaf1 100644
+index 87e2f28841..58275f41f1 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
 @@ -77,6 +77,7 @@
@@ -383,7 +383,7 @@ index 7f3dcd56a4..41b7cbaaf1 100644
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages process=
ed */
 diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus=
/bus-message.c
-index ff0228081f..9066fcb133 100644
+index ab8b06896d..43f9131205 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
 @@ -19,6 +19,7 @@
@@ -407,7 +407,7 @@ index c25c40ff37..57a5da704f 100644
  static int node_vtable_get_userdata(
                  sd_bus *bus,
 diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/=
bus-socket.c
-index 3c59d0d615..746922d46f 100644
+index 5ade8e99aa..7553cf319d 100644
 --- a/src/libsystemd/sd-bus/bus-socket.c
 +++ b/src/libsystemd/sd-bus/bus-socket.c
 @@ -29,6 +29,7 @@
@@ -419,7 +419,7 @@ index 3c59d0d615..746922d46f 100644
  #define SNDBUF_SIZE (8*1024*1024)
 =20
 diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-b=
us.c
-index 4a0259f8bb..aaa90d2223 100644
+index 8befc97460..6ee4d4f595 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
 @@ -46,6 +46,7 @@
@@ -443,7 +443,7 @@ index d988588de0..458df8df9a 100644
  #define MAX_SIZE (2*1024*1024)
 =20
 diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-=
journal/sd-journal.c
-index 6b9ff0a4ed..4a5027ad0f 100644
+index 7a1dd2569f..d187baad47 100644
 --- a/src/libsystemd/sd-journal/sd-journal.c
 +++ b/src/libsystemd/sd-journal/sd-journal.c
 @@ -44,6 +44,7 @@
@@ -455,7 +455,7 @@ index 6b9ff0a4ed..4a5027ad0f 100644
  #define JOURNAL_FILES_RECHECK_USEC (2 * USEC_PER_SEC)
 =20
 diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
-index b8da266e27..4bb8dd9496 100644
+index bf45974ca5..2cb7e930c0 100644
 --- a/src/login/pam_systemd.c
 +++ b/src/login/pam_systemd.c
 @@ -35,6 +35,7 @@
@@ -503,10 +503,10 @@ index c64e79bdff..eda26b0b9a 100644
  static void setup_logging_once(void) {
          static pthread_once_t once =3D PTHREAD_ONCE_INIT;
 diff --git a/src/portable/portable.c b/src/portable/portable.c
-index d4b448a627..bb26623565 100644
+index 3b2a37912f..835a3fdeaa 100644
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
-@@ -40,6 +40,7 @@
+@@ -42,6 +42,7 @@
  #include "strv.h"
  #include "tmpfile-util.h"
  #include "user-util.h"
@@ -551,7 +551,7 @@ index 8b462b5627..183ce1c18e 100644
  struct CGroupInfo {
          char *cgroup_path;
 diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
-index 4ee9706847..30c8084847 100644
+index 50de98941f..d47beccb0b 100644
 --- a/src/shared/bus-unit-util.c
 +++ b/src/shared/bus-unit-util.c
 @@ -50,6 +50,7 @@
@@ -599,7 +599,7 @@ index 83e9834bbf..74eaae6f5e 100644
  enum {
          IMPORTER_STATE_LINE =3D 0,    /* waiting to read, or reading li=
ne */
 diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
-index a5d04003bd..10392c132d 100644
+index 0a31be382f..92d629e7e0 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
 @@ -41,6 +41,7 @@
@@ -683,7 +683,7 @@ index ed22c8b679..19ebe20237 100644
  UdevEvent *udev_event_new(sd_device *dev, usec_t exec_delay_usec, sd_ne=
tlink *rtnl, int log_level) {
          UdevEvent *event;
 diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index 5f12002394..febe345b4c 100644
+index c242549654..e5b8df5c2d 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
 @@ -41,6 +41,7 @@
@@ -694,6 +694,3 @@ index 5f12002394..febe345b4c 100644
 =20
  #define RULES_DIRS ((const char* const*) CONF_PATHS_STRV("udev/rules.d"=
))
 =20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BR=
ACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd=
/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index 15877bea88..15d25e9f19 100644
--- a/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE-and=
-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE-and=
-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,8 +1,7 @@
-From 5325ab5813617f35f03806ec420829dde7104387 Mon Sep 17 00:00:00 2001
+From 2903e42c7cd727a2374d21b78950308de792ebe8 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
-Subject: [PATCH 04/22] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is n=
ot
- defined
+Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not def=
ined
=20
 If the standard library doesn't provide brace
 expansion users just won't get it.
@@ -115,7 +114,7 @@ index 9b3e73cce0..3790ba3be5 100644
 =20
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
 diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index 230ec09b97..2cc5f391d7 100644
+index 6a1c7725a1..138b3ac561 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
 @@ -73,6 +73,12 @@
@@ -131,7 +130,7 @@ index 230ec09b97..2cc5f391d7 100644
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -2434,7 +2440,9 @@ finish:
+@@ -2426,7 +2432,9 @@ finish:
 =20
  static int glob_item(Context *c, Item *i, action_t action) {
          _cleanup_globfree_ glob_t g =3D {
@@ -141,7 +140,7 @@ index 230ec09b97..2cc5f391d7 100644
          };
          int r =3D 0, k;
 =20
-@@ -2461,7 +2469,9 @@ static int glob_item_recursively(
+@@ -2453,7 +2461,9 @@ static int glob_item_recursively(
                  fdaction_t action) {
 =20
          _cleanup_globfree_ glob_t g =3D {
@@ -151,6 +150,3 @@ index 230ec09b97..2cc5f391d7 100644
          };
          int r =3D 0, k;
 =20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macr=
os-for-musl.patch b/meta/recipes-core/systemd/systemd/0005-add-missing-FT=
W_-macros-for-musl.patch
index a1dfca22cd..deb0e83b6d 100644
--- a/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-for-=
musl.patch
+++ b/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-for-=
musl.patch
@@ -1,7 +1,7 @@
-From dad7f897c0de654fa5592fda3e90f874639849f9 Mon Sep 17 00:00:00 2001
+From dcd9639657e4122b7665b01a067219f990ee3ace Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
-Subject: [PATCH 05/22] add missing FTW_ macros for musl
+Subject: [PATCH] add missing FTW_ macros for musl
=20
 This is to avoid build failures like below for musl.
=20
@@ -39,6 +39,3 @@ index 8684d064ec..70fc2b5376 100644
 =20
  static char **list_nftw =3D NULL;
 =20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-han=
dling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t=
-for-handling-rlim_t.patch
index 4be14b72ec..f02675604d 100644
--- a/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handling-r=
lim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handling-r=
lim_t.patch
@@ -1,7 +1,7 @@
-From 96e975a2412a20e5f80bd3ab144057d275eb8597 Mon Sep 17 00:00:00 2001
+From c58933386caa8e45b5e814ec4ff210b18ab401da Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
-Subject: [PATCH 06/22] Use uintmax_t for handling rlim_t
+Subject: [PATCH] Use uintmax_t for handling rlim_t
=20
 PRIu{32,64} is not right format to represent rlim_t type
 therefore use %ju and typecast the rlim_t variables to
@@ -86,10 +86,10 @@ index c1f0b2b974..61c5412582 100644
          return 1;
  }
 diff --git a/src/core/execute.c b/src/core/execute.c
-index bd3da0c401..df1870fd2f 100644
+index 531bec4c92..602a95f674 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -1045,9 +1045,9 @@ void exec_context_dump(const ExecContext *c, FILE*=
 f, const char *prefix) {
+@@ -1041,9 +1041,9 @@ void exec_context_dump(const ExecContext *c, FILE*=
 f, const char *prefix) {
          for (unsigned i =3D 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
@@ -101,6 +101,3 @@ index bd3da0c401..df1870fd2f 100644
                  }
 =20
          if (c->ioprio_set) {
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK=
_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/000=
7-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index 8d6084239e..1d4ce33712 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NOFOLL=
OW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NOFOLL=
OW-flag-to-faccessat.patch
@@ -1,7 +1,7 @@
-From 4842cff4f1329f0b5034b529d56f8ad1f234ac4c Mon Sep 17 00:00:00 2001
+From 5bf8235bc5c802908aa5d95740350927d87e953a Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
-Subject: [PATCH 07/22] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat(=
)
+Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
=20
 Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right
 thing to do and it's not portable (not supported by musl). See:
@@ -31,7 +31,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  2 files changed, 23 insertions(+), 4 deletions(-)
=20
 diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
-index 1023ab73ca..c78ff6f27f 100644
+index 6a1e2e76d1..c3f7235e09 100644
 --- a/src/basic/fs-util.h
 +++ b/src/basic/fs-util.h
 @@ -49,8 +49,27 @@ int futimens_opath(int fd, const struct timespec ts[2=
]);
@@ -64,7 +64,7 @@ index 1023ab73ca..c78ff6f27f 100644
  int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid,=
 gid_t gid, mode_t mode);
 =20
 diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index 569ef466c3..7ae921a113 100644
+index a4e2dae245..67aa8ea1f2 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
 @@ -145,7 +145,7 @@ int base_filesystem_create_fd(int fd, const char *ro=
ot, uid_t uid, gid_t gid) {
@@ -94,6 +94,3 @@ index 569ef466c3..7ae921a113 100644
                                                  continue;
                                  }
 =20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatib=
le-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd=
/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index c1a8bb19fe..1ab23553f9 100644
--- a/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-base=
name-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-base=
name-for-non-glibc-syste.patch
@@ -1,8 +1,7 @@
-From bab07e779ff23d5593bb118efaaa31b60a6dce87 Mon Sep 17 00:00:00 2001
+From d98f6bd4d8acdc4c1a5bff4c699f5004a6ebccce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
-Subject: [PATCH 08/22] Define glibc compatible basename() for non-glibc
- systems
+Subject: [PATCH] Define glibc compatible basename() for non-glibc system=
s
=20
 Fixes builds with musl, even though systemd is adamant about
 using non-posix basename implementation, we have a way out
@@ -29,6 +28,3 @@ index b6d8be3083..0a29036c4c 100644
  static inline char* strstr_ptr(const char *haystack, const char *needle=
) {
          if (!haystack || !needle)
                  return NULL;
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv=
-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0008-implment-s=
ystemd-sysv-install-for-OE.patch
index acff18dc43..8b833ce073 100644
--- a/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-instal=
l-for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-instal=
l-for-OE.patch
@@ -1,4 +1,4 @@
-From 5712d56f1cd654d2e5d2e9117ff77fe4c299f76b Mon Sep 17 00:00:00 2001
+From 5f89867f2b15f9bd411564d04e660cdeedd370ca Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Sep 2015 06:31:47 +0000
 Subject: [PATCH] implment systemd-sysv-install for OE
@@ -38,6 +38,3 @@ index cb58d8243b..000bdf6165 100755
          ;;
      *)
          usage ;;
---=20
-2.39.2
-
diff --git a/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffer=
ing-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd=
/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index 3ff0177ae3..98ab397eff 100644
--- a/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-whe=
n-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-whe=
n-writing-to-oom_score_a.patch
@@ -1,7 +1,7 @@
-From 25093c5017725b8577c444dfea0f42ad85b43522 Mon Sep 17 00:00:00 2001
+From f3943f58f3c8a9d20dcada56eb5ca5f673a49b3d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
-Subject: [PATCH 09/22] Do not disable buffering when writing to oom_scor=
e_adj
+Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
=20
 On musl, disabling buffering when writing to oom_score_adj will
 cause the following error.
@@ -24,7 +24,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 201c5596ae..ea51595b6c 100644
+index 4492e7ded2..b61a2aba74 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
 @@ -1716,7 +1716,7 @@ int set_oom_score_adjust(int value) {
@@ -36,6 +36,3 @@ index 201c5596ae..ea51595b6c 100644
  }
 =20
  int get_oom_score_adjust(int *ret) {
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compl=
iant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd=
/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index cf59ac7d06..e1ffe4ddb5 100644
--- a/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-st=
rerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-st=
rerror_r-from-GNU-specif.patch
@@ -1,7 +1,7 @@
-From 2adbe9773cd65c48eec9df96868d4a738927c8d9 Mon Sep 17 00:00:00 2001
+From 5305c5f18236a9d7f2e633ea6ad317e09e8f29d5 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
-Subject: [PATCH 10/22] distinguish XSI-compliant strerror_r from GNU-spe=
cifi
+Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
  strerror_r
=20
 XSI-compliant strerror_r and GNU-specifi strerror_r are different.
@@ -24,10 +24,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  2 files changed, 15 insertions(+), 1 deletion(-)
=20
 diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/b=
us-error.c
-index 77b2e1a0fd..fdba0e0142 100644
+index f415797700..a5c6e9a3bd 100644
 --- a/src/libsystemd/sd-bus/bus-error.c
 +++ b/src/libsystemd/sd-bus/bus-error.c
-@@ -408,7 +408,12 @@ static void bus_error_strerror(sd_bus_error *e, int=
 error) {
+@@ -410,7 +410,12 @@ static void bus_error_strerror(sd_bus_error *e, int=
 error) {
                          return;
 =20
                  errno =3D 0;
@@ -40,7 +40,7 @@ index 77b2e1a0fd..fdba0e0142 100644
                  if (errno =3D=3D ERANGE || strlen(x) >=3D k - 1) {
                          free(m);
                          k *=3D 2;
-@@ -593,8 +598,12 @@ const char* _bus_error_message(const sd_bus_error *=
e, int error, char buf[static
+@@ -595,8 +600,12 @@ const char* _bus_error_message(const sd_bus_error *=
e, int error, char buf[static
 =20
          if (e && e->message)
                  return e->message;
@@ -71,6 +71,3 @@ index 69a2eb6404..1561859650 100644
                  if (errno =3D=3D 0) {
                          char error[STRLEN("ERRNO=3D") + DECIMAL_STR_MAX=
(int) + 1];
 =20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of=
-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0011-av=
oid-redefinition-of-prctl_mm_map-structure.patch
index e481b2e2e4..3075f9d003 100644
--- a/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_=
mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_=
mm_map-structure.patch
@@ -1,7 +1,7 @@
-From 49c446cfb78cf74a909bed8c3798b77a5469866a Mon Sep 17 00:00:00 2001
+From c866c8652f06af4cd0b9bd7eedc606449f432b95 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
-Subject: [PATCH 11/22] avoid redefinition of prctl_mm_map structure
+Subject: [PATCH] avoid redefinition of prctl_mm_map structure
=20
 Fix the following compile failure:
 error: redefinition of 'struct prctl_mm_map'
@@ -27,6 +27,3 @@ index 7d9e395c92..88c2d7dfac 100644
 =20
  /* 58319057b7847667f0c9585b9de0e8932b0fdb08 (4.3) */
  #ifndef PR_CAP_AMBIENT
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer=
-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0012-do-not-d=
isable-buffer-in-writing-files.patch
index 66be79077e..0fec84724d 100644
--- a/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-wri=
ting-files.patch
+++ b/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-wri=
ting-files.patch
@@ -1,7 +1,7 @@
-From e4885a8e60f883d9217e26e1db3754c2906aca31 Mon Sep 17 00:00:00 2001
+From 8464b845e6df1be303e09274c13e653072701671 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
-Subject: [PATCH 12/22] do not disable buffer in writing files
+Subject: [PATCH] do not disable buffer in writing files
=20
 Do not disable buffer in writing files, otherwise we get
 failure at boot for musl like below.
@@ -201,7 +201,7 @@ index 61ac4df1a6..ea18970196 100644
                  return r;
 =20
 diff --git a/src/core/main.c b/src/core/main.c
-index 3f71cc0947..0e5aec3e9e 100644
+index 1c0030a75f..7108a87d46 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
 @@ -1678,7 +1678,7 @@ static void initialize_core_pattern(bool skip_setu=
p) {
@@ -253,7 +253,7 @@ index 066483e342..5f92dd7064 100644
                  log_warning_errno(r, "Failed to drop caches, ignoring: =
%m");
          else
 diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-de=
vice/sd-device.c
-index 2fbc619a34..09d9591e37 100644
+index 01e66b4658..f3ea82ca1b 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
 @@ -2516,7 +2516,7 @@ _public_ int sd_device_set_sysattr_value(sd_device=
 *device, const char *sysattr,
@@ -279,10 +279,10 @@ index a5002437c6..b12e6cd9c9 100644
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 6ab604d3dc..bbec6b686c 100644
+index 0600f3e014..ea369c32b2 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2688,7 +2688,7 @@ static int reset_audit_loginuid(void) {
+@@ -2690,7 +2690,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
 =20
@@ -291,7 +291,7 @@ index 6ab604d3dc..bbec6b686c 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This =
probably means that your kernel is too\n"
-@@ -4141,7 +4141,7 @@ static int setup_uid_map(
+@@ -4143,7 +4143,7 @@ static int setup_uid_map(
                  return log_oom();
 =20
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
@@ -300,7 +300,7 @@ index 6ab604d3dc..bbec6b686c 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write UID map: %m"=
);
 =20
-@@ -4151,7 +4151,7 @@ static int setup_uid_map(
+@@ -4153,7 +4153,7 @@ static int setup_uid_map(
                  return log_oom();
 =20
          xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
@@ -367,10 +367,10 @@ index 805503f366..01a7ccb291 100644
                  log_debug_errno(r, "Failed to turn off coredumps, ignor=
ing: %m");
  }
 diff --git a/src/shared/hibernate-util.c b/src/shared/hibernate-util.c
-index 3eb13d48f6..d09b901be1 100644
+index c3991cfa4c..7d522d8d1f 100644
 --- a/src/shared/hibernate-util.c
 +++ b/src/shared/hibernate-util.c
-@@ -481,7 +481,7 @@ int write_resume_config(dev_t devno, uint64_t offset=
, const char *device) {
+@@ -501,7 +501,7 @@ int write_resume_config(dev_t devno, uint64_t offset=
, const char *device) {
 =20
          /* We write the offset first since it's safer. Note that this f=
ile is only available in 4.17+, so
           * fail gracefully if it doesn't exist and we're only overwriti=
ng it with 0. */
@@ -379,7 +379,7 @@ index 3eb13d48f6..d09b901be1 100644
          if (r =3D=3D -ENOENT) {
                  if (offset !=3D 0)
                          return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSU=
PP),
-@@ -497,7 +497,7 @@ int write_resume_config(dev_t devno, uint64_t offset=
, const char *device) {
+@@ -517,7 +517,7 @@ int write_resume_config(dev_t devno, uint64_t offset=
, const char *device) {
                  log_debug("Wrote resume_offset=3D%s for device '%s' to =
/sys/power/resume_offset.",
                            offset_str, device);
 =20
@@ -402,7 +402,7 @@ index 1f88e724d0..feb18b320a 100644
                  return r;
 =20
 diff --git a/src/shared/watchdog.c b/src/shared/watchdog.c
-index 4c1a968718..6faf6806a5 100644
+index 99ccefb227..e4975018ab 100644
 --- a/src/shared/watchdog.c
 +++ b/src/shared/watchdog.c
 @@ -93,7 +93,7 @@ static int set_pretimeout_governor(const char *governo=
r) {
@@ -412,10 +412,10 @@ index 4c1a968718..6faf6806a5 100644
 -                              WRITE_STRING_FILE_DISABLE_BUFFER | WRITE_=
STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
 +                              WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRI=
TE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
          if (r < 0)
-                 return log_error_errno(r, "Failed to set pretimeout_gov=
ernor to '%s': %m", governor);
+                 return log_error_errno(r, "Failed to set watchdog preti=
meout_governor to '%s': %m", governor);
 =20
 diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index 21af3e9e52..6d4b84b5d5 100644
+index 21062b24e0..262dd71d72 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
 @@ -137,7 +137,7 @@ static int write_state(int fd, char * const *states)=
 {
@@ -437,7 +437,7 @@ index 21af3e9e52..6d4b84b5d5 100644
                          log_debug("Using sleep disk mode '%s'.", *mode)=
;
                          return 0;
 diff --git a/src/storagetm/storagetm.c b/src/storagetm/storagetm.c
-index ae63baaf79..82eeca479a 100644
+index 16d4fb07d4..aca7506463 100644
 --- a/src/storagetm/storagetm.c
 +++ b/src/storagetm/storagetm.c
 @@ -186,7 +186,7 @@ static int nvme_subsystem_unlink(NvmeSubsystem *s) {
@@ -533,7 +533,7 @@ index ae63baaf79..82eeca479a 100644
                  return log_error_errno(r, "Failed to set IP address on =
NVME port %" PRIu16 ": %m", portnr);
 =20
 diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index febe345b4c..a90b610ba1 100644
+index e5b8df5c2d..63ca15628c 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
 @@ -2711,7 +2711,6 @@ static int udev_rule_apply_token_to_event(
@@ -557,6 +557,3 @@ index 4d82c65f0a..3a3d861b83 100644
          if (r < 0)
                  return log_warning_errno(r, "Failed to %s sysfs UTF-8 f=
lag: %m", enable_disable(utf8));
 =20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usa=
ge.patch b/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage=
.patch
index 43f75373a6..6d7e002d61 100644
--- a/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patc=
h
+++ b/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patc=
h
@@ -1,7 +1,7 @@
-From 2f90f8463423cfbb7e83fcef42f1071018c3b56e Mon Sep 17 00:00:00 2001
+From f6b69f28657c09b1181552d85e52ced0e01182e3 Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
-Subject: [PATCH 13/22] Handle __cpu_mask usage
+Subject: [PATCH] Handle __cpu_mask usage
=20
 Fixes errors:
=20
@@ -55,6 +55,3 @@ index ea0c58770e..b65c0bd370 100644
 =20
  /* Print information about various types. Useful when diagnosing
   * gcc diagnostics on an unfamiliar architecture. */
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshado=
w.patch b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.p=
atch
index a751e1ba6f..40b60399aa 100644
--- a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
@@ -1,7 +1,7 @@
-From b7c827bb44edbb6251c9fcdb80aa03982c0e7bf3 Mon Sep 17 00:00:00 2001
+From 5442d8ddb285d33b459aefc76962640afd131280 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
-Subject: [PATCH 14/22] Handle missing gshadow
+Subject: [PATCH] Handle missing gshadow
=20
 gshadow usage is now present in the userdb code. Mask all uses of it to
 allow compilation on musl
@@ -168,6 +168,3 @@ index f60d48ace4..e878199a28 100644
                          if (r < 0)
                                  return r;
 =20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Def=
ine-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0=
015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
index e112766a9b..51f0b048fa 100644
--- a/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIP=
S-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIP=
S-ABI-defines-for-musl.patch
@@ -1,7 +1,7 @@
-From 3dc9d9d410bcce54fddfd94f43f7f77f3aa8e281 Mon Sep 17 00:00:00 2001
+From 863dd6f502d53a4a2644e031eee2e8dfa3fd05aa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 12 Apr 2021 23:44:53 -0700
-Subject: [PATCH 15/22] missing_syscall.h: Define MIPS ABI defines for mu=
sl
+Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
=20
 musl does not define _MIPS_SIM_ABI32, _MIPS_SIM_NABI32, _MIPS_SIM_ABI64
 unlike glibc where these are provided by libc headers, therefore define
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 7 insertions(+)
=20
 diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index d795efd8f2..d6729d3c1d 100644
+index 86280771c4..20d05db506 100644
 --- a/src/basic/missing_syscall.h
 +++ b/src/basic/missing_syscall.h
 @@ -20,6 +20,12 @@
@@ -33,7 +33,7 @@ index d795efd8f2..d6729d3c1d 100644
  #include "missing_keyctl.h"
  #include "missing_stat.h"
 diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index 7ae921a113..0ef9d1fd39 100644
+index 67aa8ea1f2..8d9824495e 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
 @@ -20,6 +20,7 @@
@@ -44,6 +44,3 @@ index 7ae921a113..0ef9d1fd39 100644
 =20
  typedef struct BaseFilesystem {
          const char *dir;      /* directory or symlink to create */
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0016-pass-correct-paramete=
rs-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0016-pass-corr=
ect-parameters-to-getdents64.patch
index 0be817e62d..66b8f66806 100644
--- a/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-g=
etdents64.patch
+++ b/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-g=
etdents64.patch
@@ -1,7 +1,7 @@
-From 0994b59dba9f248ad31cb7087046dc00b72cb4ea Mon Sep 17 00:00:00 2001
+From 01de9e5a6e4ad2f361d3eb4d9839c7afd91cc677 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 15:15:11 -0800
-Subject: [PATCH 16/22] pass correct parameters to getdents64
+Subject: [PATCH] pass correct parameters to getdents64
=20
 Fixes
 ../git/src/basic/recurse-dir.c:57:40: error: incompatible pointer types =
passing 'uint8_t *' (aka 'unsigned char *') to parameter of type 'struct =
dirent *' [-Werror,-Wincompatible-pointer-types]
@@ -32,6 +32,3 @@ index 5e98b7a5d8..aef065047b 100644
                  if (n < 0)
                          return -errno;
                  if (n =3D=3D 0)
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-heade=
rs.patch b/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers=
.patch
index 4176522a1c..f86b8c889c 100644
--- a/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patc=
h
+++ b/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patc=
h
@@ -1,7 +1,7 @@
-From 3c094d443ca30f19114392fd8ef274af6eabc12d Mon Sep 17 00:00:00 2001
+From a45cf93772ac5055665cc55454509747b9c68ad2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 22:19:37 -0800
-Subject: [PATCH 17/22] Adjust for musl headers
+Subject: [PATCH] Adjust for musl headers
=20
 Upstream-Status: Inappropriate [musl specific]
=20
@@ -425,7 +425,7 @@ index 607fe0053c..9ce4005874 100644
 =20
  #include "sd-dhcp-server.h"
 diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
-index efbae6d868..1ea2151d50 100644
+index 49c452da7c..98aad1f3cd 100644
 --- a/src/network/networkd-dhcp4.c
 +++ b/src/network/networkd-dhcp4.c
 @@ -3,7 +3,7 @@
@@ -451,7 +451,7 @@ index 32229a3fc7..662a345d6e 100644
  #include "in-addr-util.h"
  #include "networkd-address.h"
 diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index ee5f0f2c0a..ea5269a2de 100644
+index 4ef1be4bad..e5aa53604d 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
 @@ -3,7 +3,7 @@
@@ -464,7 +464,7 @@ index ee5f0f2c0a..ea5269a2de 100644
  #include <linux/netdevice.h>
  #include <sys/socket.h>
 diff --git a/src/network/networkd-ndisc.c b/src/network/networkd-ndisc.c
-index ab9eeb13a5..dd96fe7483 100644
+index 840ccb158d..9f2e85e32f 100644
 --- a/src/network/networkd-ndisc.c
 +++ b/src/network/networkd-ndisc.c
 @@ -6,7 +6,7 @@
@@ -477,7 +477,7 @@ index ab9eeb13a5..dd96fe7483 100644
  #include "sd-ndisc.h"
 =20
 diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index 7218d799fc..30d5574eae 100644
+index eb502ae2cf..5b25ee4523 100644
 --- a/src/network/networkd-route.c
 +++ b/src/network/networkd-route.c
 @@ -1,9 +1,5 @@
@@ -502,7 +502,7 @@ index 7218d799fc..30d5574eae 100644
          _cleanup_(route_freep) Route *route =3D NULL;
 =20
 diff --git a/src/network/networkd-setlink.c b/src/network/networkd-setli=
nk.c
-index 2298f9ea3a..7d5f87de53 100644
+index 011ea1fe6e..59dfe733eb 100644
 --- a/src/network/networkd-setlink.c
 +++ b/src/network/networkd-setlink.c
 @@ -2,7 +2,7 @@
@@ -567,6 +567,3 @@ index f528a46b8e..830318cda5 100644
  #include <linux/netdevice.h>
  #include <linux/pci_regs.h>
 =20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerr=
or-is-assumed-to-be-GNU-specifi.patch b/meta/recipes-core/systemd/systemd=
/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
index 75f6b9094a..67388e6807 100644
--- a/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-a=
ssumed-to-be-GNU-specifi.patch
+++ b/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-a=
ssumed-to-be-GNU-specifi.patch
@@ -1,8 +1,8 @@
-From be02bd0876a061728661535a709d313e39fe1ac3 Mon Sep 17 00:00:00 2001
+From 20dfb0b5e7113c2e7f82c01488b419dffe8714ab Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Nov 2022 13:31:34 -0800
-Subject: [PATCH 18/22] test-bus-error: strerror() is assumed to be GNU
- specific version mark it so
+Subject: [PATCH] test-bus-error: strerror() is assumed to be GNU specifi=
c
+ version mark it so
=20
 Upstream-Status: Inappropriate [Upstream systemd only supports glibc]
=20
@@ -47,6 +47,3 @@ index 376d532281..967cfd4d67 100644
 =20
  TEST(PROTECT_ERRNO) {
          errno =3D 12;
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRER=
ROR-portable-for-musl.patch b/meta/recipes-core/systemd/systemd/0019-errn=
o-util-Make-STRERROR-portable-for-musl.patch
index e038b73678..36d468959a 100644
--- a/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-por=
table-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-por=
table-for-musl.patch
@@ -1,7 +1,7 @@
-From 46d80840bfe37e67d4f18c37a77751ea1fe63a07 Mon Sep 17 00:00:00 2001
+From 32371040c2aa649e23c3b0f2c5ee27995a16526a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 23 Jan 2023 23:39:46 -0800
-Subject: [PATCH 19/22] errno-util: Make STRERROR portable for musl
+Subject: [PATCH] errno-util: Make STRERROR portable for musl
=20
 Sadly, systemd has decided to use yet another GNU extention in a macro
 lets make this such that we can use XSI compliant strerror_r() for
@@ -37,6 +37,3 @@ index 27804e6382..274c1c6ef1 100644
  /* A helper to print an error message or message for functions that ret=
urn 0 on EOF.
   * Note that we can't use ({ =E2=80=A6 }) to define a temporary variabl=
e, so errnum is
   * evaluated twice. */
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_=
trim-conditional-on-glibc.patch b/meta/recipes-core/systemd/systemd/0020-=
sd-event-Make-malloc_trim-conditional-on-glibc.patch
index b83fffe793..f860b5f542 100644
--- a/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-co=
nditional-on-glibc.patch
+++ b/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-co=
nditional-on-glibc.patch
@@ -1,7 +1,7 @@
-From 9eb4867b4e2dbdb2484ae854022aff97e2f0feb3 Mon Sep 17 00:00:00 2001
+From 751fb8c9a05115f5329cfa25e69afe7657124c20 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Aug 2023 12:06:27 -0700
-Subject: [PATCH 20/22] sd-event: Make malloc_trim() conditional on glibc
+Subject: [PATCH] sd-event: Make malloc_trim() conditional on glibc
=20
 musl does not have this API
=20
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/src/libsystemd/sd-event/sd-event.c b/src/libsystemd/sd-even=
t/sd-event.c
-index 288798a0dc..6419a7f216 100644
+index b6899df192..0c03287004 100644
 --- a/src/libsystemd/sd-event/sd-event.c
 +++ b/src/libsystemd/sd-event/sd-event.c
 @@ -1874,7 +1874,7 @@ _public_ int sd_event_add_exit(
@@ -34,6 +34,3 @@ index 288798a0dc..6419a7f216 100644
          usec_t after_timestamp =3D now(CLOCK_MONOTONIC);
 =20
          if (r > 0)
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-mal=
loc_info-on-musl.patch b/meta/recipes-core/systemd/systemd/0021-shared-Do=
-not-use-malloc_info-on-musl.patch
index 7eff069bb7..ece9873bbc 100644
--- a/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_inf=
o-on-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_inf=
o-on-musl.patch
@@ -1,7 +1,7 @@
-From 502597b9ddd6b145541b23fadca0b1d3ca9f6367 Mon Sep 17 00:00:00 2001
+From 4fe2a8b1aab7297beac50f6ce46f3df4169de218 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Aug 2023 12:20:40 -0700
-Subject: [PATCH 21/22] shared: Do not use malloc_info on musl
+Subject: [PATCH] shared: Do not use malloc_info on musl
=20
 Upstream-Status: Inappropriate [musl-specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
@@ -52,6 +52,3 @@ index 8e70e365dd..9e782caec9 100644
                  (void) memstream_dump(LOG_INFO, &m);
                  break;
          }
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX=
-declaration.patch b/meta/recipes-core/systemd/systemd/0022-avoid-missing=
-LOCK_EX-declaration.patch
index 24f3bf74a0..f517392e58 100644
--- a/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declar=
ation.patch
+++ b/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declar=
ation.patch
@@ -1,7 +1,7 @@
-From fd52f1764647e03a35e8f0ed0ef952049073ccbd Mon Sep 17 00:00:00 2001
+From 97d3ed7834bd86615ba4acdbef984c677b7e7791 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 2 Jan 2024 11:03:27 +0800
-Subject: [PATCH 22/22] avoid missing LOCK_EX declaration
+Subject: [PATCH] avoid missing LOCK_EX declaration
=20
 This only happens on MUSL. Include sys/file.h to avoid compilation
 error about missing LOCK_EX declaration.
@@ -15,7 +15,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  2 files changed, 2 insertions(+)
=20
 diff --git a/src/core/exec-invoke.c b/src/core/exec-invoke.c
-index 70d963e269..7084811439 100644
+index fe14ceeb31..521e7b87ff 100644
 --- a/src/core/exec-invoke.c
 +++ b/src/core/exec-invoke.c
 @@ -4,6 +4,7 @@
@@ -38,6 +38,3 @@ index 5339bc4e5e..0697495f23 100644
 =20
  int lock_dev_console(void);
 =20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-co=
re/systemd/systemd_255.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_255.4.bb
rename to meta/recipes-core/systemd/systemd_255.6.bb
--=20
2.34.1


