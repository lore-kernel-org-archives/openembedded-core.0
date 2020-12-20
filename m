Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.22924.1608466606247410881
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 04:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WqfCq2dm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id q75so7980263wme.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 04:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=soGB8331EZ1ktTwwTKp+9HGbWhOVPZzCcRTcE81DGT0=;
        b=WqfCq2dmibaYHyf+akGsJSmp8myvyEMZjprIFK2qVzOEpEc5y+WpweOio7w7MSjwRh
         P/EZJ7H55cmDjFanHmxtFdLhM6SwiXxTkW3SOInfAzTab1boEimlJo/iiTBcusudRnBI
         UcwIuMTL1PsukiHeDaiiHkNLxQYKnEUHMnGyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=soGB8331EZ1ktTwwTKp+9HGbWhOVPZzCcRTcE81DGT0=;
        b=LHUkQnqaojrc/vSYHHVrCXwGXMc7vitcHuzf/pgF4tnrLPy8GcukPhlJGbZY35JmvD
         sCqjQ3OvIIvayAYCjXiNgMXXq3h/PN1nJlsaNP1GLAC3C6Mk2r7eMBlr5E2Lrj6x57VH
         24mpnUFJsx4dQscTrMrGl2a0shsVAz8zfiCeXdoNVWbx2NYdvDaIme31lczUW1sFFmPn
         AEPcv7njRt1eJkdrRxzMy5eHPEdzAOjW9SmITAUWawiNKWgVhzEqUTPjHaif3Pegsdaw
         2yMyIeWTS8d6o4HrykQgnc+Q14L0spFuW4dLWAAHH/3pcd06MBFE5BnBA6NY98ylAoVk
         z+rQ==
X-Gm-Message-State: AOAM532bHeea+lLX8qJzf1jnTIHUKmSnAX5+25nXW7X4EVBSUotm/giy
	a9umNTCPAFnsFaDrKoZ3zt1WRNrgmiercw==
X-Google-Smtp-Source: ABdhPJyNvHLDEq7zFndevlvivx3FKh3st+XjSaJMLUhNVml28y2HOqw5kchx3md37qQF6A36ZOQ4dA==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr5592713wmj.148.1608466604402;
        Sun, 20 Dec 2020 04:16:44 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (6.6.5.9.1.e.9.f.7.4.3.6.0.6.1.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:e160:6347:f9e1:9566])
        by smtp.gmail.com with ESMTPSA id q1sm21305123wrj.8.2020.12.20.04.16.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 04:16:43 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] u-boot-tools: Fix reproducibility issue
Date: Sun, 20 Dec 2020 12:16:43 +0000
Message-Id: <20201220121643.9496-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If you build on a system with git < 2.14 from scratch (e.g. debian9), the
tree will be marked as "dirty" and the version will include "-dirty", leading
to a reproducibility problem. The issue is the inode count for Licnses/README
changing due to do_populate_lic hardlinking a copy of the file. We avoid
this by ensuring the index is updated with a "git diff" before the
u-boot machinery tries to determine the version.

build$ ../git/scripts/setlocalversion ../git
""
build$ ln ../git/
build$ ln ../git/README ../foo
build$ ../git/scripts/setlocalversion ../git
""-dirty

(i.e. creating a hardlink dirties the index)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/u-boot/u-boot-tools.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/u-boot/u-boot-tools.inc
index 8ae290acc61..4ed936a70d3 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -23,6 +23,21 @@ SED_CONFIG_EFI_armeb = ''
 SED_CONFIG_EFI_aarch64 = ''
 
 do_compile () {
+	# Yes, this is crazy. If you build on a system with git < 2.14 from scratch, the tree will
+	# be marked as "dirty" and the version will include "-dirty", leading to a reproducibility problem.
+	# The issue is the inode count for Licnses/README changing due to do_populate_lic hardlinking a
+	# copy of the file. We avoid this by ensuring the index is updated with a "git diff" before the
+	# u-boot machinery tries to determine the version.
+	#
+	# build$ ../git/scripts/setlocalversion ../git
+	# ""
+	# build$ ln ../git/
+	# build$ ln ../git/README ../foo
+	# build$ ../git/scripts/setlocalversion ../git
+	# ""-dirty
+	# (i.e. creating a hardlink dirties the index)
+	cd ${S}; git diff; cd ${B}
+
 	oe_runmake -C ${S} sandbox_defconfig O=${B}
 
 	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
-- 
2.25.1

