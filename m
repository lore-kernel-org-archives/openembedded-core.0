Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31AEAC433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 05:48:49 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.3267.1648532925985865766
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 22:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22T5mhuc016423
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 28 Mar 2022 22:48:43 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 22T5mgjC013431
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Mar 2022 22:48:43 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 28 Mar 2022 22:48:42 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 28 Mar 2022 22:48:41 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] graphviz: add pkg_postinst script
Date: Tue, 29 Mar 2022 13:48:38 +0800
Message-ID: <20220329054838.7210-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 05:48:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163732

From: Kai Kang <kai.kang@windriver.com>

It needs to run `dot -c` first before call 'dot' command, otherwise it
fails with:

| Format: "png" not recognized. No formats found.
| Perhaps "dot -c" needs to be run (with installer's privileges) to
  register the plugins?

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
v2:
* add guard to check qemu-usermode is supported

 .../graphviz/graphviz_2.50.0.bb               | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
index 0eca7fdba..66353b837 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
@@ -17,7 +17,7 @@ DEPENDS = " \
 DEPENDS:append:class-target = " ${BPN}-native"
 DEPENDS:append:class-nativesdk = " ${BPN}-native"
 
-inherit autotools-brokensep pkgconfig gettext
+inherit autotools-brokensep pkgconfig gettext qemu
 
 SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-releases/${PV}/${BP}.tar.xz \
            "
@@ -81,6 +81,23 @@ graphviz_sstate_postinst() {
 }
 SYSROOT_PREPROCESS_FUNCS:append:class-native = " graphviz_sstate_postinst"
 
+pkg_postinst:${PN} () {
+    if [ -n "$D" ]; then
+        if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
+            ${@qemu_run_binary(d, '$D', '${bindir}/dot')} -c
+        fi
+    else
+        dot -c
+    fi
+}
+
+pkg_postrm:${PN} () {
+    rm -f $D${libdir}/graphviz/config*
+    rmdir --ignore-fail-on-non-empty $D${libdir}/graphviz
+}
+
+PACKAGE_WRITE_DEPS += "qemu-native"
+
 PACKAGES =+ "${PN}-python ${PN}-perl ${PN}-demo"
 
 FILES:${PN}-python += "${libdir}/python*/site-packages/ ${libdir}/graphviz/python/"
-- 
2.17.1


