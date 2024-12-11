Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420F2E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 18:01:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1250.1733940064133825932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 10:01:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2075040ffa=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBCF8Mo021198
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 10:01:03 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy1vhjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 10:01:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exD1QIbjAs8cjnw+aXojQHBzfJCK14m9WVaLwQsKZBIFtDcext5UgeECSIFby2CG5dVqcXaF01iwlWrTMlkwxybPD5WQpLokY8LgoHGc6AYYNKOzXS1UeKV2wq1VErJz6synhS+D5DLwFxWK/te5bojF5F7U5JlJpHol24LZESWN1Vlnui08ULxs4RyLzbiHyO97AM7alnTxKXBMyWEAwSBa/VwIQTHTBte5v+K6pwT1V30EPzGlwgQoTS2tmnpbujZ+cn94XF3BEcN/WNggRC5aGBkKtwaD7joFCEhv5fa/yPUvxOY2QqCStpAuZsMQPB/83dvQqoa9/UlmCKrKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fA2FiEi+4RKpwkF7yMnX/+amG1TfzaUffW2fRYLhQdo=;
 b=YzKzIfNeuyhn5imigaIon865LGDt7YMKFC77w5hYb6EH5zxVpa7KqlbaoDbnwou6+xrQlj3N/mNUQ/vP7ZqbtQuiwBl2NdXAEesuydi0f+hQwnRya661/XAiazMA/7n2iz+6b0VXkar8g2N/aV4JPMaKz+VLMuyFp8yFloJ+JEgStaXh6POwX0z6I1VyZBrq8uJ1Ozf3ufFWBqwN8ix95YjBEsCBcxdPjwV4Cly5XhJnPJVOl2m4dfAR2EoF+AHbC+yeHN1wYUVzmdAfrUutke3EfFIEyYqZXL7GyyjSxNI2QbGXECNoncXgFGsddT4t+QVaBwcgBjZ9GygJx0cnTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 18:00:51 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%5]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 18:00:51 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] gcc: Fix c++: tweak for Wrange-loop-construct
Date: Wed, 11 Dec 2024 10:00:36 -0800
Message-ID: <20241211180036.1710054-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|LV8PR11MB8680:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e06ad1-e211-4c96-6d52-08dd1a0dc003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BnTpSkT7NlWly5S3Wy4sR6dOPNCpoFqNFqA2jjMq95YX9C7RDrFjt8DNvvgM?=
 =?us-ascii?Q?vv6rrQYWsvBtrR2c3kMI8BYcYrAkL3eMBY5EUf2pfxUixvaB0V/Sy6CDWGvt?=
 =?us-ascii?Q?mitSObQbj8n+ogrEMW1Hw+d11e518X02PwlUkEePy5z773XRikxdrjMJL0UU?=
 =?us-ascii?Q?R1dDSUrh+4zwCKp3bGI7O7cKwYXzErc2YrXK7myqe6aOHeLsPtlRnRAvWPDP?=
 =?us-ascii?Q?UWf8sU0k78BlKF7pcwQSy0E5mzeJiPEUAqyENWSW71thNSuXPkVDzt/wyv2n?=
 =?us-ascii?Q?XYunnHyNWDR/0TcI5+yjBTvPhYQM75oDvsBfjBB9NRs2lY4GLZhAIeFkRDRF?=
 =?us-ascii?Q?uMEX5BrjZTI85CPippXw6ntOlj2OQ81W0Mc7i4Lf6vTSon0xqE0XsqgizreP?=
 =?us-ascii?Q?yyX5PPA3jS8oJCZEL3+9WATAnzrHeVLx5iFtOUOlNZ6abl3HsrcMp/029mgi?=
 =?us-ascii?Q?OJoAnLmsPBED6+a+SsnfMAoojkIlr2ovIUJRzyhPkN1Iq1rDg2t4ikvXolQ9?=
 =?us-ascii?Q?yfQpEKwPFU3tfPeUOly8dC3UlPpGT1WFYYqVFJAcn1Cxti0ojcRO3GF9v7l5?=
 =?us-ascii?Q?Vc5Q3yvK3VdYrUP/jSVK6cjN4NegBV1Ac0sgUZZKxUgp/k8E+VHmR76OLj1K?=
 =?us-ascii?Q?TGZEBZYzP6/55UnTB3jwbtRNxX7/WZyTeumcDwgbihSD80JsYdm4xzPI/F/k?=
 =?us-ascii?Q?BF9AQjoL/LlrhxIRaSP5bY5YhQ2wcW5jR+4GktiUfo0KRY4QCvo/xxf8V5ji?=
 =?us-ascii?Q?qGNauFvQjFiir/gHA3jcAExMlFQFJpGXxZeKHbegJ2fqp6AHsjTXsaa8Mk87?=
 =?us-ascii?Q?zW31sebnIn2l1PppbRhz11bp40riBU0ddTRqkYWRZWCfnEtWdheLl/5c4viE?=
 =?us-ascii?Q?7X5QU6lA+dyfi/97ySrf44pGjNsPdv8uF6r8XYGE/O2bsDb1rn0UgN5cOsIY?=
 =?us-ascii?Q?UcIzaKIR11VFSr8LVmUNxB6fIevymTfHtsz7Eyx5/tHXQhNizqZkZgtWvLwP?=
 =?us-ascii?Q?hs9luzc2k+HCcMdqsA0jucwqCUGxaY+gnuh0+1plVrSkq8gJa13kee6ihIpZ?=
 =?us-ascii?Q?KbKVreKfmJJg/tvE0UmkD5vlE9YGcpnpj2wm0cNa+l66os2bCZr0uvdVqMDz?=
 =?us-ascii?Q?2WdIlLbwsJzBQCkDHOioLlFxq/Jo51Kej1GQBioRCVaNn3J1FTpedY+NJf2t?=
 =?us-ascii?Q?bGfU1AJoPACRo2h5QzEkAY5qAP3MbRlGigG0nqt/HKgDTnvCF0eXDLshOIgH?=
 =?us-ascii?Q?QBD+B8R0T7Hl5AXYt36aCT+VDpiA30VL+g2VWNrZsRhcpRmhPeU63ZzN6ZZb?=
 =?us-ascii?Q?xLOa8+sqfBNfNmPGFeewfF8rS/nbUZ3tbGLgMTYj+D3qVkcVrhqoopGBlYaU?=
 =?us-ascii?Q?TVfmmoA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ItLSnC0xRqC/RjN0jbYXcOQuilH8FMCOjivNGQYO8nGDG0s6WH6lXkO6Ubxn?=
 =?us-ascii?Q?pHUHzvWrFGcFqr+GSCvSjuFYbuXLisYGnuFG8eTg+5EnOkEAaVpL+xZe0quG?=
 =?us-ascii?Q?YpiBwXrrKJ2STco43V+Y2Y2f9bWUI7g6n51pBbijKkvEQJQhDD60TZ1G1/5+?=
 =?us-ascii?Q?q0nGETtAG8dB5mO1Lw1BpplvDf8btV3tfvsiR+YjvxdulEpKxyGeEEDKS85y?=
 =?us-ascii?Q?62ZLZLjIgzPxlCDwpzpqPWCYocI3I241uLRW9SWmqPY/4bFZdXDVEE0sZOXt?=
 =?us-ascii?Q?keW4pSgg3R6WenPe2+kjrUTTIZlhhr8aor/WhA/sgsQ6eG7dY14mE0SoioPr?=
 =?us-ascii?Q?xo5OxnrS4aE/+GBa0v5DJGKosA73Ksu1ZM9Gnpf0FmzTdd2HGkSMGYRcv1Ah?=
 =?us-ascii?Q?8TmO0Y0DwxhZPiootWwVsP6xkDaZj65CGwN5cqH77qRlLMXTptGEBizC1orO?=
 =?us-ascii?Q?1vb/DNR0rUXsJ3tIvD0eqrqqQK2lwj5Pa+oHZmN8Nr6bHhGRgv4UAa54zzSa?=
 =?us-ascii?Q?DC+8a7n8iMLwxn8Aoxiuf46SD0e+D3Qx7be0L5rJm++E2HjcHe0m10wokkHd?=
 =?us-ascii?Q?WLiDIyRZ6uwdZ5mXISSv+BIz9HvOoOdW9+s49RuZuuLCwLVSqOInioX3Q8iG?=
 =?us-ascii?Q?Q5ZhM5muMHva/kcpvFvoUtUp0Uih1Mc9LHwXDo5ahXxSB+i3b5CPZ6/WrRQm?=
 =?us-ascii?Q?ohR0TKxS1VA03g02S2CR6Esnb9E0yn52IJFGO6J5OG8/DihwwOdtskb2Do3V?=
 =?us-ascii?Q?TaTUdakLT1QtlqR32Vq3HHsucVywGua/KQkY6t7u4/t3q8/bqssAYEYYGqpt?=
 =?us-ascii?Q?uqHWPjstdZLZ2/UMQNTz2SOZB79DQ/kNYZuIqZ/ovh0wQF2HuKAGJ4LIYMKg?=
 =?us-ascii?Q?kuLdNJ8Lw1RBTiwrF3d2MSjwExgUsSqSBQQousDfUrAXSTGmQsItTEM8Wn62?=
 =?us-ascii?Q?og6ejYAve/2kQ0PCjNmdtJqJjoTS5nDjcnMTgoO2EVuq7fgE9wTSA2VIhUpp?=
 =?us-ascii?Q?zBrEWAVFxEhlub+nNCUViQ399xb1cmYad0g46dc0AsB04YJ/PyJTFR0I6Ult?=
 =?us-ascii?Q?McLpwHn8+b7iLolG+9z+iF86jv0GPEksgLh+F2hbH0JS8QK/Ka5yqau+oaeE?=
 =?us-ascii?Q?Jq2JKfFf4v9R4nu8HL73M6bdYnmUQOpgwrqBGXxzvVkm6pN3VdSW78Bvyd4W?=
 =?us-ascii?Q?HWC5gMmpeflHm67LG2QvdYGqbqVO+Yo2a8a0eZVGJzLjQrJmWK37d9J/ulJy?=
 =?us-ascii?Q?SGX+ktOQ/WjyAT3Bgk36F0ve+ZRkmQIKXLaWHLlCBbHFss1XvFEC6O7aRll6?=
 =?us-ascii?Q?77kB0hzXYgUMZdagFP0rmkH2VMdkIYlpIOpk6Obb2t4YZA0klNoPW/0bC+4R?=
 =?us-ascii?Q?QqV4titv2OKuBzoKdtgtczraj6RF2t3f8LipkcxsxYH8Wbdzz/iayuoSM80D?=
 =?us-ascii?Q?IS0WgZ0EZui2Nhh1+eVYROxdc6bjf0uQUzIaR123uoVZksbcwaiG/GG6A7Ug?=
 =?us-ascii?Q?rMS17EZbJRQpezgu6qCb7I1s7iNmJuX7ae89p1BEBL5BdLnOWoTJ7Hx/DYFd?=
 =?us-ascii?Q?Zbp57EDO2xVFdrY/q8Q1HujMELSjrgiLJrE5KW5osEBFBnFC3Am6ouxhA/pO?=
 =?us-ascii?Q?wg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e06ad1-e211-4c96-6d52-08dd1a0dc003
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 18:00:51.7061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: domAq+JpYu8maHohu6RkYIrNlfThlzGGzagnTuwS/sNcnf3Hrrbe+Kgck0kzEXeAXyGMLL3Yey31alz5W5sQQCyx/8ACLurlZ02BV5UmLf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8680
X-Proofpoint-ORIG-GUID: F2b9iGLQY-4vwPSpMlO0RCAUZzdrWbRX
X-Authority-Analysis: v=2.4 cv=eePHf6EH c=1 sm=1 tr=0 ts=6759d35f cx=c_pps a=OGaRt8TyNAR4X2Yz4FfAAw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=CwzhqiM_r4gBRsMSDHgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: F2b9iGLQY-4vwPSpMlO0RCAUZzdrWbRX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-11_11,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412110130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 18:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208599

From: Sunil Dora <sunilkumar.dora@windriver.com>

This commit updates the warning to use a check for "trivially constructible" instead of
"trivially copyable." The original check was incorrect, as "trivially copyable" only applies
to types that can be copied trivially, whereas "trivially constructible" is the correct check
for types that can be trivially default-constructed.

This change ensures the warning is more accurate and aligns with the proper type traits.

LLVM accepted a similar fix:
https://github.com/llvm/llvm-project/issues/47355

PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116731]

Signed-off-by: Marek Polacek <polacek@redhat.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-13.3.inc        |   1 +
 ...ix-c-tweak-for-Wrange-loop-construct.patch | 113 ++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch

diff --git a/meta/recipes-devtools/gcc/gcc-13.3.inc b/meta/recipes-devtools/gcc/gcc-13.3.inc
index ffe90c7188..8b6c2a5938 100644
--- a/meta/recipes-devtools/gcc/gcc-13.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.3.inc
@@ -66,6 +66,7 @@ SRC_URI = "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0027-Fix-gcc-vect-module-testcases.patch \
+	   file://0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch \
            file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch \
 "
 SRC_URI[sha256sum] = "0845e9621c9543a13f484e94584a49ffc0129970e9914624235fc1d061a0c083"
diff --git a/meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch b/meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
new file mode 100644
index 0000000000..745b38f7f1
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
@@ -0,0 +1,113 @@
+From 66aa69e2add2b8641a652768b0eac30f00427145 Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Wed, 11 Dec 2024 09:48:16 -0800
+Subject: [PATCH] gcc: Fix c++: tweak for Wrange-loop-construct
+
+This commit updates the warning to use a check for "trivially constructible" instead of
+"trivially copyable." The original check was incorrect, as "trivially copyable" only applies
+to types that can be copied trivially, whereas "trivially constructible" is the correct check
+for types that can be trivially default-constructed.
+
+This change ensures the warning is more accurate and aligns with the proper type traits.
+
+LLVM accepted a similar fix:
+https://github.com/llvm/llvm-project/issues/47355
+
+PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116731]
+
+Upstream-Status: Backport [https://gcc.gnu.org/g:179dc0f0fe01012675c1b430591b9891ce96c26e]
+
+Signed-off-by: Marek Polacek <polacek@redhat.com>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ gcc/cp/parser.cc                              |  7 ++-
+ .../g++.dg/warn/Wrange-loop-construct3.C      | 57 +++++++++++++++++++
+ 2 files changed, 61 insertions(+), 3 deletions(-)
+ create mode 100644 gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
+
+diff --git a/gcc/cp/parser.cc b/gcc/cp/parser.cc
+index 4e67da6ff..5dd94357d 100644
+--- a/gcc/cp/parser.cc
++++ b/gcc/cp/parser.cc
+@@ -13854,11 +13854,12 @@ warn_for_range_copy (tree decl, tree expr)
+   else if (!CP_TYPE_CONST_P (type))
+     return;
+ 
+-  /* Since small trivially copyable types are cheap to copy, we suppress the
+-     warning for them.  64B is a common size of a cache line.  */
++  /* Since small trivially constructible types are cheap to construct, we
++     suppress the warning for them.  64B is a common size of a cache line.  */
++  tree list = build_tree_list (NULL_TREE, TREE_TYPE (expr));
+   if (TREE_CODE (TYPE_SIZE_UNIT (type)) != INTEGER_CST
+       || (tree_to_uhwi (TYPE_SIZE_UNIT (type)) <= 64
+-	  && trivially_copyable_p (type)))
++	  && is_trivially_xible (INIT_EXPR, type, list)))
+     return;
+ 
+   /* If we can initialize a reference directly, suggest that to avoid the
+diff --git a/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
+new file mode 100644
+index 000000000..3d9d0c908
+--- /dev/null
++++ b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
+@@ -0,0 +1,57 @@
++// PR c++/116731
++// { dg-do compile { target c++11 } }
++// { dg-options "-Wrange-loop-construct" }
++
++void
++f0 ()
++{
++  struct S {
++    char a[64];
++    S& operator=(const S&) { return *this; };
++  };
++
++  S arr[8];
++  for (const auto r : arr)
++    (void) r;
++}
++
++void
++f1 ()
++{
++  struct S {
++    char a[65];
++    S& operator=(const S&) { return *this; };
++  };
++
++  S arr[8];
++  for (const auto r : arr) // { dg-warning "creates a copy" }
++    (void) r;
++}
++
++void
++f2 ()
++{
++  struct S {
++    char a[64];
++    S& operator=(const S&) { return *this; };
++    ~S() { }
++  };
++
++  S arr[8];
++  for (const auto r : arr) // { dg-warning "creates a copy" }
++    (void) r;
++}
++
++void
++f3 ()
++{
++  struct S {
++    char a[65];
++    S& operator=(const S&) { return *this; };
++    ~S() { }
++  };
++
++  S arr[8];
++  for (const auto r : arr) // { dg-warning "creates a copy" }
++    (void) r;
++}
+-- 
+2.43.0
+
-- 
2.43.0


