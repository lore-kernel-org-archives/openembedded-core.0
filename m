Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 61A7C6011C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 06:48:10 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id x1so28759424qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 22:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jU4748P2+8GnIKACpRqL5nYqmh2b647Qr0aVJwGJ60s=;
	b=EUNouIMoAj88o5kzepqgWt212VrqC/6m9K95MxE+AnRbKTJaJefPwgh9DQDn/urNdE
	FulUn+lEL0CTbTCtRMgixK/BEsZEa28kEHz2Ygya2KCDk+sQ5yKfQC7kX3eVCpluqzZE
	PRZfUd+vUZDZ33/bjapBM6+XwpsS3MqrdFnWZiCGkyIcCmjOfwZuUM6xXLLN5TxrBcee
	UNI6rtEWIciaQF52fR7dJKhgLDgYWtzpBBzq9lipar1VGDp4ugIurC4AVuOXCFXr+7mt
	e09WyesQThJvIJL3ILTiO9EzKKg0QH584vL3czWfRTp0B+z9dOGu/4H8TyHOKlrFRnB2
	uBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jU4748P2+8GnIKACpRqL5nYqmh2b647Qr0aVJwGJ60s=;
	b=GmpwGaQ7i6WpQWgV8IjozjtVbnXNXrF3qzGCNWlxRmZk5Z2kNa8/JGm1YW5m8AC/aa
	aBE2QsOnm+Lxq/ig9QOgPffmSNGqHHqlhPN3zQoYdfmEVOsuCjDyAJg6Ta5BeAYVVeyJ
	qvGaG82p6n8DWDFRdvwlyPoAdvThFNJtzAasSHDVDiSogB0bXMkd1/5VWlTsPIooImWa
	9ZqL+s9Rzf1cxd9iPdbPZpsUy88T2ajkpjrFGLRxowzsh+297l5pPoR+loyVutWNGP48
	RDY/GSHBdjrTjHlzWCCAl6q/wayQ9mTlUiP/A5tMaKUPJgBBwDxAhgJeXZvvlO5jSQp7
	PTBA==
X-Gm-Message-State: AG10YOQVN+0DaglzCJPI9PxN5YRztr/7CcjKHj3G6uOLy+OR6lurMHudTee0S3TfEI0NhQ==
X-Received: by 10.55.74.14 with SMTP id x14mr62392589qka.70.1456469290443;
	Thu, 25 Feb 2016 22:48:10 -0800 (PST)
Received: from nyx.sys.comcast.net (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	d65sm4779761qgf.30.2016.02.25.22.48.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 22:48:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 06:47:59 +0000
Message-Id: <1456469281-6333-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 1/3] gettext: Delete libintl.la file from install
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
X-List-Received-Date: Fri, 26 Feb 2016 06:48:10 -0000

gettext installs a libtool .la file for non-glibc systems
since it builds libintl for them unlike glibc where it finds that using
libc's gettext implementation is just fine. Same is not true for
musl even though musl provides itw own gettext implementation much on
then lines of glibc.

ideally gettetxt should be fixed to behave on musl, but at this time its
not clear if APIs are same and complete.

Deleting .la file helps compiling packages like util-linux when using
fstack-protections since it does not alter the order of libc on linker
cmdline

Moved src_uri checksums just below the SRC_URI as matter of formatting

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.19.6.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.19.6.bb b/meta/recipes-core/gettext/gettext_0.19.6.bb
index 737561d..488b633 100644
--- a/meta/recipes-core/gettext/gettext_0.19.6.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.6.bb
@@ -12,15 +12,15 @@ PROVIDES_class-native = "virtual/gettext-native"
 RCONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://parallel.patch \
-          "
+"
+
+SRC_URI[md5sum] = "6d1447f8c5c45c329371ef4bfe7d79a5"
+SRC_URI[sha256sum] = "ed4b4c19bd3a3034eb6769500a3592ff616759ef43cf30586dbb7a17c9dd695d"
 
 PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--disable-curses,ncurses,"
 
 LDFLAGS_prepend_libc-uclibc = " -lrt -lpthread "
 
-SRC_URI[md5sum] = "6d1447f8c5c45c329371ef4bfe7d79a5"
-SRC_URI[sha256sum] = "ed4b4c19bd3a3034eb6769500a3592ff616759ef43cf30586dbb7a17c9dd695d"
-
 inherit autotools texinfo
 
 EXTRA_OECONF += "--without-lispdir \
@@ -45,6 +45,7 @@ acpaths = '-I ${S}/gettext-runtime/m4 \
 do_install_append_libc-musl () {
 	rm -f ${D}${libdir}/charset.alias
 	rm -f ${D}${includedir}/libintl.h
+	rm -f ${D}${libdir}/libintl.la
 }
 
 # these lack the .x behind the .so, but shouldn't be in the -dev package
-- 
1.8.3.1


