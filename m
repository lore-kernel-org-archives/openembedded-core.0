Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id B02F96BB13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 20:10:23 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c73so8196747pfe.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 12:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZMIKgWj6q8t48KQDCVFycnHObsygYrs/inlsJ4X9d38=;
	b=LKPAiznfjmmRDZE07jNmu5fgZYGWPlRH8wYM9Wg4SxOx4nQSXvV81ZhZRKh1D8wL0p
	NO8AMwUh0HXmisTGDIymlrn1c9757sbJR2bxmrQvm5odVnU8CstRkZI56bI8z4WKa+yq
	9BFh1RhqDvrgRQ1V/p2CsdX3jrOeYNK49nCXqPloHpWhp0qvMv6SD64W3BsGt38Zsbxo
	2H1DzOTXGImEpE4/BfDLwD6KwokjRyY7j2k7dkmoJwqPXKi/N3bHhby+yigfjDJjRrcO
	FMzbV36QuPLcR+3o4pc3YLMsumPTVnt48PScrsbAkI68v6e5Q3a/3kSOg8y1aQd+NfGf
	h/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZMIKgWj6q8t48KQDCVFycnHObsygYrs/inlsJ4X9d38=;
	b=HF4EZYZLNgx7piRQImifnxnR/ZY1OPy4PZBxaoWqC0Dh35EqJJ7uCVsVDgb74r30PB
	+PRJLbU6tTi4eyfS9/XH20zF3cudQWV5jSPhLbwuA3TUQ1OMweAF8gF02T3hWOHSdAKv
	w7clZuparVyO+KfRKbi1durpDvSt21snGGVPk7pxBpgKKf0cPPnfhb+RA+QeSVUD0xso
	yAuJNXvfwwlI52E2vh5ZYLbxmqaFvCG/dsD7AwWrPCvnYLtnNw3z6MtpsGKcED7Gia15
	HZ3vJDCMxsddSgkq6ZUkCcRsegStaZPpyn9WT2NQaiTOYK4HWObzPM36QOyjMttxcBLV
	pnfQ==
X-Gm-Message-State: AJcUukfhXqbKrfS7ezW40UB9vfC3sj56fX1uNsOBhkXx1lnQ3rnBbXJz
	2M8HegnEEYtWVvUm1W3kFH9Iq3vKWCI=
X-Google-Smtp-Source: ALg8bN6zlP0ZCQKlUA9II0dUNebAjelebYROaJsrU4EKCN8xcn2vmWgRYZ1xD1pjTAE8raDhcX2AYg==
X-Received: by 2002:a62:6cc9:: with SMTP id h192mr8381769pfc.223.1545855023340;
	Wed, 26 Dec 2018 12:10:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6e98])
	by smtp.gmail.com with ESMTPSA id
	l3sm60029493pga.92.2018.12.26.12.10.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 12:10:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Dec 2018 12:09:47 -0800
Message-Id: <20181226200954.5267-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181226200954.5267-1-raj.khem@gmail.com>
References: <20181226200954.5267-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/10] gnupg: Do not apply -Woverride-init guard for gcc >= 9
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
X-List-Received-Date: Wed, 26 Dec 2018 20:10:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...erride-init-is-not-needed-with-gcc-9.patch | 31 +++++++++++++++++++
 ...-a-custom-value-for-the-location-of-.patch |  6 ++--
 .../gnupg/gnupg/relocate.patch                |  2 +-
 meta/recipes-support/gnupg/gnupg_2.2.12.bb    |  3 +-
 4 files changed, 37 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
new file mode 100644
index 0000000000..4a280f9d5c
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -0,0 +1,31 @@
+From 0df5800cc2e720aad883a517f7d24a9722fe5845 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Dec 2018 17:37:48 -0800
+Subject: [PATCH] Woverride-init is not needed with gcc 9
+
+Fixes
+| ../../gnupg-2.2.12/dirmngr/dns.h:525:16: error: lvalue required as
+unary '&' operand                                                 |
+525 |  dns_rr_i_init(&dns_quietinit((struct dns_rr_i){ 0, __VA_ARGS__
+}), (P))
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dirmngr/dns.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dirmngr/dns.h b/dirmngr/dns.h
+index 30d0b45..98fe412 100644
+--- a/dirmngr/dns.h
++++ b/dirmngr/dns.h
+@@ -154,7 +154,7 @@ DNS_PUBLIC int *dns_debug_p(void);
+ 
+ #define dns_quietinit(...) \
+ 	DNS_PRAGMA_PUSH DNS_PRAGMA_QUIET __VA_ARGS__ DNS_PRAGMA_POP
+-#elif (__GNUC__ == 4 && __GNUC_MINOR__ >= 6) || __GNUC__ > 4
++#elif (__GNUC__ == 4 && __GNUC_MINOR__ >= 6) || (__GNUC__ > 4 && __GNUC__ < 9)
+ #define DNS_PRAGMA_PUSH _Pragma("GCC diagnostic push")
+ #define DNS_PRAGMA_QUIET _Pragma("GCC diagnostic ignored \"-Woverride-init\"")
+ #define DNS_PRAGMA_POP _Pragma("GCC diagnostic pop")
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 3f1c3abaeb..c43ecdf861 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 8eb4d25c25a1c1323797d94e0727a3e42b7f3287 Mon Sep 17 00:00:00 2001
+From c69c3a49f3295179c247db5ceb3ef8952928a724 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4d66af9..b9ef235 100644
+index 919ab31..cd58fdb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1848,7 +1848,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1855,7 +1855,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index c494ef80b7..1a5ea4aa2b 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From f9fc214b0bf2f67b515ca8a5333f39c497d1b518 Mon Sep 17 00:00:00 2001
+From 6d31b04d7a75f1d73c3518bf043b5b0a2dc40cb1 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.12.bb b/meta/recipes-support/gnupg/gnupg_2.2.12.bb
index 1f381c2d91..a02c66a0c8 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.12.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.12.bb
@@ -14,7 +14,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0003-dirmngr-uses-libgpg-error.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
-          "
+           file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
+           "
 SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
 
-- 
2.20.1


