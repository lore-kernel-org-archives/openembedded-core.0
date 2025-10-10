Return-Path: <maganuru.jayasurya@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BBCCCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 09:41:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5011.1760089270831783063
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 02:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XxbuGY2F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23784d5933=maganuru.jayasurya@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59A9KBEO1414195
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:41:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=RVKCgqsmm
	htUQCFlNX62xJ+1oaljld3YPYBk/fEtTHE=; b=XxbuGY2Fp6wto+48PV0BTa0YA
	7CY5zKQgDhRLQeEwZ5l7IMO4s7jdKGM6SK40Oipheqd+dhFMvDPBwxT4aPka07B9
	NyUfFxraVraGcvakcErZsXC5E/6ZFGUFlCZXrfDg1+l992t5amAYj+MPBkaGtgGW
	e67l9ZzjGkjRCOk1ahqz31jULYA1zMLIYcLmNHoLVFfm+cphRNQr8Qwd3IFtZ4fW
	BFKb/fhh5ShIVKZUe24Wdmt3EimwO5eVO/pO/LvLPrjIQwGyTlh/B/zgdJzL5RpJ
	v24pivTr7efolXM//W4A5C+VsOJ6ZHA2YmSqivNVOolDF3J/gOcFliidN2UFA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010029.outbound.protection.outlook.com [52.101.193.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx2u9y2h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3tqpsZN+Fi4VBY4g3HY+wlWlSw3+lF7zR9FUd9WxmCYd7vvyk82UMqAPrlbp/O3xiLGi6AC2GdeD3RXXfk9jgMduAvy0MryQxppTs+9uI55g2SKAsWz65ZoVz8hO/bpNzr+gzXgfi6KfA0+x6gbLEpjx46mJ1DoiSY2jKbe2Pn9unEO3Zx4eg537+25RXIekg7eKvHYg30WlK647V/EX9Eg9MAqeS9DR1ZGidQrTyQxMyiC6nhkCD5bMp0GJ+w1r5HhL+x+bKRJbgE8nqahLn2zC9Fn/CxvI7u5SAKjRuQPnPCoIup7xGEdjo/19lM47Eb+7OLhTzPXivtemrlbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVKCgqsmmhtUQCFlNX62xJ+1oaljld3YPYBk/fEtTHE=;
 b=IYqT9J534J1Xqn5/MzbQ2GuLx6a77FtphfXTOZ8bcIHgYLhxXtz17DiDga2aL+6rFJAbEhlGDtn0u53v7/t1SXGu6G29q75XdHky826i6DHrXi59HXPGhOwD0cVnI+WRxXFpwVGyf0cE3tY2oDaqTGOnfD6sn1Bpv9YRKULmYGu9AK74iWGNGmRcne7dGCf4kyqSMav+OkMs3DmaIsR/3u2k2j0smWfeAxRnqw9LA1bLIM1ZLq9VHwL8OcwG9IYjVlbJqwUzTg20p4HYAN1QmUPuvEb6Ywl70EkRN8eImbN8MOUUyAkZOs/rZNNZr6BSb2dUYY/Yl8/dtGh1gnxVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN8PR11MB3844.namprd11.prod.outlook.com (2603:10b6:408:91::24)
 by SA0PR11MB4672.namprd11.prod.outlook.com (2603:10b6:806:96::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 09:41:08 +0000
Received: from BN8PR11MB3844.namprd11.prod.outlook.com
 ([fe80::a1cf:8049:9375:50c]) by BN8PR11MB3844.namprd11.prod.outlook.com
 ([fe80::a1cf:8049:9375:50c%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 09:41:06 +0000
From: Maganuru.Jayasurya@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com
Subject: [PATCH] populate_sdk_ext: include image SPDX tasks in locked signatures
Date: Fri, 10 Oct 2025 02:40:34 -0700
Message-ID: <20251010094034.4107881-1-Maganuru.Jayasurya@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To BN8PR11MB3844.namprd11.prod.outlook.com
 (2603:10b6:408:91::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3844:EE_|SA0PR11MB4672:EE_
X-MS-Office365-Filtering-Correlation-Id: 5061c5d1-b234-47b3-cdd6-08de07e12209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SG73sMuFqdRgpec/BEB9U1T+aOEN4zV4CZzmRJgYWA//tDtYliunPYWU/nXB?=
 =?us-ascii?Q?Tq6spIvb7seo7wPu6HhQfdg3VbkjfbicwcV37+tCcoxO468dzm+0CN/xFLDU?=
 =?us-ascii?Q?Y90EsEnKmsM/ra1gvSF4VGM7m8HElfeUnW98ozQETalEQnP55HUEHgDvNHpB?=
 =?us-ascii?Q?nvmVOOZdh9QKE1j4a5sar50h8EFRwcbWo07GvnUqbq74GfrPhI5gWxZvX8+g?=
 =?us-ascii?Q?dfEZttPE4RH1zFb1ethMMZqafH4HMfgbG0Mhgaabz91WZY76bObfvOI7C70A?=
 =?us-ascii?Q?3sTcMCPxT8MoXD6JEFC8Rpue0fnJAcplM8hMINYeycxWgEJlPOzMsmYtlXDT?=
 =?us-ascii?Q?6G1CNKGiNjFww2ykViXapUQhf3WQ2MEyjXF/oNUn62iMwQYwor4uAAxLtsvU?=
 =?us-ascii?Q?EDiFL+cMf8AmbiOsO0ACNjbnaHuGMYCd4rQLQUQYXDBeJP6OEYSvy4dYGS+S?=
 =?us-ascii?Q?YpEv4TVc5ihhQPjGmAalYm/s3ZKJhvG/NX2Z5TdsU31zLbxwp4fMVgSEP5uB?=
 =?us-ascii?Q?oyVO9EF+6KEDej54Z0AGF2fTuSzHKRRYYQZSkf95XulCYYEUHdc/gO+Q9eHh?=
 =?us-ascii?Q?yKCrGIj7Xcb21jsB07GapGA/5lj9XykdXNQ4xKF/zgZ7NJiM38z8jjb8pt9Y?=
 =?us-ascii?Q?5iFnW0cPysiYuChR4MIKISxGkpO/fr7L9qMA3uOTo/LB3JJkVewyjm/idX1W?=
 =?us-ascii?Q?bpaKW1dgqwuJBo1JHScM83xW7zTuY/SmGFY0RJ5psqTJuap6Cxpt0d7kOICI?=
 =?us-ascii?Q?ft7g27uxKZnTtXqXritYCq0NXL7TvwEFwXxRaTIXLXmfUJPB1MJO92OIW/Cu?=
 =?us-ascii?Q?YGDzjyiO4X/agATAKZZcEYZ7YQQMXSp+iD+qjSg5cq5Om7h9iw4Ffb5PUatg?=
 =?us-ascii?Q?a1cOvpRCJcR++/GpuwlLu1D6X/YneNY1rY5tI8izoxX0/NChL4XnQ/WW37lJ?=
 =?us-ascii?Q?1QewW05f5e21Vm0lp+Qix7p1XD69Fl96hlV5Tcor3QDAnubjf2ZRgvOg1jLz?=
 =?us-ascii?Q?Q/OiqLBK99iumQqGuX+4L0yoltvCjdWiDJpDTWgMiDl8v+nuj0XscW6Rh8WC?=
 =?us-ascii?Q?hDGBMqSQOGpCSFL+xv9gPDB3kmU0csshn9/C3zaIEdZhwRbDKlsQcu8Yh4nm?=
 =?us-ascii?Q?rxLQedXJMToDW5Uko//5YbzmFdGHlteEZq6rYPCrevBGQPDxLXorZBfRd21m?=
 =?us-ascii?Q?+VmlBDP3PzMcOkZes2Pc73fpm/gr1mvJV39oDroc+MPD7zHodUvtvXPG2GNU?=
 =?us-ascii?Q?s9yn+w17u6MSh73fLHhWVN5aJZsj5IWviFf6vqk5AWvZNWrQAdXdTSTRYLeY?=
 =?us-ascii?Q?Hj105ouDsWpDNlGsYc7UlxYPjNNVAcFkGODpzrFXuoiW01XiejK1B8Z5f+yy?=
 =?us-ascii?Q?3oHOVIrE6LnmcMqxuTJZfFyeCmrIT0+E+FzxwWI+oHjSF1t3Tw/ah0wbYm0L?=
 =?us-ascii?Q?oADmWCFEmr++AHkzxkXVxcLcCXdgELpxh9i+mDxV6U+Q4wkBfpBtvAxmDMTv?=
 =?us-ascii?Q?zS/r8dJO8HnEQHqcPG+jJg7Vzot+6u4GeUSb?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR11MB3844.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RAkmyaft7Z2Rt6ofxjo/PuFU1FaFPgiovcARXM8hzhLCtbjdSYtbN1XY9VGW?=
 =?us-ascii?Q?FOx0dqcj5l2IqmUA5WJWEUjSL6a5ROV9HKz2N/779Phl5Rbn9wl47E5jNSJM?=
 =?us-ascii?Q?hadz47mQUadNsLKsu8U/FLVm7n5GkKm9RtqjuP7mdGQTHGiTQZrdG72rtagL?=
 =?us-ascii?Q?U8uqaARYByIdlgSjGCr8xBuDcG3fiKLj9NU92dmQbSGmAhhB77ric0KU98vL?=
 =?us-ascii?Q?bgf10T/rdJL5JeGG4dHKEv+6ooFTkGrtcngHizpZXNtPtKcxCUzckI1TQEFp?=
 =?us-ascii?Q?kuFJLo7aUHlOF//UKvkOmSdVivLOrGWSrKSKdypWv8F6pBwVrUSro73b1uhM?=
 =?us-ascii?Q?WNaBGW4q7VfNMGaJbxvnGVG7WbmEWyoEcJRmc4wV026Pnlug6TiytrfLR67U?=
 =?us-ascii?Q?Wv9oHLe8xP+5gbhzXFsDM9YhMFpZ8T1b5xMg9OkCyThH2VsgiSpFsDUL9zSa?=
 =?us-ascii?Q?2KNcdVGWqiKaMexihKmt4DveiEtw6VxveFk4Y5zaGyFKf9y0Pm+UBXulf92J?=
 =?us-ascii?Q?P05DseRQDtzZMhbRgOknozdIrMETnnz301kYXghupsJrJEurXicHU2XzCLkM?=
 =?us-ascii?Q?l6zFXzr4poN6cU8xk+ISdkFkv90uC2WPVNbL9PWLosc3gzpXYF2RJlXozUUF?=
 =?us-ascii?Q?Ke9a7dBj2Zt1oMRKiZGHzsNI6BEFtxp9LESBysXCt8msKQ4+XXCAobzg7rTg?=
 =?us-ascii?Q?LjOzrfR9dv6lyvyQvh+67SYmO4yuFdxHA0FZGdvbDM+JnxMQG+1jLXXUhx4P?=
 =?us-ascii?Q?Alk8acTLBYn8I4/UPH1omn2AT63I6qUmr1wWoHMkyxlBvF8zRXv/XqDVBFOP?=
 =?us-ascii?Q?rMZjR87ZnGMEkcakO5sJQoVaqoLmnGBzOq0TS5JNBvOyJ3hhFDMcorU7sY7X?=
 =?us-ascii?Q?sp1dn7WpIAtzMzGC5FyV9ZOgAKU1ztw14Ws1ZVbEifQcjUdTvgcWSiu/3olQ?=
 =?us-ascii?Q?aLj/oJVTvFIQ2KIN58CGR4AWDfzNe/G4kSTMlAuoMCtnVKvtdf4igpjFhPfN?=
 =?us-ascii?Q?rKMurHXTmpHGL1tbhbRn1n/TEA6c3g9Q4UAaEu5qq5YnIinyF48eNYKPmLNs?=
 =?us-ascii?Q?8xdq7ve74Z+eG1cEIPOM8PJzTEtfv1nv/4VO6/+Ywc8vlMoQDs1XQ0+HN/+u?=
 =?us-ascii?Q?HIxje8QwQ2HHAaL/gE6Do2iH0Q7uGcMSm3qA6RebzzIhK99ynRcf2HfTdWn5?=
 =?us-ascii?Q?rVaY5XEg6rz1nPPLa4lEI7XLNL5bJTWWOq8cjJmj3ilufA7XmsVZq6sSBOqL?=
 =?us-ascii?Q?zNQklB0BxIMjCEY2ECkGZzoRrimkCDmUPe3kEdyb3QR0ROpy0jiy20Zre8jk?=
 =?us-ascii?Q?0qHmeklcRJnXJteJqomIZB0Y3NR6e1Qj/Ej/rjY9XF2GWdhZsnmrngiUNsJ6?=
 =?us-ascii?Q?DFfX18yu5OlVzjosVqA1gt2ArJ7/SIhPlZMsEBIopthpeDNxMVqwxz3Pf777?=
 =?us-ascii?Q?IAx1V/+Y9lZdSANetfms/mWUI3D00hBRrKwMiCFRJWcd/pilJ5qIRhoE2lsp?=
 =?us-ascii?Q?JZIN51xQiC1qj0SRbvalgA25ZX9CF+HbPajx7QvpVisKXfjlL9701/KkCABp?=
 =?us-ascii?Q?Vrl6rzN9fDWuu9mmNGEmqwnaSsCzpYh1J5LPM0MhBeT5f5BNY4uy2U8zD32V?=
 =?us-ascii?Q?GYAtNkeWypWC1i9qelwi2DE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5061c5d1-b234-47b3-cdd6-08de07e12209
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 09:41:06.5344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4UZtYV6IXwDkisRX0YYK0W3VmC+yB5o4pHSmhXRDQWy2LiN2lfv+LsYzQyx1wNVVXZNejlXkP26TgJ2JYsNwkJuGD6O7PFVNbtW2KD8cHmSr2iz6FKwdE9zC2SqWqHG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4672
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA1NiBTYWx0ZWRfX9iCPzoAHx0Lv
 X7Lp6rgakOcqyml+qYtpZkXd9eho2Z1ka9n3nTS+8+dqq3rmbimcy0xTa3jw4ci6nN0c5F9z5w1
 HFpjiQbYx/L8Yraf5TCWqabHL77GOgjfpTAejr/Xv5ATj7gUDNK/fvT9zP5oWxbf6QuE3Z+jYG6
 Rr1D35odTqEGZiVLHLj6a+4QpLPsSZLFlSDNNsbw4/qG9wAuCbIa+Ji5aqJMl2rcnfGhulp/fqm
 Uwz/ex1dF+Mr1dUQ6G8bIa/53zrNzUu+AyCL60OP7NSdUcgoY9h4KdzooHsfIFAx9SdxYeVZEwS
 pnxJ95m9AINkSrZWJYOM1jaCkS0vLdTxVafRpfzvGvqxO5PfEF4pzC5oejaBLxmT9l2LvrjYKEs
 1+MhkDAXzbNVC+0JPApxVjCiGEXPWQ==
X-Authority-Analysis: v=2.4 cv=ZMnaWH7b c=1 sm=1 tr=0 ts=68e8d4b6 cx=c_pps
 a=sujALEMa9QlLHAoAbbwPUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=t7CeM3EgAAAA:8 a=ZZk8WBbUgeXaBqf7xAQA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fh6NoL2VQXyULYtH1M1-u4CFqCCOReUi
X-Proofpoint-ORIG-GUID: fh6NoL2VQXyULYtH1M1-u4CFqCCOReUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510100056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 09:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224675

From: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>

Fixes [YOCTO #15726]
Fixes [YOCTO #15853]

After the switch to SPDX 3.0, eSDK installation can fail with errors like:

  gcc-source-1*:do_fetch attempted to execute unexpectedly
  This is usually due to missing setscene tasks.

This is caused by image-related SPDX tasks, such as do_create_image_sbom_spdx,
being excluded from the locked signatures. Without these, the corresponding
sstate-cache artifacts are missing during eSDK installation.

Previously (under SPDX 2.2), these image SPDX/SBOM tasks were not
dependencies of do_populate_sdk_ext task, so their sstate artifacts
 were not required at install time.

Fix:
- do_create_image_sbom_spdx is added to do_sdk_depends[recrdeptask] to
 ensure it is included in the eSDK build and corresponding sstate cache.
- SDK_TARGETS (and multilib variants) are removed from the excluded target
 list in prepare_locked_cache(), so their image SPDX/SBOM tasks are retained
in locked-sigs.inc.

With this fix, eSDK installs work without unexpected task runs, even
for custom distros or "tar" images.

Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 36a3e9c836..769672ec80 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -465,6 +465,15 @@ def prepare_locked_cache(d, baseoutpath, derivative, conf_initpath):
 
     # Filter the locked signatures file to just the sstate tasks we are interested in
     excluded_targets = get_sdk_install_targets(d, images_only=True)
+    sdk_targets = d.getVar('SDK_TARGETS')
+    ext_sdk_target_set = set(multilib_pkg_extend(d, sdk_targets).split())
+    excluded_set = set(excluded_targets.split())
+
+    # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included in the locked signatures,
+    # as they are required during eSDK installation.
+    filtered_excluded_set = excluded_set - ext_sdk_target_set
+    excluded_targets = ' '.join(filtered_excluded_set)
+
     sigfile = d.getVar('WORKDIR') + '/locked-sigs.inc'
     lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
     #nativesdk-only sigfile to merge into locked-sigs.inc
@@ -821,7 +830,7 @@ addtask sdk_depends
 do_sdk_depends[dirs] = "${WORKDIR}"
 do_sdk_depends[depends] = "${@get_ext_sdk_depends(d)} meta-extsdk-toolchain:do_populate_sysroot"
 do_sdk_depends[recrdeptask] = "${@d.getVarFlag('do_populate_sdk', 'recrdeptask', False)}"
-do_sdk_depends[recrdeptask] += "do_populate_lic do_package_qa do_populate_sysroot do_deploy ${SDK_RECRDEP_TASKS}"
+do_sdk_depends[recrdeptask] += "do_populate_lic do_package_qa do_populate_sysroot do_deploy do_create_image_sbom_spdx ${SDK_RECRDEP_TASKS}"
 do_sdk_depends[rdepends] = "${@' '.join([x + ':do_package_write_${IMAGE_PKGTYPE} ' + x + ':do_packagedata' for x in d.getVar('TOOLCHAIN_HOST_TASK_ESDK').split()])}"
 
 do_populate_sdk_ext[dirs] = "${@d.getVarFlag('do_populate_sdk', 'dirs', False)}"
-- 
2.49.0


