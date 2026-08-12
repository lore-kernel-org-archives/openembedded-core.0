Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EB7C5B572
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 13:07:45 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7446.1786540058263143449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 06:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WuDZu7bh;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954dff6536so7279075e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 06:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786540056; x=1787144856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0pVk5kvn8odAI4W3ch6j3DkZWbkUsyrdVzPgeE/+l7Q=;
        b=WuDZu7bhq4+iG4v8R75CtrGEWpPRj9145QRfu0gEpAsZQMfqEC84tkmu1yO32sup4t
         cS55qnvnPCDAN9rYUnHYDTKJ4h1clTPKFIpm8SNGuHGBlZBUqVsREEnQZ/fDuGmEHuNl
         Ul3SPV4VoZqgQKy7ocfSUsCjUeAJUkvgfuCHkRtwYVpc1OwdIc5wCOI0WoCyLxibqicn
         S47saDA7sEvrnoYC6eaii3EloG1u2HqdNVBF7r1nZD3U7c7aB8SU7HuUMnX7BpFYseEE
         +FiOnicKM2cwhWhtN8HiAmaUMArWojmYK/JAQ+0NhM0LSho2NcCeUvG/2O9uCvgyEHZm
         YJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786540056; x=1787144856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pVk5kvn8odAI4W3ch6j3DkZWbkUsyrdVzPgeE/+l7Q=;
        b=pu1xU2OdqFhjZGL19p6+ZPeE7nijr4EUUSYCqAW+g9vXVKAbqzx0HjqFNXXSXxX5a6
         oSyrZppwk7i9i1gOgzUQX6DCkZ183xuTip3Tyal4AMpI3ESMIzde5krl3hIDEEkuj+9h
         QUOSyqzWO35NZI2xR23rjeqs7gS7qPssmFbTo6cyoAWgBISrgXNvUtt+cYCnQm//9PA9
         S+1So3q8j8Nmp5zq14DrosKC7/P88/qpuJXHJJLYNZuFMxmbo1npnTnXMkmdthZ72VyA
         wkjqL4klwj7SKrza61rsv/2+8BHomnxEmZw5xA47fhuU557bsX5QEZyojqjbvCLp9BDe
         D/2w==
X-Gm-Message-State: AOJu0YxLksL4erw24ZIDQYDppF1nET08cxshRtEHwYjkobKHifqZbgPo
	hYzUZO0sDWngNz0naL4BKxHKHDl7Bq+wurY7n9O3ZuPqVL39kVwC4VLttBZosahi
X-Gm-Gg: AR+sD11u+oSWWrLPX7fozZFzYkGdUYtJVWgckEShaZPUC09I8OGy0MD3CVw67euSM2C
	1nFGyZxR+LXr08l98t9r0qKtfVRin7PXT1/JZpjIVECbhInyVD7rGyRyaVsC8+iUdnLC9csa5KX
	Xpdeu5Q8C4mMi8GYstPO70Nd1/yzvbftUT1tzGUyyywHKbfUcApIlpOQ3mdk2aCmuctDrjlOZPm
	mxBohK3asfG0m8mZu1tD+Hb5QNgsiPlBYh3cMF6cJdA10QY6uOD6qyNJyX+wkSRBEVTMr6vsDHs
	9f/LtXLDqbGSspWh+LuoU/7qVThi5YQX36pAK3MzGJEGEs7prH1J6cFhMN83/0cEs1+mktHrkmL
	gRgj0ly0En6SPprFZC9nJywDfyVKrpZCCZrmASCoFrgz19oPOHe/JmBB3pY92k1Qq7YrhVliASd
	k6mJ9SonzaMAJ+o3/NEbFTvdEzqX9qfFVuJQbxgfM4qq5Pz7FZcKZaLBOjUwL4+mLWx7etfQbvL
	ma0uJlHe12E7760cw6TU+gP9lN6gT/Z97UF3a7gtBxQQhSrhEmKSUAlADYYSIFEetUvXHiz7KUk
	FnJn4GsSa5g=
X-Received: by 2002:a05:600c:35c1:b0:499:811b:dfed with SMTP id 5b1f17b1804b1-499811be003mr4603845e9.5.1786540056185;
        Wed, 12 Aug 2026 06:07:36 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:75b8:c973:c30e:1f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c9417bcsm65561005e9.4.2026.08.12.06.07.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Aug 2026 06:07:35 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Anis Bougrine <anis.bougrine10@gmail.com>,
	ross.burton@arm.com
Subject: [OE-core] [PATCH] kernel.bbclass: add strip process for signed kernel modules
Date: Wed, 12 Aug 2026 15:06:54 +0200
Message-ID: <20260812130655.15109-1-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 13:07:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243287

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
---
 meta/classes-recipe/kernel.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index a82bdf7ecb..0d8d370e9d 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -453,7 +453,21 @@ kernel_do_install() {
 	#
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${firmwaredir} modules_install
+		# If the module will be auto-signed, perform stripping before signing.
+		if grep -q '^CONFIG_MODULE_SIG=y$' .config && grep -q '^CONFIG_MODULE_SIG_ALL=y$' .config; then
+			oe_runmake \
+				INSTALL_MOD_STRIP="--strip-debug --remove-section=.comment --remove-section=.note --preserve-dates" \
+				DEPMOD=echo \
+				MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} \
+				INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware \
+				modules_install
+		else
+			oe_runmake \
+				DEPMOD=echo \
+				MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} \
+				INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware \
+				modules_install
+		fi
 		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
 		# Remove empty module directories to prevent QA issues
-- 
2.50.1 (Apple Git-155)


