Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C4BCD98D2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:30 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33658.1781132129090412307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PqamUEVf;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so46909905e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132127; x=1781736927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AX+GEd0JNzd1tTXI1BCJ2CV+gkQVZ8wX8hSHSBdqHA=;
        b=PqamUEVfG38cdqYUOI/ttjY1VFcB1RI8A2YA3byq8RxRW2Dg2pW0q9qLVcZSXArHj6
         Fghm+KwSBa2JLYw+BL59KAU6aHeQUI+SGCRNDunypRicIy2F5Jh+0ayB4Ct8R07Y0vMC
         8gXxa7BNagq0ofP0pTcISrV1OmwS1eZUw2MRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132127; x=1781736927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2AX+GEd0JNzd1tTXI1BCJ2CV+gkQVZ8wX8hSHSBdqHA=;
        b=i1f4x2dQrCjnYqB9YO4W2vwtsWPhfVbex0ibJQHfjFIfDqtVQ1/p3IJYKplIfDQs1R
         h4TE7gJBBHWD5GS6XgZP5BycaCJEqX4q0YtFFcaxJ3mBsaQEP0OvNr4Y827he9uXCZax
         G81kX6bxK+ZiZXjWNFcdaB/ttOJJLbJhCX+Co/n4WlIlGerCNLWOkDJneWIDmWwS92pr
         KrTIRluGyYuuOTJLre2C+cI54aRCEigs6LGHTVrcf/qUm0PzTr+AONYIEJC3Gv+Kvlks
         RwCdFMP2jdz5tlvxKBrfof1/HuqSl60Xu53XBLd66A0DurOzxcP8th905G4pw5sx1wmp
         xcZQ==
X-Gm-Message-State: AOJu0YyIvu92kIvorxzUCRCJTs1Rbu5PNIWy7YguLMCofTN2i6rGYCYx
	Hr6C61dHmS9x91AAjAEQj4k0BZWfkyR2sqqWhVbgWCTNL83ioLmQAwxxzJFKw7LrKHJbN9IBJFL
	obxm/
X-Gm-Gg: Acq92OFYfbiiMgft/ZJbb2gilAAPBRteprFeWefPBXo0jYhcc4ljJyTEsS+cUbTCIAx
	4vRFN3nUj/XtP/izP0KbQFn0Wz2wydicoobG7MAFZ32QGAdbep5C2b3LhSJe4LCms7kEhhYbOcO
	idfDTcfCb2UPyftKL7FgQv5Bg02l7/TRYQvLgBLCwUv2YyV3B05trVj3JSkdpp5Eul6wwFIdkdI
	SVAlnd3jyrfu1D9BlQdqj18CbGi1qLFTe8vVW0nqhyy41mD4XrkmJFoA/K3sToY+2GVapGlg5Ja
	QFw7ARrge+ybH+IfVVe7fZ3HEuycV5on4tgJHyu+L0kiMNaE/ObzoWMqUm+05mmpLs3PjtN+vcJ
	RvLdVYA6mkG4PSScfr4t0UZpZGBkaTG2ao0kHi9U4KtNPOdpxOrsku4nYCUoKIKMu9nXXCJNAFn
	pMNTDs6axsb35lkpCIHgLiVjAWpXVlTQ1uT/tDfVq0hrlsUyfspgwOr1YEs9sM0dbxDKrPWduTu
	LRUnCChF7vanQTGfvQc2tBpiPUb3GWbp719JHc=
X-Received: by 2002:a05:600c:46c3:b0:490:625e:bb68 with SMTP id 5b1f17b1804b1-490e2d1c0a8mr10407985e9.3.1781132127517;
        Wed, 10 Jun 2026 15:55:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 20/21] python3: sanitize userbase in _sysconfig_vars JSON to avoid host path leak
Date: Thu, 11 Jun 2026 00:55:11 +0200
Message-ID: <5cebc2470a9a9a3bba570b7ad63e9af7c7624534.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238416

From: Bin Cao <bin.cao.cn@windriver.com>

The _sysconfig_vars__linux_x86_64-linux-gnu.json file contains a
"userbase" field that is populated from the build host user's $HOME
at build time. This leaks the build host user's home directory path
into the target rootfs.

The existing py_package_preprocess() cleanup for this JSON file only
strips known OE build path prefixes (STAGING_DIR_TARGET, RECIPE_SYSROOT,
etc.), but the userbase value comes from the build user's $HOME
environment variable which doesn't match any of those patterns.

Set userbase to an empty string in the packaged JSON. This is safe
because at runtime, sysconfig.get_config_vars() always recomputes
userbase by calling _getuserbase(), which resolves the actual target
user's ~/.local path dynamically. The static value in the JSON is
never used for runtime path resolution.

(From OE-Core rev: beb245ef60c63359cd4f5e285d2f31c5c572b51e)

Signed-off-by: Bin Cao <bin.cao.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3_3.14.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipes-devtools/python/python3_3.14.5.bb
index 501de75fb18..919cfde9aec 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -390,6 +390,7 @@ py_package_preprocess () {
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
                 -e 's:${RECIPE_SYSROOT}::g' \
                 -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+                -e 's|"userbase": ".*"|"userbase": ""|g' \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfig_vars*.json
 }
 

