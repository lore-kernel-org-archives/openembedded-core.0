Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5AAC27FA1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:00:12 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id t14so13843616wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 06:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZUNPDIJzl6NbdFC/Ewb2XUSPJh2+XpgWwtixO59IUok=;
	b=o56d7bhJtbY3l3ZPDoa5X9MkXvqrxeaXrchF/qnybmD7AOkHoe82leA5KO4hluNYcN
	p5McnLtvfYf+5LIEi6iXtTKiUQRVNeidNEqMGYbCM3lyDmuS0C2m0GWVrKDaqvTttans
	kzN9ACzFnAZnPJop/9JeVxz/SzEWEIeXmYIjY39VTtJMnKHvbU2nwi/SOc5NCNo/225S
	A+nl17D0lS6Ja48yoFlewnq5zpunOe0w8L+nSO/akG7TGB0j0Jo1W3/tbEmkE9ubiuCf
	QuLZRxq5PZDH9BkMX3dY3oSE3MZxXBnkHcZpgblU8vcAvdsXe6cbPHuAQCbpZpvsz5vX
	T9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZUNPDIJzl6NbdFC/Ewb2XUSPJh2+XpgWwtixO59IUok=;
	b=NmMr0azcqeQXM+1RUNAkXBtCPUKM3XcJmtwbZ9GqWWaq39rXznw7ay7bCzoMs30a69
	0VI7Pe0Z7+LPb5T+VsaZQ3e6lC9/b+9xxOKhQNhltZ4p9VSAHwUwOxknvYDpKg/1neTe
	18vu8uFPXaTURHHRP/QZ/H1BSIj8j9E//oB0RBcZ1nizhZNGQfzwfZSLVEycxoIBtpri
	dPS0bEIgXZsp/Rb6OYvdWso2CDECAfCx0kzOtX5TSdmUgLmGBlZuaU4e5OgKctN6FVaW
	6a+8I+Rqt0z3HTPjCEiDp3rxa5SbJ6QDm/pIiv7JUqXHmgfJSZZoziOm3PtNsrCicVqj
	7V3A==
X-Gm-Message-State: APjAAAVJmTWx0NvL9YqqmMXjG0pKr+y/N9xqijbzTvVH1PBOKqAaYy9v
	V9F5gLNMUhktGzG3RAJVOtT5GcbW
X-Google-Smtp-Source: APXvYqy6hTk9RZVOIDitHFMK3+RnzKsy5EFtcgltWCpPykYlQZZp2t0H6p8SqzZfYn3e+qbdm3lmiQ==
X-Received: by 2002:a1c:7ed0:: with SMTP id z199mr26927377wmc.58.1579010412790;
	Tue, 14 Jan 2020 06:00:12 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	r62sm20147333wma.32.2020.01.14.06.00.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 06:00:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 14:59:48 +0100
Message-Id: <20200114140007.36622-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/20] rpm: switch to openssl from nss
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
X-List-Received-Date: Tue, 14 Jan 2020 14:00:12 -0000

nss is a problematic library in many ways, but openssl
seems to work just fine.

rpm was the only user of nss in oe-core, which opens
the possibility of moving it out.

Add a backported patch to enable builds with latest openssl.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...support-for-unused-MD2-and-RIPEMD160.patch | 81 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |  5 +-
 2 files changed, 84 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch b/meta/recipes-devtools/rpm/files/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch
new file mode 100644
index 00000000000..734e38bb391
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch
@@ -0,0 +1,81 @@
+From 2d53d1e308a5bd15a16cc289fa7e1f264ea706be Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Tue, 26 Jun 2018 10:46:14 +0300
+Subject: [PATCH] Rip out partial support for unused MD2 and RIPEMD160 digests
+
+Inspired by #453, adding configure-checks for unused digests algorithms
+seems nonsensical, at no point in rpm history have these algorithms been
+used for anything in rpm so there's not even backward compatibility to
+care about. So the question becomes why do we appear to have (some)
+support for those unused algorithms? So lets don't, problem solved...
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/ff4b9111aeba01dd025dd133ce617fb80f7398a0]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ rpmio/digest_beecrypt.c | 7 -------
+ rpmio/digest_nss.c      | 2 --
+ rpmio/digest_openssl.c  | 6 ------
+ 3 files changed, 15 deletions(-)
+
+diff --git a/rpmio/digest_beecrypt.c b/rpmio/digest_beecrypt.c
+index 597027e25..653a39491 100644
+--- a/rpmio/digest_beecrypt.c
++++ b/rpmio/digest_beecrypt.c
+@@ -132,10 +132,6 @@ DIGEST_CTX rpmDigestInit(int hashalgo, rpmDigestFlags flags)
+ 	ctx->Digest = (void *) sha512Digest;
+ 	break;
+ #endif
+-    case PGPHASHALGO_RIPEMD160:
+-    case PGPHASHALGO_MD2:
+-    case PGPHASHALGO_TIGER192:
+-    case PGPHASHALGO_HAVAL_5_160:
+     default:
+ 	free(ctx);
+ 	return NULL;
+@@ -292,9 +288,6 @@ static int pgpVerifySigRSA(pgpDigAlg pgpkey, pgpDigAlg pgpsig, uint8_t *hash, si
+     case PGPHASHALGO_SHA1:
+         prefix = "3021300906052b0e03021a05000414";
+         break;
+-    case PGPHASHALGO_MD2:
+-        prefix = "3020300c06082a864886f70d020205000410";
+-        break;
+     case PGPHASHALGO_SHA256:
+         prefix = "3031300d060960864801650304020105000420";
+         break;
+diff --git a/rpmio/digest_nss.c b/rpmio/digest_nss.c
+index e11920e3e..b3d2b5595 100644
+--- a/rpmio/digest_nss.c
++++ b/rpmio/digest_nss.c
+@@ -117,7 +117,6 @@ static HASH_HashType getHashType(int hashalgo)
+ {
+     switch (hashalgo) {
+     case PGPHASHALGO_MD5:	return HASH_AlgMD5;
+-    case PGPHASHALGO_MD2:	return HASH_AlgMD2;
+     case PGPHASHALGO_SHA1:	return HASH_AlgSHA1;
+ #ifdef SHA224_LENGTH
+     case PGPHASHALGO_SHA224:	return HASH_AlgSHA224;
+@@ -217,7 +216,6 @@ static SECOidTag getHashAlg(unsigned int hashalgo)
+ {
+     switch (hashalgo) {
+     case PGPHASHALGO_MD5:	return SEC_OID_MD5;
+-    case PGPHASHALGO_MD2:	return SEC_OID_MD2;
+     case PGPHASHALGO_SHA1:	return SEC_OID_SHA1;
+ #ifdef SHA224_LENGTH
+     case PGPHASHALGO_SHA224:	return SEC_OID_SHA224;
+diff --git a/rpmio/digest_openssl.c b/rpmio/digest_openssl.c
+index 18e52a724..0ae48dd1d 100644
+--- a/rpmio/digest_openssl.c
++++ b/rpmio/digest_openssl.c
+@@ -172,12 +172,6 @@ static const EVP_MD *getEVPMD(int hashalgo)
+     case PGPHASHALGO_SHA1:
+         return EVP_sha1();
+ 
+-    case PGPHASHALGO_RIPEMD160:
+-        return EVP_ripemd160();
+-
+-    case PGPHASHALGO_MD2:
+-        return EVP_md2();
+-
+     case PGPHASHALGO_SHA256:
+         return EVP_sha256();
+ 
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index c37330eb4c6..339bd7b8343 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -42,6 +42,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
            file://0001-mono-find-provides-requires-do-not-use-monodis-from-.patch \
+           file://0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch \
            "
 
 PE = "1"
@@ -49,7 +50,7 @@ SRCREV = "4a9440006398646583f0d9ae1837dad2875013aa"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "nss libarchive db file popt xz bzip2 dbus elfutils python3"
+DEPENDS = "openssl libarchive db file popt xz bzip2 dbus elfutils python3"
 DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
 
 inherit autotools gettext pkgconfig python3native
@@ -58,7 +59,7 @@ export PYTHON_ABI
 # OE-core patches autoreconf to additionally run gnu-configize, which fails with this recipe
 EXTRA_AUTORECONF_append = " --exclude=gnu-configize"
 
-EXTRA_OECONF_append = " --without-lua --enable-python"
+EXTRA_OECONF_append = " --without-lua --enable-python --with-crypto=openssl"
 EXTRA_OECONF_append_libc-musl = " --disable-nls"
 
 # --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
-- 
2.17.1


