Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDC3E6E7EE
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13361.1770113973836815209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BPqSexud;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so3456661f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113972; x=1770718772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XhJ4yY5BJPf0KFv5k+0mGLtSCNE4wpH75EyXvlNaoL8=;
        b=BPqSexudd/PmwaQy6fD3KVJts/vx1L0IbJcScHxOH0qGi+LFoglcMQOKZeaxTJZEsn
         VvhFcOmJ0h12xwUF9dzH8R5Ej3loppu/45BtdpMfUc+2IaBkBwru6Ci4zIF1eEcfElqX
         7qZfQN8r+JYu8uYHqr4Mb/6bYfLZHUVNhaEaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113972; x=1770718772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XhJ4yY5BJPf0KFv5k+0mGLtSCNE4wpH75EyXvlNaoL8=;
        b=UvQImt3RUFqn/4TpxDp8sNWPq+QA0lMWViW6d89b4L5xDw/v6tKHRTnMJbEBcehizE
         kb/ik7dg9uSCorg+PeJdiSmCOifbcq03KV7iq18GlfiaF/NBzk7RVu+JCrdwXeoAh2Cb
         4FQrF4Sv8hZgIaoHI3vPBzs8TxvL9IqAwSLXd9Mg1xuhXPgRA7CzluxJiHvZHjKUysi1
         ZbkbUw728ekwKAtPrxHbXlRevNs0nCjCcCRixymgsBJZ4Pf5avaeTgbUWKQhvpXPN74d
         7kRJcNUQQUWnMToIwostfDn5QuHLaElavKdtepeQiEvopVMMCDa4IF2/f6yarFueH94S
         rREA==
X-Gm-Message-State: AOJu0YwbtxaC+RJaYBrjD2C0nmJnlgL3NJAsC0kPFCGmyn+2SxtCSbSx
	SbvN/xyxL7rkRm5sqKcgIFbAIZI8jIfEDV7NkaXJweDqWz8eY+G447LpqAgkHO4beipd61by+pz
	tZcCX1ks=
X-Gm-Gg: AZuq6aIhgO82j/2s+mdggLe/VsdehBfWaEXsUKKz+dclKfsnHKHmB9g6QDk84CiIaO2
	WB7BB/7GzsVcKAqH7N50LXfUTGKsAzydQs/9XYTpnnHvAmgPfDwVSdjBI7E7Ju7O0b6g7j6VHug
	VzEqS2BBTZKt0dhYn+uI02z3/wKIIvWrIi2O8cLVOxOsPFOqPL+KS/+amCyKKGEUuTUOjAM9meG
	IDkXeQjKftpNULRuhrhto+94HmhxEfurbQi2YyNSFO+weC0/0kBtrre63GqyKWA6R8kF96W40Lh
	aKrOriaD4bO1syzG5/LNBdc5S4HqS8h0AG44S37jB+u7dAHCkkL31CWq6aT7Zx8pcGnSpDjYC0H
	skDer4KQ5yrl+4nc1zEEG0Ee3jTseD4+6a/xasSaAjeUmD9S4v0/tcLdSAnsDoW2T77quhrwWt9
	G8MpVUGahOHOYVQjDyF4qTx8Gzc+xzUkP9FDW53CkhtcTrFijuZ9/rtIbNMbeHcPtB7SbfdSinv
	ykLiL2yvqI4dv07wcQuAk8OUg==
X-Received: by 2002:a5d:5d13:0:b0:42f:b707:56e6 with SMTP id ffacd0b85a97d-435f3aaa6a0mr21027011f8f.34.1770113971974;
        Tue, 03 Feb 2026 02:19:31 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:31 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 15/22] libpng: upgrade 1.6.53 -> 1.6.54
Date: Tue,  3 Feb 2026 11:16:44 +0100
Message-ID: <0d7e8b4fdc95ddd9a32603f2f692e0a1e7f510d5.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230443

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2026-22695 and CVE-2026-22801.

License-Update: copyright years refreshed

Changelog:
Version 1.6.54 [January 12, 2026]
  Fixed CVE-2026-22695 (medium severity):
    Heap buffer over-read in `png_image_read_direct_scaled.
    (Reported and fixed by Petr Simecek.)
  Fixed CVE-2026-22801 (medium severity):
    Integer truncation causing heap buffer over-read in `png_image_write_*`.
  Implemented various improvements in oss-fuzz.
    (Contributed by Philippe Antoine.)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9c18cb1d4dd0edf2e9c638c3c576cb803e1ff4c6)
[YC: Added changelog]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpng/{libpng_1.6.53.bb => libpng_1.6.54.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.53.bb => libpng_1.6.54.bb} (94%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.53.bb b/meta/recipes-multimedia/libpng/libpng_1.6.54.bb
similarity index 94%
rename from meta/recipes-multimedia/libpng/libpng_1.6.53.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.54.bb
index 956cd243b19..3f2b80a060f 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.54.bb
@@ -5,7 +5,7 @@ library for use in applications that read, create, and manipulate PNG \
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5516d77a3cf75f55a0d37254e3e65a20"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9dc350edbbbee660c7d9af79487168f2"
 DEPENDS = "zlib"
 
 LIBV = "16"
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4"
+SRC_URI[sha256sum] = "01c9d8a303c941ec2c511c14312a3b1d36cedb41e2f5168ccdaa85d53b887805"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

