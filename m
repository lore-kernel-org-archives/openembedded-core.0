Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FE1D68BCE
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 02:28:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32059.1766024929069333871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 18:28:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qEFbZVKJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44473d6ac5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1UmY93828772
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 18:28:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=coUz22ZdRmKe9lJIRTy3BdNmKUmZs4f5/QzHdHJ2bk4=; b=qEFbZVKJJCFS
	IBjGLeMGd/E4tPN+sesG1NpJio18/URJfEqpntawkHu6Lb5wAZuCKFMh7n6Hy3fG
	1uYIEw8UDEtOzVIXAs9H9pe4vupKD50f1ZIVvvFPdQe3QkVoduVeXe/44wOqcsEr
	3cn9VeCiMa8MknXp/OHMtw3j4WlaPYIHaivibwB1q7LA52okA5+fPys/GOVzrEkj
	DxfOScsbQ3RCTFqsElXyylEkA2Ur/zIQvXd6Pej8OFGtFIRDfj7J/GssF1FKMxnz
	iYBsCbAIcfh/4bNOx3yPeofpQY37pNNnV5UU/TeaD4DiVats8FPdgVz7bdwJF/sl
	70JxThdbQA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011069.outbound.protection.outlook.com [52.101.52.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0shcee-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 18:28:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yS5R0YRHxtVbfrCA1yiV/sJmoEEGaKjPC4/AmW7sWuP7IYYuF5hmAJxd12dwO2Ufz97T3X9yo7pFObOKbjk/00cOuEr5+aMsE47EfiOgvBvyxmcVAXGUgF2hFxzs8DLHMx6ACJe9J6oY61cK1NYqg3IJLQIUyRqT+Ux085haAvw2LeQTI8DeNVSQxPDSyC0ceUwnuuE9SPvDX3teoInVX4VkQRxq2rhhcoNKvb9l3YkE1/B5SCZt7sAMXUHOs6ONHEEXhW4jcFXkYYYXH8V/UHI1eRH48ogbBdXc1rXFns2YD4Ud/ar6TJ1TmKRuolZspl+SFsa+IGdZzkVBvekXsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coUz22ZdRmKe9lJIRTy3BdNmKUmZs4f5/QzHdHJ2bk4=;
 b=I/UyTuX9v+Up06Pfdc33WYx49/a9cEzAUaZ0Ktkmgz1yW1bR+9XWA6NRR3Nc9O3sPE9nVfbtxSkb5ycFzZ0iBJOIyRp1c24uLv7yfq6dRZG1msxmyFTbZgVV+AzlaTKxghap34tjdpwoHvMnVLgvPrfL4yXx7OigvgQw5Mo9s4hBe58ETkSdFEbyvy3C49lznsRLczb2SS/jXUQXfc5mu9yi9YAHe6TOoDkg90XyYuq4rMYx583qGZAk6O8OFfXxPJbvK63vcVl64xju0HmtPrKQljQmTHf0+3WKX1KrcU9LgxpsrAqw/nqc9rvUrfMGkFZSPfc0nDl0hkbPWeQY7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA3PR11MB7413.namprd11.prod.outlook.com (2603:10b6:806:31a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Thu, 18 Dec
 2025 02:28:46 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 02:28:46 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] tcl: upgrade 9.0.2 -> 9.0.3
Date: Thu, 18 Dec 2025 10:28:31 +0800
Message-Id: <20251218022831.3368366-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218022831.3368366-1-yi.zhao@windriver.com>
References: <20251218022831.3368366-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:405:1::24) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA3PR11MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: d2cb6057-98c0-424f-65c2-08de3ddd2bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?U0lvJGH8Ml/GADZhGaTnfiRyssChtQ8OVIYee2OG/VvsKa7B3k8+GE/mDWaD?=
 =?us-ascii?Q?IB4muRTKYW8d+26RpfZOFzGzkDR7wz4xGFiIWhM96OVjJExv3q/34qjJybZf?=
 =?us-ascii?Q?MafvgW9gw/ZVzceX7jfQtjMFWVNzmSx1e7bzk0rMP5jyWwBKPcbQfKkS/v/p?=
 =?us-ascii?Q?ERC/nnFSC40/m02cMPA9dWCf/giBXPvon9EWInXWsUXLJJtDoOACWuImzvow?=
 =?us-ascii?Q?qhXsudayvHrw7ysDMOqArobdciCAOJjAcI/iQwjY3PYs45GuKF0uu0lMqBtI?=
 =?us-ascii?Q?jo0UIZq/d46l1sXDr914i+EHDB4wf7O+kd454V/NVTh7RtLptvurIlgLTNQ/?=
 =?us-ascii?Q?arNp3SuliYq2fEhaRRuS1qsMgb2nVQdEOCtAzn+0xHnYVmIVUuzX9xkN+PuL?=
 =?us-ascii?Q?9ZRAicT+9BdYd0dCGkDftiM+4DdugejEjF/szwcXxvPzr5x9YKCVDNlZOKQc?=
 =?us-ascii?Q?NPjiQsJyFuhIKbRd1jWBG7iiprJ/Z4fa0NJwWk0C4RgG8Ifn1dugwAgKyDTF?=
 =?us-ascii?Q?bqr/UunoWSH0nxw9zUMMRXtmrZQpEumusW4SQz0ofV/6rhjWhpwLVhPzNJc7?=
 =?us-ascii?Q?xCPLt+pEckAcXCZIZ4/pv82s4HSgXS5cxPPCcJhZm6UTIUY/7VRvN1F+wjAA?=
 =?us-ascii?Q?GhGKN8Qp45qOOnogMAtwZCI70fiVe230/m8OtKazpUevKYFm4dAzXfRi1T3Z?=
 =?us-ascii?Q?GxvvbeZKDbquCr3AB9JBSvNGaFRLJiufK44zrji6CvwNALWpA2vBrBTxT6Pd?=
 =?us-ascii?Q?P5gNCbX6+DJZrXANksyPvmMVE+RaKQQgmaRLnvr7QUtqttXd/jxrX5V9XOwq?=
 =?us-ascii?Q?5gxWDNFn2nUpPuvlvF4XOzy/M56pw8U2q3MIAHyJtsHgPvST8xzGALSI7bdA?=
 =?us-ascii?Q?ySQeVRfB1DIOzhqDvPL7b+iLjc8sGy/5k4BbKBcOAuEk/rPgCEomOj/iduAo?=
 =?us-ascii?Q?eUbiKarqFUdNoSZFoYDh3FTAyHZiB77TDuik8PcxH8LuqAGoNCG33TsWM05j?=
 =?us-ascii?Q?FNj2h5xn4FliutjiG4oTo35sov3BnLAd7kxXe4NT7GuDvG9kMvQGogYLb6g8?=
 =?us-ascii?Q?HyG+fxIuAfrYCoM/3WWwzFx5ojOgAC8umgm+dd0qkCO4uYt5zQNXHURcxUUk?=
 =?us-ascii?Q?G5165N6HH260QA8jxcQE1MBdJqUc3c4KaouKKLRcX1rI/SZfw5N5Ye9d8JZX?=
 =?us-ascii?Q?TE2CzYRENO0loGFL3+V25yRmhCMJWL+Ziy6x7kjq/m8//bs7uR2rI3iKimwa?=
 =?us-ascii?Q?+BCzpSQWxD7PnoS0YHMRQzl+ilQgvAeLAulG43/GSP9qe6W0rHVXGltqJusY?=
 =?us-ascii?Q?0noFi3fILqUMpvTcNVYL2hLcWA7AghNkKX2/n+YCztGm44xpCFYWlE5ETKac?=
 =?us-ascii?Q?a2g7ZKP2A2Bu7d2w5XSfiBFaovF+WTe+ITq1cyHBVsywDaYvjmOOAG0kTSKZ?=
 =?us-ascii?Q?MjyWZmJUmONR1Vs+Y4vhSU7qr0a2PcdzPwic4wFdN7tUQXp7K8WyFQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sQQ0hPP9dHM/koboGdt3iS4/XopsyAvJkvkziVtrqeniL0rXlhzvs9ZDPgFi?=
 =?us-ascii?Q?4c69eDuhH5Q7QsmGT/gXJsRZ+GHM9DIYSA2T4XyKCJKc/LpQ4qY7SJgEY4m0?=
 =?us-ascii?Q?U0aWJ1UkgLd6iLfPaHBpRfjoOBmQGq6wJbv2gBotm5hoDKVWbjy0OdGfjB4J?=
 =?us-ascii?Q?EiC4AeVI7fkM96bn20lXUGKWNo/sI9UNegjV8kVOW9VqLW/JWFS304XK7Ybp?=
 =?us-ascii?Q?Q9mH0jImGasA1eAMPx2yl0+3PHFdDG7/vingSyn+NwbwmkuFtxrQYd/pO2BN?=
 =?us-ascii?Q?IS4izitBPd3p31HdlbDt47/No+965vN17ha40xKLOf3balSA2Qkz1jMOAsWe?=
 =?us-ascii?Q?NnxqkRgtLQHys+hpPXmeyRb0FwMAY4uNrsZjlQbCxo1Mvlw6Q2GusOu0NB2G?=
 =?us-ascii?Q?1zodv9/u4Gynop6oJxpo4PVtrU+JOB6tkpOf7GWqE/Kf//wTwVpct964zp7K?=
 =?us-ascii?Q?ybFk5b2piALNd8gVjZ2V2IKK11wDWpx1l5AlfItqd7pLCTCgJE4DvIXLVAbc?=
 =?us-ascii?Q?OtJZXhyzeUqk5E6t63PpgCUqkS0kqGNloE1eJN/O1C/v2gjanqt140Cr1Ks7?=
 =?us-ascii?Q?pUd8VCyu7EuHDA6pZWxKN3303x0Rs3qhPc6YtPC87qxaSgVtE1sK+5Ej5HlT?=
 =?us-ascii?Q?CHu080KPTV7WuDcxAuaiOnDrPMqt/svJS7+gIewwvcvon98C3irfpm6sC1am?=
 =?us-ascii?Q?ea0IYDD4bp/OH/tevGRjoNvTShnZ4mLlNi57AqaivC0wEqSp3A4wHdgTjDz8?=
 =?us-ascii?Q?dv1HI1OLtEzW2DBnl0hdJjsBj+guHuByyBAHetC7AvApwilQmuOXqduDGNVH?=
 =?us-ascii?Q?HGBdl81kG/Kf9bB4ds9/f5CYaEq78VvKGDFJ9tsb1KYFpG3LjJ9lbG1lykhp?=
 =?us-ascii?Q?VaNoKh9KjYoIB2jA7cu8ST+tTcAdMtoiQG/XHpkmdPvvhZRHzUol0RHQIju7?=
 =?us-ascii?Q?wPwNZ6+xKCoksVWLZkpCm8Q+dlhoGrK4xYPhpCj9tFX4otYiWAcW5A9KDpYU?=
 =?us-ascii?Q?n8xq3CPG5WAYfdcHWgl5A8xrojrQ39b8SrfPE+555Jpq7rM8KVdWdROspKSU?=
 =?us-ascii?Q?dNfsEuKvbymMdvc+xAO47fxtSkr/QxSoPDvQE007nAza/MpUNqG5pSky+zQo?=
 =?us-ascii?Q?OARO1xFhq9k/1F34y+plLXpS+9feLGUvvXHS8tOlOfspk2PPQ7biDF0f3pc8?=
 =?us-ascii?Q?TjVUCpeusRDt+m/R1eLpOj8Q4UwuJo5qKsPyj1/BsGib4tZslxzUTJN/XoOs?=
 =?us-ascii?Q?Okb0wWNnkWA4WoM6XowBaIfpSYEWszewe/FsIWMRLKhgEsV4fFGnZHpiks9Y?=
 =?us-ascii?Q?wnswC5zOyyaU86t2Bz1+N/lYGAT1RWlCrjXtVfFw0BgsOJnx4DQ/0K1va5Db?=
 =?us-ascii?Q?Txp6jKSV+MzzXN2vpMeRpqyP/xsmkLqwWJtL6GWPn4/a1gl/oFLnNp50JYKD?=
 =?us-ascii?Q?mxthJKmi8Ufd6cgsxuSLH6nXBAF1ewsORmpQDE83iJKI0WbRgzQBy1nzAWIB?=
 =?us-ascii?Q?8wi8wYjD6kL96GtHG5Uiq298gkLaT+9Y1lGD3uxvqbwLZ6tkjp5B9iQWIy/g?=
 =?us-ascii?Q?P5IouCX6gWJcd1v4VKsIrzD1FIqdyAJdsz/T3ak6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cb6057-98c0-424f-65c2-08de3ddd2bee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 02:28:46.8778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4vBhw+lGM33Qa6BVYUAYari6J4RCdpoiQL124HbUqQD0iu4ALgWwnTx50Y0m92WIOn+TzESeXLTzjoAbxDFOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7413
X-Proofpoint-GUID: i1HuNAQxkdbIPGacw4eDM_jr412W0OPm
X-Proofpoint-ORIG-GUID: i1HuNAQxkdbIPGacw4eDM_jr412W0OPm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxOCBTYWx0ZWRfX2sU9HTEYyufB
 KTOsWJ2VmT3Y8RoIKlojbJKT2onm9aB+nY8MgGdRCm+UBPE3xEDVJVaf6Yb6zJzU9DwcIVlguxQ
 MC27hp2dgOGRVcZqOfNEapXhdhQZ8ze+fM5Xvr3TdvUmcToj1eH/QlBEv6UEJ2sH5r/ut2R4o7q
 oWxGCrSA48753GWJ7AZNVZFk/7m5JMOSDdsXifYuNQFc+uTUbQ4YhbuGKwrHMwKXEYzV2NPyy/l
 B9OKGVAO7/qu3Rpq1RLmDu28QQzqOhgK3IeWTc/FJhhngbxBw/0AYWcDpoZTcnuViCdU3w3jqwT
 HtHUSoDeGDP8BvvRi2MJbvRc2qftEV8dn9z620xuout9xsLHQuQl4+laQxZA0wXm1GNMj2sqWs9
 VXHTeIi45VNby6muZ6IisG2sNrcH9A==
X-Authority-Analysis: v=2.4 cv=PqeergM3 c=1 sm=1 tr=0 ts=694366e0 cx=c_pps
 a=KKuy1w1gR68tVOnyqteslA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Cd_a9bp0AAAA:8 a=7vUEEOO_AAAA:8 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8
 a=RJ4JmPAlkN7aAxcE5GIA:9 a=SbBUOS6azRQA:10 a=v_m6YjKbmDAA:10
 a=VTyE1620iiVinhSXTNLy:22 a=X_Y1BvaDLgsXqAkisrwy:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 02:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228079

ChangeLog:
https://wiki.tcl-lang.org/page/Changes+in+Tcl%2FTk+9.0.3

* Refresh local patch.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...tk-from-OE.dev-but-with-legacy-staging-fu.patch | 14 ++++++--------
 .../tcltk/{tcl_9.0.2.bb => tcl_9.0.3.bb}           |  2 +-
 2 files changed, 7 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_9.0.2.bb => tcl_9.0.3.bb} (97%)

diff --git a/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch b/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch
index cefcb24433..3ae1897baf 100644
--- a/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch
@@ -1,4 +1,4 @@
-From 822a73a5dec13549cb20e6c7338b059ece2ea95a Mon Sep 17 00:00:00 2001
+From c4dc19a7ad37269c21b8925a33dbcb9ffbcf8d5a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 9 Dec 2009 23:59:44 +0000
 Subject: [PATCH] tcl: add .0 to libtcl.so filename
@@ -11,28 +11,26 @@ changing that.
 
 Upstream-Status: Inappropriate [see above]
 ---
- unix/Makefile.in | 5 ++++-
+ unix/Makefile.in | 3 +++
  unix/tcl.m4      | 3 +++
- 2 files changed, 7 insertions(+), 1 deletion(-)
+ 2 files changed, 6 insertions(+)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index b72b0da..2de7b2f 100644
+index 53f7c28..90866b4 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
-@@ -1021,7 +1021,10 @@ install-binaries: binaries
+@@ -1021,6 +1021,9 @@ install-binaries: binaries
  	done
  	@echo "Installing $(LIB_FILE) to $(DLL_INSTALL_DIR)/"
  	@@INSTALL_LIB@
--	@chmod 555 "$(DLL_INSTALL_DIR)/$(LIB_FILE)"
 +	mv "$(DLL_INSTALL_DIR)"/$(LIB_FILE) "$(DLL_INSTALL_DIR)"/$(LIB_FILE).0
 +	ln -sf $(LIB_FILE).0 "$(DLL_INSTALL_DIR)"/$(LIB_FILE)
 +	ln -sf "$(DLL_INSTALL_DIR)"/$(LIB_FILE).0 ./
-+	@chmod 555 "$(DLL_INSTALL_DIR)"/$(LIB_FILE).0
  	@echo "Installing ${TCL_EXE} as $(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
  	@$(INSTALL_PROGRAM) ${TCL_EXE} "$(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
  	@echo "Installing tclConfig.sh to $(CONFIG_INSTALL_DIR)/"
 diff --git a/unix/tcl.m4 b/unix/tcl.m4
-index 4265832..49ad5ab 100644
+index d03f15b..a381a58 100644
 --- a/unix/tcl.m4
 +++ b/unix/tcl.m4
 @@ -1269,6 +1269,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.2.bb b/meta/recipes-devtools/tcltk/tcl_9.0.3.bb
similarity index 97%
rename from meta/recipes-devtools/tcltk/tcl_9.0.2.bb
rename to meta/recipes-devtools/tcltk/tcl_9.0.3.bb
index 87773c7717..21a6cbb23d 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.2.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.3.bb
@@ -23,7 +23,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
            file://0004-tcl-update-the-header-location.patch \
            file://0005-tcl-fix-race-in-interp.test.patch \
            "
-SRC_URI[sha256sum] = "b563649181dfe12f970673c427c59208074fd7c91a20132d6cadf5d82d3371be"
+SRC_URI[sha256sum] = "407a073ee8f718200c3a004bc2186deccc33356ee5112a71d8b01b55230f4ee4"
 
 UPSTREAM_CHECK_URI = "https://www.tcl.tk/software/tcltk/download.html"
 UPSTREAM_CHECK_REGEX = "tcl(?P<pver>\d+(\.\d+)+)-src"
-- 
2.34.1


