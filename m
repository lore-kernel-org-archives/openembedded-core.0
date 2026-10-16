Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C9ECCF2C9
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:46 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5938.1792189485395128380
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uK0gAjjW;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso146695f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189483; x=1792794283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m+WcvivTY9/boFGQyA7OCDICW1UGyMzB2F/yUEyT/Ks=;
        b=uK0gAjjWFrd5un2+rpwznDm72s+0+cpjtfh08JLSG1NCQ9to7a+w7n9OioIDv6WKLF
         NrOAbXaYLry3+szl+kwE1ocjEbcnHLHnME3mShd9d13vfYMejFJe1suL7YJvZTKXLWBO
         a4iKFhQi49xeQHc+AbCcTq5IuV2xwHwtVZgdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189483; x=1792794283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m+WcvivTY9/boFGQyA7OCDICW1UGyMzB2F/yUEyT/Ks=;
        b=MlS/fgEYdc3gActTTX7Lo4gJYRgCVuJvvfvyGvF0V2hTm/NDZpNzK7yZP7XnHMEFjl
         10CNM8niaT5V08qCxCWORRnP3vE6G+SUE6FxxnO+vMa5zrpt6+F1HcfyjNFpih5jEtvn
         xDLcZ0OKrdTFlrdh2R+TDaubiboX7JkPDfiV2vpgona46DaHOf+QVMkaC59o2qSAMn1I
         QqVU+TqqG+dFzXTmImMIk+eodF8US8z+CadVel4mEA5mGPED7TduLGHGVDGi4eWUU7np
         qv1O9TbYR7rZ0pDUmybE1AVLuOjlqftzc7mcKLqEagLckmckC6uOXH6K1QtYjc5ffspi
         TfQQ==
X-Gm-Message-State: AFq9FYL2M8btDWXj89kfVMLHXEqdqDXyILitr6drovXlnwJZ7mdD1X1d
	VyLnD7x6xRNkODKAZoik8ZVIOvdVBuK2smzh0vF9PkUrdjghmkeG3sG5Xms7cLR8UntNZLyCxC+
	ozj1i0ac=
X-Gm-Gg: AYBFou28Zv5uYsw0G+Gee9IcP2x22RbWO5WRHvmxmOQG5z95hoA/qbkaHBfYJ5lZsR3
	NgH/lzhbsZuBEFQJdseXVeulQcf5S+4aaLZYcBd2tcEXOFeHG7IzJWCzg8nsq5R11LUoXxdIiOc
	9wXiTr819SweLheWfvvEfrON3Dlc4y7gjO1/dwEW7q7FN5TgDPdiUzbIg3pCb7bSpHJUQk0aJuA
	28KtgGUXZTibNGTpVGY+lrod2+Q7rKTBBECBSbk50r9KcMi50okL1MX57KBdTsXx3H8all8lbN6
	MRLrw3RUd/Kt+/8K8eGrCAfPhtFkwiizLkZIs0s47Kcm//QT5wFFJH1H/iyQ0WoAN4hsVFun1yT
	3FE9dOBhcEAYo4pQ3nWXsejncXA5wGRGuMG+htzS5TLJ3ZFLI1U/JEgytKdqnM9+VQZo0wWvPim
	K4n19mJiBCloQu1+F7RwKybWKT8Fm0CF14ln7RT+S3dDK9g5uiN58tq+VKpFxfq2eDDsDxQ80JR
	3v3oH+3aJ1OoMkQHNtrudrjPqm8S2nQSrTSjAatqpibuzAm7hOb7O7W0J2cF7PPpfrwTbZY+aa2
	7yfz6pZL
X-Received: by 2002:a05:6000:490e:b0:488:6561:b324 with SMTP id ffacd0b85a97d-48e07baf65dmr1810258f8f.9.1792189482216;
        Fri, 16 Oct 2026 15:24:42 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 05/17] libpng: upgrade 1.6.58 -> 1.6.59
Date: Sat, 17 Oct 2026 00:24:07 +0200
Message-ID: <91466c1fbeb2dc2f1ebca37479edcb2c673d7203.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792189264.git.yoann.congal@smile.fr>
References: <cover.1792189264.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248056

From: Peter Marko <peter.marko@siemens.com>

Release notes [1]:

Version 1.6.59 [September 28, 2026]
  Fixed CVE-2026-46675 (medium severity):
    Use-after-free of zlib input in `png_read_end` after incomplete zTXt, iTXt
    or iCCP decompression.
    (Reported independently by Ze Sheng and
    <JasonHonKL@users.noreply.github.com>.)
  Fixed a regression introduced in version 1.6.47 that caused libpng to reject
    hIST chunks in their correct position, after PLTE.
    (Contributed by Yuki Sekiguchi.)
  Prevented a double free of `png_struct` members after an allocation failure.
    (Contributed by Anthony Hurtado.)
  Applied fixes and updates to the CMake build.
  Adopted the REUSE Specification for licensing the CI files.

[1] https://github.com/pnggroup/libpng/blob/v1.6.59/CHANGES#L6388

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 907c6fa2d0c4f8a8f765cde004c55fb2dd2c402d)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../files/0001-tests-stream-per-test-results-to-stdout.patch    | 2 +-
 .../libpng/{libpng_1.6.58.bb => libpng_1.6.59.bb}               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.58.bb => libpng_1.6.59.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch b/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
index 139495d211d..2bedb607f65 100644
--- a/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
+++ b/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
@@ -50,7 +50,7 @@ index eb7078158..a2e64fbe6 100644
  endif
  
  # man pages
-@@ -165,7 +171,7 @@ pkgconfig_DATA = libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.pc
+@@ -216,7 +222,7 @@ pkgconfig_DATA = libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.pc
  # not done in the source directory!
  EXTRA_DIST= \
  	ANNOUNCE AUTHORS CHANGES INSTALL LICENSE README TODO TRADEMARK \
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb b/meta/recipes-multimedia/libpng/libpng_1.6.59.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.58.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.59.bb
index 928b010c9c8..4dbd769cf73 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.59.bb
@@ -15,7 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://0001-tests-stream-per-test-results-to-stdout.patch \
 "
 
-SRC_URI[sha256sum] = "28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775"
+SRC_URI[sha256sum] = "d80dd2a38a37f803cb9b6ac7b14bd6e74ddc3b654780a8380bdf93523fdb4389"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

