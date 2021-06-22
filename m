Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by mx.groups.io with SMTP id smtpd.web12.8054.1624364149312490944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 05:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.28, mailfrom: andrej.valek@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 15MCFkck004744
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Jun 2021 14:15:46 +0200
Received: from dev.vm6.ccp.siemens.com ([144.145.220.53])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 15MCFjHi030442;
	Tue, 22 Jun 2021 14:15:45 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 5CA5A950A87;
	Tue, 22 Jun 2021 14:15:45 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH] ca-certificates: revert mktemp patch in update-ca-certificates script
Date: Tue, 22 Jun 2021 14:15:31 +0200
Message-Id: <20210622121531.13424-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0

- revert f3eabbb5c15fb55ae3d46b2377c09bb58226d965
- mktemp from busybox does not support '--tmpdir' option
- coreutils is usually not possible to use because of 'GPLv3+' LICENSE

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../ca-certificates/ca-certificates/sbindir.patch   | 10 ++--------
 .../update-ca-certificates-support-Toybox.patch     | 21 +++++++++++----------
 2 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch b/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
index f343ebf16e..a113fa8b15 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
@@ -1,12 +1,6 @@
-sbin/Makefile: Allow the sbin path to be configurable
+Upstream-Status: Pending
 
-Some project sharing ca-certificates from Debian allow configuration
-of the installation location. Make the sbin location configurable.
-
-Also ensure the target directory exists
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Submitted [https://salsa.debian.org/debian/ca-certificates/-/merge_requests/5]
+Let us alter the install destination of the script via SBINDIR
 
 --- ca-certificates-20130119.orig/sbin/Makefile
 +++ ca-certificates-20130119/sbin/Makefile
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch b/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
index f78790923c..6e2171f758 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
@@ -1,13 +1,14 @@
-update-ca-certificates: Replace deprecated mktemp -t with mktemp --tmpdir
+From 30378026d136efa779732e3f6664e2ecf461e458 Mon Sep 17 00:00:00 2001
+From: Patrick Ohly <patrick.ohly@intel.com>
+Date: Thu, 17 Mar 2016 12:38:09 +0100
+Subject: [PATCH] update-ca-certificates: support Toybox
 
-According to coreutils docs, mktemp -t is deprecated, switch to the
---tmpdir option instead.
+"mktemp -t" is deprecated and does not work when using Toybox. Replace
+with something that works also with Toybox.
 
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Submitted [https://salsa.debian.org/debian/ca-certificates/-/merge_requests/5]
+Upstream-Status: Pending
 
-[This was originally for compatibility with toybox but toybox now
-supports -t]
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 ---
  sbin/update-ca-certificates | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
@@ -23,9 +24,9 @@ index 79c41bb..ae9e3f1 100755
 -TEMPBUNDLE="$(mktemp -t "${CERTBUNDLE}.tmp.XXXXXX")"
 -ADDED="$(mktemp -t "ca-certificates.tmp.XXXXXX")"
 -REMOVED="$(mktemp -t "ca-certificates.tmp.XXXXXX")"
-+TEMPBUNDLE="$(mktemp --tmpdir "${CERTBUNDLE}.tmp.XXXXXX")"
-+ADDED="$(mktemp --tmpdir "ca-certificates.tmp.XXXXXX")"
-+REMOVED="$(mktemp --tmpdir "ca-certificates.tmp.XXXXXX")"
++TEMPBUNDLE="$(mktemp -p${TMPDIR:-/tmp} "${CERTBUNDLE}.tmp.XXXXXX")"
++ADDED="$(mktemp -p${TMPDIR:-/tmp} "ca-certificates.tmp.XXXXXX")"
++REMOVED="$(mktemp -p${TMPDIR:-/tmp} "ca-certificates.tmp.XXXXXX")"
  
  # Adds a certificate to the list of trusted ones.  This includes a symlink
  # in /etc/ssl/certs to the certificate file and its inclusion into the
-- 
2.11.0

