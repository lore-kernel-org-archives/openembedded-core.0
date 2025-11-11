Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4B3CD13D3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:59:09 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19450.1762873146656051981
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eaUGWGs3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3436a97f092so4166287a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873146; x=1763477946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wulw7insuv7q7rdd9IaOYah76nzapU+cDAsnRhHZjcI=;
        b=eaUGWGs3OtYo7mClCQMCSUVvvBwhcqUSkvvdTZB2IfNsDvl2g5cnVaj9HyXAc00/rY
         ibtMswolb45vLFmgl2tmviBQHKGlGjBkIoWYIZIzTc23u/crUyXnoevqU6x2brjCCuE/
         /jI2ZC4vjlUN4Z3xAB1xyyZOrl2U6FCQlmgIV7/fOZpTfLe5S6xWI4DaR/IoCjnTLhcN
         qte6a2xk/U9Vk99MmyyggHxGHdGKZyhq13tMgnIFWQQNjfqZwpwbr8WHXCvaqkrGJLkF
         ksJgIUHCtwGj67BC8TXnh6EcWYu4xvf4KaJjqKbgld0P403cqObhGngk0xK6tp8i9aua
         CH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873146; x=1763477946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wulw7insuv7q7rdd9IaOYah76nzapU+cDAsnRhHZjcI=;
        b=N+/mhMSayuzXbRqCPIGau99AzfPm3fkmswCjhO3Ni9ExmyON7Ws9dRpa4Vge6EsNRX
         alFt0oZoHbzh1+Oa50kMMq+GAOYuKWJkhiL/rsDqWUh+l7mHvz20+Ec66dU9RfekpVzJ
         baCTa8mCczFZheI/8eX4DZDf6B5J53h4oj7PqAWq9rnDTWjO2tmAB5jzh7iGlKZbq1vi
         OvZmQtBwys2ed4H4WuBBCAjI/23uCG5Kz84Gfa7Cnb0uoLZpWScvLbFn/LDR/NyTBzfv
         Dx8uvf/KYUPRonUjsDxvCIPjan6dqADyzSaUVNaAywK13+XWyI7Yb/Mvz6uej3/eozAj
         jT6g==
X-Gm-Message-State: AOJu0YwRBvmIso6hMRySpth28ujRmnhxefrQEhNw3M/s4q7pI4Q25kFy
	KWjf80z4EfvwTMlgWPPbM118Z31pyKw7dDUmwSx5aaBZSrhRGi46Er/mHw5TVUUPVJQ1ysD6whU
	7cLPCdNg=
X-Gm-Gg: ASbGncuxMFxjvtWay1PJdC1mGj/YRXFun68ClbXz+iqbLOrAnzzXP1FZ3lwq0lrQStk
	eQ7+SZtAZ/l1aAcY/NE763C+WmRsWJLxLqfAR2kLlwRuG2Sj5ddmRZF4qQR83OTaV36ZEc/vF3f
	l/kBSSfdd53HFj9z+npyAaz/up2y0TZMUWrEWPfUqTrvc7M8g64p8T2iN0hup9HH/9o6QwZffDF
	30WGQ+yohbHELG/hTpf8EVkwL4FtWsZx0/xIAYTMM6s6hPUKNukr0yRpIdsrxsQAAwzqaDyryIH
	f+kH0C72JD7jjWvPPbIpeSZDsTSETCedQglktDrt/FzbVlR/V7oaJ19YEba3cPofq/09BrDFmU6
	7WLYN9C//69eQkuj0AZ7I3UHRF5RVACQhDwOOOCx0zcOqH31lgUgDPsOVjYtx8Cw4LHh6Q7svFw
	fvKw==
X-Google-Smtp-Source: AGHT+IHpt1ePUni1NMc2sPQ8ltk9ZY7tTNIZ3VO1yWgFTSOp7kmLfzdhHzy+CrgvjRapaT1V4N8x/w==
X-Received: by 2002:a17:90b:2fc5:b0:340:e517:4e05 with SMTP id 98e67ed59e1d1-3436cb3e5a6mr19484587a91.12.1762873145845;
        Tue, 11 Nov 2025 06:59:05 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.59.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:59:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/19] ca-certificates: submit sysroot patch upstream, drop default-sysroot.patch
Date: Tue, 11 Nov 2025 06:58:23 -0800
Message-ID: <a80185fd72a2be183783b0e464c07f1043d7dd37.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226180

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 90d9f0ba674d4fe8e9291f0513c13dff3775c545)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 0000000000..ba5bb69657
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
index 48c69f0cbc..0000000000
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
index 214f88909a..929945b56f 100644
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
index c2a54c0096..0000000000
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
index bbdc7dd68d..676e9e0c78 100644
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
2.43.0


