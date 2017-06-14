Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5AA0F782DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 10:33:55 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id l6so44636453iti.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 03:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h6CuyQS9vhnoNmc1h5sxpYYRBY1NdBbBHa8eiYqFMtQ=;
	b=X+GLyvZVx/ves9WrYNyfnxLsTmWT35KxKQ2fbS3li5CsUAvNFj3Lx28nG/2u4UIItS
	0Qix3sRBqvU7SOGZt91dV/FPC/CgyzFw8SQtUhW5fIaJUBjuK6WFMRIR8EPAW/FXsGpm
	lOu1zFGPdPCOwOfEZdttmuD6iVEthDjRS769F7Xsur5LQcEgb3H9OVrSyH+Akw1BpkVE
	RtBh58aA3hSM10EBIGhntjxOCqaezCGjWxzm7XNvEmd+as2GabeRe0FmLF1AFW1aDX9D
	bovSe3koTmOLEw/ixG71as2PjdKKIg8NBMb/1Z3bac7bRSxgQBk+ed4VrX2eakKplYSB
	oqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h6CuyQS9vhnoNmc1h5sxpYYRBY1NdBbBHa8eiYqFMtQ=;
	b=UyMN6zFFz3bMbdtMd2tIgqfgEjBWJeS97vPN96WCJeZChY8EPLaUMmiR3yNFZ7k8rM
	7hEfNFuUGHErnzzGXkgCu3X0NGSEeuLVcXjmvdu1ilTaeKYuycHEE9KWl25FWZ7jPbCW
	yFg3uCrm3Pmrz1Q69YrWGEJ13QP3dodIwXg6/dGGpaJ7r8fryL4rpKyeyxjJMsd4ZZlk
	GNzhRkjzjbREmc6mUcjgBLRq2rie9bjeMkQ3AxD8eNqHitDfh4sS5SW6AbvpHDVBM2jK
	Dw7Ry6OyT/UHlIPw09Fs4cASeRJ61pAuOyQxRPYWkSrqKEKz2tiTu7dbfNembtukdZFV
	PS0A==
X-Gm-Message-State: AKS2vOxmW/VLwm7Emtsr1HR78DIBpfwUKwnpDz4n6h6VWXb2dwghpLjk
	4p219ZmfHTThMnfdwak=
X-Received: by 10.36.80.14 with SMTP id m14mr15973131itb.31.1497436437039;
	Wed, 14 Jun 2017 03:33:57 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E312.dip0.t-ipconnect.de.
	[93.232.227.18])
	by smtp.gmail.com with ESMTPSA id j62sm175673iod.29.2017.06.14.03.33.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Jun 2017 03:33:55 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 12:33:49 +0200
Message-Id: <3389cda98c8b515e1f9b1e87457042274e88689b.1497436409.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <1497436322.30163.375.camel@intel.com>
References: <1497436322.30163.375.camel@intel.com>
Subject: [PATCH 1/2] Revert "bitbake.conf: DISTRO_FEATURES as overrides"
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
X-List-Received-Date: Wed, 14 Jun 2017 10:33:56 -0000

This reverts commit 3b3ae91a22d6f685e804df4f32cdeebe1bd6bd88.

It turned out that the code which expands DISTRO_FEATURES early during
base config parsing can fail because some entries in DISTRO_FEATURES
might call Python functions like base_conditional() from base.bbclass
which aren't defined yet.

A different solution will be needed.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/conf/bitbake.conf | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5d5ddec..80baec8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -713,28 +713,13 @@ DISTRO_NAME ??= "OpenEmbedded"
 #
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
-OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}${DISTROFEATURESOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
+OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
 CLASSOVERRIDE ?= "class-target"
 DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
 MACHINEOVERRIDES ?= "${MACHINE}"
 
 FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}"
 
-# Turns certain DISTRO_FEATURES into overrides of the same name
-# or (optionally) some other name. Ensures that these special
-# distro features remain set also for native and nativesdk
-# recipes, so that these overrides can also be used there.
-#
-# Beware that this part of OVERRIDES changes during parsing, so usage
-# of these overrides should be limited to .bb and .bbappend files,
-# because then DISTRO_FEATURES is final.
-DISTRO_FEATURES_OVERRIDES ??= ""
-DISTRO_FEATURES_OVERRIDES[doc] = "A space-separated list of <feature> entries. \
-Each entry is added to OVERRIDES as df-<feature> if <feature> is in DISTRO_FEATURES."
-DISTRO_FEATURES_FILTER_NATIVE_append = " ${DISTRO_FEATURES_OVERRIDES}"
-DISTRO_FEATURES_FILTER_NATIVESDK_append = " ${DISTRO_FEATURES_OVERRIDES}"
-DISTROFEATURESOVERRIDES = "${@ ''.join([':df-' + x for x in (set(d.getVar('DISTRO_FEATURES_OVERRIDES').split()) & set((d.getVar('DISTRO_FEATURES') or '').split()))]) }"
-
 ##################################################################
 # Include the rest of the config files.
 ##################################################################

base-commit: 6073813151383121f9fbd3dab9f33033ddf21ee2
-- 
git-series 0.9.1

