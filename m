Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E2ECD4F20
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:51 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.16001.1695367487301869562
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ELSNudqL;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2bff776fe0bso30521551fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367485; x=1695972285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4/A2FKFuW+cM4D01jbKZw0nyqmOnZAoqIW8e49Ysc4=;
        b=ELSNudqLryS2xnbpVdDmNdtf6TswaTgEoQT8KlfTS1rJmhx7pzHBal9r8SM6lC5CEE
         CCoElwCxMjVcpNr18AgbkPV/NcwnIBZ3PUObdORqsehixSXrb7UgPM9/EBY/pEaDuu67
         aBty04MKmDQAxnJOWzWYZkCQnRy+H31LK6U43rSUarzVm7R3cymEs27/CDrNiapT1EV1
         tnxBU6xkB289V48fOtey9oYKryFFE4uHGFcvH61xOJyrGD5aR214p5m75M2f5MZtSz1u
         CsXFvgzphRgY2VDpeA4Nxqg5z+ZKySxtFS2a0Xy4FJxzkYhDuIa5EMKThmaUlwKQmc5Z
         W3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367485; x=1695972285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4/A2FKFuW+cM4D01jbKZw0nyqmOnZAoqIW8e49Ysc4=;
        b=YlCkJw782mUMEbkDPEZ/PIFZ90aKUPvUIox5L8sWo0KeyDCJP5e84TVDsYgB/+GMwa
         APXb2voFLEYCkPknXJY1pH8pr9js/aRCgM5nc/mMma14onHh1zUm7xAxANRcpAY7Y0lq
         zCPlh/0ESG0ez8PC4nYOdwQfzPe5Ttkn5suOBeGf4XNfO5OS4IN9hIc/vamwNqqRCYI/
         /pt1eUaPi/svax5Yhrxnxpdm2k9Vo2MaK5eh4Hx+8KEvwkAWFxx6fAiHw/3OnL3VYtxu
         SiV02eeGMwQADF5UPCAabGuVLJEFqgGnCtGaBgR+W3sThq6MIYHT3UW+dTn2w6l0Q0he
         i9lg==
X-Gm-Message-State: AOJu0Ywq3hgO/ejCUeOqkg2PCw+lIbDr3IQjhg1bOSOZ9aYUndoftDtk
	T6uwBFTYP0aFwCbIzFk6eBMz12w5b+s=
X-Google-Smtp-Source: AGHT+IGYSkMBZaVU5RJMnhiwcsRxmpvhjMtFdCO5xPSfSIwYBa8yVRB+JvDDhYkr6h7a9pH8JUFV9w==
X-Received: by 2002:a2e:96c5:0:b0:2bf:df8c:4e56 with SMTP id d5-20020a2e96c5000000b002bfdf8c4e56mr7493472ljj.39.1695367485431;
        Fri, 22 Sep 2023 00:24:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/40] ghostscript: upgrade 10.01.2 -> 10.02.0
Date: Fri, 22 Sep 2023 09:24:08 +0200
Message-Id: <20230922072431.1481743-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188060

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...pcx-buffer-overrun-fix-from-devices-.patch | 31 -------------------
 ...ript_10.01.2.bb => ghostscript_10.02.0.bb} |  5 ++-
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.01.2.bb => ghostscript_10.02.0.bb} (94%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch
deleted file mode 100644
index b29212fbc6c..00000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d81b82c70bc1fb9991bb95f1201abb5dea55f57f Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Mon, 17 Jul 2023 14:06:37 +0100
-Subject: [PATCH] Bug 706897: Copy pcx buffer overrun fix from
- devices/gdevpcx.c
-
-Bounds check the buffer, before dereferencing the pointer.
-
-CVE: CVE-2023-38559
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- base/gdevdevn.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/base/gdevdevn.c b/base/gdevdevn.c
-index 7b14d9c71..6351fb77a 100644
---- a/base/gdevdevn.c
-+++ b/base/gdevdevn.c
-@@ -1983,7 +1983,7 @@ devn_pcx_write_rle(const byte * from, const byte * end, int step, gp_file * file
-         byte data = *from;
- 
-         from += step;
--        if (data != *from || from == end) {
-+        if (from >= end || data != *from) {
-             if (data >= 0xc0)
-                 gp_fputc(0xc1, file);
-         } else {
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb b/meta/recipes-extended/ghostscript/ghostscript_10.02.0.bb
similarity index 94%
rename from meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.02.0.bb
index 434170e34d1..4bad0f86e14 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.0.bb
@@ -25,11 +25,10 @@ def gs_verdir(v):
 SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
-           file://0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch \
            file://configure.ac-add-option-to-explicitly-disable-neon.patch \
-"
+           "
 
-SRC_URI[sha256sum] = "a4cd61a07fec161bee35da0211a5e5cde8ff8a0aaf942fc0176715e499d21661"
+SRC_URI[sha256sum] = "e54062f166708d84ca82de9f8304a04344466080f936118b88082bd55ed6dc97"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.30.2


