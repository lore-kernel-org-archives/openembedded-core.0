Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC00C98332
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 15:35:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39430.1790523326753004273
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 08:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XDrl0tHC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3730e607c3=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68REwdJo063311
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 15:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=0jO6hcIVc
	wcgUcss5w/0Fp7v5xZd1TYuAD+Gc/jHleA=; b=XDrl0tHCY87n9/WjbZVzPFiQC
	+4NcJwKASBTQKKowZuwrsxwXo332nqqQxKTsNIh6khDMqLf45NWD0MYD4JBQibwu
	tnkolMtHcGXRtVO9qVrveSq6+bEH94KMyGhMmBFpmoZExabD11aAa7Y5kE9SQfcG
	DYRy0rwZXPgYf1lfRNoppDuXlWJndC4IN1b10Zziprkflf7gAjHAmEiIWlU6eGGT
	g/EvImb5q0w/tFI6L9qzwBKn1A6xKdpS6KjBWintasF89YlR4Kre3vIe6xjm0PmR
	6XwQKFbKQciH81zgeKzZOBPdiGt+a359uEVU/ZCMmubpzxHz1KHLhDEHCz2dw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023097.outbound.protection.outlook.com [40.107.201.97])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx38w9g9q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 15:35:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqIpeNCejclaCHeOpcOZPka4s1lpUFLOB6LH1NDFGVL2eoQuqC+8QW3WGctSs9lMlyz9yvvHIaW0/TFzX3vWrktbQ9SkwtT4vbk/tpP3VKCI/iDxf4xbIcwA3j4Ge6e4riZakapgUqNDSwQnhbUMpygXiKdm20q0b63V62Iya83iE5MG3I+N/h3zQs5ocACRMrzlSiCTZ0B3it85VQ763JD2BQmsRjOE2YPcmrUKm6JfVQE0HCQFKELwaUJ7w8A6QOfYWzKiBdEAVit3mFq3DsLPTxtKcVlFJ5iTisytGZQPc6GHTQBrlD381iQvcayMno6O3+q06SdQDlu5N35JpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jO6hcIVcwcgUcss5w/0Fp7v5xZd1TYuAD+Gc/jHleA=;
 b=qze9nVJAjFtrnk9j1wfRyTQSXPXjzARURU9EQxo3FBSGSOJOOoU77kqba+7DZgtkzNaYF7g+M4YwHgvzgxykoRfqeZg6gknoyzxqJOlmGuB0KEvaQV6QK27ij92JWbfHZIpPcYjR64VDLoR8GGbUdSgDmUK+BcFyLijPS/l3So6bgxyBwXvcP6iEp0Bnd4semcTyf2Fkc2SjtObU+Cs8qPeLRx4w+DZrEyG8compBDXtRNGDBLpWfzMmKKBMC69gOHp393VgbcgyoBhfEvDm+fBZynfvQL/yVaCXvGD98gaWBN6s+f/lA37UNsrEKsofn7hd/de7sIfanvFT1A3tng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS0PR11MB7286.namprd11.prod.outlook.com (2603:10b6:8:13c::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.23; Sun, 27 Sep 2026 15:35:21 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0451.022; Sun, 27 Sep 2026
 15:35:20 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: sunilkumar.dora@windriver.com, robert.joslyn@redrectangle.org,
        richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH] curl: strip the build machine triplet from curl-config
Date: Sun, 27 Sep 2026 08:35:04 -0700
Message-ID: <20260927153504.1126797-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::30) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS0PR11MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b0b1762-9f3d-42eb-bf82-08df1cacf03d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|10067099003|38350700014|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	a7HPvxm4Rf7Iuaj0oDhNUmaSKZ+IIRdTXoglDcj/euB7rh28aKZLUiehiz6FOSIQoLD/pwI8j9ZWilVpACaffBWiJts6QnZENFtIfVNtfv8q6XdN5qZwg/Ye66M9Y+lKQN/+zhuh9owTfU9oYA8OR9FLrgfKaLTSa7SBaczTcz421Rloa74TZ8Iale817DCoJB29EWy+PM0TZOiQsNQl6lsv/OZae4CIKbbKHQK8ap+sVQTqynIbfulTRlAn6aoQDxdWjzWje4VyvdFyC8LSTN/UU8emRSFYRdbirX7jj3GtQMYJd5hBbjiY48PLBq7Es9rAFeA7aBIZIB45G1f9G6Tenih4bTRwbRFftLC8BhTgOQwENTvT4JAfFyk0Kl8mCCEfv1BZoKkB8ruXUijN1iGUmFSu3nf2uY7lSaUbEeYh5BZUMzkoUKnDMtyOdFyZKQb+YJahCZ8Enn+TmkuTcxZ3eHR57+vHB6fJXDs4lI2Ty3/MNQqkJ0OAO28OFwqL7szCFAML7wsIhAko6vi/8qBhG4UJ6HZpyww8NHLl9Dqfq4feQEt+GbD1O4QqlotWYmuBJEV1mPGfnD0zSecaKCyi62GjYfAJuCxS7ExZmr4A0T7KcUe4lI2OdU17jamdKGgGHTqvg+RlUfcy39nJ8lDhWH/QNoqSqSsGCLSlzll+WPjx47TM9Ai+ob616nN1kO4qqNhZOMOwGBwfl71/1NkMDoyWUoMk/nHOuYBe//Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(10067099003)(38350700014)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?704AX5Gb3PiZuld9oUnXJfbZVQa5fAnZk4vAd7RejQBR9RTHeW1tovUYftEC?=
 =?us-ascii?Q?CaKo2HG+ZGnaDbcO58oqy6SnlPSdwWWkLqdqshECS0w/RY5QQNhByNcODcMA?=
 =?us-ascii?Q?iXtIzMU+Ps/8bLu9bz73Qt01DjNfa+AvuTeFBCpDS75K9Xqfcrz96YS9NHcD?=
 =?us-ascii?Q?fmpuk4pXQ7VT96iz2Ytq0q2KMBAAsoJAPsb3JQfJX9vDEHfeb6jv/yp6Z28p?=
 =?us-ascii?Q?MKqzJUGC/1hloq1HeQY6v2AvXE226zgkfT9u7Us6yD9GeFew29rBD0b5+YYi?=
 =?us-ascii?Q?3eYL1FML4tGuugxlBd4aBfRLr7Dm1Kl/FD4un24qevm2lZwGOsv/oWhuZ/w9?=
 =?us-ascii?Q?v5b8qpz7EK4RDk2iSYmOj9mEGaAb3qi86OJ0rc0SpvfpyXI1ooFmT+bPWUeE?=
 =?us-ascii?Q?8e1NNjNGaRq/NVko3EiKQr/HbHsz5QDRCEUeNI42SHlo6G85F7qehAHQOnkF?=
 =?us-ascii?Q?RrWU+7zwH7GTalIwidU6FzJRlBLRKmBwxBsajAqeeIySsKU98n+qomjFVQxI?=
 =?us-ascii?Q?oYiYo6HUTwqKQXtYuipA0+SSfczaW9jRmhw/PdSoy4YkRgcKNAi1El9bftr4?=
 =?us-ascii?Q?YBeO55pXaJUUONCNufo7KsFt5Acn0E6ouhTuPlWGFQ2rChMzvcZb7dw4KLmc?=
 =?us-ascii?Q?2fmFmWOy6AeqEvzkxJF3CRLziK6BYoCt0guV2kMz6rYyuL9ub99auUYuwaWE?=
 =?us-ascii?Q?NGFoUMS5AKztjIt4ZuqliuCBxI3MFOAqf8kbIme0K/jfcBy7/WWdJsVAXePw?=
 =?us-ascii?Q?LrlcBXhPY0gZH62WLErRide1dMl41CZuJJwidfjF83W6tJBOA0K9vD2egHE8?=
 =?us-ascii?Q?zbIU23tPg3R1l0wYr6CRuG/1fBZMx294/gy4vn1cMfY5mVR6rCzlnamY4361?=
 =?us-ascii?Q?hJERvXYINcigS4XLPYr+mPiMLvodUfMoDuZmu2ypaONz4gJoWoSXkUEuBdqv?=
 =?us-ascii?Q?m+keUN74K5FrkL/EL1I0OOUmM0vsxRBzSLGbWgCrR+7WBbtGvWfIPmeaWFyp?=
 =?us-ascii?Q?l19gPbhNOfOIOMkIOlDiEvAjV3ouxxFe8y5mVZx0eMyrIsY67OaLomgU9siJ?=
 =?us-ascii?Q?4QHpA8iN1YJaOJFVzv5+AEEbsuQi8uZZAjk/q/zY46tWtogXyfrC+CWRJwLx?=
 =?us-ascii?Q?CVdRNpKn/S+60IzFuyKM2JlYJPSy/v9anYwY08m5PIuHNEtsGx/es8tq/nuV?=
 =?us-ascii?Q?+t4XpxrbE7pK5BSnLIbVBvoIDuqKsmJjpcbVKy/JxN6b0FEpKdYNYJXsrgsl?=
 =?us-ascii?Q?0mNTt2Ji2nI5y5yusGmx7cW8N6OYN9x+sQzi0mEch7Sp/nsCrO0GV4dbdE0X?=
 =?us-ascii?Q?wYL7jHncWuD0ON4J6erYCrUXVItBzhaJGWvjmCqXroTYlaOnL3Fh9s5kw5CM?=
 =?us-ascii?Q?jq4UOQYMAFZZnsTJhS1BP8ybMmb7YKgfQC/Y4s4dA1yyf4x/Tiexg2l8+ACm?=
 =?us-ascii?Q?2/NP7mvSgkk22NvIHqcEOfWlRZPDO2+eXa7uDZR6XGkmhCoBNPXv9joto+eP?=
 =?us-ascii?Q?4if2Mq4ujCS3cOU5C21tWRFOL5jJ7tcZApSPi8n72UdHqNcqvDy7vAW7Dy0X?=
 =?us-ascii?Q?DAtIJMbWopFRJHRBHM8J3td7kmXh+UOXNaK1dOPVccNffLer2KfPGNhCakwt?=
 =?us-ascii?Q?EToCZ3h4vn2SGofKQvqNjdHqI8OXN3mu5Ycwh1bxSZhsdosN498Bl/sRKFJ6?=
 =?us-ascii?Q?j/0VxxYF7+d45GaBps2anAewgVoXCTtLn90em0YJwWRnKVPPbI5nhGX3UgOc?=
 =?us-ascii?Q?FnXVR2Kx+hCxnKfHrdtxYuyTghII5/o=3D?=
X-Exchange-RoutingPolicyChecked: 
	V/H7gKe2JVljqDwq6tWnUrChIl/3K86Mi0vG9cN3L8Lb1GWWHgvaBLdJlfOKRpzU2l7COHeWpQ07dPI2lfBk9GRjk/VTxqipNqwtNd1sCuhNj+p1vMM3nTCLQwqmmAUXTL8Aqua5jrB8IFHb+wb1zQWUb4k0+CpKlXqCIjKkarcMk5FSYt2vrcrJVIDPixoFJTQgcL/u0xejYbzal27LRSMBxHPc3NCO2LyPSVv/iywpUoE41DRucZjqe+XIbnsKvNnUaqu2k9quVxk2lRrT/5Fyayttzy/5HvvxhDhZ+4rpd1YwFlqdTD4RtGHm+0sJmRiolEYHwwV7ShD4Nh/DFA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0b1762-9f3d-42eb-bf82-08df1cacf03d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 15:35:20.2473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYdGe4E1F/khNFUnNVvrwv007wF1Oz33dLEutUzZ/q7PvYTE4ekCfjfxCuYorYw5ANgXJd00y7GTo9kF62QGlR3xlOZV3BRANLxxxBMdkFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7286
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Glx9o7HsbOBTKv9JrpqYvoMVpYFgdNes
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA2MSBTYWx0ZWRfXyvlIg2CASrX9
 0GrACbvYJXcTd1uzC5SaOvzLPGT9RexpcFiNX1BD8hjKm0x6DBDYrYhQfwUnQ1QXLauulw36+An
 X0PDQG/xbGteBVbVN0j1V9BMcdypj01mT+VjLaG8lugi0peWDL4dewpLszZ1lpzZygcGl4yMkL1
 u1znL0mjVxehfJRSOi6ALYFIHFzRVm73mYvZ09X/du7KekupxfsJgT4QsofOmVqGmvCl6Wnf/dI
 BBamZZrTBtQPOtvLRCDrU014TeKTjl7Y+G/mnyQ8KrG6RySVlHrDngmCo7F1lnC+r1fQGitV9ge
 eBHsNR1+SQ3RSHYmULd/XTVWuZdWXVEyFn2YgiOUwt6Qqg4xt4kGJO296AkvIR7Y3PHTkiL/bgl
 cGlx1Fyc6TGpjffN6vR5lIH3BhKYWgw/p1Hcw0ssfRR9jEgnUjnGLYdE1xiwIIWViz0BsjlIcyc
 9raE7eNpp1eykCUeq7w==
X-Proofpoint-ORIG-GUID: zNrsTRO9s5Vfw42cGoTYeiXUFjJqD0aj
X-Authority-Analysis: v=2.4 cv=ZYSIpcVA c=1 sm=1 tr=0 ts=6ab937bd cx=c_pps
 a=XVr+MSEQQxWnM56OsALW2Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=sKQ-D_wngKVYbG8tU5UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA2MSBTYWx0ZWRfX4QVOaTrw0gaO
 9/tSwi/k+9MgEzySjKNmC1mD6ZvMo1wmt3+9kdOXRVL18719qFXlI7CMS+aqPtE6u+NgXUWcCYO
 C98TJ2xPy7emgu4yemdDEP+zDvcK0PV62jqZRvXzWQCfEXuYY5U1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 15:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246688

From: Sunil Dora <sunilkumar.dora@windriver.com>

curl-config echoes the configure arguments, which include
--build=${BUILD_SYS} and build_alias=${BUILD_SYS}. That is the machine
the package was built on, so curl-dev differs between the x86_64 and
aarch64 autobuilder workers. Drop both tokens in fix_absolute_paths,
which already scrubs this file; an empty --build= would not be valid,
so they are removed rather than blanked.

[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/recipes-support/curl/curl_8.22.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.22.0.bb b/meta/recipes-support/curl/curl_8.22.0.bb
index 3ccfcf7f2d..96f889165e 100644
--- a/meta/recipes-support/curl/curl_8.22.0.bb
+++ b/meta/recipes-support/curl/curl_8.22.0.bb
@@ -92,12 +92,14 @@ EXTRA_OECONF = " \
 "
 
 fix_absolute_paths () {
-	# cleanup buildpaths from curl-config
+	# cleanup buildpaths and the build host triple from curl-config
 	sed -i \
 	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
 	    -e 's,--with-libtool-sysroot=${STAGING_DIR_TARGET},,g' \
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
 	    -e 's|${@" ".join(d.getVar("DEBUG_PREFIX_MAP").split())}||g' \
+	    -e "s,'--build=${BUILD_SYS}' ,,g" \
+	    -e "s,'build_alias=${BUILD_SYS}' ,,g" \
 	    ${D}${bindir}/curl-config
 }
 
-- 
2.49.0


