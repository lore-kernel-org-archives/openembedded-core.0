Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869B9C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:48 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.18138.1708013920017261472
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x8WHvd5q;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d918008b99so8090935ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013919; x=1708618719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7POM8NPXUP8XImK5FCPyKfPk40OHbP6KmGFEODPiXCs=;
        b=x8WHvd5qPRxbWGvPkZHTbpJEax7ol5g7mpSXukr2uejYeKahkoylfrm1Eu5cau/0qw
         dvrLI6uP1Pz/b4En/w4xR/5T1zxhxCuXo4eKijDrmws/IqTkm+5X3qEvETj9vKxq31yR
         b3GDZ1e0SEo3C84vLbV2Ky0O27I1LpMqT0NEjs2TXyR6x0YkMuqlbSZi+zqacZE9a4Bs
         60YsgrW+ME8ww8H9cisp7z54aEVoXFVrUzL/aNobu7Tdb+Z5mY7+1UZRQAMwx3OiwiwV
         zYBTxjv+9YFWvAWcFvBlIkKHAexLU3QKyrw4Xy/DhCdSm8DrbGCiAAWhDXcl2rxRNeGj
         n5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013919; x=1708618719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7POM8NPXUP8XImK5FCPyKfPk40OHbP6KmGFEODPiXCs=;
        b=IsnDtslDeL4aUWZFewJT0DeaXGyirZZUDu2PVGnxhYv65klhNuUU+iSP6YcmkgGhdI
         xLdC/FVl4r2MzHND9quGTECQ5yvgepei17t8/Iwjgkll11vafgncfYRJRm6ZGAOBC+yB
         Z1+Ecxa9fsEwh9Sz3Bla2V49NqFjPPykEurZqhLaEMxwH8TgSjV1y/G/cm67sZenSHzT
         TwimZIIuFive7wWDboDGarmHh/CveXabxDeORPmLmpqXapebs09eYilHzDQ/4w7pXyu3
         xJfJQc05kHUozIfWcXhw4cOYCJVnjVotTZlos+ivbGfCdG1rVt4XZgtI19RwB9XMftWz
         H+ww==
X-Gm-Message-State: AOJu0YySkrnzdSrjQK7IqyjIsFruOiWdumrsi+1iniCNd0GlcRMHgTtw
	Yi/pZ/760fbMAx5pG3YZjMKJTB1XYB5pFOu9/EM3NlLUr1VwLODB3G/YA7/ib5y/7KRQuIB4kal
	zEW4=
X-Google-Smtp-Source: AGHT+IEuPQc8SPqbiJu73lYI0flyRtoHXm1NQ8ILt0RXmZXT/k4k6yQaDY8w7vN41GvqeuLCueat5A==
X-Received: by 2002:a17:902:bb8b:b0:1d7:88de:cff1 with SMTP id m11-20020a170902bb8b00b001d788decff1mr1883610pls.53.1708013919332;
        Thu, 15 Feb 2024 08:18:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 15/21] allarch: Fix allarch corner case
Date: Thu, 15 Feb 2024 06:17:58 -1000
Message-Id: <2e206eb9b43c267e939ccb3cdfa62d9666ff5efa.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195535

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Most of the allarch code is conditional and only set if the recipe remains marked
as allarch. The qemu wrapper handling is not handled in the same way however and
is unconditional.

Move the code to some slightly uglier inline python to allow it to be conditional
and match the way the rest of the code works.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dfd704f1741dccd9a85338c5d45dee4be079064d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/allarch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/allarch.bbclass b/meta/classes-recipe/allarch.bbclass
index 9138f40ed8..e429b92437 100644
--- a/meta/classes-recipe/allarch.bbclass
+++ b/meta/classes-recipe/allarch.bbclass
@@ -63,9 +63,9 @@ python () {
         d.appendVarFlag("emit_pkgdata", "vardepsexclude", " MULTILIB_VARIANTS")
         d.appendVarFlag("write_specfile", "vardepsexclude", " MULTILIBS")
         d.appendVarFlag("do_package", "vardepsexclude", " package_do_shlibs")
+
+        d.setVar("qemu_wrapper_cmdline", "def qemu_wrapper_cmdline(data, rootfs_path, library_paths):\n    return 'false'")
     elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
         bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
 }
 
-def qemu_wrapper_cmdline(data, rootfs_path, library_paths):
-    return 'false'
-- 
2.34.1


