Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA28CD5BD0
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 01:53:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2181.1779933220917554372
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 18:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JjmkE9cn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96084cca59=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S0eInr581924
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 18:53:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=g0e/sNREndtwlEeuO3d5bMuiTp64JjysPDKzWOe48MA=; b=
	JjmkE9cn9/USFhzoYCzi1qr0/9c2XV+ofDeZPh3AkCvWutaKkk5zVpGLgl6+Qw7+
	059puXK7YNJQbioryqogBVtRY9CWEjwwOgjkbp5lChSa52Bd1ZI6wKwEHnxP1BR8
	3mrV6YWIVU2NUlQSSTusUONeYsCurROMON/vFGQ5I0Um8gf0FSBmDq8e2jUuGx9+
	soEcbwIzUkmdoZrMJZqFXWhVfrXymrxNdmL45c1PcwVgYnIuQmsVjGU9Ftg4HNEL
	6PYAzJ9l7fqMjq/pilkPzSICdkfeRXlfhqLKmusE33d6l2+R4uMXjvlFspIi9tKu
	yvhdee25n6KDrZBjQKKJOw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012030.outbound.protection.outlook.com [40.107.200.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x6g784-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 27 May 2026 18:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8QAvgi3s0nkqqwToz6Lnf6lj6ghcoImWnA3fV1nWN+dYqvHvd0ucVpBZkCvKVX1Ox7KCUcCSmlcGjKpgG0fFjZte/pAjY812/Jm1LLXV6W9grtwlRpO1L925nUVZUrdkvj3RyaFRciH9UQhAqn/FyAYQbdjCUtrEuVGAGRbLLTFHrUwX2jlgdhR2ZehR4DNKsookGLksfaS7sBb2PIlhV65HZZwO0eZ0+D/cu5o412XCDI6uxHyT8whACqZqAtzL3HoqZAISNa00iPwAL7uxvZSqOhPBVi/tX934yuxALgaekQUPPtlFVVGaq+leVAisAbB6VNJKYH1MG9HOOtRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0e/sNREndtwlEeuO3d5bMuiTp64JjysPDKzWOe48MA=;
 b=X24AZjpjzoXRlgsUAr920rFWgf5Pont3ckPsMrK4Daze276uMnS+AwyTT3SrfWRsR8D8S0hjrb0uJdYhsU9fuhh9FFFl+0RmFcu71XkI5NbuoV5cpHHHeHGbMn7kQlRsaRlvdMaKbtJ6sFSixlTOjlbp7yYGwGHYWO96T1jdp5B6gnXGfnc4D+EmZ/5M2Q6QP/nUsDLPlmVHDTHhb8N8wUzL2ejD0dJKQtL4VTYs7i41HeGczh42ILegtU8fmTLq9EndZS2jDGGfkNYIx99MJOVgEg3y5uCzCgj79ixg4J9Sj9kP6Jei0SDZH+4irlHN7ZFA8gO3OkEcYYUVp1/jXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by PH0PR11MB9725.namprd11.prod.outlook.com (2603:10b6:510:396::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Thu, 28 May
 2026 01:53:37 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 01:53:37 +0000
Message-ID: <b7178a33-406f-4163-823f-ded357758d6d@windriver.com>
Date: Thu, 28 May 2026 09:53:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [PATCH v3] subversion: fix svn-revision.txt
 conflict when building for qemux86-64
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <20260528012701.1834030-1-haixiao.yan.cn@windriver.com>
 <0101019e6c4268ee-d51fbe88-f169-4bd0-b99f-906924b33fd1-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Haixiao Yan <haixiao.yan.cn@windriver.com>
In-Reply-To: <0101019e6c4268ee-d51fbe88-f169-4bd0-b99f-906924b33fd1-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0242.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::9) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|PH0PR11MB9725:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e58a41e-8b6f-4cb5-0acb-08debc5bee78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	jcIKvjXO1E3DaA/R7EClO1gA8c0YZpk6KfhZsVZauYv7ECKdk6kzKyAmq1KTGCWzp5oS68IPJi/lqdiT0slaltddRnzzvKJPr+OlxXNfa29ByHEWs/WAYjeUYh/7lAZ+qJUnjKiLgD+LEaumfW9jYPcRFhlxotphWHaOTns01LksdqfEQCp7A4f17Jt/f4oFJRLtkQB/vLGi5uFcHjvp3m1wJXOd21KLVDUqA6Q2UgnFKKrDF2cv/rTiBYeoL8jOR8csBUpzxsWPEzTaqExhMV8BbkGKNKFXiK06xAcnmIsjd1dHB5jQAl0/P9OQXP6mRYoGEUi9/xVQj3ul+y5zp/XdNNJbQjQCpKWSoeWNJRsLgqR3zMAsn87T4P5pCG2LjG4r68fuDOpS7bh6kGz3JU92cQf2woeQ+9ysuPeOd75ekHfhrfzbVcaPUcOUFfgghCbE8BoQ9iWw4jrzhLaY9eBEwChjH904z8JqccShpvyp4whn2bSRsaDMvSrws9TZY9lKsVZCOXZUfsyq7rIIEBov2MrBFfg4maNCinPaUc+1TpfW/1DnNe/BwEwOiBTWogwGcXn3xorGYadVhWjyu57zADMWpbWCbYw9L0cx8/ex+giSGxgmvDaDtFMKPK3c2opr904q/fAp0eOOZq9iYA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q2lTRENSVnBJWTVzTEF3L0tweHp3TFpTM1RiTFVQNzhyamtCc2srLzRUeGV4?=
 =?utf-8?B?THpFZkp6Nyt3OXdxWHJhbjRaMVVrZWtUbS9oaDRhZlVsbHhmTWl5N3ZacWxW?=
 =?utf-8?B?eC9NVW80SGc0bEp6bzhCdlRIVGF2ZnJhbzBtVzJLdHhaeWhCQXRnNm9NeUZv?=
 =?utf-8?B?S29ONmdvcHJ0OGt3cVhLSkRtZGZmMHBzTloxekFxRXBpYUlsQmdFSW1JZmdS?=
 =?utf-8?B?VEU0cG1LZVlzQ1Y4WmlyK0wzWldOSENja1ZOcmk4NU5Ja0dCNGZVc05Ramlt?=
 =?utf-8?B?WW5yaVBCMmhqUXl5QVlHSVNqWnR2bEpEbkQ1b3lxTVZqWVNHdktGTjVzS09y?=
 =?utf-8?B?MUxuMERib0hQcjNTMHVWOWpFZFBwWVBlVENweVRodWdxSzRSU0QxYzI4K0RH?=
 =?utf-8?B?UDkzSGR1VFpZQk1Sczd2dWdhc0lnRHFnSkxpUHJaeUxVRHlVRWg5S21tNFRa?=
 =?utf-8?B?RENkdEQxazJHNStrOTNFMXZERllTcTdzOHNTdHpRN0JwY2pxZ2pONFJpMzZG?=
 =?utf-8?B?SFdRMGRJSk1QeEtaVVNyc2NEZHdZQzBuQTVERi9CdzFGTm5wTkdVWFRPV3RM?=
 =?utf-8?B?S2pqMFVNQm10WkpnbC94ZnpSTU1EUHJkV1ZwY0ozbjBmeG82YW10dFJvQTlT?=
 =?utf-8?B?UGpNQVJlMW5RYlZKblZPVWZHc2FDUWlkVXZZSEozZ2NXSmo1enFvT01MYUE0?=
 =?utf-8?B?SHptNTBYZjMxUHUwb20zVzVLdE1FcFFsNWxXUVZXeUtLcHFMMVRRRnBucHhT?=
 =?utf-8?B?R2d0UUEzUVJlMVhNZmQvN01VTXdSZjlLSzBoMndiWCszSjF0aVhyNjRvNXJx?=
 =?utf-8?B?SlZ6VUd1djlTSkQ5eERQOSswUHZPcGxyMHVwek5ycEFrb3FkQ08xSFVhVDVN?=
 =?utf-8?B?OE5MRmZ1SFRrd1d5SGxXcGpWdklENXN6MDdzUTk2cnJpU2JCc2ZUOXgwM3k0?=
 =?utf-8?B?U3ZpMkJ5MFRaQ05nSlM3WVNoV3JXOHJkWGVEV1JhVWt5ditOYUFmck5lMnkw?=
 =?utf-8?B?a0NWWkpDbWJ4bjdiWklvaGFyaFcxWUh3YjQ4N0hIQ1p5aFlxZW4vejg0UXFz?=
 =?utf-8?B?OWo4dmlmWktMclA1eWNQN01jNnN3dnR0b2dLamE2cTR4ZW1KbXRFLzFTSlUy?=
 =?utf-8?B?OFFDWGlkNDIwb0NDdWZ4N0xsbW4wdnFVK2xDTFFEMHF0QWpaQ2FxSWVTbVlJ?=
 =?utf-8?B?azM2YlVPVWlZS1A1Rjg4d1preFdhRURrQTJvbXFzWVQxUFZHSWhTVTJ3czZh?=
 =?utf-8?B?ZFVtcmpza2lGUUQzRWdSMkNZQlh4M0poY2h1cm44Y0xLYXM3QitWT2pPWkRy?=
 =?utf-8?B?VVdEb3NDZm9uUkpaV0ZMUXVobmRaSlpqMWFpL2ZRSDVDbXJSdXUzTFNIU1hR?=
 =?utf-8?B?eGJ0REF1aHNyN3ZaKzErQ3E4SDMwR29walByRXR1VmVqMjdYUkhWR1l5dTBB?=
 =?utf-8?B?QXZyUEtMRU5SWUZwMUNic2pSVDFjamtwUlpGQ3RPazY5c3lydmdGRmU5bm5X?=
 =?utf-8?B?WSswb3JZcS92c2hkTmxobVF0dlFMU3N5UzdvaFYvUVJoTU1yRTdvMGxOSThB?=
 =?utf-8?B?MmNHNS9CenI3ajF1T3Z4ZWxIbW53aDFmVi9NT3E2Wmplc2ZTQmVPbkpzQVZq?=
 =?utf-8?B?Z0hZWG8xN0hBaVRqV2k0em9NeDhSZjJrVnNJRndNZ1U5aFNWakozYitPUWJi?=
 =?utf-8?B?YXgxZ2hHeUUweTBNeXdraXRnUDVoSkxpQUd6RWF0Nk9VTFFsZHBKRDlLK1RE?=
 =?utf-8?B?Z3Z6VDR2alg2c2w4dEQwMDhkSkVCMFhlb3k1bjVySk1vOUpnRXR6VEVVZTdq?=
 =?utf-8?B?WE1YcHdEMXlYQzVDQzl6WGVNQWNjdUU2WUJINjR4Y0x5VDVzK1g0NmdsdE1q?=
 =?utf-8?B?SzlRaGxFZ2ZxSUQxK2VyVW9ybFVEbjhiUVRUUkE5VG4xTHVDeTgvZGp1OG0v?=
 =?utf-8?B?QnZxSzIwOUFxNlhIOVgwS0RJVms4R2xPaHhqY0RHT09ZeFFFbmJ2RGxaWmZu?=
 =?utf-8?B?QWhrU2o3VFRYZWhad0QyNk9jdXR4bDBCSjFNYWNmeXF4L3Rhc0ZWdEtlU3dP?=
 =?utf-8?B?aDdNa1Nramx5ckJsZ1cySGRBRlhBUE9qYXZtY1NTVnIyRDNiTDdXQzBNbi8x?=
 =?utf-8?B?U1dpTm1OM01SKy92N0VQQVhyaUF3SDVzVCt1YkxESnp0aVBhREtqeGFRVnpZ?=
 =?utf-8?B?eHFhMy9KODdmeWwzakU4RVpzeHFHY0hGV253UnFlRXBDZ2xoL281NmtlOVlK?=
 =?utf-8?B?YUpPUWc2bFpZU0hVbWJaWEk1QTNJQ0J1YWJUMmJrS0d4NG9MMXFSY3FZejJ2?=
 =?utf-8?B?NGNJN0RmbnpuK1BObDNOcXkwYnhBSzZxT0Z3T0ZHWWJub0FKaUs0b1Y5cHVr?=
 =?utf-8?Q?QsLR9Jn3FxZgIzB0=3D?=
X-Exchange-RoutingPolicyChecked: 
	PH84NXb14aJC7uKSFMB9un4i90sf+9DU4cg/yK9bKAqWSITUrORbJhp41FIJ2WEcvWt1iJyBu5ElotWBy3kpDi5RaJB2bVI9qN9IqwtlVO9awJlFubaqN6A9jqgMBbyVWAl8C6IPO4wlRZ3WKaJZN68M+04jGGgZvT0BE2i/fbPwet7hHj3XHuG3WEu9+83uGu56HVbrpzYxq76ri5jKul5AL3PI9M9ezLI512z5po0+/drkxLgyFM3p0HCMoyeRBoN75XtAIdaWyxsw+CPt73V7tTw9IPyseA8XCJdkT7vNVWzNp3RpkxYps10XfLxj44Oe6oH59XI1MjqSlUBNYA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e58a41e-8b6f-4cb5-0acb-08debc5bee78
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 01:53:37.1317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxONlRRwrCK7kAloDNw63w4H2y3ofZcZOetoCgmUVS2Yin48sz2YKvhChE7ikP+On7TlaTD5vjaYwzeoBJEfsy/wbLWuBQsu7/gr197cQX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9725
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: lrpqyqgIGvohbZ3Rzds582L2cRL3w8Kd
X-Proofpoint-ORIG-GUID: hwUAf4j9lhRS6u0eSpIMVgXF2DNBIraE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAxNSBTYWx0ZWRfX8KGfcPN6Qphu
 4fREHDRudT3gGdXRNtrYmEAHYUS+Erjios/vyLcFdYtreZu99dpJgBaQ6GgZjBU1kQ4LUCDbY/C
 4RtHXJxTmuFkkb+rpLIeaLg7yAUIxxfCe+E0tJqiNLaZG0rCJeHxq5tDxahGRY965TJbW2hiA67
 5Jgj+QdEiDnhBHX0AkTSpYWkrmAtupBmQBMw8u78sDNfFW/K/KEGJGt3y7h4aFZXt2HgAfmMG8t
 1nMTM+XAtuo1MzQD+auxz2l0hPCOpx4GPBFyTfvmsza5xiuHunDh85LSYxDGL+4El8I5fFKIzGp
 B8ceQV9AGvpSDBOWHwVNzTdkZ2Rja6iT85T2k26RwuThxFYIfHtV7v2z2hHxM3QPHSg8GMEJcjf
 zSRTB2ijlKfOEQ+0qAGCnnrUZfAn0n4Rp97XjD6z/htqwCNQlvDln3AJFV0y1hdKu2gtWlfP1Vg
 Q9y8aAgsKunsPw0ZlJw==
X-Authority-Analysis: v=2.4 cv=bY1bluPB c=1 sm=1 tr=0 ts=6a17a024 cx=c_pps
 a=7AyV/nWbqbi5qqSn9KuTSQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=Vt2AcnKqAAAA:8 a=mV9VRH-2AAAA:8 a=iGHA9ds3AAAA:8 a=u321q_6X9ciCKB31TwwA:9
 a=QEXdDO2ut3YA:10 a=v10HlyRyNeVhbzM4Lqgd:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 01:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237678

I have raised this issue on the subversion maillist, but there is no
response at the moment.

https://www.mail-archive.com/users@subversion.apache.org/msg30267.html

And the reason is:
Upstream-Status: Inappropriate [issue reported at 
https://www.mail-archive.com/users@subversion.apache.org/msg30267.html]

Thanks,

Haixiao

On 5/28/26 09:45, patchtest@automation.yoctoproject.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/v3-subversion-fix-svn-revision.txt-conflict-when-building-for-qemux86-64.patch
>
> FAIL: test Upstream-Status presence: Upstream-Status is Inappropriate, but no reason was provided (test_patch.TestPatch.test_upstream_status_presence_format)
>
> PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
>
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
>
> ---
>
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!

