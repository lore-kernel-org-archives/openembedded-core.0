Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE1471975
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 02:11:23 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g2so7954450pge.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 19:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Q9zT0S0RQ5dc9v439DtqLawvJ0MdK4sndM1bGCKzLLA=;
	b=X/d15nYnM3r/NYeNAqOnVYlJfb1xdbB4IlEuijKM2GY42G+QmZzVgzV3gvDSG5EYjj
	1TPeqPHwx2Vnwca6jDGSySbKo/HopPEMPUilmtXHLuJRuNQePeHTgYyWful1NhRlAkKA
	CFHf1k19ssvBiQXA2L1yx6ALEk+F7kZeamB5XtVlAuQbeNj/Gk/Ch1FRPrwKkkyihZTk
	Gkh9aDT+qGYQ4HSB6Szf8VeSbnioGGTv1ir0STq+9HJe49qjjpUBfb/XbcT+Y31VvgWR
	CiaJ+mMolfLS5uTVka9zkPfIYCENZtfRw3J4EuYcJ0i5cVoCEMv3V3/Pu3jxhzeh3sYl
	0YeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Q9zT0S0RQ5dc9v439DtqLawvJ0MdK4sndM1bGCKzLLA=;
	b=COBDe1m/kx8XQCZDSdEwXdVI0qeVqPApMR2PK8wKjQieqzwt/k/SmdwBe7nU+Rr83N
	w7uZMcpeZmp85wiahMaN2mYRkth73w3693vxqhxlCa6S5KrES9GfRDoSvbfLrgT5wk6r
	mr/bpiDWQk/2Sh9tMQFFqMwQkSS/MprgOQ/itcDwy2/ZHBHvyCnYEA7bf187XujZCDTK
	kffnR8ti4+pIiBD+5NQaQwzP5WSBGsuEuNk9KsPmsSayVgreeB0QkNNPRyAIveZSIGzw
	B+dJcyy6U978Rt+sp/arhEeyDLmM2MEe3s7cr1JfgmrwXo+u2tPR/oYtK2j2fcAzeCTm
	9mkg==
X-Gm-Message-State: AFeK/H0p4L9kaJwbPEVlcKIjy3OhMLzAz8AFXidPSiYpNWqZypgzWbGk2bBKuexICjdgvg==
X-Received: by 10.98.89.70 with SMTP id n67mr13619852pfb.224.1489716684415;
	Thu, 16 Mar 2017 19:11:24 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	o24sm12879287pfj.126.2017.03.16.19.11.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Mar 2017 19:11:23 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 19:11:16 -0700
Message-Id: <1489716676-2205-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] busybox: ignore the largefile distro feature ( always enable LFS )
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
X-List-Received-Date: Fri, 17 Mar 2017 02:11:24 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc       | 4 ++--
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 34f4e25..6246c95 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -63,8 +63,8 @@ def busybox_cfg(feature, tokens, cnf, rem):
 def features_to_busybox_settings(d):
 	cnf, rem = ([], [])
 	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv6', True, False, d), 'CONFIG_FEATURE_IPV6', cnf, rem)
-	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'largefile', True, False, d), 'CONFIG_LFS', cnf, rem)
-	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'largefile', True, False, d), 'CONFIG_FDISK_SUPPORT_LARGE_DISKS', cnf, rem)
+	busybox_cfg(True, 'CONFIG_LFS', cnf, rem)
+	busybox_cfg(True, 'CONFIG_FDISK_SUPPORT_LARGE_DISKS', cnf, rem)
 	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'nls', True, False, d), 'CONFIG_LOCALE_SUPPORT', cnf, rem)
 	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv4', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
 	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv6', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 773c4f8..f649738 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -582,7 +582,7 @@ CONFIG_FEATURE_FBSET_READMODE=y
 # CONFIG_FDFLUSH is not set
 # CONFIG_FDFORMAT is not set
 CONFIG_FDISK=y
-# CONFIG_FDISK_SUPPORT_LARGE_DISKS is not set
+CONFIG_FDISK_SUPPORT_LARGE_DISKS=y
 CONFIG_FEATURE_FDISK_WRITABLE=y
 # CONFIG_FEATURE_AIX_LABEL is not set
 # CONFIG_FEATURE_SGI_LABEL is not set
-- 
1.9.1


