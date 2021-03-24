Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.211.1616596794671826470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=x3Ct+N06;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id g10so8041455plt.8
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NQADL2BX3VbHd5HkpzjBs86on2xLkA/5TOopFvjXlfQ=;
        b=x3Ct+N06WXVoS/cVaV0nm9DIiSinzahT2ncXPnntOvU6ovihc3/Uw1yFyMVmbWmEXo
         GBD8RZozP2JcWKORB93n+kMwmDWQTgOsnmll6KrxAJwktLSR1BX9htL2F4jKYNUpRajv
         RZLLiVrIgidhEwtU5vepl7BXSPnjUUQeeT7NAtI/6PEGkTQ0GJoNrVJtM/jkKJhVYTdC
         d0l73Vimb7O8+Q9x/T886Jg9wCri3SeWoniyehWhDZNSiaIkKqLKjvH7PMDmn40RZSRZ
         nm4HemeHw2wztU1wMVZLu/4IPod7oGDYCv3tLwgKjw3W1DLfZfpfj0+sKuqWU8gkOkKe
         i2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NQADL2BX3VbHd5HkpzjBs86on2xLkA/5TOopFvjXlfQ=;
        b=JnRNpAG3uRnAUUz7DYENzoK0TyOgvaG+L2D7h5iP4EUOCrrxjU3+3Y+Y5QLbrWuSzU
         9zbcGwGLOD10RnvP0Zp4k1SrOv4yOBiqEr7yFwt/v/JGR20CZx7ZkB0++rE92P1amOfL
         Xmr2uG/x5uN9580m35fTe2iE0Syz32CJMnTQp6CBsUWBS+PzWxE2P4px9Mp9AHHsjJH+
         qRUB08VzYUO/bVz1Fdp/4IRdKKQ6147ts38qAUQmaS29+nFDG7dwAwAUL/GaCFz7p3y0
         7eLAgIqsgAeZPlVazsxv2gEnm2BIaVsVMhArmw/JYcj7r3UezIBpzeXxcMXwa2JPup+6
         OUaA==
X-Gm-Message-State: AOAM530PJr9wNUtY3PaxudRTe25fO19pVQYUt8nzo1IkkdGHIJWpHlcH
	yirZYYfvjEbmMAJt2i4odGCESTa7yqfo6ZYe
X-Google-Smtp-Source: ABdhPJxeK1onBbwcb8gA7gN3H21wjzORimUVOV5fQFruHqawvpNwzNdbzQYI0HGJyXa5tJCtCcUkeA==
X-Received: by 2002:a17:90a:fd89:: with SMTP id cx9mr3742086pjb.93.1616596793790;
        Wed, 24 Mar 2021 07:39:53 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.39.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:39:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/21] systemd-conf: do not ask for DHCP if configured on kernel command line
Date: Wed, 24 Mar 2021 04:39:03 -1000
Message-Id: <c88bb3db92d0650a560d7cbc1f0f42ae8faf15e1.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Schmidt <stefan.schmidt@huawei.com>

In cases where we configure the IP address and more on the kernel
command line with ip= we should not ask for DHCP with systemd-networkd
later on. We have such a setup with our runqemu script.

With this match in place we can also deploy this unit on qemu systems.

Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8c4981e740c0e630200dbc77c9e3dfd3e43b790b)
---
 meta/recipes-core/systemd/systemd-conf/wired.network | 1 +
 meta/recipes-core/systemd/systemd-conf_244.3.bb      | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-conf/wired.network b/meta/recipes-core/systemd/systemd-conf/wired.network
index ff807ba31f..34c20fcb24 100644
--- a/meta/recipes-core/systemd/systemd-conf/wired.network
+++ b/meta/recipes-core/systemd/systemd-conf/wired.network
@@ -1,6 +1,7 @@
 [Match]
 Name=en* eth*
 KernelCommandLine=!nfsroot
+KernelCommandLine=!ip
 
 [Network]
 DHCP=yes
diff --git a/meta/recipes-core/systemd/systemd-conf_244.3.bb b/meta/recipes-core/systemd/systemd-conf_244.3.bb
index d9ec023bfd..9b797a91f4 100644
--- a/meta/recipes-core/systemd/systemd-conf_244.3.bb
+++ b/meta/recipes-core/systemd/systemd-conf_244.3.bb
@@ -23,9 +23,6 @@ do_install() {
 # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
 do_install_append_qemuall() {
 	install -D -m0644 ${WORKDIR}/system.conf-qemuall ${D}${systemd_unitdir}/system.conf.d/01-${PN}.conf
-
-	# Do not install wired.network for qemu bsps
-	rm -rf ${D}${systemd_unitdir}/network
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.25.1

