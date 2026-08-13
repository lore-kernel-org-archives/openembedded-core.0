Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BCCC5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 18:18:26 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25799.1786645100727232586
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 11:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cFp8/1jV;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b966dd74so1402585e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 11:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786645099; x=1787249899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQ2lyhRCjYFnGn5it0SJgA98UKYkpVpHLdXDZXeEK5c=;
        b=cFp8/1jVj9Qpc30Jzjco+HTJhmApDP/qFUQPs/C6J+/8ppIF73BrYU5EXy7JXmMc9F
         7bnXXZG0c68ttN81q3XL1wiTHYE4buaiicB1v0SIn18hl0zQnvdFiYOrFV9GWVYT8+YU
         o5K9yZyTWSO8HczcyyKJ08T7KuULfhxxzaI/sqd4F581HxuCrvqC7Ds8AByV6I+YI9sL
         ba4CPzVgvvenidsCwzISCWsH3dZjPbQUekq9EAwlj6kyf9p/PqCEJMN/CocjeXU2+iaF
         PVHG0a5D5bQfnfwE+0/MmVAk4JxGeojYBiLEf4fMXjUcLB9jcGRkY0s1xHWB3v9xq4cs
         qKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786645099; x=1787249899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQ2lyhRCjYFnGn5it0SJgA98UKYkpVpHLdXDZXeEK5c=;
        b=J2yNkM67sHJ0rzx1+dhPfVJy5qs5LTJTeUgVgSZ/okaRiwk3zjAvDNq1EtD3uz3IW1
         /FCSx32ntMWmafcyaf2wiMsf4is4Gc0fi0vlKYnd133ZI+/NI60neWeMoX/ipSEMK1Z7
         sJu9+79OfKzVo3NGJAnbRiYJ3UF1K6I8wAq7l0L+VOnGbunqooTr8HmVntuGcTTproUF
         VqNNBIqCa2aGxpnn6UHa1I2XoUKwvKthADVffsabeCv4xeolP4/Kb/Tls0y7WXoWHpX5
         fql/7HbBYYMEOJZLcIpb9xjpkBTNcPxNR+/P/2jfBwYhHZO8iNK0cfCu0/umFHIHE+/w
         G3pw==
X-Gm-Message-State: AOJu0Yyc2WXX5PJ31TsIW9W6JmfqMy3T/AoX5xllzNLUOxoNFJY9SZz4
	2sMyEUdXCAKvDb+MZIfA8cXGlckjMiG8K1I9T/35CrWRRU6RKf0mvSnNqmJAI/BIwCw=
X-Gm-Gg: AR+sD11zxXvL61HWzqCrK+fvJIYaHHcW/zEF7XgRjPLF1ZBWGlJgSG4AaSXF+bHKbp1
	7mqZ4DerJR1RU7GUlrPSrTUyDn/yfm5dlL8SidqIE7vPozFsuRFZW6VJw9w9z0MY5dNyyQyds1x
	AUr+iUTyKQ5JWhwFGP+LqnhoQdJxghGRrhRzobAdX/5Iy/IVX+cPKcWlDynrDuMCg36418Z5ML/
	5GgCxvNTa3yeVkQCgooZUwUdZajsPXtBym2kc07U0w6SirggJB0sgKJM9tZYTjXtkKvyVCGb2ji
	ILFnlq3FathPnaFKYAgqMu66Y+ezUxP+2+D1W1mddTOX4tY2VSVbF7aWBeHa4jNMIvbZaU+WnvR
	6khjMjhwXwzdqF6tAchFgVkvAgiTa/An7nvWeT7EJbgNNtciQ6CyTatFKeDCJAwwbPbALLKp1DK
	oM70MzAzoGJxanenGdewn5nOmOkff74PcyRf0TtYjcX84CPNR1R+9uIkiMR0uuKVIlJYYjlcxZx
	8mzXantFhUqMT/tnk0f4FYRT7sOjgOEO+aRExwzsEMzhp3i+N3FyO1yTJJpBpv7TgizUHlxA1hX
	Py18yiYPSlc=
X-Received: by 2002:a05:600c:4f52:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-4998793dafcmr5815065e9.7.1786645098748;
        Thu, 13 Aug 2026 11:18:18 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:75b8:c973:c30e:1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2b1fc2sm1142744f8f.20.2026.08.13.11.18.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 13 Aug 2026 11:18:18 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Anis Bougrine <anis.bougrine10@gmail.com>,
	ross.burton@arm.com,
	Antonin Godard <antonin.godard@bootlin.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [OE-core][PATCH v2] kernel.bbclass: add strip process for signed kernel modules
Date: Thu, 13 Aug 2026 20:17:19 +0200
Message-ID: <20260813181719.44168-1-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 18:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243378

Currently, signed kernel modules skip the stripping process in order
to preserve the file contents after signing. See commit:
4c47e5f171fa2603355e2f9183065ce8137a18c7

However, the kernel install Makefile supports stripping modules before
signing them. This allows signed modules to be stripped while preserving
a valid signature.

Make non-signed kernel modules follow the standard Yocto stripping flow,
while signed kernel modules use the kernel Makefile stripping flow.

Fixes [YOCTO #12927]

Reported-by: ross.burton@arm.com
Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
changes in v2:

- Use the conditional INSTALL_MOD_STRIP environment variable to avoid
  duplicating the oe_runmake call.
- Use `scripts/config` script instead of grepping .config file.
---
 meta/classes-recipe/kernel.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index a82bdf7ecb..dd6e203701 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -451,9 +451,13 @@ kernel_do_install() {
 	#
 	# First install the modules
 	#
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
+	unset CFLAGS CPPFLAGS CXXFLAGS INSTALL_MOD_STRIP LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${firmwaredir} modules_install
+		# If the module will be auto-signed, perform stripping before signing.
+		if [ "$(${S}/scripts/config --state MODULE_SIG)" = "y" ] && [ "$(${S}/scripts/config --state MODULE_SIG_ALL)" = "y" ]; then
+			export INSTALL_MOD_STRIP="--strip-debug --remove-section=.comment --remove-section=.note --preserve-dates"
+		fi
+		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
 		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
 		# Remove empty module directories to prevent QA issues
-- 
2.50.1 (Apple Git-155)


