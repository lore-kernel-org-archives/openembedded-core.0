Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 38A5473943
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 17:50:38 +0000 (UTC)
Received: by ieclw3 with SMTP id lw3so72722496iec.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 10:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UHydG/nImrR0FSupiszbH48+dXVSMNOxeKHfonIYEJo=;
	b=P00SVaw/puv5Xt7lekpNLLzCR1U8xWbZNevcEResjLDa6x6Zrc7RplgZvCnrZf/0F2
	vRIz6CaBt62QvXrufuA3w+XAJhLLJfiVjDyvJWZuZJZ7zG0YDecxmzmqREZdS49mn0zV
	mX12BTmIlc9Eh3MvrKH0Bimbc/ANDuDUd0N0q0lwEtmgQqEQEmw86ebC8UPvYkpJNWIX
	xCguIAg8DXVP9HJ964j7NyVRUsZ9tSL1kVuO8PhgYFfbeC/zZfuk4M123t2N9+MAyx1J
	azrXMTtP6KvwQOwymhJW9k5Ms6DJzYpwyuAw40Vv9USjKGB9j41QbjnK5UIY5jdaEVJ8
	4Jpg==
X-Received: by 10.107.155.131 with SMTP id d125mr142402780ioe.17.1426787440204;
	Thu, 19 Mar 2015 10:50:40 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id w17sm1339265iod.44.2015.03.19.10.50.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Mar 2015 10:50:39 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2015 10:50:19 -0700
Message-Id: <1426787419-16672-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1426787419-16672-1-git-send-email-armccurdy@gmail.com>
References: <1426787419-16672-1-git-send-email-armccurdy@gmail.com>
Subject: [dizzy][PATCH 2/2] busybox: libarchive: open_zipped() does not need to check extensions
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
X-List-Received-Date: Thu, 19 Mar 2015 17:50:39 -0000

Backport from busybox 1_22_stable branch:

  http://git.busybox.net/busybox/commit/?h=1_22_stable&id=28dd64a0e1a9cffcde7799f2849b66c0e16bb9cc

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...open_zipped-does-not-need-to-check-extens.patch | 66 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.22.1.bb        |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/libarchive-open_zipped-does-not-need-to-check-extens.patch

diff --git a/meta/recipes-core/busybox/busybox/libarchive-open_zipped-does-not-need-to-check-extens.patch b/meta/recipes-core/busybox/busybox/libarchive-open_zipped-does-not-need-to-check-extens.patch
new file mode 100644
index 0000000..cf91433
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/libarchive-open_zipped-does-not-need-to-check-extens.patch
@@ -0,0 +1,66 @@
+Upstream-status: Backport
+http://git.busybox.net/busybox/commit/?h=1_22_stable&id=28dd64a0e1a9cffcde7799f2849b66c0e16bb9cc
+
+From 28dd64a0e1a9cffcde7799f2849b66c0e16bb9cc Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Fri, 10 Jan 2014 14:06:57 +0100
+Subject: [PATCH] libarchive: open_zipped() does not need to check extensions for e.g. gzip
+
+We only need to check for signature-less extensions,
+currently only .lzma. The rest can be happily autodetected.
+
+This fixes "zcat FILE_WITHOUT_GZ_EXT" case, among others.
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+(cherry picked from commit 7c47b560a8fc97956dd8132bd7f1863d83c19866)
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ archival/libarchive/open_transformer.c | 23 +++++++++++------------
+ 1 file changed, 11 insertions(+), 12 deletions(-)
+
+diff --git a/archival/libarchive/open_transformer.c b/archival/libarchive/open_transformer.c
+index 4e98264..1aeba13 100644
+--- a/archival/libarchive/open_transformer.c
++++ b/archival/libarchive/open_transformer.c
+@@ -182,27 +182,26 @@ int FAST_FUNC setup_unzip_on_fd(int fd, int fail_if_not_detected)
+ 
+ int FAST_FUNC open_zipped(const char *fname)
+ {
+-	char *sfx;
+ 	int fd;
+ 
+ 	fd = open(fname, O_RDONLY);
+ 	if (fd < 0)
+ 		return fd;
+ 
+-	sfx = strrchr(fname, '.');
+-	if (sfx) {
+-		sfx++;
+-		if (ENABLE_FEATURE_SEAMLESS_LZMA && strcmp(sfx, "lzma") == 0)
+-			/* .lzma has no header/signature, just trust it */
++	if (ENABLE_FEATURE_SEAMLESS_LZMA) {
++		/* .lzma has no header/signature, can only detect it by extension */
++		char *sfx = strrchr(fname, '.');
++		if (sfx && strcmp(sfx+1, "lzma") == 0) {
+ 			open_transformer_with_sig(fd, unpack_lzma_stream, "unlzma");
+-		else
+-		if ((ENABLE_FEATURE_SEAMLESS_GZ && strcmp(sfx, "gz") == 0)
+-		 || (ENABLE_FEATURE_SEAMLESS_BZ2 && strcmp(sfx, "bz2") == 0)
+-		 || (ENABLE_FEATURE_SEAMLESS_XZ && strcmp(sfx, "xz") == 0)
+-		) {
+-			setup_unzip_on_fd(fd, /*fail_if_not_detected:*/ 1);
++			return fd;
+ 		}
+ 	}
++	if ((ENABLE_FEATURE_SEAMLESS_GZ)
++	 || (ENABLE_FEATURE_SEAMLESS_BZ2)
++	 || (ENABLE_FEATURE_SEAMLESS_XZ)
++	) {
++		setup_unzip_on_fd(fd, /*fail_if_not_detected:*/ 1);
++	}
+ 
+ 	return fd;
+ }
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb b/meta/recipes-core/busybox/busybox_1.22.1.bb
index 3934278..ae8eca7 100644
--- a/meta/recipes-core/busybox/busybox_1.22.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-cross-menuconfig.patch \
            file://CVE-2014-9645_busybox_reject_module_names_with_slashes.patch \
            file://lzop-add-overflow-check.patch \
+           file://libarchive-open_zipped-does-not-need-to-check-extens.patch \
 "
 
 SRC_URI[tarball.md5sum] = "337d1a15ab1cb1d4ed423168b1eb7d7e"
-- 
1.9.1


