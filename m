Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5991670181
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:14:01 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id hz1so3530400pad.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=w0pPa0f5+9UXHCM9zVc1MlZhmmp8RvBxWHA1qqFLqdA=;
	b=MfLkEp58rzO3jJ5YHmWbJRcYcqRrgORfrI7r3+VxxkZphXaEnMsXdqpn47BUjzTtS3
	KejMi23FtIJpkOBPM7tl2fm39nNXtDGyLTpK5MqDAI1pTtIXCV4Xt6wqhsBrcdlr0Btg
	CQTCucVEQZ/jfozWr+glIELQvzKS0/MCczE2guFNpxgVK4SaxAlyOlm3zfobOSKXvXAD
	uOtw4G3fnYnW6ByT6c8dBAdGa1TQ0ymsrq3POpl2io30lAk6m09/KYsARmPQlSB1yI8T
	c6Xos9VEj0xHX6piv+pasCTe3DRA30xbX6TaAzzqLyQPHn0ERmsC21UtijcnSQ8ycLa9
	9XMg==
X-Gm-Message-State: ALoCoQkMrrKbcpC7gWXyKrUooU8qSCbTUrfRmKgs/lg3gxr5AGwQhTKdQj/0zGkgqmoiJrRFpEYi
X-Received: by 10.68.166.36 with SMTP id zd4mr23659791pbb.54.1405437241635;
	Tue, 15 Jul 2014 08:14:01 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	mz8sm18993030pdb.62.2014.07.15.08.14.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Jul 2014 08:14:01 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 08:13:58 -0700
Message-Id: <1405437238-28782-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] [v2] nettle: update to version 3.0
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
X-List-Received-Date: Tue, 15 Jul 2014 15:14:09 -0000

Updating to version 3.x
Version 3.x includes GPL v3 code. They call it dual
  licensing
Keeping 2.7.1 as it is GPL v2
Put common code in inc file

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/nettle/nettle.inc      | 27 +++++++++++++++++++++++++++
 meta/recipes-support/nettle/nettle_2.7.1.bb | 20 +++-----------------
 meta/recipes-support/nettle/nettle_3.0.bb   | 16 ++++++++++++++++
 3 files changed, 46 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-support/nettle/nettle.inc
 create mode 100644 meta/recipes-support/nettle/nettle_3.0.bb

diff --git a/meta/recipes-support/nettle/nettle.inc b/meta/recipes-support/nettle/nettle.inc
new file mode 100644
index 0000000..bca35c0
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle.inc
@@ -0,0 +1,27 @@
+SUMMARY = "A low level cryptographic library"
+HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
+SECTION = "libs"
+LICENSE = "LGPLv2.1 & GPLv2"
+
+# Version 2.7.1 is GPL v2
+# set PREFERRED_VERSION_nettle =  "2.7.1" in local.conf
+# if you want GPLv2 code
+#
+# Version 3.x is GPL v2 and v3
+
+
+DEPENDS += "gmp"
+
+SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
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
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
index 8aa5351..9ef9f64 100644
--- a/meta/recipes-support/nettle/nettle_2.7.1.bb
+++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
@@ -1,26 +1,12 @@
-SUMMARY = "A low level cryptographic library"
-HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
-SECTION = "libs"
+
+include nettle.inc
+
 LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
                     file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
 
-DEPENDS += "gmp"
-
-SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
 
 SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
 SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
 
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
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/nettle/nettle_3.0.bb b/meta/recipes-support/nettle/nettle_3.0.bb
new file mode 100644
index 0000000..bac2e71
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle_3.0.bb
@@ -0,0 +1,16 @@
+#
+# Nettle  3 and above contains GPL v3 code
+# use 2.7.1 if you do not want GPL v3 code
+#
+
+include nettle.inc
+
+LICENSE = "LGPLv2.1 & GPLv2 & GPLv3"
+
+LIC_FILES_CHKSUM = "file://COPYINGv3;md5=11cc2d3ee574f9d6b7ee797bdce4d423\
+                    file://serpent-decrypt.c;beginline=53;endline=67;md5=a4ccbeb343203d3586661f45c1cab577 \
+                    file://serpent-set-key.c;beginline=56;endline=70;md5=150b0ea44cdfb712a83331bff566e9a8"
+
+SRC_URI[md5sum] = "f64b1bf1e774b7ae6e507318e340250e"
+SRC_URI[sha256sum] = "9651c0bd2326eb737d0ed9eb403444712407c01a25b0fe813432ef31bebcd913"
+
-- 
1.9.1


