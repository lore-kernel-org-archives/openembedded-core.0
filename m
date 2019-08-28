Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 86ECC7EE97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 15:24:49 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id y19so245465wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ifKGosAFmXsYdnUiPA+nWRPrUGq6cEjINAAeqUO+nAY=;
	b=c0TGmCBnpe6qpA53FuvEhqYdq6uRlPbzcfySxlVVCTpIFGDkzj5VmV7m/4ovYEOFM+
	9FrAvkUkkhjUX/mDHy8JYnsHAtWT1QgdMME9eRxBso56pXnzVZjWV1mpl3dg32xdw6C9
	73xyL23ikJr0jPavgsZBDxiyFeBjSo+RrTxmQt0ysl+nxmH1DI+zuI1/IoyjXCgQkXen
	t+vkkTQXzEGpk9g4nXbZqaj8+vGHn4G1xq2Ht5b6yexOhkoxYLKuJTntXG4hPi1m4SLt
	8UD4LHAheP6/EPl4TlxdRle3tSCdA1nosUQ/gsSkz/KLv43gnSUTMeDHL0lGbbG9GslM
	xCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ifKGosAFmXsYdnUiPA+nWRPrUGq6cEjINAAeqUO+nAY=;
	b=pqkSdyGxLrNpVZ+g8gvHMvSFJesTHBvwwxooJLarwI8W01TeZ+vMsFsD/fagSiV5DD
	InN8Byq8iZ9ZCtIuJnrNctjys/GEOoDNsyKJ+G8kgGbhKooh7vCV66a5A/nugecxR9bK
	BK/AmH/3hAHTquBiLF8c5R5Yw0M0iEbcNcpkK58yFk2+K3zzMtUKa/XFB6sqP2+Wc5ZV
	gPTLaqY9eFPjlZpYiJg6zJSQKfPDHdieeFXu0LAjWFb9Aaps2HDR1gx6MfXcRX197eT7
	I3AZInQ99vMJ9eB91SqhHHHB571nkrMbd0g8+79+MfghQEtLbDDiNLp4DkpSwd0aLd9z
	P54Q==
X-Gm-Message-State: APjAAAUwvJVVK8u74+pA8cLnGajORKIGHHJaMgnmyCONIAKTZbQtaY1/
	OVl8x0HgXJNM26peu6CaIv1S6suR
X-Google-Smtp-Source: APXvYqztOvT6GR6urhzgcg5e6zHjXVLJ9ei+TaQElXDmO8t+1DWqwGjDPXYxwAe28OddjC9aR/mnuA==
X-Received: by 2002:adf:d1a4:: with SMTP id w4mr5126161wrc.331.1567005889820; 
	Wed, 28 Aug 2019 08:24:49 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id w5sm2207074wmm.43.2019.08.28.08.24.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 08:24:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2019 17:24:40 +0200
Message-Id: <20190828152440.70861-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828152440.70861-1-alex.kanavin@gmail.com>
References: <20190828152440.70861-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/4] mesa: disable gallium swrast driver on x86 x32
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
X-List-Received-Date: Wed, 28 Aug 2019 15:24:50 -0000

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


