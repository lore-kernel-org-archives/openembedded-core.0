Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FA3C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 14:07:45 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.32962.1635170838550550797
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 07:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Iwn/vrI6;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635170839;
  x=1666706839;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ExWPVhDzSos+o7KQgbplNM3x+iSLIbiNjECpLns9NKM=;
  b=Iwn/vrI69kCC+kVXZbrbfBeBFCNopQekM0Ct40FmjXRwhQ0cwhXtFRRn
   y7d7CcKD3rXflkpLddF8IuTvDUs0knafvMx8IzxeKk6fhQSFzqzKJQ12W
   6zD9es72Iqo/NAnkW6DwJvUqi8Yx1KQt91SlrG/twPGQTid8w6Ox7azpX
   wGb5bTMZZtvdNpqG7X77Admt28pJl25IoP8Ykp4gbffd1IVc/MGj83MbN
   qZVAItvatvKKV6vHP/1qfMq/eM5FaGBxg4HGH+mw6s/E4o3insSu8seeL
   VhNJvEYjH2FT1Q9XliCvAQaYkQJdlCEyVxVHol3wZhG+RK2vP2XHBsFr+
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 2/2] qemu.inc: Remove empty egg-info directories before
 running meson
Date: Mon, 25 Oct 2021 16:07:14 +0200
Message-ID: <20211025140714.1784-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211025140714.1784-1-pkj@axis.com>
References: <20211025140714.1784-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 14:07:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157341

This is the same solution that has been applied to meson.bbclass to
allow building with meson after it has been updated to a new
version. It needs to be applied here as well since qemu uses meson
without inheriting meson.bbclass.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 57e5e1a015..33052a9d49 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -9,7 +9,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 RDEPENDS:${PN}-ptest = "bash"
 
 require qemu-targets.inc
-inherit pkgconfig ptest
+inherit pkgconfig ptest python3-dir
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=8c5efda6cf1e1b03dcfd0e6c0d271c7f"
@@ -111,7 +111,11 @@ do_configure:prepend:class-native() {
 }
 
 do_configure() {
-    ${S}/configure ${EXTRA_OECONF}
+	# This is taken from meson.bbclass to avoid errors when updating to a
+	# new version of meson.
+	rmdir ${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/site-packages/*.egg-info 2>/dev/null || :
+
+	${S}/configure ${EXTRA_OECONF}
 }
 do_configure[cleandirs] += "${B}"
 

