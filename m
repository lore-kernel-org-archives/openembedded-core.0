Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id B2A2078DD3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 17:04:39 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id u24-v6so1423164pfn.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 10:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YV7WVCtmXXVqkhRQQk04uE7alOBBn7sOwMaub96nGSM=;
	b=VY0qS8UJFlZ5lmzIYl/TY54EN1TBlvHY+IXBy3NM/7UdS0FxLMh29oOhO2ZdL+IGKX
	0Itt/sk1lsC7StfkczSBBDSDWMiqNhzQHpaA+lOTF7amzIEN9/K7gQNhJ/A2vt4tMEsB
	iPb0F1xjsgzm18qN9dDYHwsbydpXujwdIbaT0uB78E+Y9mjLWrr4c6Sx6NWru47f9Noi
	d3sfyn6zw8T65eLdnIlEQALcMcBHeVRUA4wkTMZjvniLqZVa3bRuOFSpJxS9M7SjRrB2
	HB5NwXoaGFD8hGbxHj9KQyfEQ8bdoYVxjhokm94kDYa0nkGFZVxXer7IQou9ykKGvzgV
	uyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YV7WVCtmXXVqkhRQQk04uE7alOBBn7sOwMaub96nGSM=;
	b=HRjeSf0mKmuP1jY6YGEyjpRRZJ7DLi3BpQUXqrvGbOj1ynFvniwWRym7z4aYqn8O8u
	JEjs1wuAUiTbHdLAOYehtD2lC0Wiy6CtwBNRjHXNKZpP7M5NXZMDjTqCD2XUBJfAjQjd
	bsolK+Jnp++Z+BskDkKG5bmzOZ+5AMK0OA//7kdQYzLi8z67fOsJ1YB+RTwD1R6GydAW
	RtukPj49oc7GcymEnoOYUq23pkcMzwRheUaMrFb6QQTfvl1bpw6YZVa8ibT95UK9pl3E
	UV2yO9xb6oBBgYX+KX9pg3YGlUO7pDeN7oU8Uxs3KAfINVsAqGI/Bpisa29hyTEmOQwN
	PLqw==
X-Gm-Message-State: AOUpUlEfSAiq+XuQ6Nxceh6qjxrpEaug24g1lBJR3quf40/qyR2/S+p5
	+oo/noUnMzPx0YuWa0O/SPK3wRWz
X-Google-Smtp-Source: AA+uWPzkyojilcYXAWyPiv6bZKE0hV75DO88EPoFRbFHKBic3ic7UZKcHssdF3I9kaJoHjPCWeWJmg==
X-Received: by 2002:a62:3184:: with SMTP id
	x126-v6mr3874864pfx.49.1533747880209; 
	Wed, 08 Aug 2018 10:04:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	h9-v6sm3673108pfe.187.2018.08.08.10.04.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 10:04:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 10:04:23 -0700
Message-Id: <311591ab337eaa74854a45f9906984c777e386db.1533747698.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533747698.git.raj.khem@gmail.com>
References: <cover.1533747698.git.raj.khem@gmail.com>
Subject: [PATCH 6/8] ppp: Use openssl for the DES instead of the libcrypt / glibc
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
X-List-Received-Date: Wed, 08 Aug 2018 17:04:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ppp/ppp/ppp-2.4.7-DES-openssl.patch       | 84 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |  5 +-
 2 files changed, 87 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch b/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
new file mode 100644
index 0000000000..e53f240543
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
@@ -0,0 +1,84 @@
+Used openssl for the DES instead of the libcrypt / glibc
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: ppp-2.4.7/pppd/Makefile.linux
+===================================================================
+--- ppp-2.4.7.orig/pppd/Makefile.linux
++++ ppp-2.4.7/pppd/Makefile.linux
+@@ -38,7 +38,7 @@ LIBS =
+ # Uncomment the next 2 lines to include support for Microsoft's
+ # MS-CHAP authentication protocol.  Also, edit plugins/radius/Makefile.linux.
+ CHAPMS=y
+-USE_CRYPT=y
++#USE_CRYPT=y
+ # Don't use MSLANMAN unless you really know what you're doing.
+ #MSLANMAN=y
+ # Uncomment the next line to include support for MPPE.  CHAPMS (above) must
+@@ -132,7 +132,7 @@ endif
+ 
+ ifdef NEEDDES
+ ifndef USE_CRYPT
+-LIBS     += -ldes $(LIBS)
++LIBS     += -lcrypto
+ else
+ CFLAGS   += -DUSE_CRYPT=1
+ endif
+Index: ppp-2.4.7/pppd/pppcrypt.c
+===================================================================
+--- ppp-2.4.7.orig/pppd/pppcrypt.c
++++ ppp-2.4.7/pppd/pppcrypt.c
+@@ -64,7 +64,7 @@ u_char *des_key;	/* OUT 64 bit DES key w
+ 	des_key[7] = Get7Bits(key, 49);
+ 
+ #ifndef USE_CRYPT
+-	des_set_odd_parity((des_cblock *)des_key);
++	DES_set_odd_parity((DES_cblock *)des_key);
+ #endif
+ }
+ 
+@@ -158,25 +158,25 @@ u_char *clear;	/* OUT 8 octets */
+ }
+ 
+ #else /* USE_CRYPT */
+-static des_key_schedule	key_schedule;
++static DES_key_schedule	key_schedule;
+ 
+ bool
+ DesSetkey(key)
+ u_char *key;
+ {
+-	des_cblock des_key;
++	DES_cblock des_key;
+ 	MakeKey(key, des_key);
+-	des_set_key(&des_key, key_schedule);
++	DES_set_key(&des_key, &key_schedule);
+ 	return (1);
+ }
+ 
+ bool
+-DesEncrypt(clear, key, cipher)
++DesEncrypt(clear, cipher)
+ u_char *clear;	/* IN  8 octets */
+ u_char *cipher;	/* OUT 8 octets */
+ {
+-	des_ecb_encrypt((des_cblock *)clear, (des_cblock *)cipher,
+-	    key_schedule, 1);
++	DES_ecb_encrypt((DES_cblock *)clear, (DES_cblock *)cipher,
++	    &key_schedule, 1);
+ 	return (1);
+ }
+ 
+@@ -185,8 +185,8 @@ DesDecrypt(cipher, clear)
+ u_char *cipher;	/* IN  8 octets */
+ u_char *clear;	/* OUT 8 octets */
+ {
+-	des_ecb_encrypt((des_cblock *)cipher, (des_cblock *)clear,
+-	    key_schedule, 0);
++	DES_ecb_encrypt((DES_cblock *)cipher, (DES_cblock *)clear,
++	    &key_schedule, 0);
+ 	return (1);
+ }
+ 
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index a1bb7d71c1..f4646bd693 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -4,7 +4,7 @@ the Point-to-Point Protocol (PPP) on Linux and Solaris systems."
 SECTION = "console/network"
 HOMEPAGE = "http://samba.org/ppp/"
 BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
-DEPENDS = "libpcap"
+DEPENDS = "libpcap openssl"
 LICENSE = "BSD & GPLv2+ & LGPLv2+ & PD"
 LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea \
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
@@ -32,6 +32,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://fix-CVE-2015-3310.patch \
            file://0001-pppoe-include-netinet-in.h-before-linux-in.h.patch \
            file://0001-ppp-Remove-unneeded-include.patch \
+           file://ppp-2.4.7-DES-openssl.patch \
 "
 
 SRC_URI_append_libc-musl = "\
@@ -49,7 +50,7 @@ EXTRA_OECONF = "--disable-strip"
 # Package Makefile computes CFLAGS, referencing COPTS.
 # Typically hard-coded to '-O2 -g' in the Makefile's.
 #
-EXTRA_OEMAKE += ' COPTS="${CFLAGS} -I${S}/include"'
+EXTRA_OEMAKE += ' COPTS="${CFLAGS} -I${STAGING_INCDIR}/openssl -I${S}/include"'
 
 do_configure () {
 	oe_runconf
-- 
2.18.0


