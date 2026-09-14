Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591BAC88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 12:09:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18759.1789387773358899213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 05:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Wg22wjKE;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so23347865e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789387771; x=1789992571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEZMdC/RfVcrCu2wkI/PCB+A68PrEq8oLD98RQC5FTc=;
        b=Wg22wjKEQoXBB+Lm/rG/jSjfF8nbXiFR3pZi3o+eOazGJThosNS+tMYRjJKXADiqqa
         sKBdFs1v1m8wrcPHHOckTM77BDHB0LNoD49QQD+Ov5xQBSfK70Rda1ZTUOxr7JqAGMCb
         rGq/DRjA0PwClBcFd2xNWnLJyxowKsvam5f+5QjKO7BUKrOW4w2zbSwhD4ripVZZEKJy
         6+PSTMkEGNEEP/e/hBe9N4V6e/+5gztobA8uu2tB4o0A+HXO3t/3NAC5JfdfYegrcvnO
         cgTTP6kaSnMwT2AW0ltsP3CaLuxkY1IifztGfREnntroanCnXMQx1qpOw+NfMKWwW7xs
         LiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387771; x=1789992571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qEZMdC/RfVcrCu2wkI/PCB+A68PrEq8oLD98RQC5FTc=;
        b=k8Dt8O+UTSpF0TNqGxr/7k9AfWoVcz2Xx2YgpN+q2F00FUAScnvl9aUNma01h5uX4o
         UTHWK/IJhAcpr4qJ4/DuEIlmAfpKAS/MMCR5nQYDrzpD5lKzxx30NCmh2aEIUy+3yn7M
         fUkFzNx2qGyDSvdM+QAvs186jHJh+8LDzR606+drCTg1CQ1mEavUBPvEzjSnHk5sqBgn
         Urj1TBToyg0jdwNm8n+WqEWMRpbaKfo5BIPYIzWnHO7Am0Vyle2zzMozvQ1JWYRAMH4g
         y+2NqqZrOWK0CRb3Uqvs/fYLdJVGgUeo/3lqUud3SWv0PSBfLxh3sa6tmOcl539yqu9k
         7wsw==
X-Gm-Message-State: AFuF++lyOX9CvgAOQ6p8r2NBGgnjVLqmH+HgjpgUq3nxeTD8IF3ez/ny
	fcHLIJ1hQH9TY8vL6+qH6VJvFG04tspwNVo0lsiXxxJ4VUWXmOfeQQpBXaAOAA==
X-Gm-Gg: AYBFou3c+BuOcNwIZTU84YMp0t7JhYbfgFK8VM6VzrW6gV0veQOd3/CIvcJndIUg4fM
	cjbJUpwhZLGrHWJXzoVcE8EJWr8w2LDcLfEsIWcauJWJX4Z+86htL/h73J/rAE/62Gdb1iZI8N9
	DnHEJchKBm1AUBMBvsNJ4zmVh8/2EJ/ZD01S0uqRDhM78BE2w9ajtnnfjVLdZi/uO0LFQMDOM1g
	MCl0ojj6LHsv2BksWiAv5LdpVLh19wmM1oqvk/g37AoKSiUkTQOxGNQTYxJy4oAIHWJvtVAMQzU
	3jm+wyc3jmqyDkHAAPpKz2ZegJYiWHDNuu+W3B9COwaKioD4cjnhd3HhEri/eLK/mxc9vLctT/8
	fOt8w2AKiAFlgrAVl5qDyllLrE8vqnzAeE5RE4bkMRNMXNuhyLG9M2jqViMN1XaDLvVoIi2YQvD
	gryli5GVvcqvk1t6lQMsETEeon1WkzTaVsMwrhH/+Xp01JKR6g8F5EtGePpKVLxhx7gmoaCK8oN
	+s6cF7LO5LXI2EeTagvAaqyzH6TZLaRyUk=
X-Received: by 2002:a05:600c:468d:b0:49b:2796:be30 with SMTP id 5b1f17b1804b1-49e7a64ec14mr26879285e9.11.1789387771387;
        Mon, 14 Sep 2026 05:09:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm26590821f8f.20.2026.09.14.05.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:09:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] tcl: update domain: tcl.tk -> tcl-lang.org
Date: Mon, 14 Sep 2026 14:09:24 +0200
Message-ID: <20260914120925.1153614-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914120925.1153614-1-alex.kanavin@gmail.com>
References: <20260914120925.1153614-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245772

From: Alexander Kanavin <alex@linutronix.de>

tcl.tk is no longer accessible (and .tk is generally problematic:
https://en.wikipedia.org/wiki/.tk ).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/tcltk/tcl_9.0.4.bb    | 4 ++--
 meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.4.bb b/meta/recipes-devtools/tcltk/tcl_9.0.4.bb
index 5b4809ed6bf..97ba82d5fa1 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.4.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://tcl.sourceforge.net"
 DESCRIPTION = "Tool Command Language, is an open-source multi-purpose C library which includes a powerful dynamic scripting language. Together they provide ideal cross-platform development environment for any programming project."
 SECTION = "devel/tcltk"
 
-# http://www.tcl.tk/software/tcltk/license.html
+# http://www.tcl-lang.org/software/tcltk/license.html
 LICENSE = "BSD-3-Clause AND TCL"
 LIC_FILES_CHKSUM = "file://license.terms;md5=058f6229798281bbcac4239c788cfa38 \
     file://compat/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
@@ -24,7 +24,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
            "
 SRC_URI[sha256sum] = "5d265f3499b588681825d8093177830707b7035ad866b17189a3a6ab6dade0ff"
 
-UPSTREAM_CHECK_URI = "https://www.tcl.tk/software/tcltk/download.html"
+UPSTREAM_CHECK_URI = "https://www.tcl-lang.org/software/tcltk/download.html"
 UPSTREAM_CHECK_REGEX = "tcl(?P<pver>\d+(\.\d+)+)-src"
 
 S = "${UNPACKDIR}/${BPN}${PV}"
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
index 0382d4239cb..2094c9935ab 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://tcl.sourceforge.net"
 DESCRIPTION = "Tool Command Language, is an open-source multi-purpose C library which includes a powerful dynamic scripting language. Together they provide ideal cross-platform development environment for any programming project."
 SECTION = "devel/tcltk"
 
-# http://www.tcl.tk/software/tcltk/license.html
+# http://www.tcl-lang.org/software/tcltk/license.html
 LICENSE = "BSD-3-Clause AND TCL"
 LIC_FILES_CHKSUM = "file://license.terms;md5=058f6229798281bbcac4239c788cfa38 \
     file://compat/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
@@ -28,7 +28,7 @@ SRC_URI[sha256sum] = "1880b6337de72431174511419550bb4cf1327b7c8200a5466d1c4eb3ec
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 
-UPSTREAM_CHECK_URI = "https://www.tcl.tk/software/tcltk/download.html"
+UPSTREAM_CHECK_URI = "https://www.tcl-lang.org/software/tcltk/download.html"
 UPSTREAM_CHECK_REGEX = "tcl(?P<pver>8(\.\d+)+)-src"
 
 S = "${UNPACKDIR}/tcl${PV}"
-- 
2.47.3


