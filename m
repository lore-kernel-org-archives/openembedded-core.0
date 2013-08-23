Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 344C16A5A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 17:38:55 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id g10so932171pdj.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 10:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=y6NeFlpyw5Ukzf87lgYFKZRErVebUOOpmEerrmrzfn0=;
	b=eK4yC+xtrQjdkJx0JlCbSEWW9/zT40RUtrIpiIgCwccAPvWhuX6Tv9/tpoV8kwQUPf
	P+nMAh50tcK4JICtSYeW4CDwT7XLV2doHlZ7QMcV+UXCoeZG3QuWEF65/PvO1rT0zKuO
	AfDhdhg43uFw7u4otQRnYgEZETeeURnWUiJaOSrzmb1eLOXoXJ2SwKXcKnYpYuR/d+3D
	lzGDOLalcGs2+iuc7gZ4KHrx6+/fiYfOLqWOvRxIhMzbc/++cSjGWHkGTmEOAGS7/eEy
	vGqQXqWJLol99SXhyNca66rbRJ+I3S0Mi4JdQDNbN3vmXgo8Z6NVgHB++6EvM9qSOPSA
	AKlw==
X-Received: by 10.69.16.99 with SMTP id fv3mr920743pbd.60.1377279536060;
	Fri, 23 Aug 2013 10:38:56 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id pu5sm2322877pac.21.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 10:38:54 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 10:38:56 -0700
Message-Id: <ded65f847b33854db8775f6d0a6ad5f9d8b92dbc.1377279474.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1377279474.git.chris_larson@mentor.com>
References: <cover.1377279474.git.chris_larson@mentor.com>
In-Reply-To: <cover.1377279474.git.chris_larson@mentor.com>
References: <cover.1377279474.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 1/2] ca-certificates: add recipe (version 20130610)
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
X-List-Received-Date: Fri, 23 Aug 2013 17:38:55 -0000

From: Christopher Larson <chris_larson@mentor.com>

We need this for certain nativesdk recipes, as we can't rely on the
certificate path or bundle path being the same across distros, and it's useful
in many cases on the target as well.

This is based on the 20130119 recipe from meta-oe, with the following changes:

- use the debian git repository to avoid vanishing sources
- obey our target paths
- default to a sysroot relative to the script location (make relocatable)
- define SUMMARY
- don't inherit autotools, this isn't an autotools package
- add MPL-2.0 to LICENSE, as that's the license of the certdata
- install the script man page
- use a native rather than cross recipe, as it's not bound in any way to the
  target system
- add nativesdk to bbclassextend, for use in SDKs

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 ...01-update-ca-certificates-remove-c-rehash.patch | 46 ++++++++++++++++
 .../0002-update-ca-certificates-use-SYSROOT.patch  | 55 +++++++++++++++++++
 .../ca-certificates/default-sysroot.patch          | 55 +++++++++++++++++++
 .../ca-certificates/ca-certificates/sbindir.patch  | 20 +++++++
 .../ca-certificates/ca-certificates_20130610.bb    | 63 ++++++++++++++++++++++
 5 files changed, 239 insertions(+)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates_20130610.bb

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch
new file mode 100644
index 0000000..bf02723
--- /dev/null
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch
@@ -0,0 +1,46 @@
+Upstream-Status: Pending
+
+From 111e905fe931da1a3800accfc675cc01c8ee080c Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf@emagii.com>
+Date: Tue, 28 Feb 2012 06:42:58 +0100
+Subject: [PATCH] update-ca-certificates: remove c rehash
+
+Updated earlier patch to apply clean on 2012-02-12
+Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
+---
+ sbin/update-ca-certificates |   20 ++++++++++----------
+ 1 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
+index 5375950..c567e3d 100755
+--- a/sbin/update-ca-certificates
++++ b/sbin/update-ca-certificates
+@@ -132,16 +132,16 @@ rm -f "$CERTBUNDLE"
+ ADDED_CNT=$(wc -l < "$ADDED")
+ REMOVED_CNT=$(wc -l < "$REMOVED")
+
+-if [ "$ADDED_CNT" -gt 0 ] || [ "$REMOVED_CNT" -gt 0 ]
+-then
+-  # only run if set of files has changed
+-  if [ "$verbose" = 0 ]
+-  then
+-    c_rehash . > /dev/null
+-  else
+-    c_rehash .
+-  fi
+-fi
++#if [ "$ADDED_CNT" -gt 0 ] || [ "$REMOVED_CNT" -gt 0 ]
++#then
++#  # only run if set of files has changed
++#  if [ "$verbose" = 0 ]
++#  then
++#    c_rehash . > /dev/null
++#  else
++#    c_rehash .
++#  fi
++#fi
+
+ chmod 0644 "$TEMPBUNDLE"
+ mv -f "$TEMPBUNDLE" "$CERTBUNDLE"
+--
+1.7.4.1
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch b/meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
new file mode 100644
index 0000000..f4c84fe
--- /dev/null
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
@@ -0,0 +1,55 @@
+Upstream-Status: Pending
+
+From 724cb153ca0f607fb38b3a8db3ebb2742601cd81 Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Tue, 19 Mar 2013 17:14:33 +0100
+Subject: [PATCH 2/2] update-ca-certificates: use $SYSROOT
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+---
+ sbin/update-ca-certificates |   14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
+index c567e3d..923b68a 100755
+--- a/sbin/update-ca-certificates
++++ b/sbin/update-ca-certificates
+@@ -37,11 +37,11 @@ do
+   shift
+ done
+
+-CERTSCONF=/etc/ca-certificates.conf
+-CERTSDIR=/usr/share/ca-certificates
+-LOCALCERTSDIR=/usr/local/share/ca-certificates
++CERTSCONF=$SYSROOT/etc/ca-certificates.conf
++CERTSDIR=$SYSROOT/usr/share/ca-certificates
++LOCALCERTSDIR=$SYSROOT/usr/local/share/ca-certificates
+ CERTBUNDLE=ca-certificates.crt
+-ETCCERTSDIR=/etc/ssl/certs
++ETCCERTSDIR=$SYSROOT/etc/ssl/certs
+
+ cleanup() {
+   rm -f "$TEMPBUNDLE"
+@@ -64,9 +64,9 @@ add() {
+   PEM="$ETCCERTSDIR/$(basename "$CERT" .crt | sed -e 's/ /_/g' \
+                                                   -e 's/[()]/=/g' \
+                                                   -e 's/,/_/g').pem"
+-  if ! test -e "$PEM" || [ "$(readlink "$PEM")" != "$CERT" ]
++  if ! test -e "$PEM" || [ "$(readlink "$PEM")" != "${CERT##$SYSROOT}" ]
+   then
+-    ln -sf "$CERT" "$PEM"
++    ln -sf "${CERT##$SYSROOT}" "$PEM"
+     echo +$PEM >> "$ADDED"
+   fi
+   cat "$CERT" >> "$TEMPBUNDLE"
+@@ -148,7 +148,7 @@ mv -f "$TEMPBUNDLE" "$CERTBUNDLE"
+
+ echo "$ADDED_CNT added, $REMOVED_CNT removed; done."
+
+-HOOKSDIR=/etc/ca-certificates/update.d
++HOOKSDIR=$SYSROOT/etc/ca-certificates/update.d
+ echo -n "Running hooks in $HOOKSDIR...."
+ VERBOSE_ARG=
+ [ "$verbose" = 0 ] || VERBOSE_ARG=--verbose
+--
+1.7.10.4
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch b/meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch
new file mode 100644
index 0000000..7e0ee4c
--- /dev/null
+++ b/meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch
@@ -0,0 +1,55 @@
+Upstream-Status: Pending
+
+update-ca-certificates: find SYSROOT relative to its own location
+
+This makes the script relocatable.
+
+--- ca-certificates-20130119.orig/sbin/update-ca-certificates
++++ ca-certificates-20130119/sbin/update-ca-certificates
+@@ -37,11 +37,44 @@ do
+   shift
+ done
+
+-CERTSCONF=$SYSROOT/etc/ca-certificates.conf
++if [ -z "$SYSROOT" ]; then
++  local_which () {
++    if [ $# -lt 1 ]; then
++      return 1
++    fi
++
++    (
++      IFS=:
++      for entry in $PATH; do
++        if [ -x "$entry/$1" ]; then
++          echo "$entry/$1"
++          exit 0
++        fi
++      done
++      exit 1
++    )
++  }
++
++  case "$0" in
++    */*)
++      sbindir=$(cd ${0%/*} && pwd)
++      ;;
++    *)
++      sbindir=$(cd $(dirname $(local_which $0)) && pwd)
++      ;;
++  esac
++  prefix=${sbindir%/*}
++  SYSROOT=${prefix%/*}
++  if [ ! -d "$SYSROOT/usr/share/ca-certificates" ]; then
++    SYSROOT=
++  fi
++fi
++
+ CERTSDIR=$SYSROOT/usr/share/ca-certificates
++CERTSCONF=$SYSROOT/etc/ca-certificates.conf
++ETCCERTSDIR=$SYSROOT/etc/ssl/certs
+ LOCALCERTSDIR=$SYSROOT/usr/local/share/ca-certificates
+ CERTBUNDLE=ca-certificates.crt
+-ETCCERTSDIR=$SYSROOT/etc/ssl/certs
+
+ cleanup() {
+   rm -f "$TEMPBUNDLE"
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch b/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
new file mode 100644
index 0000000..a113fa8
--- /dev/null
+++ b/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Pending
+
+Let us alter the install destination of the script via SBINDIR
+
+--- ca-certificates-20130119.orig/sbin/Makefile
++++ ca-certificates-20130119/sbin/Makefile
+@@ -3,9 +3,12 @@
+ #
+ #
+
++SBINDIR = /usr/sbin
++
+ all:
+
+ clean:
+
+ install:
+-	install -m755 update-ca-certificates $(DESTDIR)/usr/sbin/
++	install -d $(DESTDIR)$(SBINDIR)
++	install -m755 update-ca-certificates $(DESTDIR)$(SBINDIR)/
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb b/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb
new file mode 100644
index 0000000..053fbbe
--- /dev/null
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb
@@ -0,0 +1,63 @@
+SUMMARY = "Common CA certificates"
+DESCRIPTION = "This package includes PEM files of CA certificates to allow \
+SSL-based applications to check for the authenticity of SSL connections."
+HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
+SECTION = "misc"
+LICENSE = "GPL-2.0+ & MPL-2.0"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=d8fc4ed45f01c31c87c9b496d4babcae"
+
+# This is needed to ensure we can run the postinst at image creation time
+DEPENDS = "ca-certificates-native"
+DEPENDS_class-native = ""
+
+# tag: debian/20130610
+SRCREV = "9f3c12784eaee1e2b005a23ce8b5c38e1e851404"
+
+SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
+           file://0001-update-ca-certificates-remove-c-rehash.patch \
+           file://0002-update-ca-certificates-use-SYSROOT.patch \
+           file://default-sysroot.patch \
+           file://sbindir.patch"
+S = "${WORKDIR}/git"
+
+inherit allarch
+
+EXTRA_OEMAKE = "\
+    'CERTSDIR=${datadir}/ca-certificates' \
+    'SBINDIR=${sbindir}' \
+"
+
+do_install () {
+    install -d ${D}${datadir}/ca-certificates \
+               ${D}${sysconfdir}/ssl/certs \
+               ${D}${sysconfdir}/ca-certificates/update.d
+    oe_runmake 'DESTDIR=${D}' install
+
+    install -d ${D}${mandir}/man8
+    install -m 0644 sbin/update-ca-certificates.8 ${D}${mandir}/man8/
+
+    install -d ${D}${sysconfdir}
+    {
+        echo "# Lines starting with # will be ignored"
+        echo "# Lines starting with ! will remove certificate on next update"
+        echo "#"
+        find ${D}${datadir}/ca-certificates -type f -name '*.crt' | \
+            sed 's,^${D}${datadir}/ca-certificates/,,'
+    } >${D}${sysconfdir}/ca-certificates.conf
+}
+
+do_install_class-target () {
+    sed -i -e 's,/etc/,${sysconfdir}/,' \
+           -e 's,/usr/share/,${datadir}/,' \
+           -e 's,/usr/local,${prefix}/local,' \
+        ${D}${sbindir}/update-ca-certificates \
+        ${D}${mandir}/man8/update-ca-certificates.8
+}
+
+pkg_postinst_${PN} () {
+    SYSROOT="$D" update-ca-certificates
+}
+
+CONFFILES_${PN} += "${sysconfdir}/ca-certificates.conf"
+
+BBCLASSEXTEND += "native nativesdk"
-- 
1.8.3.4


