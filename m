Return-Path: <andre.draszik@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 067BA78531
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 16:08:13 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id l18so3128055qtj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 09:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cg69PESwVHmTcxluw1r0GBeGP2UZS/kmxS76RF3IOgw=;
	b=C1+zlJbaC18w6J1bw9Zk3xZAht+VLZsgm9FkKgugBMWdLO2n7EZeEwlItDlTyRwFhT
	BRqYTLpobIAN8VnIVcbywOVu1AMju0CDQQdx4RnSm5hvlrdJJCWCWzr/YwCAEdr2Jdrx
	oA2DNCipT7T3KSwA6tBVG+xhNlaQJm5C6cNUtqszs7213Ow8oS4HnYE9xkX/RB3Jlu+8
	O+GaOpzbDsIjrmsFKug4WK0vLuhgqTAEpEvChArU7OsLv17z78XMwi0rR5v0yvtUFMMP
	USP6BJX0vFy1iJb5tvLKJRLFj59320k4CNbtz5Xvtow/XG5HJE2zzOwS1k+e3IzES2/f
	U8lg==
X-Gm-Message-State: AElRT7EkKds3myqWeA5SyEr4tSiKRWFYbdxPTUGUeDUTAORpKBHDA3Sn
	xE4Q/T7e3AtiB+XcQfYJ1xyoUpE8
X-Google-Smtp-Source: AIpwx49GC47lxXAckL2P/7t6fEerdJ4zGETujiiR9YIT3V8Fpb85/IDy9RK3GYIBNlsyAH6MKS5ubQ==
X-Received: by 10.237.45.68 with SMTP id h62mr6256014qtd.179.1522253294692;
	Wed, 28 Mar 2018 09:08:14 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z50sm3084580qtj.92.2018.03.28.09.08.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Mar 2018 09:08:13 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Mar 2018 17:08:11 +0100
Message-Id: <20180328160811.22324-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [PATCH] ca-certificates: use relative symlinks from $ETCCERTSDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2018 16:08:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

update-ca-certificates symlinks (trusted) certificates
from $CERTSDIR or $LOCALCERTSDIR into $ETCCERTSDIR.
update-ca-certificates can call hook scripts installed
into /etc/ca-certificates/update.d. Those scripts are
passed the pem file in /etc/ssl/certs/ that was added or
removed in this run and those pem files are absolute
symlinks into $CERTSDIR or $LOCALCERTSDIR at the moment.

When running update-ca-certificates during image build
time, they thusly all point into the host's file system,
not into the $SYSROOT. This means:
* the host's file system layout must match the one
  produced by OE, and
* it also means that the host must have installed the same
  (or more) certificates as the target in $CERTSDIR and
  $LOCALCERTSDIR

This is a problem when wanting to execute hook scripts,
because they all need to be taught about $SYSROOT, and
behave differently depending on whether they're called
at image build time, or on the target, as otherwise they
will be trying to actually read the host's certificates
from $CERTSDIR or $LOCALCERTSDIR.

This also is a problem when running anything else during
image build time that depends on the trusted CA
certificates.

Changing the symlink to be relative solves all of these
problems. Do so.

Upstream-Status: Inappropriate [OE-specific]
Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 ...ertificates-use-relative-symlinks-from-ET.patch | 71 ++++++++++++++++++++++
 .../ca-certificates/ca-certificates_20170717.bb    |  4 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
new file mode 100644
index 0000000000..4bd967f788
--- /dev/null
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
@@ -0,0 +1,71 @@
+From a9fc13b2aee55655d58fcb77a3180fa99f96438a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Wed, 28 Mar 2018 16:45:05 +0100
+Subject: [PATCH] update-ca-certificates: use relative symlinks from
+ $ETCCERTSDIR
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+update-ca-certificates symlinks (trusted) certificates
+from $CERTSDIR or $LOCALCERTSDIR into $ETCCERTSDIR.
+update-ca-certificates can call hook scripts installed
+into /etc/ca-certificates/update.d. Those scripts are
+passed the pem file in /etc/ssl/certs/ that was added or
+removed in this run and those pem files are absolute
+symlinks into $CERTSDIR or $LOCALCERTSDIR at the moment.
+
+When running update-ca-certificates during image build
+time, they thusly all point into the host's file system,
+not into the $SYSROOT. This means:
+* the host's file system layout must match the one
+  produced by OE, and
+* it also means that the host must have installed the same
+  (or more) certificates as the target in $CERTSDIR and
+  $LOCALCERTSDIR
+
+This is a problem when wanting to execute hook scripts,
+because they all need to be taught about $SYSROOT, and
+behave differently depending on whether they're called
+at image build time, or on the target, as otherwise they
+will be trying to actually read the host's certificates
+from $CERTSDIR or $LOCALCERTSDIR.
+
+This also is a problem when running anything else during
+image build time that depends on the trusted CA
+certificates.
+
+Changing the symlink to be relative solves all of these
+problems. Do so.
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+---
+ sbin/update-ca-certificates | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
+index 00f80c7..7e911a9 100755
+--- a/sbin/update-ca-certificates
++++ b/sbin/update-ca-certificates
+@@ -29,6 +29,7 @@ CERTSDIR=$SYSROOT/usr/share/ca-certificates
+ LOCALCERTSDIR=$SYSROOT/usr/local/share/ca-certificates
+ CERTBUNDLE=ca-certificates.crt
+ ETCCERTSDIR=$SYSROOT/etc/ssl/certs
++FSROOT=../../../ # to get from $ETCCERTSDIR to the root of the file system
+ HOOKSDIR=$SYSROOT/etc/ca-certificates/update.d
+ 
+ while [ $# -gt 0 ];
+@@ -125,9 +126,10 @@ add() {
+   PEM="$ETCCERTSDIR/$(basename "$CERT" .crt | sed -e 's/ /_/g' \
+                                                   -e 's/[()]/=/g' \
+                                                   -e 's/,/_/g').pem"
+-  if ! test -e "$PEM" || [ "$(readlink "$PEM")" != "${CERT##$SYSROOT}" ]
++  DST="$(echo ${CERT} | sed -e "s|^$SYSROOT||" -e "s|^/|$FSROOT|" )"
++  if ! test -e "$PEM" || [ "$(readlink "$PEM")" != "${DST}" ]
+   then
+-    ln -sf "${CERT##$SYSROOT}" "$PEM"
++    ln -sf "${DST}" "$PEM"
+     echo "+$PEM" >> "$ADDED"
+   fi
+   # Add trailing newline to certificate, if it is missing (#635570)
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
index 51af72e79a..19c4571aac 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
@@ -21,7 +21,9 @@ SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://update-ca-certificates-support-Toybox.patch \
            file://default-sysroot.patch \
-           file://sbindir.patch"
+           file://sbindir.patch \
+           file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
+           "
 
 S = "${WORKDIR}/git"
 SYSROOT_DIRS_class-native += "${sysconfdir}"
-- 
2.16.2


