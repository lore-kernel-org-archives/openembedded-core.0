Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 73B506067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 10:19:15 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q128so898701wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 03:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pGw8N3NYweNsbMW+NkMgHGS4l145bwpGA2QxOEQbBW8=;
	b=mOMWYheY6vyYMYXXvIIxmCKaYrRuKapw8KgadbbbY7xZDpb8HpPAGxpAKTeDmoQGML
	s1RfEXFiRQvOJjyg/Jb14QYZzg8jxyK1wuKPjKFDfrwywnkCMnd5IioSdEQuzIv056g/
	F/0MW2nwiDsCmVBJgXQd+91IPpozS7TC9Bl5sIGk0qUJqQw/wr1rv4QKg5McTCSVtCns
	GV33ArZxDio90ykeYEb4BmfULH8ngnkRpcEsVt6ybBauKP1zXtcoGOeMb1g/KyowNeuD
	wa2uz5DkzOZ44UF6eQZn3tFBXST1DF8Uj2Pk2W5V+SoKMHbsQ+lTZuLanMqr57cWiiMp
	mksQ==
X-Gm-Message-State: ALyK8tKwB9MPem/i5JFDkSFChzCQkMqUpGaZqjtgEBkmp3+5NhsPbRnySvpNqyGtBV2iOg==
X-Received: by 10.28.191.193 with SMTP id o62mr25181950wmi.64.1468405154937;
	Wed, 13 Jul 2016 03:19:14 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id
	r13sm8034465wmf.12.2016.07.13.03.19.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jul 2016 03:19:13 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2016 11:19:12 +0100
Message-Id: <1468405152-1725-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] opkg: backport patch to fix build when sha256 support is enabled
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
X-List-Received-Date: Wed, 13 Jul 2016 10:19:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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


