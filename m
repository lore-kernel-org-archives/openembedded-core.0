Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 58B3A7F438
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 12:50:08 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id t16so6856220wra.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ifKGosAFmXsYdnUiPA+nWRPrUGq6cEjINAAeqUO+nAY=;
	b=TklPNgb22V6Mgr7plvo0lcYKIhTxUOz+0BT1MGLdisasGeXZv2BUdi+/6tP8iJvMqP
	bVrfFeI4l48kAuUq+OpzurOQ4w+7ajY9B7hcHin2EQOS3VUTZkgrFNnWB+RM8K012jQf
	zgsr9TT3yaczmTothHTKxQTXapheB1T4ZZOYu/Ivcns6Y8W4Vf+ZkzkUfNJh86qryMLh
	H4ieC06lB+2k8bZtKRCPaOgcvEC2jZAZR/JeLajLsQu4ounVeO53HTXXUNYKTZ9wsH/n
	/TPfaagy7nAC5ae8hUBQkyxKME0v4xHmiUZWTYjs85yJxoMPvHv8bzxEy1qcshoWlpmT
	On6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ifKGosAFmXsYdnUiPA+nWRPrUGq6cEjINAAeqUO+nAY=;
	b=Ly4Zf6evq+koPpW+7acCMe+uadKrnujx9B8xS2IMZH3vtU5pOKAvGVNRlkEX9yu4To
	aJ8heuc1cUH2WWnGGWAyRbpeaEXxTXqw83DPZ5SGPHH7bgPQxk+cELGZJWkXj4U3G8Lz
	0OqsQDM3JcSfeCr0H65uhPFvJ10JpFTX8dWuuC/gW1OJENouEiyDEEKoW8uBRbApTNlI
	k7A5MzljXYeiXOFo8gFaeRrsc9boUvWU11gj5/Pe0f4vFfLNnKx12hzBYklqTSahmQrg
	mHmYk3rxkn3uTywXRVDKLGpF2JUDUJv9Y6b3jrtMSAVFiVmcyq3Icm/KO3yXheRr05bs
	Ak/A==
X-Gm-Message-State: APjAAAU1VCGQYBgOFIXYebuEeoXLY+0U894r42Q4cJYxwY9ooU9hUkgR
	r3qtROTE8DLJdGpme9E+5f9imSUL
X-Google-Smtp-Source: APXvYqx5+mRR8BmiMbs+DQ9+arnH5wbPQAJQa6Hh+l49NtVoXdUTjKk/zQxoKK5wl3XXm2kngOTmrQ==
X-Received: by 2002:a5d:4b0e:: with SMTP id v14mr18924974wrq.24.1567169408885; 
	Fri, 30 Aug 2019 05:50:08 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id d1sm6307481wrs.71.2019.08.30.05.50.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 05:50:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 14:49:49 +0200
Message-Id: <02fcbc96a0067324ee51d454811aef6ff77e1788.1567169002.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567169002.git.alex.kanavin@gmail.com>
References: <cover.1567169002.git.alex.kanavin@gmail.com>
Subject: [PATCH 04/13] mesa: disable gallium swrast driver on x86 x32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Aug 2019 12:50:08 -0000

It was found to crash the X server on startup under qemu.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/machine/qemux86-64.conf   | 5 ++++-
 meta/recipes-graphics/mesa/mesa.inc | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 7c70dbddf52..648cf2fe8f6 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -18,8 +18,11 @@ KERNEL_IMAGETYPE = "bzImage"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
+# Install swrast and glx if opengl is in DISTRO_FEATURES and x32 is not in use.
+# This is because gallium swrast driver was found to crash X server on startup in qemu x32.
 XSERVER = "xserver-xorg \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', \
+           bb.utils.contains('TUNE_FEATURES', 'mx32', '', 'mesa-driver-swrast xserver-xorg-extension-glx', d), '', d)} \
            xf86-video-cirrus \
            xf86-video-fbdev \
            xf86-video-vmware \
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index fcd19884f54..8040d78992b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -98,6 +98,9 @@ PACKAGECONFIG[vc4] = ""
 PACKAGECONFIG[v3d] = ""
 
 GALLIUMDRIVERS = "swrast"
+# gallium swrast was found to crash Xorg on startup in x32 qemu
+GALLIUMDRIVERS_x86-x32 = ""
+
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
-- 
2.17.1


