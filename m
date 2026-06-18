Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9746BCD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 21:31:56 +0000 (UTC)
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com [205.220.173.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30063.1781818311922264407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 14:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=sZZZE9+c;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=qIrgmAUD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.173.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187216.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IEqjjp3122913
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 14:31:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppfeb2020; bh=mzlkap5sZTtta1zmHlWHTN
	VGCDCXv6lTKfEGsn/0W0M=; b=sZZZE9+cqcDovdYwH2HGypEJWzCqAy15rDvJF8
	QyBptIFJaFbITt33fY3w4RSh+NAuBBO3Y5sR1Uw2GQmLy87+45xCjL6m1/A8gFTq
	UB72WbI/+yVtMPlCpb9hPlECizh88Ciz2drb5TIx7ASTrn1f23FV1NSixInm4jwy
	0L0MiLm4n7b8syJGU6f4zGYlQh6OK2WvaaUg6hFUsUdwBYcN1F/gxgaNQNrl3NW7
	9M8963/3VcXIXxO6D0eOrJpJnljSJcvJ1EgI0XdD8iCeKrgikBxtHn9Oc5/MdfK5
	tBjD0ayaq11tdRlovNKJ/2gtLwfgQIH6KFDDwDehqSuBAQtA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012010.outbound.protection.outlook.com [52.101.53.10])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4ev7eg3psq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 14:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCYCcMdYpA5yOLrCBOjsji8VouobPVTXUnRlxvhmsr9AyFi+XHl6UhD+xiAr5qrVDUUP+trc7EiTRWHV28dCl5Z/he/VEbX8uEyUSQVX2kWZNr8Cm1HDGKJqiUF1sc4gNz6GB50j324M/1oOEvekVLHYWvU8544YOgH0iOoJh80+g7Q7U3vpsBfSx8jCC0ot/sFUYTx5WN7EMTqDbxNc7FsJhAQOXR2j/w0IDJ2R7SAttPGuLitV7Dy8z2QHTa/xjn9L5JJLEQXZcIWu/ar6kWeelwh60kh22hwCMODduLh4+fcjN6+efNLOlVoYOhRNq4OMQsS5LUYA7Svj0vwNXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzlkap5sZTtta1zmHlWHTNVGCDCXv6lTKfEGsn/0W0M=;
 b=ufKElrRYt8qxhNqKusvcH8TwgOpFqLiRpDnqi0eKQEr9eC9KFq+FI05jQ078y+Qb7V1QmyBK0vUwZfhXsZOK8QQ4fbIM6a7ea6hx1wvkuPx+ezJWBzZzYzJgw4eFiM5Ya0n13E2JBJhl2Ax1CmFRy/wOZW8F5AHJWpdTlG6hY7f9jOnJuXN3VuMZBRJ29xdiP2itpOFgx7KH2d+p4cftPTlEXAgr8YYaxDaFUM1noQFcOLl0Sgrshix3RcEb4nNCQxfx8UEIcpWs0ImgOJBJSiRtBoLUu5b+93ijklBTPe2PJKxrsVt4FtNQ7GQw6E54azulVhQ9qwA2Ooe4RJWZAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzlkap5sZTtta1zmHlWHTNVGCDCXv6lTKfEGsn/0W0M=;
 b=qIrgmAUDlYQCbZOjgz30viCAWw0Bey6T2kpmB1eU0S0yJFDf6kX8nJsBT0Yhm0zFZ8v+V2ljK0cIuPa4YvUijfFCXtSWqSIJoKDbLrfOOGCJ4RAmDgigJG0JG3JVurCjtv1wQAnG0nn8P1jvMhLkAUHqML6gBipVI1XmdSm1DEw=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by DSZPR17MB7482.namprd17.prod.outlook.com (2603:10b6:5:282::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 21:31:48 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 21:31:48 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [meta][PATCH] go-vendor.bbclass: Unpack into BP for destsuffix
Date: Thu, 18 Jun 2026 15:31:19 -0600
Message-ID: <20260618213119.2495463-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8P220CA0033.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:47::23) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|DSZPR17MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ec471f-486c-4ae6-a7b0-08decd8100b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	PdYvbS9KxNpPTjsNbza82TOarksFN+ej5cvrCEG3a59+T4G1KGo6nTGHHfOy8tlqYlayNMV6f2qDxnE0MeaHevpcjM/sBnGAGnN9SKR2GX+00dKz0sJnXUYrpfYZq+ip1W4mTFSftbimZYqGI7vk3lrnOEJnHEcbZaDo+a7ZsGEH3/FDdJf0Z/Ak8EdGdyQhD1KaWyP2mkSgTD5qi29IK56cugBEaIf7EHNjCsJSL5TVADxOZzlUyo1j1oZisrT71o1j7ZMst25OaclBu+/Z8LJJXZ8VxOI/d+BQYAC2Rw6r7i8MPdt4eLWB/NMzmWsBNgfym8ztyqppPYt8HawZjf9dYo0Klh3k0/dVrGUbF9VaavNzcMSxbTABxLnP6gE2v8MkTWPszqk0EUAdmdTbVZ9D3yfG6wM0CskLWj1cF/WcNkoMsV/gEUnGHfzGNDpZyAm49OFvQi274bLc7uMJojO3NrO1k82QljrjnsJJ5eKq7lEnYdhjrDCGKDgTwHM2WesOwfrBHitB0FMfSEW1Px4Ka/lHNrhSBAI+CMP4+5IpGE5EbP8hgVdcMEv7lXxAv/Sq67kGBYOwkR/6VwK1JjyM2X0wGk0PZcytYEo/ihbZTfm0ulEMP2LW2AIPt/b0IRIXrqmazKtcvl98tCSpeqljSFLqc+9mRl1Oef5+jdw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xmN1iDFJcuJT8TkQjM48/+cTxQndL6m/lJZCrEUEJCT4JtAUTsb0UUXGMPv5?=
 =?us-ascii?Q?l+mfZTaSqCS65IVn+cOTLXh0PRuIP076tJp83EGe5hPMOruY6buyLRAbEiD4?=
 =?us-ascii?Q?bgaUh6UjI7SOpRZnYLXGI7wlMRdttwHnVAPb+e3yQKqSfiDlslNLFZatIfwm?=
 =?us-ascii?Q?dAreBzbd+9RYbCyZqjbH2su6QoDdCBI8ve4bIjpP2hUwdinpSMbTVU6OUIoR?=
 =?us-ascii?Q?wWgYFaX3wY+qtqYVcpb9bg1Q1QGkiSx9K7ncV6XQvjrfsj00DruAa3Q8QeGE?=
 =?us-ascii?Q?AVr3nntJp3VJIp0kMlkroaNwWPuEUUf985I7CV8b2w9o8//73mxZDPs1nMjT?=
 =?us-ascii?Q?Z++tPGJhwooK7sxCoPylcPDZS2/QhJqz4Zln+5700/HNda+FCF7uanawm0U8?=
 =?us-ascii?Q?go+qXceIvRk4r6+Dq9j6oeeEeLcSBhzPYX6HUojOYen0kRMPZThtMfZv1WNR?=
 =?us-ascii?Q?MrotaCBUpAQylr+Cx8s58oTG52vfzNdx3u2iglz9LsWfJ6gKfIRVruHK1JWk?=
 =?us-ascii?Q?uNi3Nw9oeQD+f1krCOcBPPuL5qBxil1lXqov4gcJlMlv2iNNqF4zX7nkVleh?=
 =?us-ascii?Q?NjYugGEQO7CbAJJI+kd0Y/XKsgll4M6qhsAedJqLz5DWI9tc0B+oPCiWafBf?=
 =?us-ascii?Q?oQx3SbGrEqqV7zg9YiGnSEw3z8moORzbPGV9rUtm7O5Ld0VeTjvDz2tQ86cc?=
 =?us-ascii?Q?5RzKUcFuamy1MqGOv/VaR85kgXOxesyaf3TlNysGR8742XdKyYfBLLHBYmsM?=
 =?us-ascii?Q?Bo/BKtkdgaRHYR4YCHI4J6a1nM9/JF30bIQ1rwDaZxFBC+r5JsWM3Ff35ZaM?=
 =?us-ascii?Q?79N1v8hW98a1jSnHiOawZfWxz9uqyjwiGfs4046o6uy1HTZLxVbcDv/+NB7i?=
 =?us-ascii?Q?AvQYSa105nGll+Ukyp5cB0L4y2U7Yy8vjGHuCEbbcYgHoq7RkbaPQbT5jn7S?=
 =?us-ascii?Q?/8msvaevY3UArSCp8fN1OmH5A50NxsrfDuyYNejlgaY63HB/W9i4ijzY48xQ?=
 =?us-ascii?Q?/s3mkPgkUEJBGBEZIBMHJsO879Uiz8oOK6vbi1D/GuTotwv+DlAOFUt53LKw?=
 =?us-ascii?Q?CtAoIGLFh4iw1aI1d6vG5EXlw/tjXkyYVcgNUwkQmXKPqgypDfK2y4tCvocf?=
 =?us-ascii?Q?nRHOSBmPL6idaJXH/Tzo45hkgwKj1hvRAp/O+7k4pwSja6aEKzQ3hr/FiffB?=
 =?us-ascii?Q?k+Ev6nrfA2KNe7aJJYdldKXK8uAhd9rdiyGctQ6lYjaXWR8SdECPG7p9i1AM?=
 =?us-ascii?Q?x+vXwJl180B0gXUXEbSk47TDivbN8Y5hvakVpPViRAZVl79C716Mo1SjH/2d?=
 =?us-ascii?Q?59nxE8pKxnrdJTHKZQEiw1yp2hY/CqSjpQZpdE7D6lv4WysqNaNelUrEgBUz?=
 =?us-ascii?Q?jPVibGzXSbvqUCR7S4SLVJYBSeRBfelO9Lxq9URmttqxVTkoPmGWoY96cSMo?=
 =?us-ascii?Q?0ys8IyrwX8pike2MOXa990oFgamz9S72psIvXa6bArm1xcElO4RBc9KjM1B2?=
 =?us-ascii?Q?KWlGBL5ZzvD5LePAjKDa/6dd+utPqiW2kpUJHmRLUbR4qybFvPlbbRqU+qdH?=
 =?us-ascii?Q?XKNuJjcX/fBfhjMI3Z5yICtwrfdMF00mlJZISxZ75CCg7TM16d3DN9sbYl9W?=
 =?us-ascii?Q?ki8STGEQBjEN4E2t69sKzpQnKmvzvB3xj4YNb+7ySX3ufe+tMOhdbp0MbXwy?=
 =?us-ascii?Q?8HTP8aO7MksFI/RHZjAt/EgHNvErDszvPUhdfNXAxnrDSBS/gmMtUQfEC1NU?=
 =?us-ascii?Q?c06hdvLIqg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	lfOLU0peDKVEYv82++nOPE/35kR2Tm7BnZVZ/Wgjt+bHR0Nwm2hROJzDKmT6GbwzVY11d9RK6QsUAl9+sXtgXTRS1/nnRS4BQSOutBoD7x1zNsVvLvoMcSC6jnBSEAWeWq6BFg3ebdBFz9tHq0KdKX3YIzPyHM4HWDoeWUBgbptWZs7dUeHaPRkButFlVbnJxj4Bipd7eUY7jSCZfjpatle0i947yyD913VoObwcARLb9RSVIGPKPU3DN2DOB3aalMtlOq+XzGSAckqvfyU+0NbV+SpDA+fnqxfMJ+Yt4K1y/Y8usXHdao6EdlDc9waw7FA8de3ggBt2MxOPiY4fBA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	qNmnhxaNh7o7Yf/vVHIudSHCVe1+IdkR9aQYPG9x3gQAV5ee0ayRSn0RvwqkwtergV727vOTXtRknIaEmAnDXUkwv7v1a2Gr22wtl1eKJxbzbpCDRDKX111YtkpDmScCmZaCtGGBvpBM9Nc+SkG8iIddM4M4vml9dgX+x546LjwNP9qvryJysvgr+yJmUA9A0bn6TjmFDyzYe0qLu/D5JxTmgUyqBLV3vj0B3J8x3uFMAtBGMP9k1fxmN/mgG7Jil+F3QqFzhZX4vC8XdtoTVfZlWo5nLjdUMOLwzGiP732ewIak262VSD5zTDxN8/neqrRdpxOb8CqHOERr+7H+QK4Pbeia9n5dWsRa6CiMby94DSbUm/Mu4m4TuiynlT1pfTAPPKsgxagXBkVx9SMlnaq1vhGajIzwf47TvzKwST+vXGg6qJvPqgcyj05XLgiaMAE3ZYqQ1AC9TYh/G/OYv5iR/VfojLQ7MMcr+gNBfk9A0z1iZv0pktmbLNvk0N1EstsT62cOUJhcRQGS77uzvMiAnmv4P9CAKBuDFWy9VjUFuifSwbb0Mtf+NDBr/1YtG0BQwqSBmlBFfy3d3/sqely2oRnAkB1pvIhEB5sH/01UUsf9/Vjo5t26slvPyfMC
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ec471f-486c-4ae6-a7b0-08decd8100b6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 21:31:48.1884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkHCUh5CK7mEmN1IN/2KBtcR7j9ImxVy4SBaOUT307z4K2PCdWP8mFNvD0gnxVXirqsaajzHThzvlQ93W9COjKAOqpNrFYsGxLCB4dILyCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSZPR17MB7482
X-Proofpoint-ORIG-GUID: KgUjcFuSI2lHN0x1nHExZ6freEMWlWaC
X-Proofpoint-GUID: KgUjcFuSI2lHN0x1nHExZ6freEMWlWaC
X-Authority-Analysis: v=2.4 cv=A4pc+aWG c=1 sm=1 tr=0 ts=6a3463c6 cx=c_pps
 a=bwjaHK0hsJlcehRpTf+kTg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=ylRlBDd5bHdllK8znExr:22
 a=F6MVbVVLAAAA:8 a=RHezoNOrqTe-SeoOf3QA:9 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE5NyBTYWx0ZWRfXxIeLJ4B+nUuF
 9NOgS5A+spU8K7tsJ1YvFa9D2yTGS85AdRm8ODlvZs8XxK32SFhyRfPa+vMIxeeUOXgA1bIdQ33
 KYIdFArAM3w1imeK9yr9qT/+xGByTQhl9kvit1ZnLIMs9DiYzBsqJN6DO8afpbV3t92CfOWyZjG
 EA5OYcvGieU1NtMj97OjnN9OxAznOocoVCrP1OAdfC9fZVcrZQfg9Pr+SNqJTWq7c3c6++42c9W
 E4C1fmCsJAUD8dicdcdMyW1uV8wuOEjudtXsBsg12J+BOH4WHRIYvX9FOxscvZhrGudzIZ80LEJ
 FCOJHQBSHmwRm9hf30oUQKucFfJYQ/lLhuWBAt8gGbWO8ia/wt3bBJEFr73q+92t5aCnu/RMQsb
 aOpuF4PgxhCh2NJzi6uj4UJ/+m/ZMhgigqprJ/ZIhT+B3qWkSquXSERXXBUK4ZrwnQqaizd63wi
 YMs835sUxIoCxt65tZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE5NyBTYWx0ZWRfX3CBMZY9f12N5
 0whVXhKnGOqObzgK9UFiJ7HcHA8Bm4v/yI34nhSZIADrV+flWTgXOgpNAE8G7Cz6Kuy1DqDAi1P
 MZEOyByBfev0oQYZZyH21qq4lsK/q8hBO04dOqUJsYIi5WW3C5Xm
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11821
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180197
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 21:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239109

The go-vendor class has a hardcoded destsuffix variable used to unpack
sources fetched with the go_src_uri function. Change this unpack
location to take the base package name into account (BP) as is the new
standard.

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 meta/classes/go-vendor.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index 6ec6178add..f854d14bdf 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -19,7 +19,7 @@ inherit go-mod
 def go_src_uri(repo, version, path=None, subdir=None, \
                 vcs='git', replaces=None, pathmajor=None):
 
-    destsuffix = "git/src/import/vendor.fetch"
+    destsuffix = "${BP}/src/import/vendor.fetch"
     module_path = repo if not path else path
 
     src_uri = "{}://{};name={}".format(vcs, repo, module_path.replace('/', '.'))
@@ -58,7 +58,8 @@ python do_go_vendor() {
     if not src_uri:
         bb.fatal("SRC_URI is empty")
 
-    default_destsuffix = "git/src/import/vendor.fetch"
+    base_package = d.getVar('BP')
+    default_destsuffix = "{}/src/import/vendor.fetch".format(base_package)
     fetcher = bb.fetch2.Fetch(src_uri, d)
     go_import = d.getVar('GO_IMPORT')
     source_dir = d.getVar('S')

