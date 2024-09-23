Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4ECCF9C6F
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 09:00:22 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.32266.1727082013166047721
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 02:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vo+7XKPY;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53655b9bbcdso4598012e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 02:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727082011; x=1727686811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RAtJxVNnF0JHhJ4/bWNhcOiQvUaL2H4cowYQ/PFivl4=;
        b=Vo+7XKPY7Ys9OTqD9m8H63Z76joDm8u0x23pYCGdqW8MtQZxFwQu2ziowtUXAzPJKy
         v4Awf9ChJVuZKIKsvqhMlLK7PAyNa0bFhMvpyDGSE+sQugQB5iGhka5oBMdaDrerJkNN
         oPFx30FzEk8YdSMvyy96DkLokRsChLWqWybmGuDZviiHHp0hmONBWXvsw0hL9gOUfB4Q
         z2Ma4UxPwhD22n/s8sqAXT4hw3XG/mg0/ZgmyDy5AnKRNHBEtn1erCWrvATm2Pux84aN
         bKGFwEm0jkdtZaBvsfrq6oGXJ4F0AMUO2a99cLEPz0kUmKUjBeYnZVWH43GH4nYvGPIs
         icyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082011; x=1727686811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAtJxVNnF0JHhJ4/bWNhcOiQvUaL2H4cowYQ/PFivl4=;
        b=C7bx9GY4C88dBex8aC4pyn+BoOTgJKuYKG8F73WeTuofXPOhJFyCWuiikjElfReGLa
         NPfBPL17o7+oC3g7uSDIZjRAkzD3xTCRPT9OFwf1itxZ9wZoyis5zPeao6IAu3O/74lF
         Uu6+VgdJNrmUzUoN0y3rYof6g81ly9xnDO5RbaVyoeYwhZU84ioS4G81gKRJAwetSFtw
         OshAtc8kWaL7KDniKT8JB1a80vXqaWpfDnRqcdsK/1DPekbcKDCskT5kPXbg8M5Inod7
         qB36T9RCVUN8tS7i3spVbgjuTY2TAcDvJiqwCBnQddk+bVxfs5OFTSArJgwIR/HedrVC
         w9eg==
X-Gm-Message-State: AOJu0YxXzjeIrwTG05iHefnBOZ+Ayiup36zhi6fY0GgVyquQhtKxD83/
	OgoiuEvLTzR0nXKsZi2rfQy4Npbo4rmgRwJZDJKV8MJt8SoX/m+pgu5IrwbtbWY=
X-Google-Smtp-Source: AGHT+IHKD8TbBuhZNA78ixhJRuTkMb5CHjLC/y94y7N/Zh8rTKZukg0MNAD7xHtlFpHf5wgQqm2ZPQ==
X-Received: by 2002:a05:6512:3a94:b0:52e:ff2a:217 with SMTP id 2adb3069b0e04-536ad3eb9a4mr5326003e87.50.1727082010811;
        Mon, 23 Sep 2024 02:00:10 -0700 (PDT)
Received: from an.. ([2a02:810d:600:2744:e855:ba31:e4ab:c4bc])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb94a01sm9872262a12.91.2024.09.23.02.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 02:00:10 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@microsoft.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [PATCH 1/4] install-buildtools: support buildtools-make-tarball and update to 4.1
Date: Mon, 23 Sep 2024 10:59:45 +0200
Message-Id: <20240923085948.49447-1-an010@live.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 09:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204796

From: Paul Eggleton <paul.eggleton@microsoft.com>

Support installing buildtools-make-tarball that is built in version 4.1
and later for build hosts with a broken make version. Also update the
default version values to 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5d539268d0c7b8fad1ba9352c7f2d4b81e78b75c)
Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 10c3d043de..2218f3ffac 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'http://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-3.4'
-DEFAULT_INSTALLER_VERSION = '3.4'
+DEFAULT_RELEASE = 'yocto-4.1'
+DEFAULT_INSTALLER_VERSION = '4.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
@@ -154,6 +154,8 @@ def main():
     group.add_argument('--without-extended-buildtools', action='store_false',
                        dest='with_extended_buildtools',
                        help='disable extended buildtools (traditional buildtools tarball)')
+    group.add_argument('--make-only', action='store_true',
+                       help='only install make tarball')
     group = parser.add_mutually_exclusive_group()
     group.add_argument('-c', '--check', help='enable checksum validation',
                         default=True, action='store_true')
@@ -170,6 +172,9 @@ def main():
 
     args = parser.parse_args()
 
+    if args.make_only:
+        args.with_extended_buildtools = False
+
     if args.debug:
         logger.setLevel(logging.DEBUG)
     elif args.quiet:
@@ -197,7 +202,10 @@ def main():
                 if not args.build_date:
                     logger.error("Milestone installers require --build-date")
                 else:
-                    if args.with_extended_buildtools:
+                    if args.make_only:
+                        filename = "%s-buildtools-make-nativesdk-standalone-%s-%s.sh" % (
+                            arch, args.installer_version, args.build_date)
+                    elif args.with_extended_buildtools:
                         filename = "%s-buildtools-extended-nativesdk-standalone-%s-%s.sh" % (
                             arch, args.installer_version, args.build_date)
                     else:
@@ -207,6 +215,8 @@ def main():
                     buildtools_url = "%s/milestones/%s/buildtools/%s" % (base_url, args.release, safe_filename)
             # regular release SDK
             else:
+                if args.make_only:
+                    filename = "%s-buildtools-make-nativesdk-standalone-%s.sh" % (arch, args.installer_version)
                 if args.with_extended_buildtools:
                     filename = "%s-buildtools-extended-nativesdk-standalone-%s.sh" % (arch, args.installer_version)
                 else:
@@ -303,7 +313,9 @@ def main():
         if args.with_extended_buildtools and not m:
             logger.info("Ignoring --with-extended-buildtools as filename "
                         "does not contain 'extended'")
-        if args.with_extended_buildtools and m:
+        if args.make_only:
+            tool = 'make'
+        elif args.with_extended_buildtools and m:
             tool = 'gcc'
         else:
             tool = 'tar'
-- 
2.25.1


