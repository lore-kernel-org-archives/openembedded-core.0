Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F923CF6D36
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:13:24 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.6957.1727874803289551773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CnufL5dR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71dd2b6cbe6so211349b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727874802; x=1728479602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2waS2Nn5+ED+yu/z5kmeluDxGLj4e8o+WkBMz/+AbnQ=;
        b=CnufL5dRj7wPMwpRJ3aym+qfe0qOcB5tTFOP+rKiBmfhVtHNRtfPTAxUOxzuaRaHdG
         GWiGUDKt/yBNko+j1Q1BHkm2YcyjqvbKb4J0HeBLajr7Mjhtyemq3mUAcUWVjrRrqFJI
         9S0G+xVoLtyU71zamhaTaWDO+U1wGbfUNx9oDFDwLoEapYe8uutP9sI32CImwpTw6Ta4
         gnlK4Hyen12TjJduxDEXny/IxTJli9s7SWrGasSt/CahiJ9Y+Yzqv3AUi5nLIf2Ikf+5
         31CMxG1/FM3LomBLS9vfRXiwb2Ot7g/WSrr9N40dZOQvUijpBBowrGY28/zKNMFAcZWt
         FKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874802; x=1728479602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2waS2Nn5+ED+yu/z5kmeluDxGLj4e8o+WkBMz/+AbnQ=;
        b=YsCisqKxmgenfQs9qmplT+hqPHlnc8YPsBVYfoUojE2Hqe4s35Nc5As/ZvXnrjGBbf
         0U4pZCPkenM12DGgTnJB+as7ZLfD3SULOcUJczfeLnAV9UtUPfWAxzKAFMaDz/ghM19j
         OB1W8X05aGg3l/FltTsY1QwGc1LcuVnjRT9NFRHHPLD/0X6xvTGPvtuFGg50EZhs+qhX
         GIi9WiRokIgoNQSWzPpUwhiE3ddaqrztBD0XE0ZBYkjT5Naphfa0GbKX2rxnvoefVPlM
         bRkvMUk+mi49uRw8yJ7lKf9mR9Mo3SRjkYWGjy03CP2EJJmVymNlta7bGmgK9uuzYI3W
         rxFA==
X-Gm-Message-State: AOJu0Yycc1q4k8fJLiMsnnyByOtlJ45/7znY/b7issIAIMmY9gb2r5pJ
	p5PaNtIZYHPeh13p/hKpBpcPUxQVCYP5trfkyijdZm7FI/ZnRPUiqOcSHaHvMEZ8YswYOTJ+lbp
	xN/M=
X-Google-Smtp-Source: AGHT+IG4EMni9+ccqiNatc/1FCaYL+rXrpnrL4JXfLI0BTEKp3DVn1zSvesPMDHY5xN0eR2Eskq80Q==
X-Received: by 2002:a05:6a00:3995:b0:717:8ee0:4ea1 with SMTP id d2e1a72fcca58-71dc5b06f65mr5575816b3a.0.1727874802399;
        Wed, 02 Oct 2024 06:13:22 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c775sm9773436b3a.29.2024.10.02.06.13.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:13:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/16] install-buildtools: support buildtools-make-tarball and update to 4.1
Date: Wed,  2 Oct 2024 06:12:51 -0700
Message-Id: <5348a4999e19bcd002c7d4558067a38870e172d2.1727874367.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727874367.git.steve@sakoman.com>
References: <cover.1727874367.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205195

From: Paul Eggleton <paul.eggleton@microsoft.com>

Support installing buildtools-make-tarball that is built in version 4.1
and later for build hosts with a broken make version. Also update the
default version values to 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5d539268d0c7b8fad1ba9352c7f2d4b81e78b75c)
Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


