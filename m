Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A2BF8DFEA
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:26 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28573.1776378796852173212
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NApx+CV6;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so603315e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378795; x=1776983595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xd1Oh51XRJtN4hlM/3Q0YJ5TBwhGd63HGd4UxeJdqMI=;
        b=NApx+CV6xhRm1F80PFzdF7WDQtOcL0Wijj2DK8psuho1Acly2f9NztDFqHFxZ1dBU7
         sEm//Ju9zJWEY0t3+ToHiT5H0f3m9PNLIvpBXtn1CEFWIWO6JdpB9Bh5jNMzpAkBcsM+
         F2aRnlFocHKWPhR9w7G7QtQaceThkuFUII8JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378795; x=1776983595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xd1Oh51XRJtN4hlM/3Q0YJ5TBwhGd63HGd4UxeJdqMI=;
        b=Xy5g//3PJfwGpZX2Ppov0H3jVwzzu+R6UlvU176L1+hCGyRFny/eFJWXZC4wHNhX2o
         0gfnE1OBDc+M9QkxJIxCjLPASZZYw/k4jmbZ2T/l6qw7bLzbjp5e21ENaG3Y583Xo4mA
         bXPyVcBOfEiCVcNueCw4oIpFzlKKggStFm/oWFNF9ho8EXixRwgKbuw6vbfgMtlNaGJw
         CrmwUT0aWsNtrRyx6RUitqrR6DNtgl6IfJmqUwN3JKA6DAu0IX7f1mUjwN/9wXkenhLc
         Yaj+hAshA0sb7xOpxu7DPN1RV/IlT0X4yGllDUHodNXAHT2O8UWJJ8i+MrulbBQXAlzp
         8HYQ==
X-Gm-Message-State: AOJu0YxDfgAPZnkfNvWHihxMeEgG6VRIgRKXnFSp/vn3tbLjrBtZ229o
	ggbGL/orvT1xjaBi2/AsQnQ3ZzC4BXwbSBztzBfpOSFzR6KSVGg+on2iy1T3crbBBErf1dZizUg
	1cvsaxiF00ruB
X-Gm-Gg: AeBDieuBjx9y5OevVn4ir/JuWHUV51OWru84qqZj/lAme6meLfjNievBaXTIC0H1sZv
	IEMOY6tFYmDbUjHCoN5B8vMaPIklc9oqMzTvfaCs1Z/37n1TuRpU0iaj7RgkgjWdN8BWrZnPmw1
	ssd/u4B9oGNFfjR23YWYqBsR7DM8kyVqUrk0j3Is6ioJB/XI/ficGLM4AWT0F+/zyUJeDpeBE+K
	UwnY6uHcOQQELcWFOLEpxASR6bavA+JrNK8Eq1cvM43c+t+zEOO84cfGOLTvSK27PWg5XRhuAp+
	sbRaN3wfswqDfDjOHifWSCanUrKRcHugISERRdQeRBgui+KdrjZKMubdYYPSDbFwbdFecmLb5ch
	5pqvSZ8Y+wYeo7wr5Y521tJEt+2V4U8Z8WhbTl3L0EFWK86OEgxhWZ0ZHUoHOlo0VnmZNBRiXWv
	xdRAFDeEVPM/GsTcXfVbuXNlq3C2URlbBr2DaD8c3T/c5zEUQXoshj1/x71QD6u8tVLjaOR6c+o
	isTt53DK/xMz6tyEJNWToMiwn9j+cnnaSyzTA==
X-Received: by 2002:a05:600c:8582:b0:485:4006:960c with SMTP id 5b1f17b1804b1-488fb7710e1mr3868165e9.16.1776378794702;
        Thu, 16 Apr 2026 15:33:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 24/51] systemd: backport fix to build with glibc-2.43 on host
Date: Fri, 17 Apr 2026 00:30:07 +0200
Message-ID: <166f2b4685678af745f346c6f73aab6f12e84149.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235453

From: Martin Jansa <martin.jansa@gmail.com>

fixes systemd-systemctl-native on hosts with glibc-2.43:

In file included from ../sources/systemd-systemctl-257.9/src/basic/errno-list.c:13:
src/basic/errno-to-name.h:71:23: error: initialized field overwritten [-Werror=override-init]
   71 |         [EFSBADCRC] = "EFSBADCRC",
      |                       ^~~~~~~~~~~
src/basic/errno-to-name.h:71:23: note: (near initialization for ?errno_names[74]?)
src/basic/errno-to-name.h:114:26: error: initialized field overwritten [-Werror=override-init]
  114 |         [EFSCORRUPTED] = "EFSCORRUPTED",
      |                          ^~~~~~~~~~~~~~
src/basic/errno-to-name.h:114:26: note: (near initialization for ?errno_names[117]?)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/systemd/systemd.inc         |  4 ++-
 ...ilter-out-EFSBADCRC-and-EFSCORRUPTED.patch | 34 +++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 761660f2c84..f41acc029d1 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -17,6 +17,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 SRCREV = "5e38d199a623563698ab4a69acbbe3afa9135198"
 SRCBRANCH = "v257-stable"
-SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
+SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV} \
+    file://0001-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch \
+"
 
 CVE_PRODUCT = "systemd"
diff --git a/meta/recipes-core/systemd/systemd/0001-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch b/meta/recipes-core/systemd/systemd/0001-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch
new file mode 100644
index 00000000000..5673175cb13
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch
@@ -0,0 +1,34 @@
+From fb146f6d2c5118410fd19907651fd8f7310bf69e Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Tue, 24 Feb 2026 20:19:45 +0900
+Subject: [PATCH] errno-list: filter out EFSBADCRC and EFSCORRUPTED
+
+These are introduced in kernel v7.0.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/3cfb16998808a6ec8012a6120d0a82f0e1a0c8bb]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ src/basic/generate-errno-list.sh | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/basic/generate-errno-list.sh b/src/basic/generate-errno-list.sh
+index f756b2e020..491fa1b6e3 100755
+--- a/src/basic/generate-errno-list.sh
++++ b/src/basic/generate-errno-list.sh
+@@ -3,9 +3,13 @@
+ set -eu
+ set -o pipefail
+ 
+-# In kernel's arch/parisc/include/uapi/asm/errno.h, ECANCELLED and EREFUSED are defined as aliases of
+-# ECANCELED and ECONNREFUSED, respectively. Let's drop them.
++# In kernel's arch/parisc/include/uapi/asm/errno.h, The following aliases are defined:
++# ECANCELLED → ECANCELED
++# EREFUSED → ECONNREFUSED
++# EFSBADCRC → EBADMSG
++# EFSCORRUPTED → EUCLEAN
++# Let's drop them.
+ 
+ ${1:?} -dM -include errno.h - </dev/null | \
+-       grep -Ev '^#define[[:space:]]+(ECANCELLED|EREFUSED)' | \
++       grep -Ev '^#define[[:space:]]+(ECANCELLED|EREFUSED|EFSBADCRC|EFSCORRUPTED)' | \
+        awk '/^#define[ \t]+E[^ _]+[ \t]+/ { print $2; }'

