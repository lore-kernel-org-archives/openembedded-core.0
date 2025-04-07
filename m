Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476E5C369A3
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:40:59 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.43304.1744018854926141893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I6WE/4L5;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39149bccb69so3801100f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018853; x=1744623653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7qiBCaCsYrdM8Bzikp2EeKyslZ9K4+7MxnHuQM0Big=;
        b=I6WE/4L5VcfgL4Ba80L4Resy+VLQSiivS0DpdiSwBeYH3mqhVfH/62XQRL/jOmzfvU
         zmapr6ftbTfsv7so8KKlhL8wkRyBUabmLH0FYGA2PMgzGDdszEJPfV03G2IDan8ClJWd
         XykixAM/3cJ8Z2Fi7LMUqaDmHe99fA9G8HCHltIAXcN/pw42Stan9Z22UUTx3CTHmuam
         3fqLk7Tob9TH8TqbHfIcmVJYnluEd7B7OMf1sv9XtTXroWP92hDccosfbBqpp3+WWTc7
         NXJpVxvwN57p6A+EuyQqFlJFSaTcy8hr3lXePKloki0dGaJqnK3p1te+voMEdaYewTx+
         nS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018853; x=1744623653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7qiBCaCsYrdM8Bzikp2EeKyslZ9K4+7MxnHuQM0Big=;
        b=KT6v11RuHDg/rwVivpdrRpld+PmpTJgCgTPEQGu9CuSMnBPgvqgDyGAS4LN7KBpntc
         YhitZXWtCgI8YRS0kUyIq4Dgw0Jkb9HegdNFtenE73OsDCMTN7yB0GYupd5riOGgydJC
         GaXpJTRWqIcUhSKfIkIILA60keh81l/k/4xDzFg2MqWxSGqj3vwa78KexQXxsul3rLv8
         S07NJHbSOj8dIup4toSX2LfiCOGYwqbmv7mYH8YV2ZB0bpz/QvIzEse54g7ALKZCly+c
         mcnlOajlwFisqGm6a4y8WyJ9CkVBzZ9ZUO63TxBUQjlbEwYA8jTTarKgFq6LpHY1TtZo
         wrYg==
X-Gm-Message-State: AOJu0Yy7x/+FZ9oeONhcDt4mYMYWVOd2kwcf3igl4LcIpCKlXdVe+2rm
	2CNuNu1GcYRRDA4l1Nx3rrfup7QrPSKpjnDkAv3BJu8EF45WkKTUXcyBYA==
X-Gm-Gg: ASbGnctMo9BXsFN9MF1g7ypEz98C1VmKFFhpKZLRpzzenQgn0O7jvxB1N+22VlyYTn6
	23v9oEq/vboRxpfKjqhqscDOfZEfDb5A7F5sqdn5aFhZ8LzJVPWndyF23HUe8eSpDhRA9Uqj+pA
	Gg0b0MG4D6tASmDRs8ywQg+SMXiJWdYLRkHFi6KzWIlor+urMPAOOvDN/cEJ546vJEyMebdwl03
	UBMs4TM9+77EYUy9d4Ddo/9REmo9axZIzbL/MlfjiRXIEmPfCZla5HL6UC+Ab0l8p9NFwvnYk+S
	XF0+gqcLsDUorl5YIvOmIHaHf+9GUrATBKfUj1/JpGIsrxZ3FXNXIcaOtYDi8rNI2nB9DqVPIfc
	VJwpsWg==
X-Google-Smtp-Source: AGHT+IFy9fmSxYtEeZU6WWZsfbbRW57FHVe86W2UYUHIF7iu+UFLO8RTnOPEGoutjqdvgXzifgzqUA==
X-Received: by 2002:a5d:648c:0:b0:38d:d0ca:fbad with SMTP id ffacd0b85a97d-39d6fc48d22mr6130170f8f.14.1744018853144;
        Mon, 07 Apr 2025 02:40:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:40:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/18] ca-certificates: submit sysroot patch upstream, drop default-sysroot.patch
Date: Mon,  7 Apr 2025 11:40:33 +0200
Message-Id: <20250407094045.753021-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214415

From: Alexander Kanavin <alex@linutronix.de>

ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
was using a non-standard environment variable, and was replaced
with a patch that adds a command line option (and then this
was submitted upstream). ca-certificates recipe was tweaked accordingly,
and nothing else in core or meta-oe is using update-ca-certificates.

Drop default-sysroot.patch as the use case is unclear: sysroot
is explicitly specified in all known invocations of update-ca-certificate,
and if there's a place where it isn't, then update-ca-certificates
will error out trying to write to /etc, and should be fixed to
explicitly specify the sysroot.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ca-certificates-add-a-sysroot-option.patch | 36 ++++++++++++
 ...2-update-ca-certificates-use-SYSROOT.patch | 46 ---------------
 ...icates-use-relative-symlinks-from-ET.patch | 18 +++---
 .../ca-certificates/default-sysroot.patch     | 58 -------------------
 .../ca-certificates_20241223.bb               |  9 ++-
 5 files changed, 49 insertions(+), 118 deletions(-)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0002-sbin-update-ca-certificates-add-a-sysroot-option.patch
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0002-sbin-update-ca-certificates-add-a-sysroot-option.patch b/meta/recipes-support/ca-certificates/ca-certificates/0002-sbin-update-ca-certificates-add-a-sysroot-option.patch
new file mode 100644
index 00000000000..ba5bb69657e
--- /dev/null
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0002-sbin-update-ca-certificates-add-a-sysroot-option.patch
@@ -0,0 +1,36 @@
+From d6bb773745c2e95fd1a414e916fbed64e0d8df66 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 31 Mar 2025 17:42:25 +0200
+Subject: [PATCH] sbin/update-ca-certificates: add a --sysroot option
+
+This allows using the script in cross-compilation environments
+where the script needs to prefix the sysroot to every other
+directory it operates on. There are individual options
+to set those directories, but using a common prefix option
+instead is a lot less clutter and more robust.
+
+Upstream-Status: Submitted [https://salsa.debian.org/debian/ca-certificates/-/merge_requests/13]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ sbin/update-ca-certificates | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
+index 4bb77a0..1e737b9 100755
+--- a/sbin/update-ca-certificates
++++ b/sbin/update-ca-certificates
+@@ -59,6 +59,14 @@ do
+     --hooksdir)
+       shift
+       HOOKSDIR="$1";;
++    --sysroot)
++      shift
++      SYSROOT="$1"
++      CERTSCONF="$1/${CERTSCONF}"
++      CERTSDIR="$1/${CERTSDIR}"
++      LOCALCERTSDIR="$1/${LOCALCERTSDIR}"
++      ETCCERTSDIR="$1/${ETCCERTSDIR}"
++      HOOKSDIR="$1/${HOOKSDIR}";;
+     --help|-h|*)
+       echo "$0: [--verbose] [--fresh]"
+       exit;;
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch b/meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
deleted file mode 100644
index 48c69f0cbc0..00000000000
--- a/meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From cdb53438bae194c1281c31374a901ad7ee460408 Mon Sep 17 00:00:00 2001
-From: Andreas Oberritter <obi@opendreambox.org>
-Date: Tue, 19 Mar 2013 17:14:33 +0100
-Subject: [PATCH] update-ca-certificates: use $SYSROOT
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
----
- sbin/update-ca-certificates | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
-index 5a0a1da..36cdd9a 100755
---- a/sbin/update-ca-certificates
-+++ b/sbin/update-ca-certificates
-@@ -24,12 +24,12 @@
- verbose=0
- fresh=0
- default=0
--CERTSCONF=/etc/ca-certificates.conf
--CERTSDIR=/usr/share/ca-certificates
--LOCALCERTSDIR=/usr/local/share/ca-certificates
-+CERTSCONF=$SYSROOT/etc/ca-certificates.conf
-+CERTSDIR=$SYSROOT/usr/share/ca-certificates
-+LOCALCERTSDIR=$SYSROOT/usr/local/share/ca-certificates
- CERTBUNDLE=ca-certificates.crt
--ETCCERTSDIR=/etc/ssl/certs
--HOOKSDIR=/etc/ca-certificates/update.d
-+ETCCERTSDIR=$SYSROOT/etc/ssl/certs
-+HOOKSDIR=$SYSROOT/etc/ca-certificates/update.d
- 
- while [ $# -gt 0 ];
- do
-@@ -92,9 +92,9 @@ add() {
-   PEM="$ETCCERTSDIR/$(basename "$CERT" .crt | sed -e 's/ /_/g' \
-                                                   -e 's/[()]/=/g' \
-                                                   -e 's/,/_/g').pem"
--  if ! test -e "$PEM" || [ "$(readlink "$PEM")" != "$CERT" ]
-+  if ! test -e "$PEM" || [ "$(readlink "$PEM")" != "${CERT##$SYSROOT}" ]
-   then
--    ln -sf "$CERT" "$PEM"
-+    ln -sf "${CERT##$SYSROOT}" "$PEM"
-     echo "+$PEM" >> "$ADDED"
-   fi
-   # Add trailing newline to certificate, if it is missing (#635570)
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
index 214f88909a9..929945b56f9 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
@@ -1,4 +1,4 @@
-From 38d47c53749c6f16d5d7993410b256116e0ee0b8 Mon Sep 17 00:00:00 2001
+From a69933f96a8675369de702bdb55e57dc21f65e7f Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Wed, 28 Mar 2018 16:45:05 +0100
 Subject: [PATCH] update-ca-certificates: use relative symlinks from
@@ -45,26 +45,26 @@ Signed-off-by: André Draszik <andre.draszik@jci.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
-index f7d0dbf..97a589c 100755
+index 1e737b9..8510082 100755
 --- a/sbin/update-ca-certificates
 +++ b/sbin/update-ca-certificates
-@@ -29,6 +29,7 @@ CERTSDIR=$SYSROOT/usr/share/ca-certificates
- LOCALCERTSDIR=$SYSROOT/usr/local/share/ca-certificates
+@@ -30,6 +30,7 @@ LOCALCERTSDIR=/usr/local/share/ca-certificates
  CERTBUNDLE=ca-certificates.crt
- ETCCERTSDIR=$SYSROOT/etc/ssl/certs
+ ETCCERTSDIR=/etc/ssl/certs
+ HOOKSDIR=/etc/ca-certificates/update.d
 +FSROOT=../../../ # to get from $ETCCERTSDIR to the root of the file system
- HOOKSDIR=$SYSROOT/etc/ca-certificates/update.d
  
  while [ $# -gt 0 ];
-@@ -125,9 +126,10 @@ add() {
+ do
+@@ -100,9 +101,10 @@ add() {
    PEM="$ETCCERTSDIR/$(basename "$CERT" .crt | sed -e 's/ /_/g' \
                                                    -e 's/[()]/=/g' \
                                                    -e 's/,/_/g').pem"
--  if ! test -e "$PEM" || [ "$(readlink "$PEM")" != "${CERT##$SYSROOT}" ]
+-  if ! test -e "$PEM" || [ "$(readlink "$PEM")" != "$CERT" ]
 +  DST="$(echo ${CERT} | sed -e "s|^$SYSROOT||" -e "s|^/|$FSROOT|" )"
 +  if ! test -e "$PEM" || [ "$(readlink "$PEM")" != "${DST}" ]
    then
--    ln -sf "${CERT##$SYSROOT}" "$PEM"
+-    ln -sf "$CERT" "$PEM"
 +    ln -sf "${DST}" "$PEM"
      echo "+$PEM" >> "$ADDED"
    fi
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch b/meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch
deleted file mode 100644
index c2a54c00961..00000000000
--- a/meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 50aadd3eb1c4be43d3decdeb60cede2de5a687be Mon Sep 17 00:00:00 2001
-From: Christopher Larson <chris_larson@mentor.com>
-Date: Fri, 23 Aug 2013 12:26:14 -0700
-Subject: [PATCH] ca-certificates: add recipe (version 20130610)
-
-Upstream-Status: Pending
-
-update-ca-certificates: find SYSROOT relative to its own location
-
-This makes the script relocatable.
----
- sbin/update-ca-certificates | 33 +++++++++++++++++++++++++++++++++
- 1 file changed, 33 insertions(+)
-
-diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
-index 2d3e1fe..f7d0dbf 100755
---- a/sbin/update-ca-certificates
-+++ b/sbin/update-ca-certificates
-@@ -66,6 +66,39 @@ do
-   shift
- done
- 
-+if [ -z "$SYSROOT" ]; then
-+  local_which () {
-+    if [ $# -lt 1 ]; then
-+      return 1
-+    fi
-+
-+    (
-+      IFS=:
-+      for entry in $PATH; do
-+        if [ -x "$entry/$1" ]; then
-+          echo "$entry/$1"
-+          exit 0
-+        fi
-+      done
-+      exit 1
-+    )
-+  }
-+
-+  case "$0" in
-+    */*)
-+      sbindir=$(cd ${0%/*} && pwd)
-+      ;;
-+    *)
-+      sbindir=$(cd $(dirname $(local_which $0)) && pwd)
-+      ;;
-+  esac
-+  prefix=${sbindir%/*}
-+  SYSROOT=${prefix%/*}
-+  if [ ! -d "$SYSROOT/usr/share/ca-certificates" ]; then
-+    SYSROOT=
-+  fi
-+fi
-+
- if [ ! -s "$CERTSCONF" ]
- then
-   fresh=1
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb b/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
index bbdc7dd68d3..676e9e0c78a 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
@@ -16,9 +16,8 @@ PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
 SRC_URI[sha256sum] = "dd8286d0a9dd35c756fea5f1df3fed1510fb891f376903891b003cd9b1ad7e03"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
-           file://0002-update-ca-certificates-use-SYSROOT.patch \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
-           file://default-sysroot.patch \
+           file://0002-sbin-update-ca-certificates-add-a-sysroot-option.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
            file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch \
            "
@@ -62,7 +61,7 @@ do_install:append:class-target () {
 }
 
 pkg_postinst:${PN}:class-target () {
-    SYSROOT="$D" $D${sbindir}/update-ca-certificates
+    $D${sbindir}/update-ca-certificates --sysroot $D
 }
 
 CONFFILES:${PN} += "${sysconfdir}/ca-certificates.conf"
@@ -71,11 +70,11 @@ CONFFILES:${PN} += "${sysconfdir}/ca-certificates.conf"
 # we just run update-ca-certificate from do_install() for nativesdk.
 CONFFILES:${PN}:append:class-nativesdk = " ${sysconfdir}/ssl/certs/ca-certificates.crt"
 do_install:append:class-nativesdk () {
-    SYSROOT="${D}${SDKPATHNATIVE}" ${D}${sbindir}/update-ca-certificates
+    ${D}${sbindir}/update-ca-certificates --sysroot ${D}${SDKPATHNATIVE}
 }
 
 do_install:append:class-native () {
-    SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-certificates
+    ${D}${sbindir}/update-ca-certificates --sysroot ${D}${base_prefix}
 }
 
 RDEPENDS:${PN}:append:class-target = " openssl-bin openssl"
-- 
2.39.5


