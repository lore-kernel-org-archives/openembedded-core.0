Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 67BFA758BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 19:30:30 +0000 (UTC)
Received: by qkca135 with SMTP id a135so3205878qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 12:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/TlW2Ifc7f1shatD9Iq5wZgDK0lBFzOhB/r0UmlUjUE=;
	b=eQl2DVetWDuIYCXsZgkpEDLzSBlqIlQ4GLf941tNE4Gum0wHT3o1258evsynPUMGUE
	DpUFb01pyNbz1cjmdF+YfMh7oq8aUGtIgCxyco/QDAxXjdrcJER7B5i1Cjqi2IBiYL4P
	QdEBMRvfGDhvQ9EYyVTE7wSNhIVG3z6c4oiVKqNrMVGmUqOKK9rlWlpqI8B663ltdYpF
	XnqSM3i34amazBEd9NVchRxPLQsx/CH3gfn5dJPygcZsoaXhTsJjqj9G+5/Gex7ADjra
	Y3edxAX8gB/3ahh8aOgJq35AT8yosf/rEPNcZpeTUBE4ODyQijzNolMJg+ZFGmipNmUx
	fObA==
X-Received: by 10.229.214.195 with SMTP id hb3mr29456377qcb.0.1433878231736;
	Tue, 09 Jun 2015 12:30:31 -0700 (PDT)
Received: from Pahoa2.mvista.com (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id 138sm3074610qhx.18.2015.06.09.12.30.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jun 2015 12:30:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jun 2015 12:30:24 -0700
Message-Id: <1433878226-21350-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1433878226-21350-1-git-send-email-akuster808@gmail.com>
References: <1433878226-21350-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 1/3] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Tue, 09 Jun 2015 19:30:30 -0000

this requires the gnutls 3.4.1  update or the current gnutils build will break.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/nettle/nettle_2.7.1.bb | 26 --------------------------
 meta/recipes-support/nettle/nettle_3.1.1.bb | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-support/nettle/nettle_2.7.1.bb
 create mode 100644 meta/recipes-support/nettle/nettle_3.1.1.bb

diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
deleted file mode 100644
index f53afcc..0000000
--- a/meta/recipes-support/nettle/nettle_2.7.1.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "A low level cryptographic library"
-HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
-SECTION = "libs"
-LICENSE = "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
-                    file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
-
-DEPENDS += "gmp"
-
-SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
-SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
-
-EXTRA_OECONF = "--disable-openssl"
-
-do_configure_prepend() {
-       if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
-               cp ${S}/aclocal.m4 ${S}/acinclude.m4
-       fi
-}
-
-inherit autotools
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/nettle/nettle_3.1.1.bb b/meta/recipes-support/nettle/nettle_3.1.1.bb
new file mode 100644
index 0000000..ce5e756
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle_3.1.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "A low level cryptographic library"
+HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
+SECTION = "libs"
+LICENSE = "GPLv2+ & GPLv3 & LGPLv3+"
+LIC_FILES_CHKSUM = "file://COPYINGv2;beginline=1;endline=2;md5=c70d8d3310941dcdfcd1e02800a1f548 \
+                    file://COPYINGv3;beginline=1;endline=2;md5=d1c727712ceba52db52e0ee449cadf43  \
+                    file://COPYING.LESSERv3;beginline=1;endline=2;md5=ff44a06d461487fb65f84ad672a1d1c8"
+
+DEPENDS += "gmp"
+
+SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "b40fa88dc32f37a182b6b42092ebb144"
+SRC_URI[sha256sum] = "5fd4d25d64d8ddcb85d0d897572af73b05b4d163c6cc49438a5bfbb8ff293d4c"
+
+EXTRA_OECONF = "--disable-openssl"
+
+do_configure_prepend() {
+       if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
+               cp ${S}/aclocal.m4 ${S}/acinclude.m4
+       fi
+}
+
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.3.5


