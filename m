Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198CBCF9C69
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 23:05:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.2729.1727219131570737075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 16:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PDrt2PXh;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso59752905e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 16:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727219130; x=1727823930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RAtJxVNnF0JHhJ4/bWNhcOiQvUaL2H4cowYQ/PFivl4=;
        b=PDrt2PXhj+Swhy8x+szIy9RWBDnBvyn/1caJLqEUnX7uE4ORngy0VIXgmnNrIScOPK
         teh4D10imq7R5E/n8XBoLjoedZKYY8Yek6Bk4HRuX4y7IG5s30h0DsyBlaWBox02xRbo
         qQqUJy6qSO3bqe+VOk8ptVe4FkziuUWc+xZswKt+0NIF3mYbMDW8I4V+fNreDO6SqChU
         DDeeqr+uDL3/+jRx7cEOALsKHAx7A2VdwVAeOtgbmy9eBJ3G4WdQsv9WMWr7TqSchriO
         RdoKUMtQP7EMQN0qPv9Bn5BH74ghlpcbEwod4SoedB/LpeDffAW7n4iocdr6zHC3ECu3
         cwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727219130; x=1727823930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAtJxVNnF0JHhJ4/bWNhcOiQvUaL2H4cowYQ/PFivl4=;
        b=PcCoGpWv4VMgPY8fdzzsm9vFs8SRdMv1iLWLvHrpttPQ2lPuua2JaLBRWnH4ALRoE1
         az07q1h2CqOGqk/7Fy1RPefAZ3Mi8G1ZbKnuRDDDSFdYb6kT3QXGcOQvd4PuKUO4pKIw
         /da11ndPehi1IRtjUNfKqBDsAftQjSFm7QxTQ569BQCwu3qxoZenAc1elet7mdR2EAqQ
         2TxnE5iAtkWebbNuHnl+mi3XvDAPP7Rol8tyXJ9g2dicgdeEXssqEnv0Qr7EvEzxdaDH
         z5zcHhwbjmNUAQ0604zeUKcMJBVEMI7K0tRLyvQ5KYAh3MD9ngkGqoBUXMXtUpfH0Spg
         1DKQ==
X-Gm-Message-State: AOJu0YyLTIzIy8bsDpiy29KhKr5Y8Gl/pfJBKtOtfcBQEXcd+Bg/J7+9
	K52A+Mi3+I+uybVxY6QLMpiAB0FfwlSX6JBGp40q3g8ejjw69cjoXWLAeG5/v2E=
X-Google-Smtp-Source: AGHT+IG0N1MjfYTfumJ8w4UzN8rOyJcnej6k/j9N2+kH9UAiI/g3ADWHL0SJEGD6hsY7LHId6Hr/sQ==
X-Received: by 2002:adf:e450:0:b0:378:c305:8f43 with SMTP id ffacd0b85a97d-37cc2468e17mr477790f8f.18.1727219129546;
        Tue, 24 Sep 2024 16:05:29 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:600:2744:7bc8:c715:17d:4d03])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf4d75cdsm1291721a12.81.2024.09.24.16.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:05:29 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@microsoft.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [kirkstone][PATCH 1/4] install-buildtools: support buildtools-make-tarball and update to 4.1
Date: Wed, 25 Sep 2024 01:05:14 +0200
Message-ID: <20240924230517.19994-1-an010@live.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 23:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204884

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


