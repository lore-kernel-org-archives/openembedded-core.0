Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B73C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 11:32:04 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.3352.1665142322455427666
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 04:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=dqJsQ7yh;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 98E8020EA298; Fri,  7 Oct 2022 04:32:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 98E8020EA298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665142321;
	bh=2EsszLjk/u8/XBfKkQfy/z/q1C30mKUfkgae+mgXrEU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dqJsQ7yhWR/2+KjxswqndFjFjUh5vdUR52nXbo4R63hhWwFZMLnpx90QenZM751+X
	 UWKdkwDs3oCO4bDrN+qHFsljL/UUwZL8YceBXf2J/YMayZ9z+o7YK+OMb3TFavrRxa
	 QECOFMBCbjYGSR1RBN60W37sH9NfSCNzil2HgqWo=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] install-buildtools: support buildtools-make-tarball and
 update to 4.1
Date: Fri,  7 Oct 2022 04:31:56 -0700
Message-Id: 
 <0439f6feb9344743364e44e6658fad45b88fd760.1665142126.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665142126.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665142126.git.paul.eggleton@linux.microsoft.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Oct 2022 11:32:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171522

From: Paul Eggleton <paul.eggleton@microsoft.com>

Support installing buildtools-make-tarball that is built in version 4.1
and later for build hosts with a broken make version. Also update the
default version values to 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 scripts/install-buildtools | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 10c3d04..2218f3f 100755
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
1.8.3.1


