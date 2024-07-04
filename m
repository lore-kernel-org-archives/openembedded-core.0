Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98772C3814E
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 08:25:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5844.1720081502208297528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 01:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7915407677=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4645ebaZ010928
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jul 2024 08:25:01 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jrsg8uf-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 08:25:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EX3oJcONENC7uAuBYdmh2GSeicwpHtU+50TYquGltJncuLjU+PbutXugJCnv2kLAlAkKlA8uszDMu8BiDokBN9mj15oVipm8sgwl9IIJAu3g6rLMbUPHe9v7w1acHx4ZpWLIVDa7LyO1mHihCD2zQdXVCjJCheqpMcSsYuB23Y8dtyUc2jJ99B5xI49VVmPlAYmVejo3/vgFYuVNK0RmpI7lXKsNcpt78eNzN/8GyKDx9sqvhBd5GZoqstJHkoA2fsr0K4dIRoxkPtzb+dYAuLzpHSlMPgmsi9FeXcyXLx7Rk6vuJ4TtoCc9BZaUWBOYlmU2BVMErTRXXboqkjxaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IujVaO+BHa4vRbmeZ6SN14R69U2Xq9L4gN6p+dFxQ64=;
 b=Hjp/LkdVJR71pAuD3qBWo6Nf1DUsoVobL1Kdj2nq20A74F37o7+bInDU8Ko7XG3uQifzZaUE3hnds75h6mE4ZQ3Xdl9BAX4eNeVY44EjBvE2qTRLetWo/IhSYJlcxtJUYLtUtpzfSuc1pkdEj3DOcJjtbG02Aqg9RLA4Ij5mo0si9PYZfg3FngLlRapMCPvHIrFYxzVv2Uqq8n7CvScKe1RFOObS+AV5noWrKNu/Nssbgy/akAd8Q5LPqwAx2IUiuAkKuZtFASm7qJwMXMgFpDXNf3RsG8PhCecQXQJd7vHF76gX0CJSvSGa56NdrF44L8iWhQKAWQkB8R4sdSY9qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Thu, 4 Jul
 2024 08:24:57 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7741.027; Thu, 4 Jul 2024
 08:24:57 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/4] util-linux/util-linux-libuuid: upgrade from 2.39.3 to 2.40.1
Date: Thu,  4 Jul 2024 01:24:41 -0700
Message-ID: <20240704082444.3886275-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704082444.3886275-1-Qi.Chen@windriver.com>
References: <20240704082444.3886275-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:a03:117::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW3PR11MB4649:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c17f83-298a-49c7-c7f8-08dc9c02c9cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AFG6W2fti5sEcNXmN+GQoC3tSxuE9Wibg8EArnt5HNHDOevaC7cJIbIBXapO?=
 =?us-ascii?Q?ayD2uL186NH2rWYZlOZGK4vc5zRqm79yiP8x2f1YB94K22iq8tvgmggXHj3w?=
 =?us-ascii?Q?3jyFTDJzQeaCrbW74vbZgEX9y4AmbyEQCcCa0VTJq54iR60G4wyUNq3iOPaU?=
 =?us-ascii?Q?XYrXbUC4KZciF1cocR7GYgmGvh4669LCVk7cCDQ+NKVOhds9KZCIFqnyk/+v?=
 =?us-ascii?Q?ke6PEqG08o6bZAH023y5UvTH23yDLh/Z8IfHQORTxwxSs5CAY/WTYiu2aj++?=
 =?us-ascii?Q?kAjLC6UUbxwJrebwASlPU8sxe3Q7QGrSqxzcZhjm2tbmAb+R9HNqKGLc0hFp?=
 =?us-ascii?Q?x2kGF9d97/luDgCJvjY48ieSyCc8SC9GXkW4HdjYdEatkCLahdAFPCQzDa4r?=
 =?us-ascii?Q?bJc4vi8fkBoASfpsLOvvE5PK/4JWCLzSJbi/Jf3Ss7ungZ4/jiaV5UejaMtN?=
 =?us-ascii?Q?MBjVRhwm6nLICxb+cYWD5rYIwn2dxe0qCbu/52t1G6lFz7GVrcmkTCmEFlYJ?=
 =?us-ascii?Q?/avvC4LD41GtOq9L42aa+EUFcfjFCBEU00bMlQXxX7d3scuUpBSOvmAMbuxQ?=
 =?us-ascii?Q?4qFfkKZFN6IuBB4lpfcuZG9X2IepyFlJ9lKLJhzzF05mdgXA8T9/K/YgLrsF?=
 =?us-ascii?Q?ADFNHl2e9HVlaDyXwV12AgPCSFPOmDaUlZxx3im8aqrJfJcwDyEuLoV7YdBr?=
 =?us-ascii?Q?5wxtcj8AHhiATIcAIwdSGzXPA1auG3FW9Zdko26zZj5PF1EGIPooMMqUQtOf?=
 =?us-ascii?Q?iRZrNhWMnvrjBc/H+oFZ+9BzZZUjond36qkcTVseuGvBzsZck5yp3ZAHr/fQ?=
 =?us-ascii?Q?M3+bhFeJjTzPb4EJ9+MbA9TgKR6Vf/xoMrOISkwUgpYTIqxpImyCMEhFLFX0?=
 =?us-ascii?Q?Tshnu4v4lJpLK3rRp+W+ur7ncGbv+B6iXtUNsC+/UtEfT1hJDleQdMoUMvp8?=
 =?us-ascii?Q?2G7AYgHY25UZBFAVTVp5dn33rso0/oKAgy9Pjvz+WUA03JpU2uTIiPsqkj5S?=
 =?us-ascii?Q?y09YiAoDRMBNuQ3SKkviXdO0Mt/ldgUgpBcDPQnHNBT3mzJUiE4pHPx1dh2P?=
 =?us-ascii?Q?Xz4118h84AJjnYloFTGaJLzBPvofWaD/kDD5fxYB0k517xbeWyPhyWivjQ5v?=
 =?us-ascii?Q?+QhPZK4IGCzCAoAqiGjxQwsBgK9eBwQeXjnDt/oIyQ86iP/f/ahy7DeR4g86?=
 =?us-ascii?Q?AyjbUDVB4NXYUIlXPumIXGnhr5xlegKDgyHQemEFVp5Odsnr1ROmLSvM/Ks/?=
 =?us-ascii?Q?DGKgYhXoGj1IBHDzK9ej0Sdgon5aizdYabyhgcWFLFNUFynYE+7bJGet0gs1?=
 =?us-ascii?Q?+jMv7LYewu4uMWGt6yjT3BI9Ukn+wUqxzWidUXD0AxHZ0WrJCM5pCMlQLG0V?=
 =?us-ascii?Q?ID7oGo0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UAbEZF0XOQxf9oAU7ON+kd9eSHX6MQ73sXmDrJ3tX0ieeplNU2rcGFVHiqvq?=
 =?us-ascii?Q?OpBmS55WCV0Sc2Zgwr728yDbNpb+V3jx1LkA7wEB6cO19NOGTmoswNOSVvUq?=
 =?us-ascii?Q?XPDNuX5bcXx1W8EyzeO6ak51CyvXI54zp0aJeqiriLoJTkCkgx7uIr8rlyek?=
 =?us-ascii?Q?J0ctJi/aBTnjnLq1zZ8lcGzIzRtO5KO8m6YMPEH34hPlvOG7gw59P9z0f/QI?=
 =?us-ascii?Q?KElvoLnQFNQtDPvB5zsnQYaQqJEf4TpmHE9B0HvFcq9qQFfbF5jsnmVpxi8J?=
 =?us-ascii?Q?xkTbpZkp9zQB3aG9VH5w+CcISbDzqo16xc1+kVl5S9jDVTwUlLxPVj4oZIdJ?=
 =?us-ascii?Q?IpeMYKI6XbpBPJc571bmNDcyUY+XpGw2gVRV7JCdRka1JJsrOV0ffJCv9A6P?=
 =?us-ascii?Q?hu0W9Rz98HMiFDNNicN+z2c5trMUt/YkCJzJEQZyYEBJz9G+iQhJ7R7aT6w/?=
 =?us-ascii?Q?ZEVhe9JZjYvH7SzeyO3mCKOBrh5SfsZnvORV9DEeFD8+pbzALWLtiigwzBnk?=
 =?us-ascii?Q?HLJl3TgzuL4bbAueF+4HCCOd5H1YzaE5zlv8AkQ+bZpyN1/j79P/UlHQewvr?=
 =?us-ascii?Q?OCH6sYLjVekp6WnF4YA4mvZeQlQcQLKVij3jPx9QYdeOowzKaHQDi65Hovt5?=
 =?us-ascii?Q?Tw9OmqwS48cA7JkbHsGCAsEm0qvbV2qFAJpyJOn996vZ5Hcq7xqV/iKE5Gsk?=
 =?us-ascii?Q?nQgz02Z6W6iPrv2btnPewwjjw+NKEL2TJxV/2rabYxQ5TnkduDc6lCedKzpk?=
 =?us-ascii?Q?xI7edmGbizrFfBrw4EubOwrqTfgEq9QQ24I+oHM91RVcKw5qMJXxALoTuZ3q?=
 =?us-ascii?Q?jL/KNmpcKONfgSZsisbLRslCrCnnFVVFYoUrgEkC/D5Up7J2j2q7qh6jnIlL?=
 =?us-ascii?Q?R+YTrsx8w9Q9/smMUG44++6BIBWYa01A6OIddEo0WH6F9xRyGyRMP6j1HP4L?=
 =?us-ascii?Q?Y0g7t+FUBW2yPaH7D4ajtmCc9LCBBtvuc9/jxVDvJpPjNs5y8QJMeNfbppqh?=
 =?us-ascii?Q?uq6GAt5cVwg2+6PayQray4HcSlpfUiCYZGVaaNRdHV9ln9B67DZFZ7SSneyy?=
 =?us-ascii?Q?ED6W9HJOh3l0soBaQGo3OAOXdIcyCThdT2Ofa5HRe4pfpStnT+PRQRiVkT2X?=
 =?us-ascii?Q?xO0Nm6oMiMUGNsrpyMspoBKOBWhAv1eMzbZefnfVWwKSl+t4GxuZD+KymOol?=
 =?us-ascii?Q?2A4AHe5KxdDEzm5JlmKpL9ylLzp2Dn/y3FXIQPX5Sywrw0n4pwLXjFLQltrk?=
 =?us-ascii?Q?pc64PgLG+fSJg5T5xYUQqwkIzGBNdpbmPJ2nGuOFp+wgVi9N7ZdpfNTIqC4v?=
 =?us-ascii?Q?zY02eec/U5SeXCwaLAT/ZJj6CF4WxpDHvihjSzmIW8mk1ByfD0wUNetq8vp9?=
 =?us-ascii?Q?iWvTm18Sfe+2MlY37HEM+SJkpV7z34odRvogTsSnr0FQUSdy035jXGDX/VUK?=
 =?us-ascii?Q?C3G7tBeG2S7OLygyv80ftvEmLaRfUIEEiAjxiLLVy7ywEbuIBIO/wIUqztYT?=
 =?us-ascii?Q?/GRwVYLcBwZ12seoTQWYxwPVj7y2iCKTA2T3jxY2v61eSYzuoHMa9pFNupiE?=
 =?us-ascii?Q?zfhIoJVWy3zD8/irrI7IH8Ysnn0aOQsDervUAq5W9FI68qSghjqAw0TbDbjl?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c17f83-298a-49c7-c7f8-08dc9c02c9cc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 08:24:57.0019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WF/No2oEPgknEL3krPdiVeROUXVkoY4elXs2sU76kv49ZfzLLMQiK6Avw3JEbtCJDBQGN1SYytMBiNHcPIzNGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
X-Proofpoint-GUID: mIv-8I21ReWB3rShlmbiFZSpOIfdkGNa
X-Proofpoint-ORIG-GUID: mIv-8I21ReWB3rShlmbiFZSpOIfdkGNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_18,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2407040058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 08:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201526

From: Chen Qi <Qi.Chen@windriver.com>

License-Update:
===============
GPL-2.0 is changed to GPL-2.0-only in README.licensing.

The following two patches are removed as they've been there in new release:

  0001-login-utils-include-libgen.h-for-basename-API.patch
  mit-license.patch

Other existing patches are refreshed to avoid patch-fuzz error.

A new PACKAGECONFIG, lastlog2, is added, which serves as a switch to build Y2038
safe lastlog pam module. This is a new functionality added in 2.40.

This 2.40.1 version has the problem of unnecessary remake, causing
intermmittent errors at parallel make. The do_compile:prepend is a
workaround for this. Upstream issue and PR are:
https://github.com/util-linux/util-linux/issues/3061
https://github.com/util-linux/util-linux/pull/3064

do_install is changed to do_install:append, the legacy codes are
removed. They've been there since the born of oe-core. I tested
with ccache, there's no error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...2.39.3.bb => util-linux-libuuid_2.40.1.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc   |  8 +--
 ...ls-include-libgen.h-for-basename-API.patch | 60 -------------------
 .../util-linux/avoid_parallel_tests.patch     |  5 +-
 .../util-linux/configure-sbindir.patch        |  7 +--
 .../display_testname_for_subtest.patch        |  7 +--
 .../util-linux/util-linux/mit-license.patch   | 45 --------------
 .../util-linux/util-linux/ptest.patch         | 11 ++--
 ...l-linux_2.39.3.bb => util-linux_2.40.1.bb} | 21 ++++---
 9 files changed, 29 insertions(+), 135 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.39.3.bb => util-linux-libuuid_2.40.1.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/mit-license.patch
 rename meta/recipes-core/util-linux/{util-linux_2.39.3.bb => util-linux_2.40.1.bb} (95%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index d506783f9a..0f5f838e84 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,7 +6,7 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-LICENSE = "GPL-1.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
+LICENSE = "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
 LICENSE:${PN}-fcntl-lock = "MIT"
 LICENSE:${PN}-fdisk = "GPL-1.0-or-later"
 LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
@@ -14,7 +14,7 @@ LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
 LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
 LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=cc80239f106687ab39ef0271ff5cf4ba \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=ddd58b6c94da86ff4f03e91208eb9cfc \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
@@ -30,7 +30,6 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=cc80239f106687ab39ef0271ff5cf4ba
 FILESEXTRAPATHS:prepend := "${THISDIR}/util-linux:"
 MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
-           file://mit-license.patch \
            file://configure-sbindir.patch \
            file://runuser.pamd \
            file://runuser-l.pamd \
@@ -38,8 +37,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://0001-login-utils-include-libgen.h-for-basename-API.patch \
            file://fcntl-lock.c \
            "
 
-SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
+SRC_URI[sha256sum] = "59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch b/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
deleted file mode 100644
index 6258710e1e..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From d44e3ad1f6f8b5c1b3098bb7d537943a4c21d22f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 3 Dec 2023 19:59:46 -0800
-Subject: [PATCH] login-utils: include libgen.h for basename API
-
-musl has removed the non-prototype declaration of basename from string.h [1] which now results in build errors with clang-17+ compiler
-
-include libgen.h for using the posix declaration of the funciton.
-
-Fixes
-
-../util-linux-2.39.2/login-utils/su-common.c:847:20: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-  847 |                 shell_basename = basename(shell);
-      |                                  ^
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2615]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- login-utils/su-common.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/login-utils/su-common.c b/login-utils/su-common.c
-index b674920..3297c78 100644
---- a/login-utils/su-common.c
-+++ b/login-utils/su-common.c
-@@ -26,6 +26,7 @@
- #include <sys/types.h>
- #include <pwd.h>
- #include <grp.h>
-+#include <libgen.h>
- #include <security/pam_appl.h>
- #ifdef HAVE_SECURITY_PAM_MISC_H
- # include <security/pam_misc.h>
-@@ -840,17 +841,20 @@ static void run_shell(
- 				su->simulate_login ? " login" : "",
- 				su->fast_startup ? " fast-start" : ""));
- 
-+  char* tmp = xstrdup(shell);
- 	if (su->simulate_login) {
- 		char *arg0;
- 		char *shell_basename;
- 
--		shell_basename = basename(shell);
-+		shell_basename = basename(tmp);
- 		arg0 = xmalloc(strlen(shell_basename) + 2);
- 		arg0[0] = '-';
- 		strcpy(arg0 + 1, shell_basename);
- 		args[0] = arg0;
--	} else
--		args[0] = basename(shell);
-+	} else {
-+    args[0] = basename(tmp);
-+  }
-+  free(tmp);
- 
- 	if (su->fast_startup)
- 		args[argno++] = "-f";
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index 85ad7a5575..8ea00dbb95 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 0b05e4695a0616badef71dfa459a00ef6ff1b521 Mon Sep 17 00:00:00 2001
+From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -9,13 +9,12 @@ Revert run.sh script accordingly to serialize running tests
 
 Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
 Upstream-Status: Inappropriate
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 890212f..870e817 100644
+index 651ef2b..2a8012e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index 75adeca188..74abdc2038 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From c79222a9a5e3425c55e150edc0b7ac59c573aa2f Mon Sep 17 00:00:00 2001
+From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
@@ -9,16 +9,15 @@ fix the test, the [ ] syntax was getting eaten by autoconf
 Signed-off-by: Phil Blundell <pb@pbcl.net>
 Signed-off-by: Saul Wold <sgw@linux.intel.com
 Upstream-Status: Inappropriate [configuration]
-
 ---
  configure.ac | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 36c24b4..890212f 100644
+index 23594ff..651ef2b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -102,7 +102,10 @@ AC_SUBST([runstatedir])
+@@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
  usrbin_execdir='${exec_prefix}/bin'
  AC_SUBST([usrbin_execdir])
  
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index 815ae9c915..871b0b2d30 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,20 +1,19 @@
-From fc5de1de898fd1a372a2fd2fa493dc57323a029d Mon Sep 17 00:00:00 2001
+From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Pending
-
 ---
  tests/functions.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/functions.sh b/tests/functions.sh
-index 5a562a3..098145e 100644
+index 5fe5ba0..a6c703e 100644
 --- a/tests/functions.sh
 +++ b/tests/functions.sh
-@@ -437,7 +437,7 @@ function ts_init_subtest {
+@@ -450,7 +450,7 @@ function ts_init_subtest {
  
  	if [ "$TS_PARSABLE" != "yes" ]; then
  		[ $TS_NSUBTESTS -eq 1 ] && echo
diff --git a/meta/recipes-core/util-linux/util-linux/mit-license.patch b/meta/recipes-core/util-linux/util-linux/mit-license.patch
deleted file mode 100644
index afbec98f18..0000000000
--- a/meta/recipes-core/util-linux/util-linux/mit-license.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 5b8fab1584017d9d9be008c23b90128bba41a7b5 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 28 Mar 2024 12:16:57 +0000
-Subject: [PATCH] README.licensing/flock: Add MIT license mention
-
-Looking at the license text, flock.c is under the MIT license (see
-https://spdx.org/licenses/MIT).
-
-Add an SPDX license identifier header and add to the list of licenses the
-source so everything is correctly listed/identified.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2870]
-
----
- README.licensing  | 2 ++
- sys-utils/flock.c | 4 +++-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/README.licensing b/README.licensing
-index 4454f8392a..535ad34813 100644
---- a/README.licensing
-+++ b/README.licensing
-@@ -12,6 +12,8 @@ There is code under:
- 
-    * LGPL-2.1-or-later  - GNU Lesser General Public License 2.1 or any later version
- 
-+   * MIT                - MIT License
-+
-    * BSD-2-Clause       - Simplified BSD License
- 
-    * BSD-3-Clause       - BSD 3-Clause "New" or "Revised" License
-diff --git a/sys-utils/flock.c b/sys-utils/flock.c
-index fed29d7270..7d878ff810 100644
---- a/sys-utils/flock.c
-+++ b/sys-utils/flock.c
-@@ -1,4 +1,6 @@
--/*   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
-+/*   SPDX-License-Identifier: MIT
-+ *
-+ *   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
-  *
-  *   Permission is hereby granted, free of charge, to any person
-  *   obtaining a copy of this software and associated documentation
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index 6221de7182..7345926b88 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,24 +1,23 @@
-From d0a69ce80c579cbb7627a2f20e8b92e006a8d8ad Mon Sep 17 00:00:00 2001
+From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Pending
-
 ---
  Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index effbb02..7d2bd1e 100644
+index 50ab8d0..7e2340d 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -57,6 +57,7 @@ systemdsystemunit_DATA =
+@@ -64,6 +64,7 @@ tmpfiles_DATA =
  dist_bashcompletion_DATA =
  check_PROGRAMS =
  dist_check_SCRIPTS =
 +TESTS = $(check_PROGRAMS)
  
- PATHFILES =
- ADOCFILES_COMMON =
+ BUILT_SOURCES =
+ 
diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
similarity index 95%
rename from meta/recipes-core/util-linux/util-linux_2.39.3.bb
rename to meta/recipes-core/util-linux/util-linux_2.40.1.bb
index 2cd7750afc..5985ddc7dc 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
@@ -90,7 +90,7 @@ EXTRA_OECONF:append = " --disable-hwclock-gplv3"
 # build host versions during development
 #
 PACKAGECONFIG ?= "pcre2"
-PACKAGECONFIG:class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam', '', d)}"
+PACKAGECONFIG:class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam lastlog2', '', d)}"
 # inherit manpages requires this to be present, however util-linux does not have
 # configuration options, and installs manpages always
 PACKAGECONFIG[manpages] = ""
@@ -106,6 +106,7 @@ PACKAGECONFIG[pcre2] = ",,libpcre2"
 PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
 PACKAGECONFIG[chfn-chsh] = "--enable-chfn-chsh,--disable-chfn-chsh,"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
+PACKAGECONFIG[lastlog2] = "--enable-liblastlog2,--disable-liblastlog2,sqlite3"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
 
@@ -117,6 +118,7 @@ FILES:${PN}-mount = "${sysconfdir}/default/mountall"
 FILES:${PN}-runuser = "${sysconfdir}/pam.d/runuser*"
 FILES:${PN}-su = "${sysconfdir}/pam.d/su-l"
 CONFFILES:${PN}-su = "${sysconfdir}/pam.d/su-l"
+FILES:${PN}-lastlog2 += "${base_libdir}/security/pam_lastlog2.so"
 FILES:${PN}-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
                           ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
                           ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
@@ -147,18 +149,21 @@ SYSTEMD_AUTO_ENABLE:${PN}-uuidd = "disable"
 SYSTEMD_SERVICE:${PN}-fstrim = "fstrim.timer fstrim.service"
 SYSTEMD_AUTO_ENABLE:${PN}-fstrim = "disable"
 
+do_compile:prepend () {
+	# this is a workaround for the unnecessary remake problem. Issue and PR are as below:
+	# https://github.com/util-linux/util-linux/issues/3061
+	# https://github.com/util-linux/util-linux/pull/3064
+	# When newly release tarball contains the above fix, the following workaround could be dropped.
+	[ -e ${S}/libsmartcols/src/filter-scanner.c ] && touch ${S}/libsmartcols/src/filter-scanner.c
+	[ -e ${S}/libsmartcols/src/filter-parser.c ] && touch ${S}/libsmartcols/src/filter-parser.c
+}
+
 do_compile:append () {
 	cp ${UNPACKDIR}/fcntl-lock.c ${S}/fcntl-lock.c
 	${CC} ${CFLAGS} ${LDFLAGS} ${S}/fcntl-lock.c -o ${B}/fcntl-lock
 }
 
-do_install () {
-	# with ccache the timestamps on compiled files may
-	# end up earlier than on their inputs, this allows
-	# for the resultant compilation in the install step.
-	oe_runmake 'CC=${CC}' 'LD=${LD}' \
-		'LDFLAGS=${LDFLAGS}' 'DESTDIR=${D}' install
-
+do_install:append () {
 	mkdir -p ${D}${base_bindir}
 
         sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
-- 
2.45.1


