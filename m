Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF35C4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 21:20:28 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.5772.1704921621942684461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 13:20:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm1 header.b=X8QUg6T6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-456497-2024011021200754ea92ecf9df671014-a6dhx2@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2024011021200754ea92ecf9df671014
        for <openembedded-core@lists.openembedded.org>;
        Wed, 10 Jan 2024 22:20:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=D77Vs0f4lgT/vYzTnKfgo9msNYgb7KuwvYL7ZOeoGmw=;
 b=X8QUg6T6p1PH04Hp2/kPzwJimEVwRv/dnh3JgGKcV9cL03N6g/guldjYloh/+SFCmcf5l9
 3veNNsVqC3KOmiR2X6oDFvR0ZJv+hUAheUlFTqGvHVOM0hNogDIoJAHeZHuOXaN1tsr27tFn
 q64JDF2o97s45l0ThMU575o8Sa7i8=;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [PATCH 1/2] linux-firmware: upgrade 20231030 -> 20231211
Date: Wed, 10 Jan 2024 22:19:56 +0100
Message-ID: <20240110212003.909270-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 21:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193530

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 ...nux-firmware_20231030.bb => linux-firmware_20231211.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231030.bb => linux-firmware_20231211.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
index b1f52479755..0ed4d91f8ab 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
@@ -151,7 +151,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "ceb5248746d24d165b603e71b288cf75"
+WHENCE_CHKSUM  = "3113c4ea08e5171555f3bf49eceb5b07"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -237,7 +237,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c98d200fc4a3120de1a594713ce34e135819dff23e883a4ed387863ba25679c7"
+SRC_URI[sha256sum] = "96af7e4b5eabd37869cdb3dcbb7ab36911106d39b76e799fa1caab16a9dbe8bb"
 
 inherit allarch
 
@@ -248,7 +248,8 @@ do_compile() {
 }
 
 do_install() {
-        oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' install
+        # install-nodedup avoids rdfind dependency
+        oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' install-nodedup
         cp GPL-2 LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
 }
 
-- 
2.43.0


