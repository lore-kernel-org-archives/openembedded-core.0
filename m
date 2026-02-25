Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB51F55453
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 03:37:48 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38311.1771990665996057270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 19:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hmig1FVl;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1771990664; x=1803526664;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+Hq+WAXzGLCYyBRrhqKfWAr0RaNkQmtpFulHyeb0txI=;
  b=hmig1FVlqBtTEmQ1g6HKTjGbIeUEkyAoixRqA4ylRzw9XPGWH53eCU75
   Y27ibbOBc1r4+s51JKPCIyyrpU5Y8i3AC9eXuVD8x+ov23OCkARG3GRna
   fIFv4m3KWYA1Irxreh16EyWdVg5ovKBHtptS+BGRIDz2rEbdZOxHp76wA
   Sg0OaYVmkWUDUWOTt9uiMfsp/am0OtXjClw/AoT6xi8E152PWKp1DJ0KR
   rRPNnBI2OYSukXyyh61G0hv8tdBQIQecyw+lbvYOcmRoOKrqAQQjBhGpX
   C3jDgDAjsdF87CdE75JR99muI5M9Xc5HZbLPZklRMbR8aZ0wYCgXAVeKv
   g==;
X-CSE-ConnectionGUID: Oe3RnnFjTNGduwUO4+G2+w==
X-CSE-MsgGUID: w9YBKRvjQ1eur7+c16r34Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="209758820"
X-IronPort-AV: E=Sophos;i="6.21,309,1763391600"; 
   d="scan'208";a="209758820"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 338281C000A8
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 03:37:44 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id DDE4A10003AA
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 03:37:43 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.167.241])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 8512A403B43
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 03:37:41 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] orc: Enable hotdoc to produce doc
Date: Wed, 25 Feb 2026 11:37:24 +0800
Message-ID: <20260225033725.708-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 03:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231924

Add do_install:append function to fix QA Issue like "File /usr/share/doc/orc/html/assets/js/search/hotdoc_fragments/orctarget.html-enum (unnamed at /work/x86-64-v3-poky-linux/orc/0.4.42/sources/orc-0.4.42/orc/orctarget.h:39:1).fragment in package orc-doc contains reference to TMPDIR [buildpaths]"

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-devtools/orc/orc_0.4.42.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/orc/orc_0.4.42.bb b/meta/recipes-devtools/orc/orc_0.4.42.bb
index f56b9058c2..b3f9555163 100644
--- a/meta/recipes-devtools/orc/orc_0.4.42.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.42.bb
@@ -9,6 +9,9 @@ SRC_URI[sha256sum] = "7ec912ab59af3cc97874c456a56a8ae1eec520c385ec447e8a102b2bd1
 
 inherit meson pkgconfig
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[hotdoc] = ",,hotdoc-native"
+
 # distinguish from apache:orc
 CVE_PRODUCT = "gstreamer:orc"
 
@@ -27,3 +30,13 @@ python populate_packages:prepend () {
 do_compile:prepend:class-native () {
     sed -i -e 's#/tmp#.#g' ${S}/orc/orccodemem.c
 }
+
+#Add this function to deal with QA Issue like File /usr/share/doc/orc/html/assets/js/search/hotdoc_fragments/orctarget.html-enum (unnamed at /work/x86-64-v3-poky-linux/orc/0.4.42/sources/orc-0.4.42/orc/orctarget.h:39:1).fragment in package orc-doc contains reference to TMPDIR [buildpaths]
+do_install:append:class-target () {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'hotdoc', 'true', 'false', d)}; then
+        rm -rf ${D}${docdir}/${PN}/html/assets/js/search/hotdoc_fragments/*unnamed*
+        for ss in $(find ${D}${docdir}/${PN}/html -type f); do
+            sed -i 's,${S},,g' "$ss"
+        done
+    fi
+}
-- 
2.43.0


