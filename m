Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6BFC83F01
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:26 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.10500.1693064364935247174
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=bTHoueg5;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.176, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3a8614fe8c4so1366871b6e.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064364; x=1693669164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vIERuWv1SBEnnQXDlrpopvOpAgl0SZR7S5FfK0s+Hro=;
        b=bTHoueg5YNjGLFWDRgteUliWf5eZH9vb9hCae4XLgLcrDtjMuucKIBTH4NzeNd8GAZ
         AZvbXbFgwivqHIszyPYoT3nTquJfrqSbak6GTNSQm8f/AbE2w+b4Pi3ICxHC80qEJsnO
         NSeOm4JDKiEHNryHm6xmL7BkxYVsvDOlEeWDCIyt3BwwKstuZF+P5sVye/t3fgYnb5D4
         Pcq4HkGnHeF/DFKDoIZuWQrtuHoa1C2cD8BDGNCTeSwBDixnTtipCIKGwhek0X8+u9Xx
         9go+z9mNa2v03HF+xA5xkeW/q8AHr5Zw2PlH0PFwXQhUwoCb/MHmUo9ifV8jWXWGCvmx
         CgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064364; x=1693669164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIERuWv1SBEnnQXDlrpopvOpAgl0SZR7S5FfK0s+Hro=;
        b=ZQTv9iOH3HdHoTRBy+R5rHfLDvnhcuXTQk3U7EFK/y/majgQ3fvtg9tX0AOrqQ3U8p
         MH98ndEUp86IhJYtgcwLF63gZAczgrYDlRdsRqrnaknGSYyeiubJKF8Rd8gxLdrKbdqs
         DF9pE686xmLvV45xXrz1q9ULNBxm0oNx0IrH2sa8+BrNIE7yyUHcfwUhhTGLkUefQsbe
         SgdUil1BUnQsT0vDNl8eiqAKGQQXZ+qZMeLoRDkw08zaA5SuLNtZPyJo/q6FUlsIzhxX
         JtEUsOExE5ESGcwVXLlNWjuKWCRyRgHM3MkfFfUuaDKDQ6BegTYeVw1/HzXyJl6tKHgG
         E/Gw==
X-Gm-Message-State: AOJu0Yyns4oNFlZq4n03XGqICDbzv712d28ncJYG+7gra4z0QFHaWleI
	G3bA/ktZnU8Nwj4c2DOfqFNO3/zZqEQogvmi81w=
X-Google-Smtp-Source: AGHT+IEg0ihB0HmzKEwn9WN0nEPPg9tep9Z4ziKF206AV4ajt2yJR2HCvQnjYG4XrtlnrPkc0qxbLg==
X-Received: by 2002:aca:1719:0:b0:3a4:4b42:612b with SMTP id j25-20020aca1719000000b003a44b42612bmr5855127oii.42.1693064363917;
        Sat, 26 Aug 2023 08:39:23 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.39.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:39:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/20] lib/package_manager: Improve repo artefact filtering
Date: Sat, 26 Aug 2023 05:38:46 -1000
Message-Id: <96954ff5ea258e8456c66bfa13a11fb4fe7a3808.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186759

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If you run an arm build followed by an x86 one and then ask for a
full repo to be created, it will include all of the arm and x86 packages.
testexport will then find the arm socat package rather than the x86 one
and try and run arm binaries within an x86 qemu image with no success.

The reproducer for this was:

oe-selftest -r fitimage.FitImageTests.test_initramfs_bundle runtime_test.TestImage.test_testimage_install

This patch only symlinks in the compatible package archictures rather
than all of them which fixes the failure and the resulting autobuilder
intermittent failure too.

[YOCTO #15190]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 30b45bcf49bf8207fd96bb45a55d7708661f3359)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager/__init__.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 0c313190cf..6774cdb794 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -470,7 +470,10 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
     # Detect bitbake -b usage
     nodeps = d.getVar("BB_LIMITEDDEPS") or False
     if nodeps or not filterbydependencies:
-        oe.path.symlink(deploydir, subrepo_dir, True)
+        for arch in d.getVar("ALL_MULTILIB_PACKAGE_ARCHS").split() + d.getVar("ALL_MULTILIB_PACKAGE_ARCHS").replace("-", "_").split():
+            target = os.path.join(deploydir + "/" + arch)
+            if os.path.exists(target):
+                oe.path.symlink(target, subrepo_dir + "/" + arch, True)
         return
 
     start = None
-- 
2.34.1


