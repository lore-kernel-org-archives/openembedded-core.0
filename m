Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 937CD7477A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 03:55:21 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [13.68.168.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2065D2098A;
	Fri,  5 Oct 2018 03:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1538711723;
	bh=Hlpc0qGvH3cZJPzno/nXsH+Bfn+KZL0EXWaj51L3cu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y4AmUZkazXdfn/sSZAKq28ItbCa8HjRPKrxV63H3xfntWQODropQDNvY+BQgOgFH6
	4SLA3RgTlSie6icJrzFubSEZ497Q1PwqPEmym2FKw3D7FWeLpdwyZ5VkkjvcY3tmW8
	rxoHaxv83Hn218bMYEQuQWo9R05n6MN/WW2oTvxA=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2018 03:55:15 +0000
Message-Id: <20181005035515.4922-2-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181005035515.4922-1-okaya@kernel.org>
References: <20181005035515.4922-1-okaya@kernel.org>
MIME-Version: 1.0
Subject: [sumo] [PATCH v1 2/2] git: CVE-2018-11233
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
X-List-Received-Date: Fri, 05 Oct 2018 03:55:22 -0000
Content-Transfer-Encoding: 8bit

* CVE-2018-11233
Code to sanity-check pathnames on NTFS can result in reading
out-of-bounds memory.

Affects < 2.17.1

CVE: CVE-2018-11233
Ref: https://bugzilla.redhat.com/show_bug.cgi?id=1583888
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../git/files/CVE-2018-11233.patch            | 44 +++++++++++++++++++
 meta/recipes-devtools/git/git.inc             |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2018-11233.patch

diff --git a/meta/recipes-devtools/git/files/CVE-2018-11233.patch b/meta/recipes-devtools/git/files/CVE-2018-11233.patch
new file mode 100644
index 0000000000..f4468cf2fd
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2018-11233.patch
@@ -0,0 +1,44 @@
+From 014281e62b7920a6d710a85089e00ca012b0744c Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Sun, 13 May 2018 12:09:42 -0400
+Subject: [PATCH] is_ntfs_dotgit: use a size_t for traversing string
+
+We walk through the "name" string using an int, which can
+wrap to a negative value and cause us to read random memory
+before our array (e.g., by creating a tree with a name >2GB,
+since "int" is still 32 bits even on most 64-bit platforms).
+Worse, this is easy to trigger during the fsck_tree() check,
+which is supposed to be protecting us from malicious
+garbage.
+
+Note one bit of trickiness in the existing code: we
+sometimes assign -1 to "len" at the end of the loop, and
+then rely on the "len++" in the for-loop's increment to take
+it back to 0. This is still legal with a size_t, since
+assigning -1 will turn into SIZE_MAX, which then wraps
+around to 0 on increment.
+
+Signed-off-by: Jeff King <peff@peff.net>
+CVE: CVE-2018-11233
+Upstream-Status: Backport[https://github.com/git/git/commit/11a9f4d807a0d71dc6eff51bb87baf4ca2cccf1d]
+Signed-off-by: Sinan Kaya <okaya@kernel.org>
+---
+ path.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/path.c b/path.c
+index da8b65573..d31c795ff 100644
+--- a/path.c
++++ b/path.c
+@@ -1305,7 +1305,7 @@ static int only_spaces_and_periods(const char *path, size_t len, size_t skip)
+ 
+ int is_ntfs_dotgit(const char *name)
+ {
+-	int len;
++	size_t len;
+ 
+ 	for (len = 0; ; len++)
+ 		if (!name[len] || name[len] == '\\' || is_dir_sep(name[len])) {
+-- 
+2.19.0
+
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index bea23ec783..8603c045cc 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -8,7 +8,8 @@ PROVIDES_append_class-native = " git-replacement-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
-           file://CVE-2018-11235.patch"
+           file://CVE-2018-11235.patch \
+           file://CVE-2018-11233.patch"
 
 S = "${WORKDIR}/git-${PV}"
 
-- 
2.19.0


