Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8888C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 16:31:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.78313.1674750685032290274
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 08:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=LertKw1K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0390690866=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30QDpAqk013994
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 08:31:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=uRc6lJ24Dq1hWRc54eeN+n0Vt6TidhaOkxKVhJmWuQ0=;
 b=LertKw1KZliE90sC7syhVFOvtn72OObec0kJf3WkJGujeSRT4VvznXyNVea3LkomwhSR
 ATOq5+1hzWh9scKYl4txYf2hQ4xbGxpkMIDSg8t5eFFs2ufh/FPfOoPQJV92XkBcdJjO
 cVpgq5XlsGykrHnFxNg06EUQVJ+Kamf6IL5CT8YEmtoWVSpeIMikQX5MqGdLbD3AYbaJ
 IA5FN5MA/Q6FCPnfyphIs4WPHLAM7VTbltDmlxRB8ZOWmj39bc97a1y2Fj1va2IQMRMP
 bBoHG00k0iQJaNINnlhdQSwPeqcjQDMElDKZBXVAtDwLz9BeNC180dondCHsqzQnw9ut Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n8geqwguh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 08:31:24 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30QGVOhH010971
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 08:31:24 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n8geqwgug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jan 2023 08:31:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mke9cCPlBU3n0W5jkyHZc9uZwnmhANqzCbfJMTOF+oRSZfQ2drwPtQ5jxnnfPVFVp9JSuWG2jPFmSPn6SGOxVmeMlfHWDmZmYH/rIrmiikp5qWL+68lvwzUlj19LsT2c+aRjyn8cLP2zSirakawmMYhXRG98Xz4d+fYST0zlSBhPLKDXFCMsxuITWogL9bUhZCr8tHV1O5c3URT9M5BHVyFo0HyoEZJTkLsQgKTdUzM6r83tTDs5ySnuURl6oO+TquEkhK6Et7+I5Q1r0+T4fUcjloeyrYMiy5VuK5jhu7Hi8Dqo1Y0w2E1VZTEcSFIbJwK9nKZMabBsnEk3QhURnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRc6lJ24Dq1hWRc54eeN+n0Vt6TidhaOkxKVhJmWuQ0=;
 b=cvQ74fVTDU46phUtajbrLvIpiMR96woJbJDmChQoTvIffooiCnDxgJ6+AfU0+C44BdqzRP1/sBYVWOnyh/BkAcsEaET/fcEKAxzbkHPD034yBaP+fcou4K9tHwUOEgsqLzFr3hwbVFBQE2VqPnr7oiAjhE9hJ0A8em6aNBioYiW7bUTWPEW3fV8Xh6QzVeNNx5gQRvCMF5bdDKL9NebBByh/fZCGJ2Cx26lmwsYLig6BN7MgXrVxrp5BFdy8B6NnNeVBTvLoBD9eYvSfmPej4KkGkE95mx9OwSbeeeCkXLhMdxBxzvxzXrDmQKBzE3uE5FWH7K8+Ia2Z72A8KxpkNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 16:31:20 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%7]) with mapi id 15.20.6043.021; Thu, 26 Jan 2023
 16:31:20 +0000
Content-Type: multipart/alternative;
 boundary="------------vsJOBQBkaA0cXHw0k0Xf2d5p"
Message-ID: <102181aa-b1c0-85d1-5cc7-cfa5f8f17e7a@windriver.com>
Date: Thu, 26 Jan 2023 11:31:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH] sstate-cache-cleaner.py: Add a script for
 sstate cache cleaning
Content-Language: en-CA
To: tomasz.dziendzielski@gmail.com, openembedded-core@lists.openembedded.org
Cc: Mikolaj Lasota <mikolaj.lasota@protonmail.com>
References: <20221121111102.5556-1-tomasz.dziendzielski@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221121111102.5556-1-tomasz.dziendzielski@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0205.namprd05.prod.outlook.com
 (2603:10b6:a03:330::30) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA2PR11MB4938:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c19bc1-b87b-43f2-06ef-08daffbac17b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8OVLEciFZm+OnQfLVRwelrr2OK6Y5sZAfNx6/zniGtimRMoDikXjI0qov28ztf9Uk19Xb+3UTtfsgJGzGxcxmt1Dpqv6z7GbwmBofo4vGaBdhRLdKJQYvazs1iIzK9rLoN/vqYuVd329z9jrEfTxDWjb0coqzhx3O/3JzLwCX7L+owU55G4yrDqpVrv2E5FoCXNfGycHSI4XmkcfgHDazcdzRXKTva68yG2klGtDo3aAa71KVqoCydRo7jEbUDLh69Y0nQQgjEMzypywlJNk5uxntNi8XBWpJmAxXlScgTUUpgrCDnTt3HoZqBH5tAz4fZRJgSOkQebdIuucC7ZnSr0v0Uato5ux58wquC7JjHxyFu9Grb7aek7i1KP+nU+8/Faf95u5H6uVcaUxWThb8ptdHZqfAldLLvX6JNUNWMG4Lam3zHu+oMZqfbDhTI8dZwZtclFX/AVAvcOTa9S3+/MPhew5iNQh/Yc7Ag6ZHxLKG1L5MiDFsNYt2DIJLl0tsAme6H7bGNQIv2/4ThJSIaPPdphpgmv4Ga65qkejCFmKpX8FCB3RkyUhjk/qq2yUSQVqJycyNcUpC55ZtaghiFvJ4KgqKJRBiM1aF1n7vkIbnlxNFB018J+iWPFWncAYBWX7HeEpXBuEGIzngvrFVnFFgH8pNBLDKqU2ApbzXxcQqclLLn7vQOnx3VSREAUsP0XMRAlBV2rTNMumlsF6sF4gUjXVmhfM44sRg4k4EEGDn9ivjhI2HCRTWa8CLgA9U800bKHJ4s2Rh8VK0nmrkO2zTdpRezqPpSbjGiL/A2BbOz+gYAiPCLbvvC1a6XyQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(376002)(39850400004)(366004)(451199018)(41300700001)(8936002)(26005)(6666004)(166002)(83380400001)(86362001)(31696002)(36756003)(66946007)(66556008)(66476007)(4326008)(8676002)(38100700002)(316002)(966005)(2616005)(6512007)(33964004)(186003)(478600001)(6486002)(53546011)(6506007)(4001150100001)(66899018)(31686004)(5660300002)(2906002)(30864003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NlA4WnhMS3R0Z2xXVG1QNDlSeGtSWkJoOXZudGhVcG5xTjRoSnZ6ZWxkUXlC?=
 =?utf-8?B?d21NaVlEVUs4eXBVbHdkejY3U0V6QWRuSmV0Sk5iclYxKytZdlpEUzNKNlYw?=
 =?utf-8?B?RFI1UGNPLzFkZ1V5bWlsZmpDUWk4UGoraWRXRTRlcTRTUGl2Rldkc1NoUVBC?=
 =?utf-8?B?TXh5K2UxY09EZEZ2NW93OWsrTDNuNTVlR3VVc1p2MWFNZU5DU09JaHpISmQ5?=
 =?utf-8?B?Mnk5eFREaTlyRXE2ZUVsMFFoRDR5Z1hudWxRd1FSMjROc2RxbmZNYzFMZEgr?=
 =?utf-8?B?SnoyblFVc1ljdCtHUmREV2pNaS8xdXAySG5EMmRRMnlCLy9FWjVyMll4cjBO?=
 =?utf-8?B?SFZMY3hWR2ZGcldITHFWZnR3YjlVOXR1a1BETEpJWjlMNXNUQmNyaG1jR1J6?=
 =?utf-8?B?M2ZIRG42am9rK1pJdnBSY1pMR3pYR3pWMjZIRXZva0JVdGN5VURqOWJPVm9Y?=
 =?utf-8?B?azNpWTQvNy8vQWl1MUJqNTdJbXdWeWt0UDA4RWFwak1jUExXS0JodXFSYzkw?=
 =?utf-8?B?OThMUXpCU0NTc3hGVVVoNmN4ejRRRnJDL0xzVmxBT2ZCSDhJUkVsZWhTdHlE?=
 =?utf-8?B?bVg5UGFGWEYzc1hZNDBta3pLaGN0RlE0c2VvaFJaNkVpY1hGTnEzOG5laHVB?=
 =?utf-8?B?RW5PcTArbHUzMjQ0Z0JtNFg0RHE2Ni9rNHlzV2xYMlJrcGlNRGYxQk5xQTRT?=
 =?utf-8?B?aU52UGg3NStBNXIzRHp1czhDcElrMi9SdC9LYUVYdjJEWE5tdUh0SWp0bktI?=
 =?utf-8?B?QkRVL3VPYWNhaG5xUXFoNE1SQW1sYUJoOGhwMjB2TC9MQmZZbEJSS3FUS0Ny?=
 =?utf-8?B?RURveXE4S3NXZXdpK1hOaDF4cllSbnRjSE9ZZGwwS3RWakxmU2JHeGFPZjl6?=
 =?utf-8?B?c2Mvejd2dkQ3UFM1MUprNGJrb08rc1BXWGsvZUt4aEVpTGo2bkR2WTArTzAx?=
 =?utf-8?B?TkZpWGdjdDRNNjJ2VThsKy9Ka0tSRExKamJWVlFRTytmQ2FCblJRbWhRSEdU?=
 =?utf-8?B?K3NVdCs3dGd3ZVpVNUZLT1JZZ0FiOEw0cTR0MUVpM1hlTGIvaDZsRFlNRHhT?=
 =?utf-8?B?b2tlOXdxM3ExK1p2eDJKN3ErOVhTL2Y5OUV6ODRKZ1FPNHNJRWdyalFva29K?=
 =?utf-8?B?VTdWRmtxRlhPK1BYWlgvcjV5U002cVhXTlE2Y1pxNnIvaGJLaTZpT3ZZeVhh?=
 =?utf-8?B?cDFoZGVNeUhKZlluNzZiMHNOb2s4a01tMFB6YlNRZlZKTDIxWElBV3NjUTRv?=
 =?utf-8?B?Ym9CUGQrbWJWVkhRQUM3cTVwczFBL1lWRkhwZElzaUNWakd4RGdUYUZsY2ph?=
 =?utf-8?B?ZGNLMFZwUDJOSHArVWhGbzFEcDA4dzk4QWh3UWlFVUpNNTVGMytJY2lSN3h1?=
 =?utf-8?B?ellwOWRBQjF5MjM1Ti9iSTlxdXVZeGhqZUpGd1hlRVdvTTF1VGkyTE9uTjBV?=
 =?utf-8?B?UXlkODJsYUFTQ1U5T3ZMMkJBOGUyN3Y2dWdxS3JPMCs0YXkwcFJLVFJNUGZj?=
 =?utf-8?B?N3cvSnVld3FHT2E3TEkrM0pEN1ZKeitoUmNrTURZSUJEY00ySEZDRUNRVXFk?=
 =?utf-8?B?Mi9jY0hPN1haalpBejRNWVdLRzQ1N3N4NGdxdFhtYXk2Nmp4NzJBWWxtQzZV?=
 =?utf-8?B?dlB2eHFRL0l0KzQwV2xSNTNMSkt2S0p2aHBqby8rZjFwS1lYMDVnUlgxQzQ4?=
 =?utf-8?B?T1MxWU1aMWRDYm1UUHN0anVYd0xSQmtzU1RpbE16TlZiTHVsek1pVnZiWDJW?=
 =?utf-8?B?dndTbUdMMjVwcktoenNidDN1UDBwRW9BTDcvcFY2TGdlMnJGUGFIOWd6aklo?=
 =?utf-8?B?Wi9ORWFZR0JvdFhCZkhMS1NtcTRyY3ZodWFVT3FlQnkzeUZDZU02anFBaHhK?=
 =?utf-8?B?S1kwV0pKM0ZDWldYc3pwUVJqeW15YU8ra2wzd0Fwd3dYbStFNmRISFgxSVhl?=
 =?utf-8?B?cklKL3Z3Mm5RV1JsK2tvc0ZwZ1Qweng1N2hjbEc3SVRtaWhkYU8vZ0d5TVdo?=
 =?utf-8?B?ZkFiZUNKZW9xcmhhNU5EakVQSmg4bnB6K0ZpNzNVQ2ZGNW16WVR3SjNXOGlR?=
 =?utf-8?B?dkhtWUhaYkRSaisrdzJpL3JWQ3pkWU9ubUE0VisxbDk2TldaeWJzWDQ4UjBI?=
 =?utf-8?B?azZNcXRzMHBaUjhWVWEvWng3YUtLT1dhdm5WdnZoeEs3NDV5U0l2WHBLcEhy?=
 =?utf-8?Q?RwhBpDPIebqfczB3mQU1LBk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c19bc1-b87b-43f2-06ef-08daffbac17b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 16:31:20.4380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7MHb9hvXA0ifm4vL9hXjW4C/IWPCfdCUk6SueMc0PBigxvsm6NEj8ie2/HWcDw80KQmXT98+JQ0ooc90+OF5/F7sTCxhFvBErbdyeakofQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4938
X-Proofpoint-ORIG-GUID: rnNuHqUEv_ePR4L_klyATuGLKR6K2nMG
X-Proofpoint-GUID: VB_0-0zJ0n7BWiDvTKBIaYbo9B4R7afa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_07,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301260160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 16:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176405

--------------vsJOBQBkaA0cXHw0k0Xf2d5p
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 30QDpAqk013994

On 2022-11-21 06:11, Tomasz Dziendzielski via lists.openembedded.org wrot=
e:
> From: Mikolaj Lasota<mikolaj.lasota@protonmail.com>
>
> Bash script used at the moment takes too much time to calculate obsolet=
e
> sstate cache files. Let's try to rewrite necessary logic in python and
> store intermediate data in memory rather than temporary files.


This seems like a nice improvement that got missed.

I'd test it and report on the speed-up but I have a million other
things to do so I'm just replying instead. What sort of performance
difference are you seeing?

Should we keep the old scripts/sstate-cache-management.sh
but make it a wrapper for this script or just remove it?

>
> Signed-off-by: Mikolaj Lasota<mikolaj.lasota@protonmail.com>
> Signed-off-by: Tomasz Dziendzielski<tomasz.dziendzielski@gmail.com>
> ---
>   scripts/sstate-cache-cleaner.py | 166 +++++++++++++++++++++++++++++++=
+
>   1 file changed, 166 insertions(+)
>   create mode 100755 scripts/sstate-cache-cleaner.py
>
> diff --git a/scripts/sstate-cache-cleaner.py b/scripts/sstate-cache-cle=
aner.py
> new file mode 100755
> index 0000000000..f01db35775
> --- /dev/null
> +++ b/scripts/sstate-cache-cleaner.py
> @@ -0,0 +1,166 @@
> +#!/usr/bin/env python3
> +
> +"""
> +This script is a python rewrite of poky based scripts/sstate-cache-man=
agement.sh
> +It has a subset of original script features - namely the ability to fi=
lter cache files by stamp files references.
> +The output is a list of unreferenced sstate-cache files - which are ob=
solete and can be removed.
> +
> +To test the script agains the original one (shell) one might create a =
small test environment:

 =C2=A0* against

../Randy


> + - create a local sstate-cache directory
> + - run two or more separate builds (different hashes/machines) using a=
bove dir (SSTATE_DIR)
> + - run original shell script using stamp dir from one of the above bui=
lds and the common cache dir
> + - run this script with the same arguments (same stamp & cache dirs)
> +"""
> +
> +import argparse
> +import fnmatch
> +import logging
> +import os
> +import re
> +import time
> +from functools import reduce
> +
> +formatter =3D logging.Formatter('%(asctime)s - %(funcName)s - %(leveln=
ame)s - %(message)s')
> +logger =3D logging.getLogger('sstate-cache-cleaner')
> +logger.setLevel(logging.DEBUG)
> +fh =3D logging.FileHandler('sstate-cache-cleaner.log', 'w')
> +fh.setLevel(logging.DEBUG)
> +fh.setFormatter(formatter)
> +ch =3D logging.StreamHandler()
> +ch.setLevel(logging.INFO)
> +ch.setFormatter(formatter)
> +logger.addHandler(fh)
> +logger.addHandler(ch)
> +
> +TIME =3D time.time()
> +ONE_DAY_IN_SECONDS =3D 86400
> +
> +def collect_sstate_cache_files(cache_dir):
> +    """ Collect all sstate-cache files form cache_dir and figure out a=
ccelerated tasks for cleaning. """
> +
> +    logger.info('Collecting sstate-cache files...')
> +
> +    sstate_tasks =3D set()
> +    cache_files =3D dict()
> +    cache_file_regex =3D re.compile(r'sstate.*:([^_]*)_(.*)\.tgz.*')
> +    for root, dirs, files in os.walk(cache_dir):
> +        for filename in files:
> +            if fnmatch.fnmatch(filename, 'sstate*'):
> +                match =3D cache_file_regex.match(filename)
> +                if match:
> +                    _hash =3D match.group(1)
> +                    _task =3D match.group(2)
> +                    sstate_tasks.add(_task)
> +                    f =3D os.path.join(root, filename)
> +                    try:
> +                        if os.stat(f).st_ctime < TIME - ONE_DAY_IN_SEC=
ONDS:
> +                            if _hash in cache_files:
> +                                cache_files[_hash].append(f)
> +                            else:
> +                                cache_files[_hash] =3D [f]
> +                    except FileNotFoundError as err:
> +                        logger.error(err)
> +
> +    num_of_files =3D reduce(lambda count, element: count + len(element=
), cache_files.values(), 0)
> +    num_of_hashes =3D len(cache_files)
> +    logger.info(f'Found {num_of_files} sstate files ({num_of_hashes} h=
ashes)')
> +    return cache_files, sstate_tasks
> +
> +def collect_stamps(stamps_dirs_list, tasks):
> +    """ Collect hashes from the stamp files (only for tasks which were=
 found in sstate-cache) """
> +
> +    logger.info('Collecting stamps...')
> +
> +    stamps =3D set()
> +    for stamps_dir in stamps_dirs_list:
> +        logger.debug(f'Looking for stamps in {stamps_dir}')
> +        for root, dirs, files in os.walk(stamps_dir):
> +            for filename in files:
> +                for task in tasks:
> +                    if fnmatch.fnmatch(filename, f'*.do_{task}_setscen=
e.*'):
> +                        match =3D re.match(rf'.*\.do_{task}_setscene\.=
([^\.]*).*', filename)
> +                        if match:
> +                            stamps.add(match.group(1))
> +                    elif fnmatch.fnmatch(filename, f'*.do_{task}.*'):
> +                        match =3D re.match(rf'.*do_{task}(\.sigdata)?\=
.([^\.]*).*', filename)
> +                        if match:
> +                            stamps.add(match.group(2))
> +                    continue
> +
> +    logger.info(f'Found {len(stamps)} stamps')
> +    return stamps
> +
> +def compute_obsolete_sstate_cache_files(stamps, cache):
> +    """ Figure out which cache files are obsolete.
> +
> +    Check if a cache file is referenced by a stamp file. If yes - it i=
s needed - and therefore should be filtered out
> +    from the processed list. The list which is returned is a list of f=
iles to be removed.
> +    """
> +
> +    logger.info('Filtering sstate-cache list for unreferenced (obsolet=
e) files...')
> +
> +    num_stamps =3D len(stamps) - 1
> +    progress =3D -1
> +    for i, stamp in enumerate(stamps):
> +        _progress =3D int(i / num_stamps * 100)
> +        if _progress % 5 =3D=3D 0 and _progress > progress:
> +            progress =3D _progress
> +            logger.debug(f'[{progress:3d}%] Cleaning stamp {i}/{num_st=
amps}')
> +        if stamp in cache:
> +            del cache[stamp]
> +
> +    num_of_files =3D reduce(lambda count, element: count + len(element=
), cache.values(), 0)
> +    logger.info(f'Found {num_of_files} sstate files to be removed')
> +    return cache
> +
> +def parse_arguments():
> +    """ Parse arguments for cache & stamp directories and output file =
name """
> +
> +    parser =3D argparse.ArgumentParser(
> +                        description=3D'Sstate cache cleanup script. \
> +                                     Cache files which are not referen=
ced by stamp files will be listed for removal.',
> +                        epilog=3D'This is a python re-write of poky pr=
ovided sstate-cache-management.sh script. \
> +                                Only stamp based cleaning is implement=
ed.')
> +    parser.add_argument('--cache-dir', required=3DTrue,
> +                        help=3D'Specify sstate-cache directory')
> +    parser.add_argument('--stamps-dir', required=3DTrue, nargs=3D'+',
> +                        help=3D'Specify stamps directories')
> +    parser.add_argument('--output-file', '-f', required=3DTrue,
> +                        help=3D'Specify a file for script output - a l=
ist of obsolete sstate-cache files.')
> +
> +    logger.debug('Parsing arguments...')
> +    return parser.parse_args()
> +
> +def main():
> +    args =3D parse_arguments()
> +
> +    stamps_dirs_list =3D args.stamps_dir
> +    for i, path in enumerate(stamps_dirs_list):
> +        abs_path =3D os.path.abspath(path)
> +        if not os.path.isdir(abs_path):
> +            raise ValueError(f'Stamps directory doesn\'t exist: {abs_p=
ath} !')
> +        stamps_dirs_list[i] =3D abs_path
> +
> +    cache_dir =3D os.path.abspath(args.cache_dir)
> +    if not os.path.isdir(cache_dir):
> +        raise ValueError(f'Cache directory doesn\'t exist: {cache_dir}=
 !')
> +
> +    output_file_path =3D os.path.abspath(args.output_file)
> +
> +    cache, tasks =3D collect_sstate_cache_files(cache_dir)
> +    stamps =3D collect_stamps(stamps_dirs_list, tasks)
> +
> +    obsolete_sstate =3D compute_obsolete_sstate_cache_files(stamps, ca=
che)
> +    obsolete_sstate_files =3D [item for sublist in obsolete_sstate.val=
ues() for item in sublist]
> +
> +    if not os.path.isdir(os.path.dirname(output_file_path)):
> +        logger.warning(f'Output directory doesn\'t exist and will be c=
reated: {output_file_path}')
> +        os.makedirs(os.path.dirname(output_file_path))
> +
> +    with open(output_file_path, 'w') as out:
> +        out.write('\n'.join(obsolete_sstate_files))
> +
> +    logger.info(f'List of obsolete sstate-cache files saved: {output_f=
ile_path}')
> +
> +if __name__ =3D=3D "__main__":
> +    main()
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173649):https://lists.openembedded.org/g/openembedd=
ed-core/message/173649
> Mute This Topic:https://lists.openembedded.org/mt/95169760/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------vsJOBQBkaA0cXHw0k0Xf2d5p
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2022-11-21 06:11, Tomasz
      Dziendzielski via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20221121111102.5556-1-tomasz.dziendzielski@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Mikolaj Lasota <a class="moz-txt-link-rfc2396E" href="mailto:mikolaj.lasota@protonmail.com">&lt;mikolaj.lasota@protonmail.com&gt;</a>

Bash script used at the moment takes too much time to calculate obsolete
sstate cache files. Let's try to rewrite necessary logic in python and
store intermediate data in memory rather than temporary files.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>This seems like a nice improvement that got missed.<br>
    </p>
    <p>I'd test it and report on the speed-up but I have a million other<br>
      things to do so I'm just replying instead. What sort of
      performance<br>
      difference are you seeing?<br>
    </p>
    <p>Should we keep the old scripts/sstate-cache-management.sh<br>
      but make it a wrapper for this script or just remove it?<br>
    </p>
    <blockquote type="cite" cite="mid:20221121111102.5556-1-tomasz.dziendzielski@gmail.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Mikolaj Lasota <a class="moz-txt-link-rfc2396E" href="mailto:mikolaj.lasota@protonmail.com">&lt;mikolaj.lasota@protonmail.com&gt;</a>
Signed-off-by: Tomasz Dziendzielski <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.dziendzielski@gmail.com">&lt;tomasz.dziendzielski@gmail.com&gt;</a>
---
 scripts/sstate-cache-cleaner.py | 166 ++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)
 create mode 100755 scripts/sstate-cache-cleaner.py

diff --git a/scripts/sstate-cache-cleaner.py b/scripts/sstate-cache-cleaner.py
new file mode 100755
index 0000000000..f01db35775
--- /dev/null
+++ b/scripts/sstate-cache-cleaner.py
@@ -0,0 +1,166 @@
+#!/usr/bin/env python3
+
+&quot;&quot;&quot;
+This script is a python rewrite of poky based scripts/sstate-cache-management.sh
+It has a subset of original script features - namely the ability to filter cache files by stamp files references.
+The output is a list of unreferenced sstate-cache files - which are obsolete and can be removed.
+
+To test the script agains the original one (shell) one might create a small test environment:</pre>
    </blockquote>
    <p>&nbsp;* against</p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20221121111102.5556-1-tomasz.dziendzielski@gmail.com">
      <pre class="moz-quote-pre" wrap="">
+ - create a local sstate-cache directory
+ - run two or more separate builds (different hashes/machines) using above dir (SSTATE_DIR)
+ - run original shell script using stamp dir from one of the above builds and the common cache dir
+ - run this script with the same arguments (same stamp &amp; cache dirs)
+&quot;&quot;&quot;
+
+import argparse
+import fnmatch
+import logging
+import os
+import re
+import time
+from functools import reduce
+
+formatter = logging.Formatter('%(asctime)s - %(funcName)s - %(levelname)s - %(message)s')
+logger = logging.getLogger('sstate-cache-cleaner')
+logger.setLevel(logging.DEBUG)
+fh = logging.FileHandler('sstate-cache-cleaner.log', 'w')
+fh.setLevel(logging.DEBUG)
+fh.setFormatter(formatter)
+ch = logging.StreamHandler()
+ch.setLevel(logging.INFO)
+ch.setFormatter(formatter)
+logger.addHandler(fh)
+logger.addHandler(ch)
+
+TIME = time.time()
+ONE_DAY_IN_SECONDS = 86400
+
+def collect_sstate_cache_files(cache_dir):
+    &quot;&quot;&quot; Collect all sstate-cache files form cache_dir and figure out accelerated tasks for cleaning. &quot;&quot;&quot;
+
+    logger.info('Collecting sstate-cache files...')
+
+    sstate_tasks = set()
+    cache_files = dict()
+    cache_file_regex = re.compile(r'sstate.*:([^_]*)_(.*)\.tgz.*')
+    for root, dirs, files in os.walk(cache_dir):
+        for filename in files:
+            if fnmatch.fnmatch(filename, 'sstate*'):
+                match = cache_file_regex.match(filename)
+                if match:
+                    _hash = match.group(1)
+                    _task = match.group(2)
+                    sstate_tasks.add(_task)
+                    f = os.path.join(root, filename)
+                    try:
+                        if os.stat(f).st_ctime &lt; TIME - ONE_DAY_IN_SECONDS:
+                            if _hash in cache_files:
+                                cache_files[_hash].append(f)
+                            else:
+                                cache_files[_hash] = [f]
+                    except FileNotFoundError as err:
+                        logger.error(err)
+
+    num_of_files = reduce(lambda count, element: count + len(element), cache_files.values(), 0)
+    num_of_hashes = len(cache_files)
+    logger.info(f'Found {num_of_files} sstate files ({num_of_hashes} hashes)')
+    return cache_files, sstate_tasks
+
+def collect_stamps(stamps_dirs_list, tasks):
+    &quot;&quot;&quot; Collect hashes from the stamp files (only for tasks which were found in sstate-cache) &quot;&quot;&quot;
+
+    logger.info('Collecting stamps...')
+
+    stamps = set()
+    for stamps_dir in stamps_dirs_list:
+        logger.debug(f'Looking for stamps in {stamps_dir}')
+        for root, dirs, files in os.walk(stamps_dir):
+            for filename in files:
+                for task in tasks:
+                    if fnmatch.fnmatch(filename, f'*.do_{task}_setscene.*'):
+                        match = re.match(rf'.*\.do_{task}_setscene\.([^\.]*).*', filename)
+                        if match:
+                            stamps.add(match.group(1))
+                    elif fnmatch.fnmatch(filename, f'*.do_{task}.*'):
+                        match = re.match(rf'.*do_{task}(\.sigdata)?\.([^\.]*).*', filename)
+                        if match:
+                            stamps.add(match.group(2))
+                    continue
+
+    logger.info(f'Found {len(stamps)} stamps')
+    return stamps
+
+def compute_obsolete_sstate_cache_files(stamps, cache):
+    &quot;&quot;&quot; Figure out which cache files are obsolete.
+
+    Check if a cache file is referenced by a stamp file. If yes - it is needed - and therefore should be filtered out
+    from the processed list. The list which is returned is a list of files to be removed.
+    &quot;&quot;&quot;
+
+    logger.info('Filtering sstate-cache list for unreferenced (obsolete) files...')
+
+    num_stamps = len(stamps) - 1
+    progress = -1
+    for i, stamp in enumerate(stamps):
+        _progress = int(i / num_stamps * 100)
+        if _progress % 5 == 0 and _progress &gt; progress:
+            progress = _progress
+            logger.debug(f'[{progress:3d}%] Cleaning stamp {i}/{num_stamps}')
+        if stamp in cache:
+            del cache[stamp]
+
+    num_of_files = reduce(lambda count, element: count + len(element), cache.values(), 0)
+    logger.info(f'Found {num_of_files} sstate files to be removed')
+    return cache
+
+def parse_arguments():
+    &quot;&quot;&quot; Parse arguments for cache &amp; stamp directories and output file name &quot;&quot;&quot;
+
+    parser = argparse.ArgumentParser(
+                        description='Sstate cache cleanup script. \
+                                     Cache files which are not referenced by stamp files will be listed for removal.',
+                        epilog='This is a python re-write of poky provided sstate-cache-management.sh script. \
+                                Only stamp based cleaning is implemented.')
+    parser.add_argument('--cache-dir', required=True,
+                        help='Specify sstate-cache directory')
+    parser.add_argument('--stamps-dir', required=True, nargs='+',
+                        help='Specify stamps directories')
+    parser.add_argument('--output-file', '-f', required=True,
+                        help='Specify a file for script output - a list of obsolete sstate-cache files.')
+
+    logger.debug('Parsing arguments...')
+    return parser.parse_args()
+
+def main():
+    args = parse_arguments()
+
+    stamps_dirs_list = args.stamps_dir
+    for i, path in enumerate(stamps_dirs_list):
+        abs_path = os.path.abspath(path)
+        if not os.path.isdir(abs_path):
+            raise ValueError(f'Stamps directory doesn\'t exist: {abs_path} !')
+        stamps_dirs_list[i] = abs_path
+
+    cache_dir = os.path.abspath(args.cache_dir)
+    if not os.path.isdir(cache_dir):
+        raise ValueError(f'Cache directory doesn\'t exist: {cache_dir} !')
+
+    output_file_path = os.path.abspath(args.output_file)
+
+    cache, tasks = collect_sstate_cache_files(cache_dir)
+    stamps = collect_stamps(stamps_dirs_list, tasks)
+
+    obsolete_sstate = compute_obsolete_sstate_cache_files(stamps, cache)
+    obsolete_sstate_files = [item for sublist in obsolete_sstate.values() for item in sublist]
+
+    if not os.path.isdir(os.path.dirname(output_file_path)):
+        logger.warning(f'Output directory doesn\'t exist and will be created: {output_file_path}')
+        os.makedirs(os.path.dirname(output_file_path))
+
+    with open(output_file_path, 'w') as out:
+        out.write('\n'.join(obsolete_sstate_files))
+
+    logger.info(f'List of obsolete sstate-cache files saved: {output_file_path}')
+
+if __name__ == &quot;__main__&quot;:
+    main()
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#173649): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/173649">https://lists.openembedded.org/g/openembedded-core/message/173649</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/95169760/3616765">https://lists.openembedded.org/mt/95169760/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------vsJOBQBkaA0cXHw0k0Xf2d5p--

