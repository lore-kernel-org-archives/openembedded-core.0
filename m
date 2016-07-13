Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DA2746067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 10:23:03 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q128so910201wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 03:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=G/3cJFgfFb1uSw8qK6ersPx2y0F3U2e3zlSW7kzJiuk=;
	b=BB+Ck9z2WGBcs18Rt1VOszbQwPMD8ZoquezcPyBpcq4m0KCWxHh/XoHxgxkH8d1ILH
	NAbA+ZBhFIuhRiIb7s1NpMlghOFpwaDkESbmgMIrCVY4Fpg8QyoawKh832h1MhfBtZuq
	SkDEbrBJxkRMNfDGQHao3X/TYXGNZKYj3SQGC1q1SoQyKAVWSNCUfHbwAw3vCMptl97d
	Q9Le7M9du0GxMRu5Ud/4RiegP22pDoeZ3SSbncEKqAPuWXtcFPFud90NaevEFdODD2/f
	Zis7fvXQzM89+UMTJgfxt6Pn9MMee2XUgskkDEGHdYTeEa3ZaKDEO5bMyCnckPtvyXsm
	dPiQ==
X-Gm-Message-State: ALyK8tJVqUXoLhqXS/4dvmGGuqvKauZfblhZOuu3p2qIT1VZhHNuCvcUY4Fe8kpkEsXOow==
X-Received: by 10.28.103.6 with SMTP id b6mr7527941wmc.89.1468405382706;
	Wed, 13 Jul 2016 03:23:02 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id wr9sm136614wjc.48.2016.07.13.03.23.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jul 2016 03:23:01 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2016 11:22:59 +0100
Message-Id: <1468405379-2760-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1468405152-1725-1-git-send-email-git@andred.net>
References: <1468405152-1725-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2] opkg: backport patch to fix build when sha256 support is enabled
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
X-List-Received-Date: Wed, 13 Jul 2016 10:23:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: André Draszik <git@andred.net>
---
 ...-implicit-declaration-of-release_get_sha2.patch | 78 ++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.3.2.bb           |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-release-fix-implicit-declaration-of-release_get_sha2.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-release-fix-implicit-declaration-of-release_get_sha2.patch b/meta/recipes-devtools/opkg/opkg/0001-release-fix-implicit-declaration-of-release_get_sha2.patch
new file mode 100644
index 0000000..57f5fe8
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-release-fix-implicit-declaration-of-release_get_sha2.patch
@@ -0,0 +1,78 @@
+From 3fe6c043f5d62710f86ca92692b02f4ffd3bb5c9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <ad@andred.net>
+Date: Fri, 24 Jun 2016 13:18:52 +0100
+Subject: [PATCH] release: fix implicit declaration of release_get_sha256()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+| ../../opkg-0.3.2/libopkg/release.c: In function ‘release_verify_file’:
+| ../../opkg-0.3.2/libopkg/release.c:120:26: warning: implicit declaration of function ‘release_get_sha256’ [-Wimplicit-function-declaration]
+|      const char *sha256 = release_get_sha256(release, pathname);
+|                           ^
+| ../../opkg-0.3.2/libopkg/release.c:120:26: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
+| ../../opkg-0.3.2/libopkg/release.c: At top level:
+| ../../opkg-0.3.2/libopkg/release.c:324:13: error: conflicting types for ‘release_get_sha256’
+|  const char *release_get_sha256(release_t * release, const char *pathname)
+|              ^
+| ../../opkg-0.3.2/libopkg/release.c:120:26: note: previous implicit declaration of ‘release_get_sha256’ was here
+|      const char *sha256 = release_get_sha256(release, pathname);
+|                           ^
+
+At the same time, make it static, too, similar to
+release_get_md5().
+
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+---
+Upstream-Status: Backport
+
+ libopkg/release.c | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/libopkg/release.c b/libopkg/release.c
+index b6aceb4..7db0bd4 100644
+--- a/libopkg/release.c
++++ b/libopkg/release.c
+@@ -109,6 +109,20 @@ static const char *release_get_md5(release_t * release, const char *pathname)
+     return '\0';
+ }
+ 
++#ifdef HAVE_SHA256
++static const char *release_get_sha256(release_t * release, const char *pathname)
++{
++    const cksum_t *cksum;
++
++    if (release->sha256sums) {
++        cksum = cksum_list_find(release->sha256sums, pathname);
++        return cksum->value;
++    }
++
++    return '\0';
++}
++#endif
++
+ int release_verify_file(release_t * release, const char *file_name,
+                         const char *pathname)
+ {
+@@ -319,17 +333,3 @@ int release_download(release_t * release, pkg_src_t * dist, char *lists_dir,
+ 
+     return ret;
+ }
+-
+-#ifdef HAVE_SHA256
+-const char *release_get_sha256(release_t * release, const char *pathname)
+-{
+-    const cksum_t *cksum;
+-
+-    if (release->sha256sums) {
+-        cksum = cksum_list_find(release->sha256sums, pathname);
+-        return cksum->value;
+-    }
+-
+-    return '\0';
+-}
+-#endif
+-- 
+2.8.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.2.bb b/meta/recipes-devtools/opkg/opkg_0.3.2.bb
index 0251b7d..5731939 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg-configure.service \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://0001-release-fix-implicit-declaration-of-release_get_sha2.patch \
 "
 
 SRC_URI[md5sum] = "b2cc1baa89d0b3d49e63ab002fd2e0a6"
-- 
2.8.1


