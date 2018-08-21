Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id E734274601
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 00:47:33 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id a26-v6so7620055pfo.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 17:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=cO/WbKJlGUINf5zQOwG6sLuaA+wnz3sT0mQeTTIIYsg=;
	b=NZnTYRR+oSsAXi6l+BnCdztoYrgd9kEl2b49aUi70yvC8hYER/P668jWj778QiQqGy
	tzRB1yPR38DJ8YrBQrG5oFvnSADZoAbuEpzrwjXeZo4EUAi7Htxzbcr1uS5vAloKkvWS
	Wicqrqa5Hzk6UAcHKOZqcKV4qjJHtZmwZKQucYIZLP1PXOIss9uio50Kh8n7Qipxhx9c
	59hLUprhXhIGakHCys1enYgiU+hZXcihs7ogbLwfHx+ptpaH2fSStWa1EpfcVBmET2sv
	GrTlTAVI/pO9EQM95Vh+BmtL8AEnc8r5GA9CkxzGK8jixFee6RYcsxoAhhgNG/vrhfbc
	2XnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cO/WbKJlGUINf5zQOwG6sLuaA+wnz3sT0mQeTTIIYsg=;
	b=OjuP41hvQkFVwNVtCBXj41VEUjbEs31ay/5Bw6z8yETiibS5xwAU7az3OYOkWWcNiV
	UjuWUIX3F4hCj0rI6KGsRqslMyHFVgL+ZPqYfL7xGURsZDtX25emiAUlTbENFdbBo/7/
	iog/HCmuRwewPNitpIrRh6ZCCB6Awef3fTsvMhCEFlgG6gn0F2HHxnkvoOZK0zpMMSrj
	rVQHAnbZ23bNSeQVjwk5eyaCsepWPOnrjXjP9/uWER1Jh7/bNCKYL8bqSqdjNoXlmyf1
	HX+cDMC96VAh08jHLqIq0ubjIEjsZNYS6hR+L2a73wbCiy3lU7ZXwcufxvucem1+dh51
	5dGQ==
X-Gm-Message-State: AOUpUlEXKnyIMm7s7XKkG5uBSEc0XS21CgWosFTfd6C8DRCXc0CLyFxo
	a2p4wIrV6FZmRaKL9z/IP87PWJVj
X-Google-Smtp-Source: AA+uWPysFHLnMzsWOU0olICgPZJusx5Qxo08RytAir7vvgV4bf81ej7+BKq4+FYDE2YO5UJMJHBOOw==
X-Received: by 2002:aa7:8307:: with SMTP id
	t7-v6mr50462503pfm.81.1534812454775; 
	Mon, 20 Aug 2018 17:47:34 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	k64-v6sm18122308pfg.141.2018.08.20.17.47.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Aug 2018 17:47:34 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 17:47:28 -0700
Message-Id: <1534812448-1047-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] openssl: fix hardcoded paths in native for openssl 1.1
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
X-List-Received-Date: Tue, 21 Aug 2018 00:47:35 -0000

Relying on hardcoded built-in paths causes openssl-native to not be
relocateable from sstate.

Solution for openssl 1.1, based on the existing solution from
openssl 1.0:

  http://git.openembedded.org/openembedded-core/commit/?id=771d3123331fbfab1eb9ce47e3013eabcb2248f5

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...SLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch | 39 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.1.0i.bb | 10 ++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch b/meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
new file mode 100644
index 0000000..67d06fc
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
@@ -0,0 +1,39 @@
+From 26e98beb8a987cdc69699aaffc5599926fb1b293 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Fri, 17 Aug 2018 20:33:44 -0700
+Subject: [PATCH] allow OPENSSLDIR and ENGINESDIR CFLAGS to be controlled
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ Configurations/unix-Makefile.tmpl | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
+index 034d93e..2310d12 100644
+--- a/Configurations/unix-Makefile.tmpl
++++ b/Configurations/unix-Makefile.tmpl
+@@ -156,6 +156,10 @@ LIBDIR={- #
+ ENGINESDIR={- use File::Spec::Functions;
+               catdir($prefix,$libdir,"engines-$sover") -}
+ 
++# Intermediate variables so the values defined via CFLAGS can be controlled.
++OE_DOPENSSLDIR=$(OPENSSLDIR)
++OE_DENGINESDIR=$(ENGINESDIR)
++
+ # Convenience variable for those who want to set the rpath in shared
+ # libraries and applications
+ LIBRPATH=$(INSTALLTOP)/$(LIBDIR)
+@@ -174,7 +178,7 @@ HTMLSUFFIX=html
+ 
+ CROSS_COMPILE= {- $config{cross_compile_prefix} -}
+ CC= $(CROSS_COMPILE){- $target{cc} -}
+-CFLAGS={- our $cflags2 = join(" ",(map { "-D".$_} @{$target{defines}}, @{$config{defines}}),"-DOPENSSLDIR=\"\\\"\$(OPENSSLDIR)\\\"\"","-DENGINESDIR=\"\\\"\$(ENGINESDIR)\\\"\"") -} {- $target{cflags} -} {- $config{cflags} -}
++CFLAGS={- our $cflags2 = join(" ",(map { "-D".$_} @{$target{defines}}, @{$config{defines}}),"-DOPENSSLDIR=\"\\\"\$(OE_DOPENSSLDIR)\\\"\"","-DENGINESDIR=\"\\\"\$(OE_DENGINESDIR)\\\"\"") -} {- $target{cflags} -} {- $config{cflags} -}
+ CFLAGS_Q={- $cflags2 =~ s|([\\"])|\\$1|g; $cflags2 -} {- $config{cflags} -}
+ LDFLAGS= {- $target{lflags}." ".$ENV{'LDFLAGS'} -}
+ PLIB_LDFLAGS= {- $target{plib_lflags} -}
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
index 507f8f8..d2f2624 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
+           file://0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
@@ -30,6 +31,9 @@ inherit lib_package multilib_header ptest relative_symlinks
 #| ./libcrypto.so: undefined reference to `makecontext'
 EXTRA_OECONF_append_libc-musl = " -DOPENSSL_NO_ASYNC"
 
+EXTRA_OEMAKE_append_class-native = " OE_DOPENSSLDIR='/not/builtin' OE_DENGINESDIR='/not/builtin'"
+EXTRA_OEMAKE_append_class-nativesdk = " OE_DOPENSSLDIR='/not/builtin' OE_DENGINESDIR='/not/builtin'"
+
 do_configure () {
 	os=${HOST_OS}
 	case $os in
@@ -116,6 +120,12 @@ do_install () {
 }
 
 do_install_append_class-native () {
+	create_wrapper ${D}${bindir}/openssl \
+	    OPENSSL_CONF=${libdir}/ssl-1.1/openssl.cnf \
+	    SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
+	    SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
+	    OPENSSL_ENGINES=${libdir}/ssl-1.1/engines
+
 	# Install a custom version of c_rehash that can handle sysroots properly.
 	# This version is used for example when installing ca-certificates during
 	# image creation.
-- 
1.9.1


