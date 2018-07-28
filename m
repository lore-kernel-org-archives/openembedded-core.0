Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id AC79378CC6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 20:39:35 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id s7-v6so5112830pgv.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 13:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Zu0kOICckVEOheZQuQPC02sCM93FvDAkYIkA/og0dxs=;
	b=QEel/A93AuqGsxXQ2dWS98HF99m1CZ41spVqbv1/pDLcLWU91wpjl6xcw2JkXQ0XnC
	iVXRuYRaFTLWFW+Og/uTctEauyotAox/rjewNWljxa8+FEHNqY3bNJybux3FNhWW66Nq
	aMIh67sjqXoNG6pI9QTKbdZvt6XqB1kE4evMQX5pVFYiPgu8Wc/pbPVrBTU1Qce8hywC
	nN15ZhKnLQ9M7U1YAMreTefz3oyhgoE8NJdA/nSRB3wjVupDoMAot6729HjWLkk+Ws/V
	eLAbYO+gHrJdHo5ELLmyzsGoWg5kCCON/QZjNz7EOXS9A1PV3LOv3cVz0QTufJy+ofD2
	tAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Zu0kOICckVEOheZQuQPC02sCM93FvDAkYIkA/og0dxs=;
	b=PbP/CDvv89BvUQpOUw0XC6YqH8ltskioNf+7ojfqE39x9IATaeV17B5mnjExP2aNLE
	lRsyasJFixKPKU/0TCbF8bKiWaSs9gUql2/KccUg2VfdogA2qBM5z1110S3ODkOhKXHP
	1WWNVQ2RIVwLJeL54Lxdij0qUromO7UtqNutGMlJANUKTywNg0b0kK19dMAKLg0/PQwb
	ge1OmF++XQg84NwFlx2bXmLq5KWTCI6YBJLgfAdm7RExH4dX7SJkZ1BgGAudjJtJvBfM
	fB7Q1a3162fx8SFkOmpvBK/oJYhcpAPbyAyRStbE2nP7zt8QqUXraVRX2KT3olIHG6jK
	CRFw==
X-Gm-Message-State: AOUpUlFX/ZrMCQuYEr4jMz6nIh8kXc9BF+f/F769G8TlvgTFsVBLSjuK
	QEVq+f0lTD7NsTrYnQXHR5CexcYY
X-Google-Smtp-Source: AAOMgpexrdFy938LI1EBUoIPOy2B3mmJc71VVST3nSs2rKWnN4xf7D7yXCW1ChGcJDsZDMEhDozXZA==
X-Received: by 2002:a62:ea05:: with SMTP id
	t5-v6mr11800969pfh.228.1532810376575; 
	Sat, 28 Jul 2018 13:39:36 -0700 (PDT)
Received: from e6520.gateway.sonic.net
	(173-228-90-111.dsl.dynamic.fusionbroadband.com. [173.228.90.111])
	by smtp.gmail.com with ESMTPSA id
	h4-v6sm8102393pgp.13.2018.07.28.13.39.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Jul 2018 13:39:36 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Jul 2018 13:39:22 -0700
Message-Id: <1532810363-23110-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532810363-23110-1-git-send-email-armccurdy@gmail.com>
References: <1532810363-23110-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 4/5] openssl_1.0: add PACKAGECONFIG option to control manpages
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
X-List-Received-Date: Sat, 28 Jul 2018 20:39:36 -0000

Creating the openssl manpages, which happens as part of do_install(),
can take a significant amount of time (e.g. ~50 seconds on a quad
core laptop). Provide a PACKAGECONFIG option to allow creation of the
manpages to be skipped completely if not required and inherit the
manpages class to automatically control the PACKAGECONFIG option
(based on the "api-documentation" distro feature).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../0001-allow-manpages-to-be-disabled.patch       | 31 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2o.bb |  8 ++++--
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch
new file mode 100644
index 0000000..3f7d649
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch
@@ -0,0 +1,31 @@
+From e1c39b80b01d4d18feeadfdc6e45a3e1dd110634 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Fri, 27 Jul 2018 21:41:06 +0000
+Subject: [PATCH] allow manpages to be disabled
+
+Define OE_DISABLE_MANPAGES (via environment or the make command line)
+to skip creation and installation of manpages.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ Makefile.org | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.org b/Makefile.org
+index ed98d2a..747d8cb 100644
+--- a/Makefile.org
++++ b/Makefile.org
+@@ -549,7 +549,7 @@ dist:
+ 	@$(MAKE) SDIRS='$(SDIRS)' clean
+ 	@$(MAKE) TAR='$(TAR)' TARFLAGS='$(TARFLAGS)' $(DISTTARVARS) tar
+ 
+-install: all install_docs install_sw
++install: all $(if $(OE_DISABLE_MANPAGES),,install_docs) install_sw
+ 
+ install_sw:
+ 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index 2804203..bbce14f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -43,6 +43,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://Use-SHA256-not-MD5-as-default-digest.patch \
            file://0001-Fix-build-with-clang-using-external-assembler.patch \
            file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
+           file://0001-allow-manpages-to-be-disabled.patch \
            "
 
 SRC_URI_append_class-target = " \
@@ -59,19 +60,22 @@ SRC_URI[sha256sum] = "ec3f5c9714ba0fd45cb4e087301eb1336c317e0d20b575a125050470e8
 
 UPSTREAM_CHECK_REGEX = "openssl-(?P<pver>1\.0.+)\.tar"
 
-inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
+inherit pkgconfig siteinfo multilib_header ptest relative_symlinks manpages
 
 PACKAGECONFIG ?= "cryptodev-linux"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 
-PACKAGECONFIG[perl] = ",,,"
 PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryptodev-linux"
+PACKAGECONFIG[manpages] = ",,,"
+PACKAGECONFIG[perl] = ",,,"
 
 # Remove this to enable SSLv3. SSLv3 is defaulted to disabled due to the POODLE
 # vulnerability
 EXTRA_OECONF = "no-ssl3"
 
+EXTRA_OEMAKE = "${@bb.utils.contains('PACKAGECONFIG', 'manpages', '', 'OE_DISABLE_MANPAGES=1', d)}"
+
 export OE_LDFLAGS = "${LDFLAGS}"
 
 # openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
-- 
1.9.1


