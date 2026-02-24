Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8ECEFB7F4
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 03:51:37 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12869.1771905088607667640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 19:51:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S/WYfgF9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1771905088; x=1803441088;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WN5Sa9x4BMcX4aAHOPfgymEHRhd/7M1dR86qGDkt3eQ=;
  b=S/WYfgF9BKFEwIaqwDqcQa1S1DQlNbGh92kLd+OrTHzkqBNy8y4f7s5p
   LiqlSg9nZ1iFZy/MTIOAGIRd2oWar5aivI1fAMn97/LQ0DH/hHI1IFybR
   YVFrLIK7xXwOVzKn0U6/yT1WRTd0hQg5ZOf7SLVYUBuDjkAW0tHyjjCqP
   Jna3/Hjh5bRpAM8JvUAcwCVkPh1AzKXBBmaguyvSXkVHq9hP1hLbSSEnf
   v+cKuLYann6iKxao8bMy8pUaMiLITlINB/QlK4sqyvtLwukwn7ZxYqRPk
   784jz1GFYIpNEfj6YkvdZAXgw+MqrVbqe/doagYcZqRQox9YEHnB16zKb
   Q==;
X-CSE-ConnectionGUID: npG6r8iCRJSSezEDPgeujg==
X-CSE-MsgGUID: ClPcv3g4Tkqy4uzkeNfFEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="230646522"
X-IronPort-AV: E=Sophos;i="6.21,307,1763391600"; 
   d="scan'208";a="230646522"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id 9C48242A33E
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 03:51:26 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4362A18002FB
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 03:51:26 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 153761000391
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 03:51:23 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] orc: Enable hotdoc to produce doc
Date: Tue, 24 Feb 2026 11:51:19 +0800
Message-ID: <20260224035119.1597-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 03:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231739

Add do_install:append function to fix QA Issue like "File /usr/share/doc/orc/html/assets/js/search/hotdoc_fragments/orctarget.html-enum (unnamed at /work/x86-64-v3-poky-linux/orc/0.4.42/sources/orc-0.4.42/orc/orctarget.h:39:1).fragment in package orc-doc contains reference to TMPDIR [buildpaths]"

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-devtools/orc/orc_0.4.42.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-devtools/orc/orc_0.4.42.bb b/meta/recipes-devtools/orc/orc_0.4.42.bb
index f56b9058c2..02f431dc0f 100644
--- a/meta/recipes-devtools/orc/orc_0.4.42.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.42.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "7ec912ab59af3cc97874c456a56a8ae1eec520c385ec447e8a102b2bd1
 
 inherit meson pkgconfig
 
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'hotdoc-native', '', d)}"
+
 # distinguish from apache:orc
 CVE_PRODUCT = "gstreamer:orc"
 
@@ -27,3 +29,13 @@ python populate_packages:prepend () {
 do_compile:prepend:class-native () {
     sed -i -e 's#/tmp#.#g' ${S}/orc/orccodemem.c
 }
+
+#Add this function to deal with QA Issue like File /usr/share/doc/orc/html/assets/js/search/hotdoc_fragments/orctarget.html-enum (unnamed at /work/x86-64-v3-poky-linux/orc/0.4.42/sources/orc-0.4.42/orc/orctarget.h:39:1).fragment in package orc-doc contains reference to TMPDIR [buildpaths]
+do_install:append:class-target () {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'true', 'false', d)}; then
+        rm -rf ${D}${docdir}/${PN}/html/assets/js/search/hotdoc_fragments/*unnamed*
+        for ss in $(find ${D}${docdir}/${PN}/html -type f); do
+            sed -i 's,${S},,g' "$ss"
+        done
+    fi
+}
-- 
2.43.0


