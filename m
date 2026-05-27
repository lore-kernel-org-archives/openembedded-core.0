Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06343CD6E46
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 13:35:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20549.1779888937277117232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 06:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=l5ivZ9JR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RCxt8d3067731
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=qnxRhCyr0SIo7obPESBlNMwA26LWhd052/k8mlsATHg=; b=
	l5ivZ9JR88Qbk9jqZrUX0tqW6qdATfMIGE0FKGp102WUgjB3wX++VISn5iio+Od4
	IR7XoJCvnlse4n5kE2N1CZaNdIpGZlwDgqnjJtMG62CpUCQpDGmt1aeRla6W6O/z
	xfr0IkLnyotNCjQ4gWjNVUWo3QZBUyWqLEH8hyxeyOynrKVAxK7T3fwxmTjrtEmS
	W9Xe71WyNtCs1U9GiPRrXCLFwwae/fkeXy0Zu1YZA/cA1sf+PB9ssQLxqx8UcaP9
	wjioC/tNyNTXjjXiLHGGkcPeDWDV88OVucOd1TZW+G5mXu9XN2xy9B9yVw1JMtE2
	PUZoclgd8BHhaXOJcQSBZg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012015.outbound.protection.outlook.com [40.107.209.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376dytx-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjEUskwbYXFbBckt+3Sizjzb5CaDja3jcfTDWDi946iEhFfzozxFX5IquGQdb+7yn1sdklhxS6nfTxO7eL69jkRAhOkYiRBrXYQRLwlZdcD74csOPZPsGMJi4qkkKTijD3+vaAuBRNwX07OIWOBXgnVnN3jgQDgMB3v+pYRmFgrb+nz726hBPwclTVxlPLeSi8R3hYD7G0q1QoLGQkWuev+0oYmmGhMF/++T/pZJqzAe66aA0th9uW0hxH9xwg9bLom3lno0bgA8RxLdrCftit2GrPfuIzeMVkOYwQSSiIyYtkyaLJrnimOfigBCqayUWbKliXq9dJ71WIc62v2e/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnxRhCyr0SIo7obPESBlNMwA26LWhd052/k8mlsATHg=;
 b=B0v4ooCIUTaDdCmFQSQD+BHWqbxWNrmNWJed0OjT7AuOdhvC8WT1RBSEe+xWgfd+qsGsyidvFz6c8MZuDXNmYVLRMI3rD2oVm9OOkUKyByX/PMBZA2oiP0N89jDfTxMrOpHtb6SJ2MHFEaaMRC58oaEwDYTsJ7XQu4gjBTTscNStjPRlda4nVLcYbv+eh2NkWy5Df+Q/APbRu6+lw/wPzMSleTXVEfRnZLozUcd5kyQSgAR2Fhj8q/JydFlMEV76nuGdvWiERmpfIS4Gwea+n21rpgN4nBzYB6coqyvfmNCE+0s2g7qx5c8k0v2W1Y3bEtuNyrRClxDHqd+iL0ZUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MW4PR11MB5774.namprd11.prod.outlook.com (2603:10b6:303:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 13:35:32 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 13:35:32 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v5 1/7] gcc: Upgrade GCC to 16.1 release
Date: Wed, 27 May 2026 06:35:07 -0700
Message-ID: <20260527133516.2337150-2-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com>
References: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MW4PR11MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: 646e4b92-40da-4354-e1f5-08debbf4d31f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|13003099007|18002099003|22082099003|12006099003|38350700014|6133799003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	f1P8NFLNwucP7+gX6FdviWMFBOsM976h4jK8XUCySvhVREJp4CgnIm8qCI+Z2uPTwL9bxx7KVhA3ZxpWWMq22oZYqlk4IanjVNlgBHdQtyLKcbfffXOpA6SBZJfX6FGLZiMNTtlWES+CxEtFIs/K1xNOMUuEWeeygV6uL04S0mpq0HFNlr4g+ZW8YuqNf21j/Mjr47yx9DZARJomn8LtdGhqvDkVQU8YTwz9gBIz+ZuuUpIcnuVFVD9lzVYNo0bFSXkRUtGxzUL/4vZJPkANdP9DPz0MNwRAWuprnhSBSxJvkixjEHLz3KIDPVsg8p4gqGt/MamvnRhqbO+dHFiQZl2IWmS8egm9xvGUsrZofuI6QTYdBqjmLWCUPsSWLh6/YohrGY2DKH78HCqtGhhJ+D/6LHqzOWCwZJ/s9W9kEQqkeGxtnlwXtnRGcXL6diygS1V8f/lQB3z3yT59c16tWHbYj8OuL43nEfDMrs8v6iXca5bd/Y5xqtYVY2sl/ByME6CiT+FIlVoRf6/KEtM3DPEOLfULoZmBdu5vM3lOAlefof4parC1otSgzW+YAUrf/T6mvV7AEt3XvYZSFkMvP2buM/cDJTOpVeKBm/QRmzuk3eYoXKAbuzHKS8BYH80Y4ooRq9ymTcIZNkyUw2r2epdQhJP+nblkOw7MIRc1mgNsGlixTsGr3ottrQBeMO3wcVdvMGpeNeVao/jQSAn3Rw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(13003099007)(18002099003)(22082099003)(12006099003)(38350700014)(6133799003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OTZ6K0lvaGZGMkZCVk9PNlpzWVh6cnl3YzFIekpUS1JzVkZ0anFxWERZQkFJ?=
 =?utf-8?B?UWQrM2dNOFA1bU9TU2poTUw4VFUwTCtoT2RmUVEvM01tZVRobTN5d0NPaU1O?=
 =?utf-8?B?NzM3cFd3Sk0vR25MOHlBc3FjaTZ0Rm9LTEtSa01xcVlnUi96MCtXM0xVbTZo?=
 =?utf-8?B?R01tcTgycys0NUx5emhudjVzajY1VllMcGF3SFdsZ3ZDaVlvVG9CTHA2SGVr?=
 =?utf-8?B?STMyUU9wblA4N2c4WHZjdFM2ejdtL2J6aDNLUE8yQ3ZBeFMrc051WUFOMEsw?=
 =?utf-8?B?UjhqRUpxdk9nRDVORERXMEdITExzYVczbm9NWGRZYUVuM3JiV3pISkVGZTdG?=
 =?utf-8?B?Q3d4REorVVYweXhBSUpMamtVQWM1eVhHSFZVdkk1bld2WXN5eGtkWmM0ejZ3?=
 =?utf-8?B?QXdIUVFLYjBOV2IwQWxBWUo3OGh3aE5ZVlRuREFRQWp6Z0pzakUvaFhCdHM0?=
 =?utf-8?B?ZGNPcjJhblVTdXI2REFjOSt2TU5CTzNYbS9QcW44c1hSZDNQMWpGQ1JrTnVS?=
 =?utf-8?B?NXBqeGEvbEcvTndQVS9xcUVkSjVkMENoODJBTWtESFJxN2xQSjM1VnJCWU5s?=
 =?utf-8?B?RE4rcFdqM2RtOTgvaU05K0c4QzFwZ2NJZlFZYWQraTA2Z2x1U20zMmZpSFhh?=
 =?utf-8?B?MFVUL3JrNW90V3hIYWUwZ2Nqb0NYam9vd0p4dUlLUWF6anVjUmJvT0ZHT3Ry?=
 =?utf-8?B?Slk2WEpzaWl3Szc3SWc0RjBOdEhrcWxpNjBPckVVSmpOMkdzYXp0ZzJISlhw?=
 =?utf-8?B?UHNrYlhTUHBBU1BnU2dvUldYSFpMTE9MSVd0RVJWeXkrQTZ6dUR2TkNONk1V?=
 =?utf-8?B?YkxaS0FBTkVhUWJsdjRTZCtJN2hTWGR0TDhHcHZXTmgzMEx1Q0ptWnJ3YTM2?=
 =?utf-8?B?aHhmVjFoZFlZc242Q3AyZ2lSYnlNeGIvOGpVZUFLNCt1QmpSMWt4ZVR2K3ho?=
 =?utf-8?B?V1dqMUxCKzNTVFBPdG9MM0RkSXJtaEVoUW1DcG52ejMxRUh5TEoycms2a3Rv?=
 =?utf-8?B?eXNXc1dZeFpzVE8ya0s0b3IyRUVUSjU3bmtYVU1EeE05NVA2ZytFZ2xxZWRB?=
 =?utf-8?B?NTEzNDl4Ukovb2M4VXRhaXQzSWV1UU85ZG12TGwwdXVBeUhmUlQrb1UwUDYw?=
 =?utf-8?B?RzlqYjYrZkVrR1pwdk5nSXhoNHlXZ3JRZmxsT1pieWh5ZnNSaFRtVmtqamY4?=
 =?utf-8?B?QjFJT1hlQ0h3VGdabDFvdVdRM1B3aEtJMEpLMG5jOGVjY3JMVkh6dGlONDBR?=
 =?utf-8?B?aGpTeWQxQ2loYmxIR3RWVHl1MG9obUpLbTNDS2Q4NTlTZXFCb3lOZi9rTnhp?=
 =?utf-8?B?OS9Pckx6cmRVUExlZUVnR3BWUUo1NXp6Ny9Ia1N0eXpnV29lMDBQbzZSdm9l?=
 =?utf-8?B?Zkcxd1FVc25mdHIxUFhaMWphZUJzUk1URzBLbVlGVllPQ1lOMG0yR2lhNTdV?=
 =?utf-8?B?bHZBWC96Tk9PbnZsNFFaNjBSSDgxUVV4VjR2MGNLTTJrTHgyVFR0RHo0SDV5?=
 =?utf-8?B?ZFpRWDd6akZuT1d4dGVkczU4OEZaTmdMRFRJK2hpditIUWtvS0t4ZHMxSHBQ?=
 =?utf-8?B?L2J2dUJraFg3T2QzYlhQZWNiR1BCT2JnWWV3bVRBdFdSYSt0L3kzTkt6bTJm?=
 =?utf-8?B?Vm41TnFZNUR2Vk92cjBQLzY4MVFHb0pTZlVMVUxqaTh6WjZQTzRtelFna3Ru?=
 =?utf-8?B?RWRSOHE1dmxkSGxqN2kxRHVBUC8waVFIc3lHVURvUk44T0NsN0ZGZHc0aVVt?=
 =?utf-8?B?V0hCVEdaVkVqWWtvZVZHeUEvWUx1bmsrU3I0TkMvTXR1S29Dc3pxSmhSUkNx?=
 =?utf-8?B?dmtCbDNjRDZYeGpxWHBlK2VmcFZVM1ZraGVOK0RBZTNNRzdVb3NiR1ZXMUlL?=
 =?utf-8?B?anJKSUE2c1dsbW5hSGJVRUZOdDF3bHgxQnkwR20rU0pEdFJRNmwwN2hkUkpN?=
 =?utf-8?B?SmQ0d2VKNFM3QXFXbTZVdDZFcWptdXp6U2pkcW9DcDdhbnJpWTQ1U1hKZWZJ?=
 =?utf-8?B?NEhwK25pNWRhUlJMWk1tQVZGbzJPWWhmL2VBNU1Jekl5dGsremx0S2FzZXZt?=
 =?utf-8?B?TFZWeGExdDNqYVRsK2lDL3JseUlpdDZ0SDRjRVRlK3JtYmRiOHBtcVB6Q2o5?=
 =?utf-8?B?M282M0p2bWNVN3hwVkY5VGNVZjJ5b2hPNDlMc01Zc3EyaE1kWkVPclJDeWwy?=
 =?utf-8?B?cEJwU21IczBhS2oxNHJCR05zU2d4ZTRoQkJWMUFNUDFBbzhLenY5bnFpbGtR?=
 =?utf-8?B?SE5MMEViTEJOamlFc045V3VsWko4ajlnVExTRzAwWHRIV3MwVElPd0xkOWE0?=
 =?utf-8?B?KytqQkQrYnZUaDdGK0REVnJkT1JDWDlmb3lJZktISUFQOGF4b2JmVXNHMG5X?=
 =?utf-8?Q?8Q9SvJSpwyPid6dY=3D?=
X-Exchange-RoutingPolicyChecked: 
	rEzsSsjVNbiR9OYq6MFkMEgOYbtb2RAknQYwrCGq/uVFbVIKbwItPnyRc4g0qTatBtzV+BYnfYcNVM3D63/yOlaMD7z3BRSZAJFCHTpujUpgEAAQ/6uyyoL6ElcqR1Xm6+LfMml4NP268/B6n7IyU+FRN55NTOvJgQ2DKC2RcnFoThvRExsxCd1E9W9YXIAAnAxp3/PIiy90/aSFJsGhpQvH9s+eWogpQTkOK2m/8O8EKbv4Tscamh41puNYZ/lye0Hmlj+/6p48xOGzbJlkbeiirgogNLkefHLpt8O5FGyywwitcuJgrPqqA6at5A/1S4Rmbe3bZ7YUn0guSkjuMg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 646e4b92-40da-4354-e1f5-08debbf4d31f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 13:35:32.3576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61q+Ik2zIrZWQLOZ31jXrSgIiFi3X4tc9paGrKpov0w3YhjUwTKWImPHM6PZyiXoFhYbgCDRuJUERW2WangZMTIHTg/wYf8WmsQj28/jpIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEzMyBTYWx0ZWRfXwhhymR+/PFUO
 aW1uDOphwKnEFel3xfb2RVRQY0Acc65P6VIEu08EMhZ4WLu5/A0EduFHK5XDvk3JnAa30wdswV8
 43/T9atawkC/SmJp+YUsRrP4jMEQJ7UHwLmgqdLyyyuBHSihZnQwd4GsbOHkrw655NACaeAxBgV
 /5pmmAkseGprLRscTVKLBOvmafI+khqyc6X/Nl3XbezFZWb8INBDHIGrXVO5KoukuEAjwqOjWWp
 kB2VtDNRGk0JNFz/F70qis0X447g7gkD+KQfYFV3aFOGO6McLxFxsbmCnzG8EuWRSfR3vAIPTMS
 aSIg3j+qM1/+jVGzzbKy3Ldd3OKSbP8STtJyp0CZli4ZRq/tYcE3eX0+tfgNSGNDmHGVQ3SrMCU
 1mFDo0GaVU2IDV9aA60lAukjimh4OjLD+RDwONc3fVt7dcKpNUDAqv59juKbJoGxj8JOvOegk6b
 7SaZ6GcGkY6RjVnezYg==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a16f328 cx=c_pps
 a=YvmT30J82QCmV9938MlLOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8
 a=iGHA9ds3AAAA:8 a=20KFwNOVAAAA:8 a=9VPlPrzCAAAA:8 a=hwpk83-eGoRv12KktN0A:9
 a=bxMAh2iGgf655hUu:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=aK1hd8Lu7Q_i5nYwpAI3:22
X-Proofpoint-GUID: d0wmTxgDNsooR6atwUib0I8gZJK6BBbE
X-Proofpoint-ORIG-GUID: d0wmTxgDNsooR6atwUib0I8gZJK6BBbE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270133
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64RCxt8d3067731
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237662

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Notable changes in GCC 16 include:
- Improved C23/C++23 support and initial C++26 features
- Enhanced diagnostics and static analyzer improvements
- Optimizer and code generation enhancements
- Target-specific updates for AArch64, RISC-V, x86, and others
- Runtime library updates (libstdc++, libatomic, libgomp, libsanitizer)
- Multiple bug fixes and performance improvements

* Rebased existing OE-Core patches for GCC 16.1 and dropped
patches merged upstream.

For detailed info: https://gcc.gnu.org/gcc-16/changes.html

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../gcc/{gcc-15.2.inc =3D> gcc-16.1.inc}        |  17 +-
 ...ian_15.2.bb =3D> gcc-cross-canadian_16.1.bb} |   0
 .../{gcc-cross_15.2.bb =3D> gcc-cross_16.1.bb}  |   0
 ...-crosssdk_15.2.bb =3D> gcc-crosssdk_16.1.bb} |   0
 ...cc-runtime_15.2.bb =3D> gcc-runtime_16.1.bb} |   0
 ...itizers_15.2.bb =3D> gcc-sanitizers_16.1.bb} |   0
 ...{gcc-source_15.2.bb =3D> gcc-source_16.1.bb} |   0
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   2 +-
 ...sroot-gcc-version-specific-dirs-with.patch |   4 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch |  18 +-
 ...025-gcc-testsuite-tweaks-for-mips-OE.patch |  78 +++---
 .../gcc/gcc/0026-fix-pr90579-testcases.patch  |  40 ---
 .../gcc/gcc/0027-gcc15-pr122394.patch         |  88 ------
 ...028-fix-gcc-libitm-false-postives-01.patch | 187 -------------
 ...028-fix-gcc-libitm-false-postives-02.patch | 220 ---------------
 ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 257 ------------------
 .../gcc/{gcc_15.2.bb =3D> gcc_16.1.bb}          |   0
 ...initial_15.2.bb =3D> libgcc-initial_16.1.bb} |   0
 .../gcc/{libgcc_15.2.bb =3D> libgcc_16.1.bb}    |   0
 ...ibgfortran_15.2.bb =3D> libgfortran_16.1.bb} |   0
 22 files changed, 66 insertions(+), 849 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-15.2.inc =3D> gcc-16.1.inc} (88%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.2.bb =3D> gcc-cr=
oss-canadian_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_15.2.bb =3D> gcc-cross_16.1.=
bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.2.bb =3D> gcc-crosssdk=
_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_15.2.bb =3D> gcc-runtime_1=
6.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.2.bb =3D> gcc-saniti=
zers_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_15.2.bb =3D> gcc-source_16.=
1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testca=
ses.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.pat=
ch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-fal=
se-postives-01.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-fal=
se-postives-02.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-bu=
ildable-by-C-11-to-C-26.patch
 rename meta/recipes-devtools/gcc/{gcc_15.2.bb =3D> gcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_15.2.bb =3D> libgcc-ini=
tial_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_15.2.bb =3D> libgcc_16.1.bb} (1=
00%)
 rename meta/recipes-devtools/gcc/{libgfortran_15.2.bb =3D> libgfortran_1=
6.1.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 24c5a9d712..fdfdec28b5 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -200,7 +200,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_=
TARGET_ARCH} =3D "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} =3D "Khem Raj <raj.khem@gma=
il.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers =3D "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-15.2.0 =3D "Khem Raj <raj.khem@gmail.com=
>"
+RECIPE_MAINTAINER:pn-gcc-source-16.1.0 =3D "Khem Raj <raj.khem@gmail.com=
>"
 RECIPE_MAINTAINER:pn-gcompat =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr =3D "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
index 3c956dfb12..33d3efd845 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -9,7 +9,7 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?=3D =
"binutils-crosssdk-${SDK_
 # Default libc config
 PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
=20
-GCCVERSION ?=3D "15.%"
+GCCVERSION ?=3D "16.%"
 SDKGCCVERSION ?=3D "${GCCVERSION}"
 GLIBCVERSION ?=3D "2.43%"
 RUSTVERSION ?=3D "1.95.0%"
diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-16.1.inc
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-15.2.inc
rename to meta/recipes-devtools/gcc/gcc-16.1.inc
index a96f2b8411..3a96228631 100644
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.1.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
=20
 # Third digit in PV should be incremented after a minor release
=20
-PV =3D "15.2.0"
+PV =3D "16.1.0"
=20
 # BINV should be incremented to a revision after a minor gcc release
=20
-BINV =3D "15.2.0"
+BINV =3D "16.1.0"
=20
 FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
=20
@@ -34,17 +34,17 @@ LIC_FILES_CHKSUM =3D "\
 #SRC_URI[sha256sum] =3D "41bf7be5dc029112a9df625266e7de030ffc36ff3638f27=
0b180ae8c91fe6449"
=20
 # from snapshot
-#RELEASE ?=3D "15-20250420"
-#RELEASE ?=3D "15.1.0-RC-20250418"
+#RELEASE ?=3D "16-20260502"
+#RELEASE ?=3D "16.1.0-RC-20260424"
 #BASEURI ?=3D "https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RE=
LEASE}.tar.xz"
 #SOURCEDIR ?=3D "gcc-${RELEASE}"
-#SRC_URI[sha256sum] =3D "fe18624317c6c662977eea8b5a506ec6c132fc11c7a8d53=
e2f6d21b139b0af3c"
+#SRC_URI[sha256sum] =3D "e8edc2aaf0affce7020658b0be9a3fc820aa33dc610640d=
3fe1ba1aee360051b"
=20
 # official release
 RELEASE ?=3D "${PV}"
 BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 SOURCEDIR ?=3D "gcc-${PV}"
-SRC_URI[sha256sum] =3D "438fd996826b0c82485a29da03a72d71d6e3541a83ec702d=
f4271f6fe025d24e"
+SRC_URI[sha256sum] =3D "50efb4d94c3397aff3b0d61a5abd748b4dd31d9d3f2ab7be=
05b171d36a510f79"
=20
 SRC_URI =3D "${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -72,11 +72,6 @@ SRC_URI =3D "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
-           file://0026-fix-pr90579-testcases.patch \
-           file://0027-gcc15-pr122394.patch \
-           file://0028-fix-gcc-libitm-false-postives-01.patch \
-           file://0028-fix-gcc-libitm-false-postives-02.patch \
-           file://0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
 "
=20
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb b/meta/=
recipes-devtools/gcc/gcc-cross-canadian_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_15.2.bb b/meta/recipes-d=
evtools/gcc/gcc-cross_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb b/meta/recipe=
s-devtools/gcc/gcc-crosssdk_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb b/meta/recipes=
-devtools/gcc/gcc-runtime_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb b/meta/reci=
pes-devtools/gcc/gcc-sanitizers_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_15.2.bb b/meta/recipes-=
devtools/gcc/gcc-source_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINK=
ER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-De=
fine-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 621f8bc41f..07e9e23f3d 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-=
UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-=
UCLIBC_DYNAMIC_LINKE.patch
@@ -172,7 +172,7 @@ index fbc75a90ad5..38c239940bd 100644
 +  SYSTEMLIBS_DIR "ld-linux-loongarch-" ABI_SPEC ".so.1"
 =20
  #define MUSL_ABI_SPEC \
-   "%{mabi=3Dlp64d:}" \
+   "%{mabi=3Dilp32d:}" \
 @@ -40,7 +40,7 @@ along with GCC; see the file COPYING3.  If not see
 =20
  #undef MUSL_DYNAMIC_LINKER
diff --git a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc=
-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0017-Se=
arch-target-sysroot-gcc-version-specific-dirs-with.patch
index a087ba17d9..678457bbc9 100644
--- a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-versio=
n-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-versio=
n-specific-dirs-with.patch
@@ -89,12 +89,12 @@ index 007c91780f6..22eb17bc099 100644
 +	            {
 +		      memcpy (path + len, this_multi, this_multi_len + 1);
 +	              memcpy (path + len + this_multi_len, multi_suffix, suffi=
x_len + 1);
-+	              ret =3D callback (path, callback_info);
++	              ret =3D callback (path);
 +	                if (ret)
 +		          break;
 +	            }
 +	        }
 +
  	      memcpy (path + len, multi_suffix, suffix_len + 1);
- 	      ret =3D callback (path, callback_info);
+ 	      ret =3D callback (path);
  	      if (ret)
diff --git a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-=
march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-=
not-enforce-march-on-aarch64.patch
index 0f2a9d8c1f..5a8a79c0d2 100644
--- a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-o=
n-aarch64.patch
+++ b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-o=
n-aarch64.patch
@@ -29,14 +29,14 @@ index 0f1a7156084..255fe448e63 100644
 =20
  endif
 diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
-index 9798e7c09e9..3b3027eb77d 100644
+index 887ae41..b3d5e6f 100644
 --- a/libatomic/Makefile.in
 +++ b/libatomic/Makefile.in
-@@ -452,7 +452,6 @@ M_SRC =3D $(firstword $(filter %/$(M_FILE), $(all_c_=
files)))
- libatomic_la_LIBADD =3D $(foreach s,$(SIZES),$(addsuffix \
- 	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
- 	$(am__append_3) $(am__append_4)
--@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=3Dar=
mv8-a+lse
- @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=3Darmv7-=
a+fp -DHAVE_KERNEL64
- @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=3Di586
- @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -mcx16 -mcx16
+@@ -470,7 +470,6 @@ libatomic_la_LDFLAGS =3D $(libatomic_version_info) $=
(libatomic_version_script) \
+ @PARTIAL_VXWORKS_FALSE@	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) \
+ @PARTIAL_VXWORKS_FALSE@	$(am__append_2) $(am__append_3) \
+ @PARTIAL_VXWORKS_FALSE@	$(am__append_4) $(am__append_5)
+-@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_=
OPTIONS =3D -march=3Darmv8-a+lse
+ @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTI=
ONS =3D -march=3Darmv7-a+fp -DHAVE_KERNEL64
+ @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS =3D=
 -march=3Di586
+ @ARCH_LOONGARCH_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTI=
ONS =3D -mlsx|-mscq
diff --git a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-=
mips-OE.patch b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-f=
or-mips-OE.patch
index fcdd79a840..dc708942b4 100644
--- a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE=
.patch
+++ b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE=
.patch
@@ -92,10 +92,10 @@ index 6dd8fa3fce9..95672008219 100644
  	"preprocess" {
  	    set compile_type "preprocess"
 diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/t=
arget-supports.exp
-index c0376b04551..5d053dfe726 100644
+index 55775d0..df161a9 100644
 --- a/gcc/testsuite/lib/target-supports.exp
 +++ b/gcc/testsuite/lib/target-supports.exp
-@@ -2949,14 +2949,7 @@ proc check_mips_loongson_mmi_hw_available { } {
+@@ -3113,14 +3113,7 @@ proc check_mips_loongson_mmi_hw_available { } {
  	if { !([istarget mips*-*-*]) } {
  	    expr 0
  	} else {
@@ -107,11 +107,11 @@ index c0376b04551..5d053dfe726 100644
 -		return 0;
 -	      }
 -	    } "-mloongson-mmi"
-+	    expr 0
++            expr 0
  	}
      }]
  }
-@@ -2970,29 +2963,7 @@ proc check_mips_msa_hw_available { } {
+@@ -3134,29 +3127,7 @@ proc check_mips_msa_hw_available { } {
      if { !([istarget mips*-*-*]) } {
        expr 0
      } else {
@@ -138,38 +138,41 @@ index c0376b04551..5d053dfe726 100644
 -	}
 -	#endif
 -      } "-mmsa"
-+      expr 0
++    expr 0
      }
    }]
  }
-@@ -10371,6 +10342,7 @@ proc is-effective-target-keyword { arg } {
+@@ -10740,6 +10711,7 @@ proc is-effective-target-keyword { arg } {
 =20
  proc et-dg-runtest { runtest testcases flags default-extra-flags } {
      global dg-do-what-default
-+    global do-what-limit
++    global do-what-limit=20
      global EFFECTIVE_TARGETS
      global et_index
 =20
-@@ -10378,6 +10350,7 @@ proc et-dg-runtest { runtest testcases flags def=
ault-extra-flags } {
+@@ -10747,16 +10719,19 @@ proc et-dg-runtest { runtest testcases flags d=
efault-extra-flags } {
  	foreach target $EFFECTIVE_TARGETS {
  	    set target_flags $flags
  	    set dg-do-what-default compile
-+            set do-what-limit link
- 	    set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
+-	    set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
++	    set do-what-limit link
++            set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
  	    if { [info procs add_options_for_${target}] !=3D [list] } {
  		set target_flags [add_options_for_${target} "$flags"]
-@@ -10385,8 +10358,10 @@ proc et-dg-runtest { runtest testcases flags de=
fault-extra-flags } {
+ 	    }
  	    if { [info procs check_effective_target_${target}_runtime]
  		 !=3D [list] && [check_effective_target_${target}_runtime] } {
  		set dg-do-what-default run
-+		set do-what-limit run
++                set do-what-limit run
  	    }
  	    $runtest $testcases $target_flags ${default-extra-flags}
+-	    unset et_index
 +	    unset do-what-limit
++            unset et_index
  	}
      } else {
- 	set et_index 0
-@@ -12172,6 +12147,7 @@ proc check_effective_target_sigsetjmp {} {
+ 	$runtest $testcases $flags ${default-extra-flags}
+@@ -12539,6 +12514,7 @@ proc check_effective_target_sigsetjmp {} {
  proc check_vect_support_and_set_flags { } {
      global DEFAULT_VECTCFLAGS
      global dg-do-what-default
@@ -177,51 +180,62 @@ index c0376b04551..5d053dfe726 100644
      global EFFECTIVE_TARGETS
 =20
      if [istarget powerpc*-*-*] {
-@@ -12203,6 +12179,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -12570,14 +12546,16 @@ proc check_vect_support_and_set_flags { } {
  		set DEFAULT_VECTCFLAGS [linsert $DEFAULT_VECTCFLAGS 0 "-mcpu=3D970"]
  	    }
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif { [check_effective_target_x86] } {
  	lappend DEFAULT_VECTCFLAGS "-msse2"
-@@ -12210,6 +12187,7 @@ proc check_vect_support_and_set_flags { } {
+ 	if { [check_effective_target_sse2_runtime] } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++         set do-what-limit link=09
++        }
      } elseif { [istarget mips*-*-*]
  	       && [check_effective_target_nomips16] } {
-@@ -12229,6 +12207,7 @@ proc check_vect_support_and_set_flags { } {
+ 	if { [check_effective_target_mpaired_single "-mpaired-single"] } {
+@@ -12596,7 +12574,8 @@ proc check_vect_support_and_set_flags { } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif [istarget alpha*-*-*] {
  	# Alpha's vectorization capabilities are extremely limited.
-@@ -12242,6 +12221,7 @@ proc check_vect_support_and_set_flags { } {
+ 	# It's more effort than its worth disabling all of the tests
+@@ -12609,7 +12588,8 @@ proc check_vect_support_and_set_flags { } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif [istarget ia64-*-*] {
  	set dg-do-what-default run
-@@ -12255,6 +12235,7 @@ proc check_vect_support_and_set_flags { } {
+     } elseif [is-effective-target arm_neon_ok] {
+@@ -12622,7 +12602,8 @@ proc check_vect_support_and_set_flags { } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif [istarget aarch64*-*-*] {
  	set dg-do-what-default run
-@@ -12279,6 +12260,7 @@ proc check_vect_support_and_set_flags { } {
+     } elseif [istarget s390*-*-*] {
+@@ -12646,7 +12627,8 @@ proc check_vect_support_and_set_flags { } {
  	} else {
  	    lappend DEFAULT_VECTCFLAGS "-march=3Dz14" "-mzarch"
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif [istarget amdgcn-*-*] {
  	set dg-do-what-default run
+     } elseif [istarget riscv*-*-*] {
diff --git a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.pat=
ch b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
deleted file mode 100644
index 6ada61b74f..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 679e24f5a751663998ff7202149a749e0f7251f9 Mon Sep 17 00:00:00 2001
-From: Harish Sadineni <Harish.Sadineni@windriver.com>
-Date: Sun, 10 Aug 2025 20:28:00 +0800
-Subject: [PATCH] testsuite: i386: Fix gcc.target/i386/pr90579.c when PIE=
 is
- enabled [PR118885]
-
-When gcc build with --enable-deafult-pie the following tests
-were getting failed:
- FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+40
- FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+32
- FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+24
- FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+16
-
-    PR target/118885
-
-gcc/testsuite/ChangeLog:
-
-    * gcc.target/i386/pr90579.c: add -fno-pie to dg-options
-    to fix tests when PIE is enabled.
-
-Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=3D679=
e24f5a751663998ff7202149a749e0f7251f9]
-
-Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
----
- gcc/testsuite/gcc.target/i386/pr90579.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gcc/testsuite/gcc.target/i386/pr90579.c b/gcc/testsuite/gcc=
.target/i386/pr90579.c
-index ab48a44063c..19081ec9fdf 100644
---- a/gcc/testsuite/gcc.target/i386/pr90579.c
-+++ b/gcc/testsuite/gcc.target/i386/pr90579.c
-@@ -1,5 +1,5 @@
- /* { dg-do compile } */
--/* { dg-options "-O3 -mavx2 -mfpmath=3Dsse" } */
-+/* { dg-options "-O3 -mavx2 -mfpmath=3Dsse -fno-pie" } */
-=20
- extern double r[6];
- extern double a[];
---=20
-2.49.0
diff --git a/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch b/me=
ta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
deleted file mode 100644
index 9ee371cef7..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From e55dcff97708a4937dc4d8736b8b3074ebbff6f3 Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Mon, 27 Oct 2025 17:43:17 +0100
-Subject: phiopt: Fix up DEBUG_EXPR_DECL creation in spaceship_replacemen=
t
- [PR122394]
-
-The following testcase ICEs in gcc 15 (and is at least latent in 12-14 t=
oo),
-because the DEBUG_EXPR_DECL has incorrect mode.  It has
-TREE_TYPE (orig_use_lhs) type, but TYPE_MODE (type) rather than
-TYPE_MODE (TREE_TYPE (orig_use_lhs)) where the two types are sometimes
-the same, but sometimes different (same if !has_cast_debug_uses, differe=
nt
-otherwise).
-
-Though, there wouldn't be the this issue if it used the proper API to cr=
eate
-the DEBUG_EXPR_DECL which takes care of everything.  This is the sole
-spot that doesn't use that API.
-
-Doesn't affect the trunk because the code has been removed and replaced =
with
-different stuff after the libstdc++ ABI change in r16-3474.
-Before r15-5557 the mode has been always wrong because this was done onl=
y
-for has_cast_debug_uses.  And the bug has been introduced with r12-5490.
-
-Enough archeology, while it could be fixed by changing the second
-SET_DECL_MODE argument, I think it is better to use build_debug_expr_dec=
l.
-
-2025-10-27  Jakub Jelinek  <jakub@redhat.com>
-
-	PR tree-optimization/122394
-	* tree-ssa-phiopt.cc (spaceship_replacement): Use
-	build_debug_expr_decl instead of manually building DEBUG_EXPR_DECL
-	and getting SET_DECL_MODE wrong.
-
-	* g++.dg/opt/pr122394.C: New test.
-
-Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=3De55=
dcff97708a4937dc4d8736b8b3074ebbff6f3]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- gcc/testsuite/g++.dg/opt/pr122394.C | 20 ++++++++++++++++++++
- gcc/tree-ssa-phiopt.cc              |  6 ++----
- 2 files changed, 22 insertions(+), 4 deletions(-)
- create mode 100644 gcc/testsuite/g++.dg/opt/pr122394.C
-
-diff --git a/gcc/testsuite/g++.dg/opt/pr122394.C b/gcc/testsuite/g++.dg/=
opt/pr122394.C
-new file mode 100644
-index 000000000000..1f84bebd74c2
---- /dev/null
-+++ b/gcc/testsuite/g++.dg/opt/pr122394.C
-@@ -0,0 +1,20 @@
-+// PR tree-optimization/122394
-+// { dg-do compile { target c++23 } }
-+// { dg-options "-O1 -g" }
-+
-+#include <compare>
-+
-+struct A {
-+  friend auto operator<=3D> (A, A) =3D default;
-+  double a;
-+};
-+void foo ();
-+A b, c;
-+
-+void
-+bar ()
-+{
-+  bool d =3D c >=3D b;
-+  if (d)
-+    foo ();
-+}
-diff --git a/gcc/tree-ssa-phiopt.cc b/gcc/tree-ssa-phiopt.cc
-index aaebae6b38c0..3e0ad9d3bb09 100644
---- a/gcc/tree-ssa-phiopt.cc
-+++ b/gcc/tree-ssa-phiopt.cc
-@@ -2995,10 +2995,8 @@ spaceship_replacement (basic_block cond_bb, basic=
_block middle_bb,
- 	      if (has_cast_debug_uses
- 		  || (HONOR_NANS (TREE_TYPE (lhs1)) && !is_cast))
- 		{
--		  tree temp3 =3D make_node (DEBUG_EXPR_DECL);
--		  DECL_ARTIFICIAL (temp3) =3D 1;
--		  TREE_TYPE (temp3) =3D TREE_TYPE (orig_use_lhs);
--		  SET_DECL_MODE (temp3, TYPE_MODE (type));
-+		  tree temp3
-+		    =3D build_debug_expr_decl (TREE_TYPE (orig_use_lhs));
- 		  if (has_cast_debug_uses)
- 		    t =3D fold_convert (TREE_TYPE (temp3), temp2);
- 		  else
---=20
-cgit=20
-
diff --git a/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-post=
ives-01.patch b/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-p=
ostives-01.patch
deleted file mode 100644
index d8ed99adb5..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postives-01=
.patch
+++ /dev/null
@@ -1,187 +0,0 @@
-From b129ff0880c6d10e0379b46889d01255ee8d1f82 Mon Sep 17 00:00:00 2001
-From: Pietro Monteiro <pietro@sociotechnical.xyz>
-Date: Fri, 30 Jan 2026 20:22:49 -0500
-Subject: libitm: testsuite: don't include libstdc++ paths in test names
- [PR69018]
-
-Libitm C++ tests pass -B/full/path/to/build/libstc++/src/.libs on the
-options argument to dg-runtest and the libstdc++ include paths as
-the default-extra-options.  This causes 2 problems:
-
-1) If a test uses `dg-options' then the libstdc++ include paths are
-not passed to the compiler.
-
-2) The `-B/full/path/to/build/libstc++/src/.libs' gets added to the
-test name.  This makes comparing build done in different directories
-harder because the hardcoded full path.
-
-Stop passing options and default-extra-options to dg-runtest and move
-dealing with the path-releated flags to libitm_target_compile in
-libitm.exp, where they are added to additional_flags.
-
-Also change the FSF address to the website in the license text.
-
-libitm/ChangeLog:
-	PR libitm/69018
-	* testsuite/lib/libitm.exp (libitm_target_compile): Add
-	lang_include_flags and `-B${blddir}/${lang_library_paths}' to
-	additional_flags.
-	* testsuite/libitm.c++/c++.exp: Set lang_library_paths and lang_include=
_flags.
-
-Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/patch/?id=3Db129=
ff0880c6d10e0379b46889d01255ee8d1f82]
-
-Signed-off-by: Pietro Monteiro <pietro@sociotechnical.xyz>
-Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
----
- libitm/testsuite/lib/libitm.exp     | 25 ++++++++++----
- libitm/testsuite/libitm.c++/c++.exp | 67 +++++++++++++++++-------------=
-------
- 2 files changed, 48 insertions(+), 44 deletions(-)
-
-diff --git a/libitm/testsuite/lib/libitm.exp b/libitm/testsuite/lib/libi=
tm.exp
-index 0b3301537cee..69a49906d338 100644
---- a/libitm/testsuite/lib/libitm.exp
-+++ b/libitm/testsuite/lib/libitm.exp
-@@ -9,8 +9,7 @@
- # GNU General Public License for more details.
- #
- # You should have received a copy of the GNU General Public License
--# along with this program; if not, write to the Free Software
--# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1=
301, USA.
-+# along with this program; if not, see <http://www.gnu.org/licenses/>.
-=20
- # Damn dejagnu for not having proper library search paths for load_lib.
- # We have to explicitly load everything that gcc-dg.exp wants to load.
-@@ -193,14 +192,24 @@ proc libitm_target_compile { source dest type opti=
ons } {
-     global gluefile wrap_flags
-     global ALWAYS_CFLAGS
-     global GCC_UNDER_TEST
--    global lang_test_file
--    global lang_library_path
-+    global lang_library_paths
-     global lang_link_flags
-+    global lang_include_flags
-=20
--    if { [info exists lang_test_file] } {
--	if { $blddir !=3D "" } {
-+    if { [info exists lang_include_flags] } {
-+	lappend options "additional_flags=3D${lang_include_flags}"
-+    }
-+
-+    if { [info exists lang_library_paths] } {
-+	foreach lang_library_path $lang_library_paths {
-+	    # targets that use lib[...].a%s in their specs need a -B option
-+	    # for uninstalled testing.
-+	    lappend options "additional_flags=3D-B${blddir}/${lang_library_pat=
h}"
- 	    lappend options "ldflags=3D-L${blddir}/${lang_library_path}"
- 	}
-+    }
-+
-+    if { [info exists lang_link_flags] } {
- 	lappend options "ldflags=3D${lang_link_flags}"
-     }
-=20
-@@ -219,7 +228,9 @@ proc libitm_target_compile { source dest type option=
s } {
- 	set options [concat "$ALWAYS_CFLAGS" $options]
-     }
-=20
--    set options [dg-additional-files-options $options $source $dest $ty=
pe]
-+    if { $source !=3D "" } {
-+        set options [dg-additional-files-options $options $source $dest=
 $type]
-+    }
-=20
-     set result [target_compile $source $dest $type $options]
-=20
-diff --git a/libitm/testsuite/libitm.c++/c++.exp b/libitm/testsuite/libi=
tm.c++/c++.exp
-index a1ce7ce4062e..90f3058e7249 100644
---- a/libitm/testsuite/libitm.c++/c++.exp
-+++ b/libitm/testsuite/libitm.c++/c++.exp
-@@ -11,8 +11,7 @@
- # GNU General Public License for more details.
- #
- # You should have received a copy of the GNU General Public License
--# along with this program; if not, write to the Free Software
--# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1=
301, USA.
-+# along with this program; if not, see <http://www.gnu.org/licenses/>.
-=20
- load_lib libitm-dg.exp
- load_gcc_lib gcc-dg.exp
-@@ -33,48 +32,42 @@ set blddir [lookfor_file [get_multilibs] libitm]
-=20
-=20
- if { $blddir !=3D "" } {
--    # Look for a static libstdc++ first.
--    if [file exists "${blddir}/${lang_library_path}/libstdc++.a"] {
--	set lang_test_file "${lang_library_path}/libstdc++.a"
--	set lang_test_file_found 1
--	# We may have a shared only build, so look for a shared libstdc++.
--    } elseif [file exists "${blddir}/${lang_library_path}/libstdc++.${s=
hlib_ext}"] {
--	set lang_test_file "${lang_library_path}/libstdc++.${shlib_ext}"
--	set lang_test_file_found 1
--    } else {
--	puts "No libstdc++ library found, will not execute c++ tests"
-+    if { ![file exists "${blddir}/${lang_library_path}/libstdc++.a"]
-+	 && ![file exists "${blddir}/${lang_library_path}/libstdc++.${shlib_ex=
t}"] } {
-+	verbose -log "No libstdc++ library found, will not execute c++ tests"
-+	unset lang_library_path
-+	return
-     }
--} elseif { [info exists GXX_UNDER_TEST] } {
--    set lang_test_file_found 1
--    # Needs to exist for libitm.exp.
--    set lang_test_file ""
-+    lappend lang_library_paths ${lang_library_path}
-+} elseif { ![info exists GXX_UNDER_TEST] } {
-+    verbose -log "GXX_UNDER_TEST not defined, will not execute c++ test=
s"
-+    return
-+}
-+
-+# Gather a list of all tests.
-+set tests [lsort [glob -nocomplain $srcdir/$subdir/*.C]]
-+
-+if { $blddir !=3D "" } {
-+    set ld_library_path "$always_ld_library_path:${blddir}/${lang_libra=
ry_path}"
- } else {
--    puts "GXX_UNDER_TEST not defined, will not execute c++ tests"
-+    set ld_library_path "$always_ld_library_path"
- }
-=20
--if { $lang_test_file_found } {
--    # Gather a list of all tests.
--    set tests [lsort [glob -nocomplain $srcdir/$subdir/*.C]]
-+append ld_library_path [gcc-set-multilib-library-path $GCC_UNDER_TEST]
-+set_ld_library_path_env_vars
-=20
--    set stdcxxadder ""
--    if { $blddir !=3D "" } {
--	set ld_library_path "$always_ld_library_path:${blddir}/${lang_library_=
path}"
--	set stdcxxadder "-B ${blddir}/${lang_library_path}"
--    } else {
--	set ld_library_path "$always_ld_library_path"
--    }
--    append ld_library_path [gcc-set-multilib-library-path $GCC_UNDER_TE=
ST]
--    set_ld_library_path_env_vars
-+set flags_file "${blddir}/../libstdc++-v3/scripts/testsuite_flags"
-+if { [file exists $flags_file] } {
-+    set lang_include_flags [exec sh $flags_file --build-includes]
-+}
-=20
--    set flags_file "${blddir}/../libstdc++-v3/scripts/testsuite_flags"
--    if { [file exists $flags_file] } {
--	set libstdcxx_includes [exec sh $flags_file --build-includes]
--    } else {
--	set libstdcxx_includes ""
--    }
-+# Main loop.
-+dg-runtest $tests "" ""
-=20
--    # Main loop.
--    dg-runtest $tests $stdcxxadder $libstdcxx_includes
-+if { $blddir !=3D "" } {
-+    unset lang_include_flags
-+    unset lang_library_path
-+    unset lang_library_paths
- }
-=20
- # All done.
---=20
-cgit=20
diff --git a/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-post=
ives-02.patch b/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-p=
ostives-02.patch
deleted file mode 100644
index 67ed47ff51..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postives-02=
.patch
+++ /dev/null
@@ -1,220 +0,0 @@
-From 66ce317036f2eb5aeb96d5e4b9e468799d7566b6 Mon Sep 17 00:00:00 2001
-From: Pietro Monteiro <pietro@sociotechnical.xyz>
-Date: Wed, 11 Feb 2026 11:55:13 -0500
-Subject: libitm: Fix recent libitm testsuite regression [PR69018]
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-The commit r16-7202-gb129ff0880c6d1 broke running libitm=E2=80=99s tests=
uite
-using combinations of options because it didn=E2=80=99t clean up all the
-global variables set in c++.exp.  Fix the regression by using g++ for
-the C++ tests and cleaning up the variables shared between C and C++
-tests.
-
-libitm/ChangeLog:
-	PR libitm/69018
-	* testsuite/lib/libitm.exp (libitm_init): Check
-	GXX_UNDER_TEST.  Add "${blddir}/.libs" to
-	always_ld_library_path if blddir is not empty.  Use
-	"-fdiagnostics-plain-output".  Don't set compiler to GCC_UNDER_TEST.
-	* testsuite/libitm.c++/c++.exp: If $blddir is not empty set
-	libstdc++_library_path, shlib_ext, lang_include_flags, add
-	"${blddir}/${lang_library_paths}" to ld_library_path.
-	Unset libstdc++_library_path and shlib_ext if we skip C++
-	tests and at the end of the test run.
-	* testsuite/libitm.c/c.exp: Update the FSF address to the
-	website in the license text. Unset lang_library_paths and
-	lang_include_flags.  Set the compiler to $GCC_UNDER_TEST.
-
-Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/patch/?id=3D66ce=
317036f2eb5aeb96d5e4b9e468799d7566b6]
-
-Co-authored-by: Jakub Jelinek  <jakub@redhat.com>
-Signed-off-by: Pietro Monteiro <pietro@sociotechnical.xyz>
-Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
----
- libitm/testsuite/lib/libitm.exp     | 21 +++++++++++++++----
- libitm/testsuite/libitm.c++/c++.exp | 42 ++++++++++++++----------------=
-------
- libitm/testsuite/libitm.c/c.exp     | 14 ++++++-------
- 3 files changed, 40 insertions(+), 37 deletions(-)
-
-diff --git a/libitm/testsuite/lib/libitm.exp b/libitm/testsuite/lib/libi=
tm.exp
-index 69a49906d338..2de0f6cbf158 100644
---- a/libitm/testsuite/lib/libitm.exp
-+++ b/libitm/testsuite/lib/libitm.exp
-@@ -79,7 +79,7 @@ proc libitm_init { args } {
-     global ALWAYS_CFLAGS
-     global CFLAGS
-     global TOOL_EXECUTABLE TOOL_OPTIONS
--    global GCC_UNDER_TEST
-+    global GCC_UNDER_TEST GXX_UNDER_TEST
-     global TESTING_IN_BUILD_TREE
-     global target_triplet
-     global always_ld_library_path
-@@ -97,6 +97,17 @@ proc libitm_init { args } {
- 	} else {
- 	    set GCC_UNDER_TEST "[find_gcc]"
- 	}
-+	# Only if we're guessing 'GCC_UNDER_TEST', we're also going to guess
-+	# 'GXX_UNDER_TEST'
-+	if ![info exists GXX_UNDER_TEST] then {
-+	    if [info exists TOOL_EXECUTABLE] {
-+		set GXX_UNDER_TEST $TOOL_EXECUTABLE
-+	    } else {
-+		set GXX_UNDER_TEST "[find_g++]"
-+	    }
-+	} else {
-+	    error "GXX_UNDER_TEST set but not GCC_UNDER_TEST"
-+	}
-     }
-=20
-     if ![info exists tmpdir] {
-@@ -119,7 +130,7 @@ proc libitm_init { args } {
-     }
-=20
-     # Compute what needs to be put into LD_LIBRARY_PATH
--    set always_ld_library_path ".:${blddir}/.libs"
-+    set always_ld_library_path "."
-=20
-     # Compute what needs to be added to the existing LD_LIBRARY_PATH.
-     if {$gccdir !=3D ""} {
-@@ -150,6 +161,8 @@ proc libitm_init { args } {
- 	lappend ALWAYS_CFLAGS "additional_flags=3D-B${blddir}/"
- 	lappend ALWAYS_CFLAGS "additional_flags=3D-I${blddir}"
- 	lappend ALWAYS_CFLAGS "ldflags=3D-L${blddir}/.libs"
-+
-+	append always_ld_library_path ":${blddir}/.libs"
-     }
-     lappend ALWAYS_CFLAGS "additional_flags=3D-I${srcdir}/.."
-=20
-@@ -179,7 +192,8 @@ proc libitm_init { args } {
-     # Turn on transactional memory support.
-     lappend ALWAYS_CFLAGS "additional_flags=3D-fgnu-tm"
-=20
--    lappend ALWAYS_CFLAGS "additional_flags=3D-fdiagnostics-color=3Dnev=
er"
-+    # Disable caret, color, URL diagnostics
-+    lappend ALWAYS_CFLAGS "additional_flags=3D-fdiagnostics-plain-outpu=
t"
- }
-=20
- #
-@@ -220,7 +234,6 @@ proc libitm_target_compile { source dest type option=
s } {
-=20
-     lappend options "additional_flags=3D[libio_include_flags]"
-     lappend options "timeout=3D[timeout_value]"
--    lappend options "compiler=3D$GCC_UNDER_TEST"
-=20
-     set options [concat $libitm_compile_options $options]
-=20
-diff --git a/libitm/testsuite/libitm.c++/c++.exp b/libitm/testsuite/libi=
tm.c++/c++.exp
-index 90f3058e7249..c24dc830bcc5 100644
---- a/libitm/testsuite/libitm.c++/c++.exp
-+++ b/libitm/testsuite/libitm.c++/c++.exp
-@@ -16,39 +16,33 @@
- load_lib libitm-dg.exp
- load_gcc_lib gcc-dg.exp
-=20
--global shlib_ext
--
--set shlib_ext [get_shlib_extension]
--# The C++ tests should be linked with g++, which defaults to -shared-li=
bgcc.
--# Doing that is currently too intrusive, so hardcode here.
--set lang_link_flags "-shared-libgcc -lstdc++"
--set lang_test_file_found 0
--set lang_library_path "../libstdc++-v3/src/.libs"
--
--# Initialize dg.
--dg-init
--
--set blddir [lookfor_file [get_multilibs] libitm]
--
--
- if { $blddir !=3D "" } {
--    if { ![file exists "${blddir}/${lang_library_path}/libstdc++.a"]
--	 && ![file exists "${blddir}/${lang_library_path}/libstdc++.${shlib_ex=
t}"] } {
-+    set libstdc++_library_path "../libstdc++-v3/src/.libs"
-+    set shlib_ext [get_shlib_extension]
-+    if { ![file exists "${blddir}/${libstdc++_library_path}/libstdc++.a=
"]
-+	 && ![file exists "${blddir}/${libstdc++_library_path}/libstdc++.${shl=
ib_ext}"] } {
- 	verbose -log "No libstdc++ library found, will not execute c++ tests"
--	unset lang_library_path
-+	unset libstdc++_library_path
-+	unset shlib_ext
- 	return
-     }
--    lappend lang_library_paths ${lang_library_path}
-+    lappend lang_library_paths ${libstdc++_library_path}
- } elseif { ![info exists GXX_UNDER_TEST] } {
-     verbose -log "GXX_UNDER_TEST not defined, will not execute c++ test=
s"
-     return
- }
-=20
-+lappend ALWAYS_CFLAGS "compiler=3D$GXX_UNDER_TEST"
-+
-+# Initialize dg.
-+dg-init
-+
- # Gather a list of all tests.
- set tests [lsort [glob -nocomplain $srcdir/$subdir/*.C]]
-=20
- if { $blddir !=3D "" } {
--    set ld_library_path "$always_ld_library_path:${blddir}/${lang_libra=
ry_path}"
-+    set lang_include_flags [exec sh ${blddir}/../libstdc++-v3/scripts/t=
estsuite_flags --build-includes]
-+    set ld_library_path "$always_ld_library_path:${blddir}/${lang_libra=
ry_paths}"
- } else {
-     set ld_library_path "$always_ld_library_path"
- }
-@@ -56,18 +50,14 @@ if { $blddir !=3D "" } {
- append ld_library_path [gcc-set-multilib-library-path $GCC_UNDER_TEST]
- set_ld_library_path_env_vars
-=20
--set flags_file "${blddir}/../libstdc++-v3/scripts/testsuite_flags"
--if { [file exists $flags_file] } {
--    set lang_include_flags [exec sh $flags_file --build-includes]
--}
--
- # Main loop.
- dg-runtest $tests "" ""
-=20
- if { $blddir !=3D "" } {
-     unset lang_include_flags
--    unset lang_library_path
-+    unset libstdc++_library_path
-     unset lang_library_paths
-+    unset shlib_ext
- }
-=20
- # All done.
-diff --git a/libitm/testsuite/libitm.c/c.exp b/libitm/testsuite/libitm.c=
/c.exp
-index daa71427d64c..7a697b870932 100644
---- a/libitm/testsuite/libitm.c/c.exp
-+++ b/libitm/testsuite/libitm.c/c.exp
-@@ -9,20 +9,20 @@
- # GNU General Public License for more details.
- #
- # You should have received a copy of the GNU General Public License
--# along with this program; if not, write to the Free Software
--# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1=
301, USA.
-+# along with this program; if not, see <http://www.gnu.org/licenses/>.
-=20
--if [info exists lang_library_path] then {
--    unset lang_library_path
--    unset lang_link_flags
-+if [info exists lang_library_paths] then {
-+    unset lang_library_paths
- }
--if [info exists lang_test_file] then {
--    unset lang_test_file
-+if [info exists lang_include_flags] then {
-+    unset lang_include_flags
- }
-=20
- load_lib libitm-dg.exp
- load_gcc_lib gcc-dg.exp
-=20
-+lappend ALWAYS_CFLAGS "compiler=3D$GCC_UNDER_TEST"
-+
- # If a testcase doesn't have special options, use these.
- if ![info exists DEFAULT_CFLAGS] then {
-     set DEFAULT_CFLAGS "-O2"
---=20
-cgit=20
diff --git a/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable=
-by-C-11-to-C-26.patch b/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-=
it-buildable-by-C-11-to-C-26.patch
deleted file mode 100644
index 431facb011..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-1=
1-to-C-26.patch
+++ /dev/null
@@ -1,257 +0,0 @@
-From 0ffe3c9af4e5d5468df742512b6e930fe7039230 Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Fri, 21 Nov 2025 16:25:58 +0100
-Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
-
-The following builds with -std=3Dc++11 and c++14 and c++17 and c++20 and=
 c++23
-and c++26.
-
-I see the u8 string literals are mixed e.g. with strerror, so in
--fexec-charset=3DIBM1047 there will still be garbage, so am not 100% sur=
e if
-the u8 literals everywhere are worth it either.
-
-2025-11-21  Jakub Jelinek  <jakub@redhat.com>
-
-	* cody.hh (S2C): For __cpp_char8_t >=3D 201811 use char8_t instead of
-	char in argument type.
-	(MessageBuffer::Space): Revert 2025-11-15 change.
-	(MessageBuffer::Append): For __cpp_char8_t >=3D 201811 add overload
-	with char8_t const * type of first argument.
-	(Packet::Packet): Similarly for first argument.
-	* client.cc (CommunicationError, Client::ProcessResponse,
-	Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
-	IncludeTranslateResponse): Cast u8 string literals to (const char *)
-	where needed.
-	* server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Backport [07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7]
----
- libcody/client.cc | 36 +++++++++++++++++++-----------------
- libcody/cody.hh   | 22 ++++++++++++++++++++++
- libcody/server.cc | 28 ++++++++++++++--------------
- 3 files changed, 55 insertions(+), 31 deletions(-)
-
-diff --git a/libcody/client.cc b/libcody/client.cc
-index ae69d190cb77..147fecdbe500 100644
---- a/libcody/client.cc
-+++ b/libcody/client.cc
-@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
-=20
- static Packet CommunicationError (int err)
- {
--  std::string e {u8"communication error:"};
-+  std::string e {(const char *) u8"communication error:"};
-   e.append (strerror (err));
-=20
-   return Packet (Client::PC_ERROR, std::move (e));
-@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector<std::s=
tring> &words,
-     {
-       if (e =3D=3D EINVAL)
- 	{
--	  std::string msg (u8"malformed string '");
-+	  std::string msg ((const char *) u8"malformed string '");
- 	  msg.append (words[0]);
--	  msg.append (u8"'");
-+	  msg.append ((const char *) u8"'");
- 	  return Packet (Client::PC_ERROR, std::move (msg));
- 	}
-       else
--	return Packet (Client::PC_ERROR, u8"missing response");
-+	return Packet (Client::PC_ERROR, (const char *) u8"missing response");
-     }
-=20
-   Assert (!words.empty ());
--  if (words[0] =3D=3D u8"ERROR")
-+  if (words[0] =3D=3D (const char *) u8"ERROR")
-     return Packet (Client::PC_ERROR,
--		   words.size () =3D=3D 2 ? words[1]: u8"malformed error response");
-+		   words.size () =3D=3D 2 ? words[1]
-+		   : (const char *) u8"malformed error response");
-=20
-   if (isLast && !read.IsAtEnd ())
-     return Packet (Client::PC_ERROR,
--		   std::string (u8"unexpected extra response"));
-+		   std::string ((const char *) u8"unexpected extra response"));
-=20
-   Assert (code < Detail::RC_HWM);
-   Packet result (responseTable[code] (words));
-   result.SetRequest (code);
-   if (result.GetCode () =3D=3D Client::PC_ERROR && result.GetString ().=
empty ())
-     {
--      std::string msg {u8"malformed response '"};
-+      std::string msg {(const char *) u8"malformed response '"};
-=20
-       read.LexedLine (msg);
--      msg.append (u8"'");
-+      msg.append ((const char *) u8"'");
-       result.GetString () =3D std::move (msg);
-     }
-   else if (result.GetCode () =3D=3D Client::PC_CONNECT)
-@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char cons=
t *ident,
- 			  size_t alen, size_t ilen)
- {
-   write.BeginLine ();
--  write.AppendWord (u8"HELLO");
-+  write.AppendWord ((const char *) u8"HELLO");
-   write.AppendInteger (Version);
-   write.AppendWord (agent, true, alen);
-   write.AppendWord (ident, true, ilen);
-@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char cons=
t *ident,
- // HELLO $version $agent [$flags]
- Packet ConnectResponse (std::vector<std::string> &words)
- {
--  if (words[0] =3D=3D u8"HELLO" && (words.size () =3D=3D 3 || words.siz=
e () =3D=3D 4))
-+  if (words[0] =3D=3D (const char *) u8"HELLO"
-+      && (words.size () =3D=3D 3 || words.size () =3D=3D 4))
-     {
-       char *eptr;
-       unsigned long val =3D strtoul (words[1].c_str (), &eptr, 10);
-@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()
- // PATHNAME $dir | ERROR
- Packet PathnameResponse (std::vector<std::string> &words)
- {
--  if (words[0] =3D=3D u8"PATHNAME" && words.size () =3D=3D 2)
-+  if (words[0] =3D=3D (const char *) u8"PATHNAME" && words.size () =3D=3D=
 2)
-     return Packet (Client::PC_PATHNAME, std::move (words[1]));
-=20
-   return Packet (Client::PC_ERROR, u8"");
-@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector<std::string> &w=
ords)
- // OK or ERROR
- Packet OKResponse (std::vector<std::string> &words)
- {
--  if (words[0] =3D=3D u8"OK")
-+  if (words[0] =3D=3D (const char *) u8"OK")
-     return Packet (Client::PC_OK);
-   else
-     return Packet (Client::PC_ERROR,
-@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const *inclu=
de, Flags flags, size_t ilen)
- // PATHNAME $cmifile
- Packet IncludeTranslateResponse (std::vector<std::string> &words)
- {
--  if (words[0] =3D=3D u8"BOOL" && words.size () =3D=3D 2)
-+  if (words[0] =3D=3D (const char *) u8"BOOL" && words.size () =3D=3D 2=
)
-     {
--      if (words[1] =3D=3D u8"FALSE")
--	return Packet (Client::PC_BOOL, 0);
--      else if (words[1] =3D=3D u8"TRUE")
-+      if (words[1] =3D=3D (const char *) u8"FALSE")
-+	return Packet (Client::PC_BOOL);
-+      else if (words[1] =3D=3D (const char *) u8"TRUE")
- 	return Packet (Client::PC_BOOL, 1);
-       else
- 	return Packet (Client::PC_ERROR, u8"");
-diff --git a/libcody/cody.hh b/libcody/cody.hh
-index 789ce9e70b75..93bce93aa94d 100644
---- a/libcody/cody.hh
-+++ b/libcody/cody.hh
-@@ -47,12 +47,21 @@ namespace Detail  {
-=20
- // C++11 doesn't have utf8 character literals :(
-=20
-+#if __cpp_char8_t >=3D 201811
-+template<unsigned I>
-+constexpr char S2C (char8_t const (&s)[I])
-+{
-+  static_assert (I =3D=3D 2, "only single octet strings may be converte=
d");
-+  return s[0];
-+}
-+#else
- template<unsigned I>
- constexpr char S2C (char const (&s)[I])
- {
-   static_assert (I =3D=3D 2, "only single octet strings may be converte=
d");
-   return s[0];
- }
-+#endif
-=20
- /// Internal buffering class.  Used to concatenate outgoing messages
- /// and Lex incoming ones.
-@@ -123,6 +132,13 @@ public:
-       Space ();
-     Append (str, maybe_quote, len);
-   }
-+#if __cpp_char8_t >=3D 201811
-+  void AppendWord (char8_t const *str, bool maybe_quote =3D false,
-+		   size_t len =3D ~size_t (0))
-+  {
-+    AppendWord ((const char *) str, maybe_quote, len);
-+  }
-+#endif
-   /// Add a word as with AppendWord
-   /// @param str the string to append
-   /// @param maybe_quote string might need quoting, as for Append
-@@ -264,6 +280,12 @@ public:
-     : string (s), cat (STRING), code (c)
-   {
-   }
-+#if __cpp_char8_t >=3D 201811
-+  Packet (unsigned c, const char8_t *s)
-+    : string ((const char *) s), cat (STRING), code (c)
-+  {
-+  }
-+#endif
-   Packet (unsigned c, std::vector<std::string> &&v)
-     : vector (std::move (v)), cat (VECTOR), code (c)
-   {
-diff --git a/libcody/server.cc b/libcody/server.cc
-index e2fa069bb933..c18469fae843 100644
---- a/libcody/server.cc
-+++ b/libcody/server.cc
-@@ -36,12 +36,12 @@ static RequestPair
-   const requestTable[Detail::RC_HWM] =3D
-   {
-     // Same order as enum RequestCode
--    RequestPair {u8"HELLO", nullptr},
--    RequestPair {u8"MODULE-REPO", ModuleRepoRequest},
--    RequestPair {u8"MODULE-EXPORT", ModuleExportRequest},
--    RequestPair {u8"MODULE-IMPORT", ModuleImportRequest},
--    RequestPair {u8"MODULE-COMPILED", ModuleCompiledRequest},
--    RequestPair {u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
-+    RequestPair {(const char *) u8"HELLO", nullptr},
-+    RequestPair {(const char *) u8"MODULE-REPO", ModuleRepoRequest},
-+    RequestPair {(const char *) u8"MODULE-EXPORT", ModuleExportRequest}=
,
-+    RequestPair {(const char *) u8"MODULE-IMPORT", ModuleImportRequest}=
,
-+    RequestPair {(const char *) u8"MODULE-COMPILED", ModuleCompiledRequ=
est},
-+    RequestPair {(const char *) u8"INCLUDE-TRANSLATE", IncludeTranslate=
Request},
-   };
- }
-=20
-@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
- 	  std::string msg;
-=20
- 	  if (err > 0)
--	    msg =3D u8"error processing '";
-+	    msg =3D (const char *) u8"error processing '";
- 	  else if (ix >=3D Detail::RC_HWM)
--	    msg =3D u8"unrecognized '";
-+	    msg =3D (const char *) u8"unrecognized '";
- 	  else if (IsConnected () && ix =3D=3D Detail::RC_CONNECT)
--	    msg =3D u8"already connected '";
-+	    msg =3D (const char *) u8"already connected '";
- 	  else if (!IsConnected () && ix !=3D Detail::RC_CONNECT)
--	    msg =3D u8"not connected '";
-+	    msg =3D (const char *) u8"not connected '";
- 	  else
--	    msg =3D u8"malformed '";
-+	    msg =3D (const char *) u8"malformed '";
-=20
- 	  read.LexedLine (msg);
--	  msg.append (u8"'");
-+	  msg.append ((const char *) u8"'");
- 	  if (err > 0)
- 	    {
--	      msg.append (u8" ");
-+	      msg.append ((const char *) u8" ");
- 	      msg.append (strerror (err));
- 	    }
- 	  resolver->ErrorResponse (this, std::move (msg));
-@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
-     return nullptr;
-=20
-   if (words.size () =3D=3D 3)
--    words.emplace_back (u8"");
-+    words.emplace_back ((const char *) u8"");
-   unsigned version =3D ParseUnsigned (words[1]);
-   if (version =3D=3D ~0u)
-     return nullptr;
diff --git a/meta/recipes-devtools/gcc/gcc_15.2.bb b/meta/recipes-devtool=
s/gcc/gcc_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_15.2.bb
rename to meta/recipes-devtools/gcc/gcc_16.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb b/meta/reci=
pes-devtools/gcc/libgcc-initial_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_15.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_16.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_15.2.bb b/meta/recipes-devt=
ools/gcc/libgcc_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_15.2.bb
rename to meta/recipes-devtools/gcc/libgcc_16.1.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_15.2.bb b/meta/recipes=
-devtools/gcc/libgfortran_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_15.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_16.1.bb
--=20
2.49.0


