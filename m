Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CEEC624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:01:57 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11940.1788354113224983190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 06:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XFudQRta;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482fc2b44a7so1064009f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788354111; x=1788958911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E6jjaNEIMi8zK8H/ri1lRuG14qFF9ZLYGQR8CO7nIKM=;
        b=XFudQRtaSrRbBIOpB/QLS/0aMeg4FYzEH07jachUyLFKfGscxYICMvw8hu5AAHNH0D
         HyiQ3sQ7wa7UQLrEuvwkl2pvc+nw4wlr39m1on7dEzzPJMa6VRkaae8Bw1b6IBpRO11u
         kfjw6+BQeT7fEiQi29ILfXRHkmNiRrlfgK5Lz3d++AjPRsy8Zl6XT+ZPNkF889ChzAIp
         F8s+lOS0WXkNh1nncSEkaxgJfMf2xUy/vF53AVm2hWH3uu1VOl2aSE+uc5V8oH0nptxd
         P/lHOwr+Ee6xLChAfrlIR7ANDVpNvIi4OunuhEj//WUxov9MPRg59+Yp7qfdSxCxlGUv
         EOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354111; x=1788958911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6jjaNEIMi8zK8H/ri1lRuG14qFF9ZLYGQR8CO7nIKM=;
        b=YSyCaZgN5JgBlADTejV/mGvzhnNw9zC75te0bi/LimD5vgbENuuabR+ElezM0ebnlU
         CJKtrs+Ua9ayzuQzG8o++PYI+svuDoiG28AdCI2sDovTYE81hbDAfqVIWlA298Eb3dBU
         Z/S1JdUmL8nsdmczVhrCll965SJ9yxspx2CINy2HsJrDccZDOpCZFmOydteXqkgnOaiC
         n8DHE7/3jArOvfzLmYq6j2/xvSDYScKkGZ5O74f23mOok0E+owHCJJeb3bNM1vrWk2rB
         1oKooK7r5EHeoMnlVhZ5jwRROrmmODtXq5zE6Jd/Lidxb/lpzrCQf/dJJT95OR2dP5V3
         eiqA==
X-Gm-Message-State: AFuF++kJdVMZDapoWpmk8yejskD7MzV4aGBn28ow4Oy35Efo4RFWAQnA
	JvJr6HU5eERmHXisUsEwbDrTC3SnIGQMMzZT9sVvyo8u2ofxg0f/KcQ8uZzzNg==
X-Gm-Gg: AR+sD10/g4Fo/CxAZ3JGpLXo/snsympDHjsUh88YQBgyRuYW0Z+zOXLHsQNOyMsaauE
	KDEAd4cNbarSeAusKyOnTpYZ/TxsWEKp+KXonSQCyjSOMqGtZqg35NvugIL4RAVRj0yzJPZxW1T
	hq5OKoy62dtgIgpltHHODJm4e4DgNR4BlM5FsruRSL8oxDw9xm+T06jA1rDZfbqEqxLrLo/eu4v
	QHp61R5vudvN8vzcHcXV5kZfy6mCQNx/APaRkNg4zRb7sH0Rq8aqdZciSpMwf4fJ/yQIirmAbF1
	XYsUV/TYfE8OYUYtHSbD/A347MmUyg/PnYCSsxNYq3JjkBsxkgqBbzybQdYSyy/HRsc64lHKy/1
	mUO2e+lTKnzXbdb8Gi00R3x+DDA8JFRd/n/U2CASbz7fcYFsZ3EYTbnCXuxHklWiZJ+GFWIhfCk
	kw9bL86T4EFNjNnZN4ryLtRm9GEuRBlXukB23rHmEszfrNydLmhip0+ACLvtwDRYsnBZIG2fHZf
	Oafqg1luQwmIlmoZWc7LXWNLg5e5wYqoRO/jSkcMQBEbK3+
X-Received: by 2002:a05:600c:a086:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49ce5815dddmr93340895e9.11.1788354107234;
        Wed, 02 Sep 2026 06:01:47 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm110414355e9.0.2026.09.02.06.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:01:46 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH] wpa-supplicant: Split .config generation into its own function
Date: Wed,  2 Sep 2026 14:01:32 +0100
Message-ID: <20260902130131.2001728-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 13:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244947

Adding entries to wpa_supplicant's .config which aren't covered by a
PACKAGECONFIG currently means overriding the whole of do_configure from a
bbappend, as the config generation is embedded in it.

Move the .config generation into a standalone wpa_supplicant_write_config
function which do_configure calls, so a bbappend can extend it, or replace it
entirely, without having to replicate the rest of do_configure.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../wpa-supplicant/wpa-supplicant_2.12.bb                | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb
index df0585f1f3c4..516699df46d4 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb
@@ -34,8 +34,7 @@ CVE_STATUS[CVE-2024-5290] = "not-applicable-platform: this only affects Ubuntu a
 
 EXTRA_OEMAKE = "'LIBDIR=${libdir}' 'INCDIR=${includedir}' 'BINDIR=${sbindir}'"
 
-do_configure () {
-	${MAKE} -C wpa_supplicant clean
+wpa_supplicant_write_config () {
 	sed -e '/^CONFIG_TLS=/d' <wpa_supplicant/defconfig >wpa_supplicant/.config
 
 	if ${@ bb.utils.contains('PACKAGECONFIG', 'openssl', 'true', 'false', d) }; then
@@ -60,6 +59,12 @@ do_configure () {
 	if ${@ bb.utils.contains('PACKAGECONFIG', 'mbo', 'true', 'false', d) }; then
 		echo 'CONFIG_MBO=y' >>wpa_supplicant/.config
 	fi
+}
+
+do_configure () {
+	${MAKE} -C wpa_supplicant clean
+
+	wpa_supplicant_write_config
 
 	# For rebuild
 	rm -f wpa_supplicant/*.d wpa_supplicant/dbus/*.d

