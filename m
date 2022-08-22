Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14B6C3F6B0
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 19:57:46 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.62])
 by mx.groups.io with SMTP id smtpd.web12.22874.1661198258720739023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 12:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=isTwGePC;
 spf=pass (domain: outlook.com, ip: 40.92.73.62,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mtinrz5lNXGQGxOqxTFLNq/sEbbW7OB13wFXWIzchGJZw2qiyeHZ4RU49Kvp1wqogyn84/W5/SZLR4XAKS7EZG9V6tlyhV0aDx1HpQafvQ5h9cjgnvZalwauNpisW7lRTffVtkDfv2h/Vmi1/8nk+kVGGWUA5+UGY147ffBm8i57as/Hmo7TTzFcvyKcnXC4HWalCj16WLtAkowrW5iS0mWl5aS0tUpdnu0/jas/eA/7q9GmjFSRiyN39dnEuIfpL+XzTIs8GRBt2iIBMaAmhm6BC1omX1itXt/7LJXtniW59aVRm2BDy5nGd7wRr6xyTtKAlmk6bcppHDoJyotaxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEO+Bbop9BhkDPBaqKUj7jMAsQRVZ8ew/l/Ww3Qe3oU=;
 b=Ni6FIPjM0QEfLVyeHKPtzgj4kcC1/8Lqq3JU4KH6Fmkl+4TQuatAgpKyT/eCQJZ19T6oo0bP+k4lzMs2TbpZaJkFJkDFP9QabHZK4GVda4UROaSOyeO8aBm+8ye94aQWu8Biv0h27yDQh+W29UvBE6gbxRIGBl0iwR+4MdMY5ThWa4UN+KuPIoKUp6jrLf5mlO8gz5UfOxZnfGZeS90GnS8BZJ4LcbX5op605UZIsx/3B9uRo8H2ETEP868rDHJjW5f0ld3r0Nl5ChQLPLFwrBPO5SF7jei65Kbi6XkwnQcEwepuHzbiAryZMMF/EYHu5EL78oQJ8qsXQg6FnF6vhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEO+Bbop9BhkDPBaqKUj7jMAsQRVZ8ew/l/Ww3Qe3oU=;
 b=isTwGePC/P64/YJ2Xev//Va3X/2BSmeCUbpiWmrF3vnnJkraOLlDzDOlox2qPAzKfbqYZy3JOwwFCKioZ/RWlRyAQP99tRx+bMjWoMpxkcGP7aw/ww4hiPhGJuagq4efTXpyy3v0DRmp/KIrbW634nGY4ZSOEOWStgpy+/4TYImEydHk7whwiR7ga97+Br3C3qCWiGuvCI+Z/QAvXdoDRaJ8NkO2xvstRtt/pYM0WXzomPFJdBlexohE38vt9tato1PcQjRX3nImX7q9vxc+d0mUq3l935W9A0hpphuP+J8R8sb9R882V9FoxACt+TttI7RiCsTdsJuQxNPKuaDHPQ==
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com (2603:10a6:101:1b::18)
 by DU0PR09MB5522.eurprd09.prod.outlook.com (2603:10a6:10:342::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 19:57:35 +0000
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::59ac:4256:4338:1fb8]) by PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::59ac:4256:4338:1fb8%5]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 19:57:35 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 1/2] python3: add wrapper for native
Date: Mon, 22 Aug 2022 19:57:00 +0000
Message-ID: 
 <PR2PR09MB310005D5AE7E68AD1153DBC2A8719@PR2PR09MB3100.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [GsC80JrASMVY3oKV4IRWmHg+hxaJonqzaztYbR6FJ2sjaxJHa04rzH3yT9bR3LaP]
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To PR2PR09MB3100.eurprd09.prod.outlook.com
 (2603:10a6:101:1b::18)
X-Microsoft-Original-Message-ID: 
 <20220822195701.2206262-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e757666-9878-42a2-4700-08da84788cd5
X-MS-Exchange-SLBlob-MailProps: 
	tBYDyRQCPcmfi2AAqXCeCO0AQpLv0oJYb+80eI7Yh7cESU+vbFTV4Ua2wruYDW6vAwoI2RrMC+JjmmOOC0dOVVT95LDZtuDQO6Sy+H6c/h2WrF8EGBsH6g89bv5sC7FeiHqwS6LjzWmIJGB3JaVzqTkjJxbRjJOb/7+0BQsLbyD8O3At8F8ujCjviC6IgkpBMR/N4mgQtrx9UZEAsbTxKY1qg+D53zY6fvec9NKH1HmvAIDVzLVcVqDt/gFDtMEb2DUVgpLQhVRLr5rtJ5hgKls4qvMu4mYtl8KQyB+fW/GaJZyJ3ecg4EV/XK6PIl0jIa2tbJ6P81baVRYtZjVaSpgmYGn6jT36d1iKF/BACyO600WBfUW6+9D1rhpn6e6D1h3mo1JE8h5+4cau5SmE/xdUKNvasRBmdTS2TJGgsxtAtMO4J6eOWeHSLGHlcDM6xSZYC6A967a0aHkMJJLR6jSXMbECxVitLi/zdFpGZ67Mpsv3tNVj1RDhuTrBpdXWNy6TyZn4VG4BHzOQljoX5SQQpee/jkqOW+dg+A4JjPQxp6jK3MtWplOD5fyTY/S+HcScKzbQgrQ58wNIo6ujrIiQ6psmDYJhxxDFQ9hW9H3JHCqFt9YToJlnJM9oU+JbWkO0FpWDhvOD27CyO7QeBdORQ35NMDC4lOkYmBTLjNfrV+nd2AwESh0dadNfFDbZSMJgTfVQdeWxojim0mnrtN1hcr+CqrimHP+YxrnQ3vGHzxTd2yU+cGPKryIaBTQa0Ist8+SKuAI=
X-MS-TrafficTypeDiagnostic: DU0PR09MB5522:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NYrzE3aqXdN9r81EDQ3pxTwf4vjYM6pGcPiPEgZMhYK0Z2GW4R/C9r1E35+KIOULBd2qEqbjZNbtKSzZ/EfJUe6FgR9XlVVp4boKyXv0F+Oucnu2EWSSpWa3Epf1+vKcNS1hw1Wf7mArNXXd2J+NarEUqIR8QAUgIXktC8E+Ty5/br6kM9s5ZrXDGi4Yrfc5vEPX/UplMRRGuUmcBwCWYIbB7UzcRooyGagoV6+FNFv0+lM8hhOGvmiOLKMcb9vzNt9eyy5O8q3u4Lc+DEWQgb0HwXY/G8qijtRWiQ2HHNn3z74p/g3/N0tdbviVCTfMYUVTA94nVMw7uo8VgUdAuWcBqTpZE4jrISq2nC+t2N8ff6DJ0ac6jVwSdb6SAciFBwQGPL5QzaG4KhiFXq5I15wpjgzC1oSvmm7wkdoGpSbX8Lz3HbJQjTfXmdsSw1AsdLrkgl+iuLDvNBR0y7OUQgPstuyT00aCqkBlUMvdiukIDXAol5zBd7u/c6gW7aNGi8KQyaKe+WkD+HeyUEgDdKrdaCBUM25TibbUO3GV/XQA84xJAAi65vFOYe8Vt/NLUHwQxgMOLuCCzyMdu3QWfjTM5v92WFt2sVKNrFi5pTH9ueLldOFMtUhh8RwIiLAmGKfKiAaBbAb9/tRB2RYrkQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+pTkgDxa9yNKC3uwdIPNMgR5cn8CVSSaEvxU9FWBywWGbBejmi6R/yS+VlCm?=
 =?us-ascii?Q?cgnwRU4Ij5DKjvC2m0V8a/ZI1Geo+uuUgjjFyd+JPoMZo92fvNd8OQjY0f/F?=
 =?us-ascii?Q?T2DkKCUkhxSGJvGvMiybfKj94QT8jS3D8KKusiCHmgaCQvUYJfXYhtFG1u40?=
 =?us-ascii?Q?eVivn5JhnJCpNFuvlm1zBtk+/Wi3cBpKRSP2tctJciEKgYtuos0OiUbnFvYW?=
 =?us-ascii?Q?9Q9Frnk09DoPw+VAGl+KecQcPzyzwPWDnkye4xHkeM4b6P0hImoxvGppWdWz?=
 =?us-ascii?Q?qTcI3zcHqGzlF6Fa+Rja/yZsaw6CPEkQO62V0jfY6pzDnDPPvehVwLhisS9Q?=
 =?us-ascii?Q?Yxaj2Bs5QnxryCN4jRHChxK6BxTqhYek+lHrLWiEAdCAOOXaTb6gCKqs5sBR?=
 =?us-ascii?Q?1F712527uRDzxVGYr9N3M8fYP38obCti/a+3AScX6Hawcxi+vfqFSCk2oeaL?=
 =?us-ascii?Q?fqhhpo3d9Y+WaTY1diQ2LWdHrqQGgIhO+O6I2OjKdyqaE8Uvbw9QzZXWFlNS?=
 =?us-ascii?Q?02pTE/jXYQbS4vZ2yBRcsqcJkFIvwivNv98nvSjgluzWJDagZ9+bihOqQ80p?=
 =?us-ascii?Q?niY+soUU/oEpVtLK2jEdHt5GCHI0JllOQLlqC9ezkB31X8Gcec2NOltEjMRD?=
 =?us-ascii?Q?nHTwWF5v2boV1ocjZuet/rLcSPsmFe7wxBr81cDCMUcNK2GLEX7uEUrTWmL/?=
 =?us-ascii?Q?6HHS47/Ht1Qi+hovBSsDsspiROB5Orv1kbkwx0sndmZdsSZiRb4XKrw9RtBg?=
 =?us-ascii?Q?bYB9WUtzeXg+fDZEv/ZLZ/gXClKsauIIS2cD9+E/monHh0GlSwSCJtq8W8J/?=
 =?us-ascii?Q?ZCgjPj6xoBZV8Ho+lyeIApPAJ+rLLO0FWT2wVs5pxLlgusd9t+VUzpBvHDCY?=
 =?us-ascii?Q?H+a2ykydg9oGtDF+CR4o29oSfx2wjeFsvu2pr05LuCxZnOvEMDSYgCOYkbLj?=
 =?us-ascii?Q?XzcpMsABtyAaHaUUIQIoRElhELE/j7JMDXqe2+HmCM+CEsKH+IRCf8j3T5y2?=
 =?us-ascii?Q?qRmrYjmemwM10/iVba4UjwUwH+O8lUy5Uhb25p1PZmVFPC+GhFsDKbFqdf0m?=
 =?us-ascii?Q?onZEhKPsC3vGbvdpN+Iti8Ha11LA8QIIfO7Hdno2o2r9j95xO78lk8rkPHr2?=
 =?us-ascii?Q?KUzjoMg2KWZh1eWvfJ/NzjaZFVv+CaYxb79B03SoPsVl9s48PDgHcbhMrUy/?=
 =?us-ascii?Q?dT/3PNTTTslsS9FQTkSKf2uRRM9FYvrHcIXX48APUzMaC8fTeT3QlXT3iKyH?=
 =?us-ascii?Q?Z0Fv+ZCH4a/riNvekp/G86y+NnKfsZs7IJwBOdGJt+SEU8lEoUsF9Qcs28mt?=
 =?us-ascii?Q?DP7tYsjqnDWTQqScmnhlMONNWMTYWC/IJ4cs7c5UNntEzg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8e757666-9878-42a2-4700-08da84788cd5
X-MS-Exchange-CrossTenant-AuthSource: PR2PR09MB3100.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 19:57:35.6010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR09MB5522
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 19:57:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169681

which makes sure to set PYTHONNOUSERSITE to prevent
dynamically loading site packages from the host sided
package dirs.
In before when a module was using pluggy and/or
importlib_metadata the host sided path ~./local/... was still
part of the sys.path search tree and had priority over the
recipe-sysroot-native, leading to host/workspace contamination

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-devtools/python/python3/nativepython3 | 2 ++
 meta/recipes-devtools/python/python3_3.10.6.bb     | 9 ++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/nativepython3

diff --git a/meta/recipes-devtools/python/python3/nativepython3 b/meta/reci=
pes-devtools/python/python3/nativepython3
new file mode 100644
index 0000000000..0413e44e32
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/nativepython3
@@ -0,0 +1,2 @@
+#!/bin/sh
+PYTHONNOUSERSITE=3D1 python3 $@
\ No newline at end of file
diff --git a/meta/recipes-devtools/python/python3_3.10.6.bb b/meta/recipes-=
devtools/python/python3_3.10.6.bb
index f19cd50273..1121c17887 100644
--- a/meta/recipes-devtools/python/python3_3.10.6.bb
+++ b/meta/recipes-devtools/python/python3_3.10.6.bb
@@ -43,6 +43,7 @@ SRC_URI:append:class-native =3D " \
            file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sy=
s.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
+           file://nativepython3 \
            "
 SRC_URI[sha256sum] =3D "f795ff87d11d4b0c7c33bc8851b0c28648d8a4583aa2100a98=
c22b4326b6d3f3"
=20
@@ -153,11 +154,9 @@ do_install:append:class-native() {
         for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/=
${PN}`; do
                 sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
         done
-        # Add a symlink to the native Python so that scripts can just invo=
ke
-        # "nativepython" and get the right one without needing absolute pa=
ths
-        # (these often end up too long for the #! parser in the kernel as =
the
-        # buffer is 128 bytes long).
-        ln -s python3-native/python3 ${D}${bindir}/nativepython3
+        # Create a wrapper for python3 in native environment
+        # make sure that no host sided modules are inherited
+        install -m 755 ${WORKDIR}/nativepython3 ${D}${bindir}/nativepython=
3
=20
         # Remove the opt-1.pyc and opt-2.pyc files. There are over 3,000 o=
f them
         # and the overhead in each recipe-sysroot-native isn't worth it, p=
articularly
--=20
2.34.1


