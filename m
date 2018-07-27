Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB6A78CFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 23:28:25 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 31-v6so2931962plc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 16:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1GNuTDcjpjFjAF1FkFEdR+xrCCOglrlzpHQkaxPJ224=;
	b=g2cz3sORDXHAbnz1c69a4ZIJy70E1AXe4tOMLj2TBUx0jSOYC41NppqR59Bs6EahIl
	t7kw1TKtNkru4WNbwUgePs3oHePRR8I9EbDO/W7yNKz1REF+j2VXe/Z7Ld7suPLZbfrX
	FnQshqFala1PM1iv0jQ1ZDAuf1v/673QJRtxYXhGWI+G/KU3HvBg4SubdgJl00JinOJ2
	wzI93nvI9aVwhkj4gx3jUNCyGNHBwCLKSwZ4/mqhBEaytekjkR100zSxhSVRAZv0Bnq9
	bE+BbO8/MjbIaWeV2VnPjMPnjiahFmt6/lpjV0rAI7oLYPBxvsq+oz9/LCPtGCW2Av3D
	vLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1GNuTDcjpjFjAF1FkFEdR+xrCCOglrlzpHQkaxPJ224=;
	b=oJW96LZD1zVBvb21v9CGGEBTtWfmpolCsbMy6lwx+66NpCqV3FQC2okeRGe8/baYkk
	hR2nenXSdF+PjsFU77zzayOWMx8CuNrhN3UY8zjTDP+3tU5qu68pgxvqaubnSlQwhQQw
	Iweed0jRlx7G1f+6Q09R90rAKiGpgoPXJjVxg8CJ0EQgXjHY+Ki0DNdpRojw9Zn+6Z1L
	jTIM6539JgUDjSyGNfQwx+RDRT0pOGlYG5U/4rdiDvEBaJGoQ8nvSpGurtKi7OuTCKlh
	DPFGywD9IPKtAzv881SKQdMqbOZFXP8IsRqa1jzpcQiKTu059Kmvv4x1tNmqQYx9/5vZ
	QO6g==
X-Gm-Message-State: AOUpUlEiPhi/XfZSYm4LjVP+nqI7HYTNn5cH9yCL/stqHUgwSCh96/n6
	MROLyw5ZUtTD/VpSu7T9eKO+q9TQ
X-Google-Smtp-Source: AAOMgpePCI/n8OpOyW2h0NYfmBgWHTmjwn40Xvbg0M0IbFFmGSRXtMJkQ49w5AZaxdqUdA8/qmkEmQ==
X-Received: by 2002:a17:902:542:: with SMTP id
	60-v6mr7874685plf.122.1532734106165; 
	Fri, 27 Jul 2018 16:28:26 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	x4-v6sm7086923pfm.119.2018.07.27.16.28.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 16:28:25 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:28:00 -0700
Message-Id: <1532734081-24485-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532734081-24485-1-git-send-email-armccurdy@gmail.com>
References: <1532734081-24485-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/5] openssl_1.0: add PACKAGECONFIG option to control manpages
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
X-List-Received-Date: Fri, 27 Jul 2018 23:28:25 -0000

Creating the openssl manpages, which happens as part of do_install(),
can take a significant amount of time (e.g. ~50 seconds on a quad
core laptop). Provide a PACKAGECONFIG option to allow creation of the
manpages to be skipped completely if not required. Leave manpages
enabled by default for target builds, but disable by default for
-native and -nativesdk.

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
index 2804203..527be72 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -43,6 +43,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://Use-SHA256-not-MD5-as-default-digest.patch \
            file://0001-Fix-build-with-clang-using-external-assembler.patch \
            file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
+           file://0001-allow-manpages-to-be-disabled.patch \
            "
 
 SRC_URI_append_class-target = " \
@@ -61,17 +62,20 @@ UPSTREAM_CHECK_REGEX = "openssl-(?P<pver>1\.0.+)\.tar"
 
 inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
 
-PACKAGECONFIG ?= "cryptodev-linux"
+PACKAGECONFIG ?= "cryptodev-linux manpages"
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


