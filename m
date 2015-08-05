Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1A2A660017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 23:08:47 +0000 (UTC)
Received: by pabxd6 with SMTP id xd6so29035027pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 16:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0uFee78BTNs1qNJnrFNkM2gbyh9Bn0frKaz7Yt0R5Gk=;
	b=xdN2FwLId26a7SCik+ldnIvJHUK/znSGf6Chcj/NZG2THVwV4i6cCJPWlN4M31zpC0
	GYXsl9tT5fVtHYj7i1xocAjgeeSMHq+hEhlJJ41Y3AIscMgZEm8LBMmRpsZ57hZ9Cnbv
	0QAlTLPrQcouTeCIncPNFGi3c1cKBvb47u1XvygSRXDwz11S3EZLoaDZUZoYeOI3pnpj
	L9z3lbEMWmQKwcDDYZFuW80DWAMm2RpUhb7aGB4XB7siPHBn4lIE7eXmkUYH/vuINMQl
	VCouhEHQcr2R9mokW80nnsoEznSFhAogsApIzCUY/ctkx/EyBx15JZqkDmfxfa4ajjG8
	hdtw==
X-Received: by 10.66.139.138 with SMTP id qy10mr24848587pab.30.1438816127891; 
	Wed, 05 Aug 2015 16:08:47 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	au10sm4095822pbd.33.2015.08.05.16.08.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Aug 2015 16:08:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Aug 2015 16:08:38 -0700
Message-Id: <1438816118-21346-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] ca-certificates: Update 20141019 -> 20150426
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
X-List-Received-Date: Wed, 05 Aug 2015 23:08:50 -0000

Older SRCREV was not fetchable which triggered this upgrade

Change-Id: I85d028294ff0018f4c81c6bb81ae262b18af7a87
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ertificates-don-t-use-Debianisms-in-run-p.patch | 31 ++++++++--------
 .../0002-update-ca-certificates-use-SYSROOT.patch  | 41 +++++++++-------------
 .../ca-certificates/default-sysroot.patch          | 10 +++---
 ...tes_20141019.bb => ca-certificates_20150426.bb} |  4 +--
 4 files changed, 37 insertions(+), 49 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20141019.bb => ca-certificates_20150426.bb} (97%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
index d7d487e..4b4b287 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
@@ -13,21 +13,18 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  sbin/update-ca-certificates | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
-diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
-index fed9c25..29ecc69 100755
---- a/sbin/update-ca-certificates
-+++ b/sbin/update-ca-certificates
-@@ -186,9 +186,7 @@ echo "$ADDED_CNT added, $REMOVED_CNT removed; done."
+Index: git/sbin/update-ca-certificates
+===================================================================
+--- git.orig/sbin/update-ca-certificates
++++ git/sbin/update-ca-certificates
+@@ -191,9 +191,7 @@ if [ -d "$HOOKSDIR" ]
+ then
  
- HOOKSDIR=$SYSROOT/etc/ca-certificates/update.d
- echo -n "Running hooks in $HOOKSDIR...."
--VERBOSE_ARG=
--[ "$verbose" = 0 ] || VERBOSE_ARG=--verbose
--eval run-parts $VERBOSE_ARG --test -- $HOOKSDIR | while read hook
-+eval run-parts --test $HOOKSDIR | while read hook
- do
-   ( cat $ADDED
-     cat $REMOVED ) | $hook || echo E: $hook exited with code $?.
--- 
-2.1.4
-
+   echo "Running hooks in $HOOKSDIR..."
+-  VERBOSE_ARG=
+-  [ "$verbose" = 0 ] || VERBOSE_ARG="--verbose"
+-  eval run-parts "$VERBOSE_ARG" --test -- "$HOOKSDIR" | while read hook
++  eval run-parts --test -- "$HOOKSDIR" | while read hook
+   do
+     ( cat "$ADDED"
+       cat "$REMOVED" ) | "$hook" || echo "E: $hook exited with code $?."
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch b/meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
index f4c84fe..792b403 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
@@ -10,14 +10,14 @@ Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
  sbin/update-ca-certificates |   14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
 
-diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
-index c567e3d..923b68a 100755
---- a/sbin/update-ca-certificates
-+++ b/sbin/update-ca-certificates
-@@ -37,11 +37,11 @@ do
-   shift
- done
-
+Index: git/sbin/update-ca-certificates
+===================================================================
+--- git.orig/sbin/update-ca-certificates
++++ git/sbin/update-ca-certificates
+@@ -24,12 +24,12 @@
+ verbose=0
+ fresh=0
+ default=0
 -CERTSCONF=/etc/ca-certificates.conf
 -CERTSDIR=/usr/share/ca-certificates
 -LOCALCERTSDIR=/usr/local/share/ca-certificates
@@ -26,11 +26,13 @@ index c567e3d..923b68a 100755
 +LOCALCERTSDIR=$SYSROOT/usr/local/share/ca-certificates
  CERTBUNDLE=ca-certificates.crt
 -ETCCERTSDIR=/etc/ssl/certs
+-HOOKSDIR=/etc/ca-certificates/update.d
 +ETCCERTSDIR=$SYSROOT/etc/ssl/certs
-
- cleanup() {
-   rm -f "$TEMPBUNDLE"
-@@ -64,9 +64,9 @@ add() {
++HOOKSDIR=$SYSROOT/etc/ca-certificates/update.d
+ 
+ while [ $# -gt 0 ];
+ do
+@@ -92,9 +92,9 @@ add() {
    PEM="$ETCCERTSDIR/$(basename "$CERT" .crt | sed -e 's/ /_/g' \
                                                    -e 's/[()]/=/g' \
                                                    -e 's/,/_/g').pem"
@@ -39,17 +41,6 @@ index c567e3d..923b68a 100755
    then
 -    ln -sf "$CERT" "$PEM"
 +    ln -sf "${CERT##$SYSROOT}" "$PEM"
-     echo +$PEM >> "$ADDED"
+     echo "+$PEM" >> "$ADDED"
    fi
-   cat "$CERT" >> "$TEMPBUNDLE"
-@@ -148,7 +148,7 @@ mv -f "$TEMPBUNDLE" "$CERTBUNDLE"
-
- echo "$ADDED_CNT added, $REMOVED_CNT removed; done."
-
--HOOKSDIR=/etc/ca-certificates/update.d
-+HOOKSDIR=$SYSROOT/etc/ca-certificates/update.d
- echo -n "Running hooks in $HOOKSDIR...."
- VERBOSE_ARG=
- [ "$verbose" = 0 ] || VERBOSE_ARG=--verbose
---
-1.7.10.4
+   # Add trailing newline to certificate, if it is missing (#635570)
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch b/meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch
index 6a5d6da..f8b0791 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch
@@ -8,11 +8,10 @@ Index: git/sbin/update-ca-certificates
 ===================================================================
 --- git.orig/sbin/update-ca-certificates
 +++ git/sbin/update-ca-certificates
-@@ -37,6 +37,39 @@ do
+@@ -66,6 +66,39 @@ do
    shift
  done
  
-+ 
 +if [ -z "$SYSROOT" ]; then
 +  local_which () {
 +    if [ $# -lt 1 ]; then
@@ -45,6 +44,7 @@ Index: git/sbin/update-ca-certificates
 +    SYSROOT=
 +  fi
 +fi
- CERTSCONF=$SYSROOT/etc/ca-certificates.conf
- CERTSDIR=$SYSROOT/usr/share/ca-certificates
- LOCALCERTSDIR=$SYSROOT/usr/local/share/ca-certificates
++
+ if [ ! -s "$CERTSCONF" ]
+ then
+   fresh=1
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20141019.bb b/meta/recipes-support/ca-certificates/ca-certificates_20150426.bb
similarity index 97%
rename from meta/recipes-support/ca-certificates/ca-certificates_20141019.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20150426.bb
index cc58e4d..716e3df 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20141019.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20150426.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=48d2baf97986999e776b43c8dd9e0c5a
 DEPENDS = "ca-certificates-native"
 DEPENDS_class-native = ""
 
-# tag: debian/20140325 + 2
-SRCREV = "2b8a047c78aadbecd90bf8e49ccf68898a211610"
+# tag: debian/20150426 + 2
+SRCREV = "d4790d2832aaac9152f450e06661511067592227"
 
 SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
            file://0001-update-ca-certificates-remove-c-rehash.patch \
-- 
2.1.4


