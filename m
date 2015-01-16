Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id BEA7E72575
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 22:15:51 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id y19so22838491wgg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 14:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JfjDcPYY1RVAgWsZojMpH5anQHyAJ4fg4xbc+lZuNzo=;
	b=zTIfFw3AegyxffM9+V/ZXZHoKW/KKdgtD/app1hWiKnaq01+VKRX3wrKV7KIwTux/B
	ehZcr7BnXixVnGQ4NVgtHexjn2nInDYfN5XkoTzHChFd8vE5hwU8lWuQJR+KX+BsXtSX
	/yJ430d/bagmGt9/eZ+hdN32rsN9CLXLndQ7BThk6Mt/XRRuzkzNfFfElD88x9Zo7FpO
	v4K589OJfUzOpXXSg9ZHxyifbaN9ClB5Bii77t1/qrlO7/Iq6zbEIkc6QAsiH1UD8r3x
	OR+yV1dLjywla4dpk5Yb2q3YsUeto7FBL5Yaw6OfskLnp3cORPycd55mtz5oUSLXDqQb
	UW7g==
X-Received: by 10.194.62.235 with SMTP id b11mr6924173wjs.73.1421446551868;
	Fri, 16 Jan 2015 14:15:51 -0800 (PST)
Received: from nuc.betafive.co.uk
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by mx.google.com with ESMTPSA id x6sm7664547wjf.24.2015.01.16.14.15.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Jan 2015 14:15:51 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Jan 2015 22:15:28 +0000
Message-Id: <1421446529-24888-7-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1421446529-24888-1-git-send-email-paul@paulbarker.me.uk>
References: <1421446529-24888-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH V2 6/7] opkg: Backport improvements to opkg-key
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
X-List-Received-Date: Fri, 16 Jan 2015 22:15:52 -0000

The improvements to opkg-key made for v0.3.0 are backported. The rest of v0.3.0
needs further testing and bugfixing prior to release, but the improvements to
opkg-key have been tested and work well.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../opkg/0001-opkg-key-Backport-improvements.patch | 78 ++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.2.4.bb           |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg-key-Backport-improvements.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg-key-Backport-improvements.patch b/meta/recipes-devtools/opkg/opkg/0001-opkg-key-Backport-improvements.patch
new file mode 100644
index 0000000..ae319ce
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-opkg-key-Backport-improvements.patch
@@ -0,0 +1,78 @@
+From 87bec8300a1122829b2ed565db7da5bacfa88919 Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Sun, 12 Oct 2014 09:59:53 +0000
+Subject: [PATCH] opkg-key: Backport improvements
+
+The improvements to opkg-key made for v0.3.0 are backported. The rest of v0.3.0
+needs further testing and bugfixing prior to release, but the improvements to
+opkg-key have been tested and work well.
+
+    1) opkg-key: Add 'reset' option
+
+        This option removes the keyrings used to verify package signatures,
+        effectively resetting opkg to the initial state where it recognises no
+        keys.
+
+    2) opkg-key: Add 'populate' option
+
+        This option causes all keyrings in /usr/share/opkg/keyrings to be
+        imported. Thus distributions may install their keys into this directory
+        and use 'opkg-key populate' to ensure the correct keys are loaded.
+
+    3) opkg-key: Improve usage output
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+Upstream-status: Backport
+---
+ utils/opkg-key | 26 ++++++++++++++++++++++----
+ 1 file changed, 22 insertions(+), 4 deletions(-)
+
+diff --git a/utils/opkg-key b/utils/opkg-key
+index 266bb66..085f1e8 100755
+--- a/utils/opkg-key
++++ b/utils/opkg-key
+@@ -10,12 +10,17 @@ usage() {
+     echo
+     echo "Manage opkg's list of trusted keys"
+     echo
+-    echo "  opkg-key add <file>          - add the key contained in <file> ('-' for stdin)"
+-    echo "  opkg-key del <keyid>         - remove the key <keyid>"
+-    echo "  opkg-key list                - list keys"
++    echo "Commands and arguments:"
++    echo "  add <file>          - Add the key contained in <file> ('-' for stdin)"
++    echo "  del <keyid>         - Remove the key <keyid>"
++    echo "  list                - List keys"
++    echo "  fingerprint         - List keys with fingerprints"
++    echo "  reset               - Remove all keys, resetting the keyring"
++    echo "  populate            - Import keys from /usr/share/opkg/keyrings"
++    echo "  help                - Print this usage message and exit"
+     echo
+     echo "Options:"
+-    echo "  -o <root>  Use <root> as the offline root directory"
++    echo "  -o <root>           - Use <root> as the offline root directory"
+     echo
+ }
+ 
+@@ -64,6 +69,19 @@ case "$command" in
+         echo "Executing: $GPG $*"
+         $GPG $*
+         ;;
++    reset)
++        rm -f $ROOT/etc/opkg/trusted.gpg $ROOT/etc/opkg/trusted.gpg~
++        rm -f $ROOT/etc/opkg/secring.gpg $ROOT/etc/opkg/secring.gpg~
++        rm -f $ROOT/etc/opkg/trustdb.gpg $ROOT/etc/opkg/trustdb.gpg~
++        echo "OK"
++        ;;
++    populate)
++        for f in $ROOT/usr/share/opkg/keyrings/*.gpg; do
++            echo "Importing keys from '`basename $f`'..."
++            $GPG --quiet --batch --import "$f"
++        done
++        echo "OK"
++        ;;
+     help)
+         usage
+         ;;
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.2.4.bb b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
index 0369089..f6a971b 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch \
            file://opkg-configure.service \
            file://opkg.conf \
+           file://0001-opkg-key-Backport-improvements.patch \
 "
 
 S = "${WORKDIR}/${BPN}-${PV}"
-- 
1.9.1


