Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760CEC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:34 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.8677.1637163333694245072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VCDLmc4I;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id u18so5488981wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z5hgrKh90xonjGRdt8YEIFY+t7PW9gELL14Xr8WJ0vs=;
        b=VCDLmc4Ik1EO9Yn9qYyvjpu22n/HC/zqYAUP3OnXcSysf2BkfwpEclGIDFuDUQ3fNh
         ce2+4qYphW9WQwlPbvCKuSgdn8ViRjFLY7/fymbaYSojq1tglhmgi8+oinIMa0I6QcY5
         gfZTE0h8oeb9/lj2jIftAMVmOmNksS8rOgYOs9dx9KRR5LrehS9kl5m0NLO9UARot9fS
         e6WvhZVN491LjgYzrpzzhbOAa/ga+nITm6K0DJvIcjKViWZlvv/bw8vRxompS2u3/BFl
         SMD+tKOpd70OOSbAnm2ihmT5KMB2hc04mIQnYwgxAXA66IVtbZgJ62wjIEo7+bjjA/n2
         VrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z5hgrKh90xonjGRdt8YEIFY+t7PW9gELL14Xr8WJ0vs=;
        b=v60ZXS0QyH9x2z7iYRhhmPJukSAbqFLZfBiODBFJQA1tsm4zMwJwy46vZY1syTyVwZ
         eVUtP5wzsaqoRIeEAf9O1n4AF7SM7dJIYTfCA15x1Pe6xiHOxf07bKloWl6kmyExLvYZ
         Tu4wzqOWCTyxtflYh/umu7zRObYzE+Jm4kM6LOBDsMG/s5pNCiQc3kd+AnEELRz0mTkg
         I02Kx7LKnw71btS2OBOWssWSi+Oy1mnMeS0tGDcSGjJ6p2Dc9AQVIVvv2VM+H14PCoIb
         +UXY3HfYaJidj8X/CNZiMcfJO4W1AuCrjtO1uNrPKAB4jeaT7uLiY24071Az3/0LcN+F
         Pqfw==
X-Gm-Message-State: AOAM530nv79R4nRQSHKROKNrhJvuWOJnug+uc/Q9CjxMVCSPihdTai71
	Lj9Hcmta4Y1PxklkPXSYRVfVG305Q/M=
X-Google-Smtp-Source: 
 ABdhPJyzhYfgc7Dcy7nNRdTwcEE4lNQ4x/pNkBENjOeOz74BhJUBvh7ZxUjvZWrw4xSSZDd9gx2EYg==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr20837047wry.347.1637163332317;
        Wed, 17 Nov 2021 07:35:32 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/36] gettext: address automake 1.16.5 failures
Date: Wed, 17 Nov 2021 16:34:58 +0100
Message-Id: <20211117153525.257146-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158404

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-builds-with-automake-1.16.4-and-new.patch | 29 +++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.21.bb     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext-0.21/0001-libtextstyle-fix-builds-with-automake-1.16.4-and-new.patch

diff --git a/meta/recipes-core/gettext/gettext-0.21/0001-libtextstyle-fix-builds-with-automake-1.16.4-and-new.patch b/meta/recipes-core/gettext/gettext-0.21/0001-libtextstyle-fix-builds-with-automake-1.16.4-and-new.patch
new file mode 100644
index 0000000000..727d1db552
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.21/0001-libtextstyle-fix-builds-with-automake-1.16.4-and-new.patch
@@ -0,0 +1,29 @@
+From 2f127ebe425c97b0641fe1bc73247e91e18c2be0 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 11 Nov 2021 22:06:16 +0100
+Subject: [PATCH] libtextstyle: fix builds with automake 1.16.4 and newer
+
+Upstream-Status: Submitted [http://savannah.gnu.org/bugs/?59929]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ libtextstyle/configure.ac | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/libtextstyle/configure.ac b/libtextstyle/configure.ac
+index 63b4c2a..cab9025 100644
+--- a/libtextstyle/configure.ac
++++ b/libtextstyle/configure.ac
+@@ -17,11 +17,10 @@ dnl along with this program.  If not, see <https://www.gnu.org/licenses/>.
+ dnl Process this file with autoconf to produce a configure script.
+ 
+ AC_PREREQ([2.63])
+-AC_INIT
++AC_INIT([libtextstyle],
++    [0.20.1])
+ AC_CONFIG_SRCDIR([version.sh])
+ AC_CONFIG_AUX_DIR([build-aux])
+-. $srcdir/version.sh
+-gl_INIT_PACKAGE([libtextstyle], [$VERSION_NUMBER])
+ AM_INIT_AUTOMAKE([1.13 silent-rules])
+ AM_CONFIG_HEADER([config.h])
+ 
diff --git a/meta/recipes-core/gettext/gettext_0.21.bb b/meta/recipes-core/gettext/gettext_0.21.bb
index 5ada709937..a0f3402904 100644
--- a/meta/recipes-core/gettext/gettext_0.21.bb
+++ b/meta/recipes-core/gettext/gettext_0.21.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
            file://mingw.patch \
            file://0001-msgmerge-29-Add-executable-file-mode-bits.patch \
+           file://0001-libtextstyle-fix-builds-with-automake-1.16.4-and-new.patch \
            "
 SRC_URI[sha256sum] = "c77d0da3102aec9c07f43671e60611ebff89a996ef159497ce8e59d075786b12"
 
-- 
2.20.1


