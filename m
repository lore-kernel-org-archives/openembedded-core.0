Return-Path: <yocto@bsorensen.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9FCC4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 05:58:51 +0000 (UTC)
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com (mailrelay6-1.pub.mailoutpod2-cph3.one.com [46.30.211.181])
 by mx.groups.io with SMTP id smtpd.web10.6255.1713419926958827424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 22:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bsorensen.net header.s=rsa2 header.b=BQQ3MaPh;
 dkim=pass header.i=@bsorensen.net header.s=ed2 header.b=0emOGu3W;
 spf=none, err=permanent DNS error (domain: bsorensen.net, ip: 46.30.211.181, mailfrom: yocto@bsorensen.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bsorensen.net; s=rsa2;
	h=content-transfer-encoding:content-type:mime-version:message-id:date:subject:
	 cc:to:from:from;
	bh=Kl9+PxTXbLjRu9GxDkxdgGUWSahdYnECBy5jN+NDk0E=;
	b=BQQ3MaPhIS6N2C3oe8xeHRRuHqdhxFD5BSz9TM1lWNoPfdaDKf9kzux+3OZqaB4vtriN5GQDfsl12
	 TQjOkcwInbJPX+pwzyaP27R7JIcOHQCKMOEgPW5KuHQOkKLsfc/juKk5Ek/M3EiLl9cZASGP65m9M3
	 95ysn+zYZ+lxaoBT2+xupc861EWXMpIW5oBjSPIVvtp8Xdq5SV9vxbAGgiurMKMdrGYNO32nAnZ+bl
	 snQSOPEaUYWrl4Oh3FGu4q44I61hLCl2JsZTB6uXHIaJjvIGzgyNtQQ/gjVz3KQpJh5U/yZB2Gbn/i
	 KBE1qc5JAuxriVY1qvScl/V7Fw85HbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=bsorensen.net; s=ed2;
	h=content-transfer-encoding:content-type:mime-version:message-id:date:subject:
	 cc:to:from:from;
	bh=Kl9+PxTXbLjRu9GxDkxdgGUWSahdYnECBy5jN+NDk0E=;
	b=0emOGu3WuUu+CBiE/ISJhOVxqfHZKAYd1lM9/QGUQL58omMq8nqXFa//Ce7oXwwNjk3A5TLEIWqud
	 57xCmSwCQ==
X-HalOne-ID: b628b9f0-fd48-11ee-a366-f528319a6ef4
Received: from cbspc.prevas.se (unknown [81.216.59.226])
	by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id b628b9f0-fd48-11ee-a366-f528319a6ef4;
	Thu, 18 Apr 2024 05:58:44 +0000 (UTC)
From: yocto@bsorensen.net
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Christian=20Br=C3=A4uner=20S=C3=B8rensen?= <yocto@bsorensen.net>
Subject: [PATCH] systemd: sed ROOT_HOME only if sysusers PACKAGECONFIG is set
Date: Thu, 18 Apr 2024 07:58:43 +0200
Message-Id: <20240418055843.547573-1-yocto@bsorensen.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 05:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198500

From: Christian Bräuner Sørensen <yocto@bsorensen.net>

Fixes a bug introducted in ebafe46379 systemd: upgrade to 255.1.

Besides updating systemd, that commit also made other changes. One of them
being when to perform the replacement in order to fix ROOT_HOME.

Previously, that happened on a configure prefunc and on
${S}/sysusers.d/basic.conf.in.
Now it happens in install and on image/usr/lib/sysusers.d/basic.conf.

However, that file is not present if sysusers is not in PACKAGECONFIG,
since that file in that case is not installed hence resulting in:
sed: can't read <redactedpath>/image/usr/lib/sysusers.d/basic.conf: No such file or directory

Previously, in the case of sysusers not being in PACKAGECONFIG, that was a
"silent error" since the replacement was done but the file was not really
used since the file was not installed.

Signed-off-by: Christian Bräuner Sørensen <yocto@bsorensen.net>
---
 meta/recipes-core/systemd/systemd_255.4.bb | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-core/systemd/systemd_255.4.bb
index e7498c802d..f58a1bc2b6 100644
--- a/meta/recipes-core/systemd/systemd_255.4.bb
+++ b/meta/recipes-core/systemd/systemd_255.4.bb
@@ -271,14 +271,16 @@ WATCHDOG_TIMEOUT ??= "60"
 
 do_install() {
 	meson_do_install
-	# Change the root user's home directory in /lib/sysusers.d/basic.conf.
-	# This is done merely for backward compatibility with previous systemd recipes.
-	# systemd hardcodes root user's HOME to be "/root". Changing to use other values
-	# may have unexpected runtime behaviors.
-	if [ "${ROOT_HOME}" != "/root" ]; then
-		bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully supported by systemd"
-		sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/basic.conf
-	fi
+	if ${@bb.utils.contains('PACKAGECONFIG', 'sysusers', 'true', 'false', d)}; then
+            # Change the root user's home directory in /lib/sysusers.d/basic.conf.
+            # This is done merely for backward compatibility with previous systemd recipes.
+            # systemd hardcodes root user's HOME to be "/root". Changing to use other values
+            # may have unexpected runtime behaviors.
+            if [ "${ROOT_HOME}" != "/root" ]; then
+                    bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully supported by systemd"
+                    sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/basic.conf
+            fi
+        fi
 	install -d ${D}/${base_sbindir}
 	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'false', 'true', d)}; then
 		# Provided by a separate recipe
-- 
2.34.1


