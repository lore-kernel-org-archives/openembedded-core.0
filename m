Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D90C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 09:58:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9946.1741168671613452654
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 01:57:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=515944b0bf=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5257xvqX013515
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Mar 2025 09:57:51 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456ct88g33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 09:57:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0FekaqIhNUCrrdvU9q9jxAq6bcocEoyHLhLeu7RGUVIEIs27m2UhG1+LUhdyWZJ18Y0ogapVYuIRlZuEw0zoZ2qBwGVCRrjewCtxFdikgJKuJMdVw/uL+NwbZ9U/FNbYzgKgH6HBmJD6n0y9Ri//5NSnmpJSxGmvY7vw7R8ofkMczNNSpCXJu1CsW3s8q3DDzE07pSX5WYP1gTtJPMY2I9jIzghjYxikn/gxQZxUVnFpY53pWHQoQ+nLdlHxw+3KN3yUTt89+KDjb5Ey33az4fb4zhjC+nJlh+qgwOHO2vvGTx5pOiAvZQXcxOZ3NiS3I9XOq+pyiQ6jGJTa/Zq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbSwYUULpy1fD1fkIUU16p0+sBVnV0Byr4nuBpFpGrw=;
 b=tTz2pusCIR995T/89ItWDmaO2NwXn9ZOo+rmmqtGzAXyvsDRothic2xmzQvkJ2EkqDgC7J9pZDnLA8euZ9qTrko9nXHkmjxprqeDCo13NEjHa5Gky4gZjSXjOJQ91x+AzMOyb+iZaiYW9nUfX1ArIy7m6Z1sIg8M9srdXiYdGJX9d8sFVKJzoM2CCdoYXJD0EyxlUmzyYsmhSHJgSiLhPy3Eh1P0VY0WSi/oakYtObOtpJs1vnyd9GSyij6anIa8hu0Xr/jcahbG+7TwHnKupYkZ+2H4y1zlrFmhK36BzueLD1NiUHsxVVbv9eD++gIlAYlIX/znXFWJ19B+su8qrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by PH7PR11MB7025.namprd11.prod.outlook.com (2603:10b6:510:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Wed, 5 Mar
 2025 09:57:48 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%2]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 09:57:47 +0000
From: bin.lan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] babeltrace2: upgrade 2.0.6 -> 2.1.0
Date: Wed,  5 Mar 2025 17:57:32 +0800
Message-Id: <20250305095732.3882467-1-bin.lan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0066.apcprd02.prod.outlook.com
 (2603:1096:4:54::30) To CH3PR11MB8701.namprd11.prod.outlook.com
 (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|PH7PR11MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd4fd7c-467a-45c4-6137-08dd5bcc2ef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hWP9zq48enwn8Dz2WotoOt8M+g4MwdB64ziUrUarAohQkySlGPrPBS5JcWIt?=
 =?us-ascii?Q?Vucab+1ad3c6Bh7UdgNADO7LYlCaAv5DY/8omS4sRT03L4LWAKhW/Y/s48FG?=
 =?us-ascii?Q?P7het2wzKR4OiHLXz50v8z3hHknteDUUvcvDR9UNew7/YVmeWlPcG0oIxrnl?=
 =?us-ascii?Q?RHuvEuZp9bwE5QH5R+J/L/I6tuMOY3m6SLY/1A7J2zu85QlLHgLCSKcxK2pi?=
 =?us-ascii?Q?iipXnUpZzODy382OWvt1Ur+GD+GwCT5aB9NfvduUVve3p66oH7djYQdaB3K2?=
 =?us-ascii?Q?TuiuA0L8CbS3ALYzo3PQ7u3TeHIrG4fZQe/gjt3bTfq7liRT48BXrTxilDt4?=
 =?us-ascii?Q?M95ogoKVcJ/XbYa6hvPc8wSdTZ16e3n+zHmZDwDwjs1GA8fEO/ToN8najf8r?=
 =?us-ascii?Q?axDd55ftm0wJVjG5PHDk17aJFXaeRmtwdN5eBQNmlUFeBmzZKQDdjvPowFwZ?=
 =?us-ascii?Q?1IQRYctP5GC/T+z3prFK9nzzepsT9bXk/95BcxOQYq6hezK4/Rj71cpKyYEY?=
 =?us-ascii?Q?VHknfHaKb76F/kjmDJE7olq+/mcu4nVY35Ebd5F74+BrhUdHsmqP4bfYx89z?=
 =?us-ascii?Q?Os7letxqAjuYO5IpLNqzptBTQsO2Wg3kvoC0tDsHCbl2r8lqSHXyQTj6Dp11?=
 =?us-ascii?Q?QGAXIbNYh1C0wvuSLD8RkYwgS7ubA7V6JCXyjUDWRU4v9RQg9QKpNUNROyyw?=
 =?us-ascii?Q?pCSUSV7pyoH7Lno+M7kq//UPcHoqDuXhBvQfSmrKNnfqfE8j5gJSypugEBs0?=
 =?us-ascii?Q?P08c5krmCqzu05Hj636TD0S2RtFa5tr5O/DcENWJbiG9OBckh+Yptqh9pELT?=
 =?us-ascii?Q?B0oF41V4BnDpH8gTq9u8MsTnaQbZyhJVJSgKHhI0jyUpiO/VSX+vjkEJK1Rg?=
 =?us-ascii?Q?asDZ1pUKvvJPCrFgL799FuneVIVHd9SkEK0p9k2NIQFG7k0snDzEqMW/UINb?=
 =?us-ascii?Q?UxIKAeDz2R91BzBU2VKypi7Ycgyt7ARTBQ3AxHJb24/s2K9G+suKZZtA8jw/?=
 =?us-ascii?Q?Dxik5LwqwHUN6lgn6tuSsRsmg0BjuLYPO14alO1T43zqe1DeRejPU0MSS20w?=
 =?us-ascii?Q?7Z8gRXxK6yuaFaimRy+1SO1dtGNQxdt9v53whznDgYuHAf7qA9KlVSHO+wHY?=
 =?us-ascii?Q?KMFMnvHzki/iAOHMt2pRZDNN/2DGGgHCr1PBXDBYf9T5MpD6pbSM2jU6eMSy?=
 =?us-ascii?Q?D4RzIgaUD0wQ81t/bWUbrd5YxTtabQ04LVEop/gW5vw7YubSztYFJgl9yMfF?=
 =?us-ascii?Q?ofDQIJm/U5RNN4GtTJeeYwO7IAnxW5xcjpHWUMVZV6CNc/46gAzVHeqoReTx?=
 =?us-ascii?Q?B9fkTUyvC8WpCsGntp303YTlyZbm8q159YI87KdDGz2fGnu1KHxgfhnicE1o?=
 =?us-ascii?Q?NmtSFlj9+qxFbpj+QuhNNaUUTDZ+lp6cV8RC3ttG0OZtLe80qw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aGuhlm1RuOD225hnCChR36bKUor/JAlMDNOHCuPr/GmT8qrJZ35VKx4/91/S?=
 =?us-ascii?Q?Z2ngjI2KhfV2YmlJX45gmTGC5qdMGhkohjf0m63gH8kXlc2d3/lyOkV6v9yA?=
 =?us-ascii?Q?FxQ5DcOZQIFSiAlq9zuiXsiDy82yg53dfcopzn6WKSvnhqmgbImbISTYJh21?=
 =?us-ascii?Q?taxc/7wxR6+uQKDh9iBfwkMDVEajsuAdpqvgFuQo8I8o7pIQJ78zmhpKn82Z?=
 =?us-ascii?Q?R1V6dPrIgDfRhaHP96WR/bfkXHFScpSeHwi6Z0EpMSxfNMO4WCf0uLJ7ZNFH?=
 =?us-ascii?Q?Dl7iXRIGSM6yEXI/ylgIRTWLHAZGL/ucQ+OG8ahFf8QZ/AjC4/v896fOxPPx?=
 =?us-ascii?Q?jWW7EbafuL8h8TjoPjiXLCbpJWph4tOIrakT21GP/kO7rX2zfSVhLxz0wtu7?=
 =?us-ascii?Q?HxkPWzzcaSUvyE8f7PawC96GjfN+42uCMDzh7T0pPnMmp3OM+coAYor8uqM7?=
 =?us-ascii?Q?1AH2t4JFWtDf1GqRzdiHHft6MqW+7WMRq+fOrz9X2Rr3Ff24LmYpj6k0MV0J?=
 =?us-ascii?Q?7rBrsWMPgWh2q7GK5tVouPIGslOn3QMzxjY3/28nD60BXCgNzyI9eTi+EYFo?=
 =?us-ascii?Q?tGYIcOdh1YCuU5hY+B/P16dtyOCMaBWne5F3OV9v/pcw+foNu2vmdVRk0m+d?=
 =?us-ascii?Q?16fj9crVXMAM2NdXVtkgmIpKRVef8nGA/uWjJyxqXFwso/NU7Ydc9Ak7y1zs?=
 =?us-ascii?Q?hPthvWXcR8yWzOLJvlNTYKPCSKZHNlm2thzil4UgU3gpce/QKqOSMD2wO51O?=
 =?us-ascii?Q?6ZTzbvgcUI8pAuzr3bozJjDpW7/8yiJg1Q9YBAPCcbm9EXt5sXxub2EZ76Nc?=
 =?us-ascii?Q?df1EdKtVpiP8yRoUanNsUF2LDj/+gQAKE/CvcJ1iPqcLsAHSIT/9mlltGhVI?=
 =?us-ascii?Q?MpaklVAqo+k+/sG3N5W0trI98f3tuODMM3t040iSNosbkt30UfunMQMZitpF?=
 =?us-ascii?Q?xwA1MMpb0FIJ2gCVHM7DwSiMgyVZIIWOSrNc/yrrus5tMT9f3xBXJLp9MFFE?=
 =?us-ascii?Q?wbFIvCn5ENQY/Ho3ga8R02etzM4xwk03hKkwqv/EcMfZCi40lzm1Pmn7XDEM?=
 =?us-ascii?Q?hobnKdrb5FDx7+DCQy0dBrqsY4hk+L3mkwncw6bj7Rf6B7M+z0CjD3x+jfpk?=
 =?us-ascii?Q?5asuw8yPHD5sWz3I2Cdyew9obbmOfG+Lgh2kVmxO+w4GeHrWD9Z9v+943eny?=
 =?us-ascii?Q?Lq0jF6ADs/PflCmT388U0jBIq4h8rJFt7/aFd9O4z4fy1/0i1fTavoaRvBpt?=
 =?us-ascii?Q?w44ddWP7cYdTlAVLGtNiSv8W0iIfvvJcGxITzOXB3qHrg5/QkOtOqRPJKabI?=
 =?us-ascii?Q?AHIzQKA1gOfL0Afs3Lelezw4THcpoA5FFsOlOugIWCrsp7rMjGXZLyTFOyfI?=
 =?us-ascii?Q?IqvMrHsKESrcIbXjT6ckH8dUdWr2pR9KayJuqfJ4SP+lAEYaqliyxt0XF+PF?=
 =?us-ascii?Q?9/8GLMeXd/p63IvFvKOQzxM8eq0EPyf2EBCR2AW7wJQSjwgweP9FpBEhCtBg?=
 =?us-ascii?Q?G6b4OU5TifisTIxkd3KMlqQ63GvcyGYijws+rkqwMd/f0Jno1hyNphwCVIot?=
 =?us-ascii?Q?Mddo2MkTsqGpZ+dM4hMnxcKJfNofhG5EAAORcN9cyDIfY1R/KOrJVbTHyJMv?=
 =?us-ascii?Q?BA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd4fd7c-467a-45c4-6137-08dd5bcc2ef3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 09:57:47.7526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlPjsy8j0P9VwQdIN/XnpK924UZi5jQQwzx3wqVjCpHHuRLJ8Sb7WrVft5rZ4r9HnSeZpezy3uo21Xx9GPnY1Lb114g55j3SFAHhNwVRhpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7025
X-Proofpoint-GUID: 7PzjmjgcQQLG0nXzVONY_X5k5QQvjJYs
X-Proofpoint-ORIG-GUID: 7PzjmjgcQQLG0nXzVONY_X5k5QQvjJYs
X-Authority-Analysis: v=2.4 cv=D4W9KuRj c=1 sm=1 tr=0 ts=67c8201e cx=c_pps a=O5U4z+bWMBJw47+h9fOlNw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=U40Yx87jAAAA:8 a=a5LkSv8FAAAA:8 a=t7CeM3EgAAAA:8 a=fk1lIlRQAAAA:8 a=pGLkceISAAAA:8 a=7d_E57ReAAAA:8 a=VFVOwz_qZ-WAeXJ-Jr8A:9 a=_PE9Q_0Z8bzuyU0-:21 a=BBahhS0D0WQA:10 a=yv_D6YSC6K1Ih23S2Yuy:22 a=E2cWBXyb0kjxxB1PlMdk:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=U75ogvRika4pmaD_UPO0:22 a=jhqOcbufqs7Y1TYCrUUU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503050079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 09:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212301

From: Bin Lan <bin.lan.cn@windriver.com>

0001-tests-do-not-run-test-applications-from-.libs.patch is deleted
for tests/lib/test_plugin is removed.

Changelog:
Babeltrace 2.1, MIP 1 is available and adds many functions
to support CTF 2 features.
The Python bindings wrap all the library changes in the same
systematic way as in Babeltrace 2.0. Add type hints to the
public API to assist with static analysis of your applications.

Details about the 2.1.0 release:
https://babeltrace.org/docs/release-notes/babeltrace-2.1.0-release-notes.html

Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
---
 ...001-Make-manpages-multilib-identical.patch |  9 ++--
 ...not-run-cpp-common-test-applications.patch | 46 +++++++++++++++++++
 ...not-run-test-applications-from-.libs.patch | 28 -----------
 ...o-not-run-test-applications-in-.libs.patch | 27 +++++++++++
 .../lttng/babeltrace2/run-ptest               |  2 +-
 ...eltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} | 19 ++++++--
 6 files changed, 94 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-cpp-common-test-applications.patch
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-in-.libs.patch
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} (83%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
index 2401b176e6..76bef9c3b8 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
@@ -5,15 +5,17 @@ Subject: [PATCH] Make manpages multilib identical
 
 Upstream-Status: Pending
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
 ---
  doc/man/asciidoc-attrs.conf.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/doc/man/asciidoc-attrs.conf.in b/doc/man/asciidoc-attrs.conf.in
-index ad1183f1..e11c7031 100644
+index 88fb13ce2..27858b720 100644
 --- a/doc/man/asciidoc-attrs.conf.in
 +++ b/doc/man/asciidoc-attrs.conf.in
-@@ -1,7 +1,7 @@
+@@ -4,8 +4,8 @@
+
  [attributes]
  # default values
 -system_plugin_path="@LIBDIR@/babeltrace2/plugins"
@@ -24,5 +26,4 @@ index ad1183f1..e11c7031 100644
  enable_debug_info="@ENABLE_DEBUG_INFO_VAL@"
  defrdport=5344
 -- 
-2.24.1
-
+2.34.1
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-cpp-common-test-applications.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-cpp-common-test-applications.patch
new file mode 100644
index 0000000000..a133826792
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-cpp-common-test-applications.patch
@@ -0,0 +1,46 @@
+From a68641947aa5a8b11c81445a9f79d3018bc79893 Mon Sep 17 00:00:00 2001
+From: Bin Lan <bin.lan.cn@windriver.com>
+Date: Wed, 5 Mar 2025 10:41:42 +0800
+Subject: [PATCH] tests: do not run cpp common test applications
+
+These cpp common test applications are needed to re-build in the target.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+---
+ tests/Makefile.am | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 2a4022bc4..8a23bc8f7 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -128,10 +128,11 @@ cpp_common_test_unicode_conv_LDADD = \
+ 	$(top_builddir)/src/lib/libbabeltrace2.la \
+ 	$(COMMON_TEST_LDADD)
+ 
+-TESTS_CPP_COMMON = \
+-	cpp-common/test-c-string-view \
+-	cpp-common/test-uuid \
+-	cpp-common/test-unicode-conv
++TESTS_CPP_COMMON =
++#TESTS_CPP_COMMON = \
++#	cpp-common/test-c-string-view \
++#	cpp-common/test-uuid \
++#	cpp-common/test-unicode-conv
+ 
+ TESTS_LIB = \
+ 	lib/test-bt-uuid \
+@@ -272,7 +273,7 @@ endef
+ $(eval $(call check_target,bindings,$(TESTS_BINDINGS)))
+ $(eval $(call check_target,bitfield,$(TESTS_BITFIELD)))
+ $(eval $(call check_target,cli,$(TESTS_CLI)))
+-$(eval $(call check_target,cpp-common,$(TESTS_CPP_COMMON)))
++#$(eval $(call check_target,cpp-common,$(TESTS_CPP_COMMON)))
+ $(eval $(call check_target,ctf-writer,$(TESTS_CTF_WRITER)))
+ $(eval $(call check_target,lib,$(TESTS_LIB)))
+ $(eval $(call check_target,plugins,$(TESTS_PLUGINS)))
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
deleted file mode 100644
index 805dde8064..0000000000
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 582713cc9a013481eeef253195d644020f637ec4 Mon Sep 17 00:00:00 2001
-Message-Id: <582713cc9a013481eeef253195d644020f637ec4.1583403622.git.wallinux@gmail.com>
-From: Anders Wallin <wallinux@gmail.com>
-Date: Thu, 5 Mar 2020 11:20:04 +0100
-Subject: [PATCH] tests: do not run test applications from .libs
-
-Cross compile specific change
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Anders Wallin <wallinux@gmail.com>
----
- tests/lib/test_plugin | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/lib/test_plugin b/tests/lib/test_plugin
-index 652c90cc..1f817c50 100755
---- a/tests/lib/test_plugin
-+++ b/tests/lib/test_plugin
-@@ -26,4 +26,4 @@ fi
- # shellcheck source=../utils/utils.sh
- source "$UTILSSH"
- 
--"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins/.libs"
-+"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins"
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-in-.libs.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-in-.libs.patch
new file mode 100644
index 0000000000..36d7184e97
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-in-.libs.patch
@@ -0,0 +1,27 @@
+From 32494b1726a881883cb6d317ab76d1ec3f1fa740 Mon Sep 17 00:00:00 2001
+From: Bin Lan <bin.lan.cn@windriver.com>
+Date: Wed, 5 Mar 2025 10:51:11 +0800
+Subject: [PATCH] tests: do not run test applications in .libs
+
+.libs is not exist when cross build.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+---
+ tests/lib/test-plugins.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/lib/test-plugins.sh b/tests/lib/test-plugins.sh
+index f83e42baa..939236393 100755
+--- a/tests/lib/test-plugins.sh
++++ b/tests/lib/test-plugins.sh
+@@ -14,4 +14,4 @@ fi
+ # shellcheck source=../utils/utils.sh
+ source "$UTILSSH"
+ 
+-"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-plugins-plugins/.libs"
++"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-plugins-plugins"
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
index 71a9c81bfb..f3796d4340 100755
--- a/meta/recipes-kernel/lttng/babeltrace2/run-ptest
+++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
@@ -16,4 +16,4 @@ if [ -e tests/test-suite.log ]; then
     cat tests/test-suite.log
 fi
 
-exit $exitcode
\ No newline at end of file
+exit $exitcode
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
similarity index 83%
rename from meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
index a50ba8fcdf..0e2b4f3a1d 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
@@ -3,16 +3,17 @@ DESCRIPTION = "Babeltrace provides trace read and write libraries in host side,
 HOMEPAGE = "http://babeltrace.org/"
 BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
 LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f6b015e4f388d6e78adb1b1f9a887d06"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=https \
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https \
            file://run-ptest \
-           file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
+           file://0001-tests-do-not-run-cpp-common-test-applications.patch \
+           file://0001-tests-do-not-run-test-applications-in-.libs.patch \
            "
-SRCREV = "0a6632f77801f3218a288604c646f8a39cb0d2c4"
+SRCREV = "e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
@@ -33,6 +34,14 @@ LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', '-fuse-ld
 # coreutils since we need full mktemp
 RDEPENDS:${PN}-ptest += "bash gawk python3 make grep coreutils findutils"
 
+do_configure:append() {
+    # when doing cross compile, the path ${B}/src/plugins/ctf/common/src/metadata/tsdl
+    # is not created by the babeltrace2 build system. It is need when generating
+    # parser.cpp by executing /bin/bash ../../git/config/ylwrap.
+    # So make this directory after configuration.
+    mkdir -p ${B}/src/plugins/ctf/common/src/metadata/tsdl
+}
+
 do_compile_ptest () {
     make -C tests all
 }
@@ -93,3 +102,5 @@ do_install_ptest () {
     # Remove architechture specific testfiles
     rm -rf ${D}${PTEST_PATH}/tests/data/plugins/flt.lttng-utils.debug-info/*
 }
+
+INSANE_SKIP:${PN}-ptest += "buildpaths"
-- 
2.34.1


