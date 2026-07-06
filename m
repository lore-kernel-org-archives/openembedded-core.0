Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12367C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:33 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156302.1783358242818047094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pxBvh9tY;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso33769245e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358241; x=1783963041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIhGhCd06uHhTSM44V5x/mPxZ0oueTD+A5K/F/44+N4=;
        b=pxBvh9tYxjS3izKi9HfeM8HsyiHxVm5Ugym6HRoT1QjD4vh9WsdyOLcV6vmLxmW63M
         Bhluk08SwZr3d5lSBlwhs7T5rS0iVCiZJnTjfFSGUMXd/Gqpq1UdzHId140beFUW889x
         1dOyN4G6zCWeBS7foAj2KQrN9CD9BtGUPnneSQFfMAFSJk7Xe4iDPx+a3+3RrSDFr6S/
         nubrMD2PjfC3kCopur21dIK6w1YB13iIcjXSp8rusOY+qoiRCB+DQdJHA0qRJouU4BI0
         EbrbMh3dvQd28di8MOMfk8y+5bhSJg1qaNlqOzJ++w774TNxe5oKvcJYDP6ewg3x/HZY
         INdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358241; x=1783963041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DIhGhCd06uHhTSM44V5x/mPxZ0oueTD+A5K/F/44+N4=;
        b=MVouLRsix5zjNiQb3lgObGrw5mK4iozgd1iGOE+TcKYlSL3DyKVinhOZdYMXIm9ww3
         fxZTTNsElFEe1tTwdoxscimYWPSTLYpENsq+LR+XQPaC72fNKJKY1H4dwNki5pnqs7Uz
         oFJYVk2/Cu4cBgFKiJ2bnWDIzMYwxabc/iiOjokaMFQuZ0CcqmBO3kxQuuxSVQ44D3kU
         23IkonQpzcldmu93A40PpaBv+r712KXizNsNmSWjGd95PcZ/CBrMWgPiMWP2uuUjpcvT
         UIf5N7IVqaF2piPwz6Jg3N+cqaibzMQTz5n61lzUW36bnx4WCz53E5SEjXi4WQ86Kk9C
         eNGA==
X-Gm-Message-State: AOJu0YwMme6IY+xDLaCguW4l8D146CH30aDkAQ3MEiwZrIH1eYTMGhEJ
	yTKdObX+HJtfGmsV3+01eIhYR2XUWuCMqpIicEnArWU2/xdehMTdw/7o364fMQ==
X-Gm-Gg: AfdE7cmgkcRr3HzQSgzAiia9hdiZDGirZgcCVdAbnR1cIOHfYwuV25RkK981NwNXWOA
	EghqZ7dz+dIV2WkvYKSlCqEBCfGOqnCO+aZLz+TYUwRUgeTKIylzbpAcxlumTZYXeGQTDRe9J5m
	TDRgYV1cl/M0iLOQtuhfeQU/MNUJ41q572LtWP638647Uf73ArrRjAHC8Dj9grjtwBke54a7Vtu
	2iMKL9nuUDnn0WuiPE6XxODNM3UW8Rr1VKepu25b6qHZ1tenewC728Vig8j54LHlZadz4qYd4sw
	VDOiwBpPzjo3/6mjO1kfyoZr0AK1qbljwA+d4lD/slvJUSc1bEQndkAorcONdLNB1DdZqroJcmf
	EktFV03wAtO6C0uzNPediYNAt18fHqkspV7qhtaHHzgh0AkD5Qdqn4NyHssWASdFnJjhnJXvJ7N
	XD74W6ko8WL/JIljnWONPOhs2X5/GUl2XApDTBpG9Jbby0T9ZN
X-Received: by 2002:a05:600c:4e56:b0:493:c35c:b4d1 with SMTP id 5b1f17b1804b1-493df062bcamr16739435e9.7.1783358240871;
        Mon, 06 Jul 2026 10:17:20 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/45] libffi: upgrade 3.5.2 -> 3.6.0
Date: Mon,  6 Jul 2026 19:16:33 +0200
Message-ID: <20260706171701.70536-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240305

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/libffi/libffi/not-win32.patch          | 6 +++---
 .../libffi/{libffi_3.5.2.bb => libffi_3.6.0.bb}             | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.5.2.bb => libffi_3.6.0.bb} (94%)

diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index ca76fde855..17f45456ad 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,4 +1,4 @@
-From 28d0fd6b73163fc2dbc10c7dc838a8222671f88c Mon Sep 17 00:00:00 2001
+From b89a6b1ebfde657a8ff3c325297caf2bfbd1f7f4 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 4 Feb 2016 16:22:50 +0000
 Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
@@ -20,10 +20,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 258107d..ef1a285 100644
+index 2c8ba77..4e92515 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -411,7 +411,7 @@ AC_ARG_ENABLE(multi-os-directory,
+@@ -423,7 +423,7 @@ AC_ARG_ENABLE(multi-os-directory,
  
  # These variables are only ever used when we cross-build to X86_WIN32.
  # And we only support this with GCC, so...
diff --git a/meta/recipes-support/libffi/libffi_3.5.2.bb b/meta/recipes-support/libffi/libffi_3.6.0.bb
similarity index 94%
rename from meta/recipes-support/libffi/libffi_3.5.2.bb
rename to meta/recipes-support/libffi/libffi_3.6.0.bb
index d3aa90d429..8868279d6a 100644
--- a/meta/recipes-support/libffi/libffi_3.5.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.6.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ce4763670c5b7756000561f9af1ab178"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            "
-SRC_URI[sha256sum] = "f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc"
+SRC_URI[sha256sum] = "31ff1fe32deaebfbb388727f32677bb254bf2a41382c51464c0b1837c9ee9828"
 
 EXTRA_OECONF = "--disable-builddir"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
-- 
2.47.3


