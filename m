Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEEFD2ED17
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:26 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6483.1768916301157770447
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NETTIVID;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee07570deso37188585e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916299; x=1769521099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43uA3w4veefmnXhnhAd7FGhTHNfEexB0CNExXSaybxw=;
        b=NETTIVIDKkE8TOdR78oIabqchvsZQJi13xNPrKHf5whaZ3XND/VWJAFeTRmVbXIL6a
         /3GEeZCIqXDAMvnW7bQETVAAkcxLwchxVD/aMgS4eAs323P7daJXhxmY8ZYYaDVeA9Qy
         xVYL16Jfx3VPXSfDLvkP8xJVo2286QuHQRy6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916299; x=1769521099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=43uA3w4veefmnXhnhAd7FGhTHNfEexB0CNExXSaybxw=;
        b=X+CkxVb8wFAlp378rdY3AnGsU5cq1upQDskLzuhqLPoxy+HDT+fWkO7fEDUtIbTruf
         AI0xwoS31heiyr0t3q+kg9pPswA+sJbhuJE9AXixxUu7FRFUJ4HujampO9iCdLQYY7zb
         HnE4xtiQQuIBqtKS1BwBoJppSShjjV/qUyUlCCG4/kuRFnFQPcppLy4v3owBQTcIGYSI
         in5Ca/hB85pxCQGmyTbevOu/YzyJvlAovKhISefVB8DYdn4rvIzR+rnzn5//UJdsl5BM
         mP27JnDZxVmLiunMmPD6XPsEqwMABYmh6j3Uc+FIfJh+R9JdhKa9pZEsYUtdLMM8Hj2Q
         ZXww==
X-Gm-Message-State: AOJu0YxbqnbVwpSCXw2pvx1v7eu9MzQgrV3R3SORnuhn60Nw+Ovil05h
	mmNT7kdiLVXO9J2CKMjpDRG15KxeXcfOR5OXCOqKsuz07rAgDWaEEBRrniXXB4mBHGhPQQxZGgl
	G/uis
X-Gm-Gg: AY/fxX64negYTJeGa2Tgpt7Q3AquK0e6HEyNhytmpXOYUD2atq6C+nKMlFI2U6LogYv
	2rtUVuXkn0RhtIQfADch4iRJVVFz247febA8LJ/vfCsAEru74HADzqvi28czx8J+UvlnrVUolYy
	oSDZ4sUhmpx5HXWJKtb+rJcooCTqLxAdJX/oG531/7nmHSfQolMPKgI2464EYLDT4MnpphodES8
	ulxnJgrjW3B/I12SLGZ55B/vWKH88fRRDYmz1HSY7S+MiM4pbNt4qN5xW7HgY4dG5YRQVEN1VkU
	1uhleMwcycj5vGcJFyDt/uC9aDJw7GRhG3/oEDHp1q90JY9WGxHwaj4r+D1pwTf/5Qt9XCPYuI5
	7/hSufmgpa1hfO+jfphSsw0cew2IMGRjgkkOHnCHm6oCd6tgfcRZ4PMbmAWmUpZW2W/qh9emn1O
	3MWTNGPQJsscf6pTNFM2xxCD1GGK2Ou3zp7tzamJhaj6A7XKEbj2y0w6WHfibw/Mn/E8MrxbpxX
	l7j0DTO0YlPLWfuBZI7VA==
X-Received: by 2002:a05:600c:35c2:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-4801eb09296mr199431715e9.24.1768916299327;
        Tue, 20 Jan 2026 05:38:19 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:18 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/26] pseudo: Add hard sstate dependencies for pseudo-native
Date: Tue, 20 Jan 2026 14:37:45 +0100
Message-ID: <e164df5b7a8a3fd761b359b4c1c756f7bd72c9dd.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229729

From: Paul Barker <paul@pbarker.dev>

Where a task (such as do_package) runs under fakeroot, the corresponding
setscene task (do_package_setscene) will also run under fakeroot when
restoring from sstate. Assuming pseudo is used as the fakeroot
implementation, we need pseudo-native and all its runtime dependencies
to be available in the sysroot before running any setscene tasks under
fakeroot.

We already add a hard dependency from all do_package_setscene tasks to
virtual/fakeroot-native:do_populate_sysroot in base.bbclass, but this
does not cover transitive dependencies. So, extend the dependencies of
pseudo-native:do_populate_sysroot_setscene to ensure that the sqlite3
library is also available in the sysroot before running fakeroot
setscene tasks.

[YOCTO #15963]

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2c146ca657440550e00bc5e53d13502ef7aa945b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 7e09b6d58c..9c191560fb 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -156,3 +156,10 @@ do_install:append:class-nativesdk () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# Setscene tasks which run under fakeroot must not be executed before
+# pseudo-native and *all* its runtime dependencies are available in the
+# sysroot.
+PSEUDO_SETSCENE_DEPS = ""
+PSEUDO_SETSCENE_DEPS:class-native = "sqlite3-native:do_populate_sysroot"
+do_populate_sysroot_setscene[depends] += "${PSEUDO_SETSCENE_DEPS}"

