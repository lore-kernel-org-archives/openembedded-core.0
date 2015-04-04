Return-Path: <matt@madison.systems>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1BEE7724DC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Apr 2015 14:14:03 +0000 (UTC)
Received: by pdbni2 with SMTP id ni2so152319793pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Apr 2015 07:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4f/hf16vhsVixvBbkeGJktcJ3cO7n6GyLxtlpsskmBU=;
	b=fLzUipwifYKH17tMg1xHhyX9JCV+PDB6hArVZg0oEhUtDakA/zROW0lacU1wHOLdWt
	kgkklnS3nOWyzIaJNmL244ZEwGuOCLv06SpZuQqAPXENM/2mCWTDlpeqIkPFVY/6Q/Ov
	6XgO7BIIq+iwAJwTpZIOFGqqkzuINKU9kRIGSoFzDhcAW9OiQ7+6anOXkkHyRhRx+qmo
	jDgwuH3VYIcOyhel6mCHRpiqL4XmXy1DaI9J3XeZdYfMrjcWsiaNVknwLHwpnl41qq3p
	loEd88YpJLoj1rUr+hpRB16pIbr2XvoVL2JMnayolA0ne1T17Q/m1wefZsPVGXesSwBJ
	UAgQ==
X-Gm-Message-State: ALoCoQnxaHRPxI0R7jz9OgC24jb9Sn+1jYzA/mC0sbNGIepwRKwhBF/1oOJ4tHVzphuFFezQ8GMl
X-Received: by 10.66.227.169 with SMTP id sb9mr12703058pac.11.1428156844954;
	Sat, 04 Apr 2015 07:14:04 -0700 (PDT)
Received: from workhorse.athrat.org
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93]) by mx.google.com with ESMTPSA id
	f12sm11254275pat.43.2015.04.04.07.14.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 Apr 2015 07:14:04 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Apr 2015 07:13:24 -0700
Message-Id: <1428156804-10854-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 1.9.1
Subject: [dizzy][PATCH] Revert "busybox: libarchive: open_zipped() does not need to check extensions"
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
X-List-Received-Date: Sat, 04 Apr 2015 14:14:07 -0000

Backing out this change, which breaks busybox's modutils commands.

This reverts commit cd20b3c009a9c1743f5cb054710214231e5dfcfc.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 ...open_zipped-does-not-need-to-check-extens.patch | 66 ----------------------
 meta/recipes-core/busybox/busybox_1.22.1.bb        |  1 -
 2 files changed, 67 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/libarchive-open_zipped-does-not-need-to-check-extens.patch

diff --git a/meta/recipes-core/busybox/busybox/libarchive-open_zipped-does-not-need-to-check-extens.patch b/meta/recipes-core/busybox/busybox/libarchive-open_zipped-does-not-need-to-check-extens.patch
deleted file mode 100644
index cf91433..0000000
--- a/meta/recipes-core/busybox/busybox/libarchive-open_zipped-does-not-need-to-check-extens.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-Upstream-status: Backport
-http://git.busybox.net/busybox/commit/?h=1_22_stable&id=28dd64a0e1a9cffcde7799f2849b66c0e16bb9cc
-
-From 28dd64a0e1a9cffcde7799f2849b66c0e16bb9cc Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Fri, 10 Jan 2014 14:06:57 +0100
-Subject: [PATCH] libarchive: open_zipped() does not need to check extensions for e.g. gzip
-
-We only need to check for signature-less extensions,
-currently only .lzma. The rest can be happily autodetected.
-
-This fixes "zcat FILE_WITHOUT_GZ_EXT" case, among others.
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-(cherry picked from commit 7c47b560a8fc97956dd8132bd7f1863d83c19866)
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
----
- archival/libarchive/open_transformer.c | 23 +++++++++++------------
- 1 file changed, 11 insertions(+), 12 deletions(-)
-
-diff --git a/archival/libarchive/open_transformer.c b/archival/libarchive/open_transformer.c
-index 4e98264..1aeba13 100644
---- a/archival/libarchive/open_transformer.c
-+++ b/archival/libarchive/open_transformer.c
-@@ -182,27 +182,26 @@ int FAST_FUNC setup_unzip_on_fd(int fd, int fail_if_not_detected)
- 
- int FAST_FUNC open_zipped(const char *fname)
- {
--	char *sfx;
- 	int fd;
- 
- 	fd = open(fname, O_RDONLY);
- 	if (fd < 0)
- 		return fd;
- 
--	sfx = strrchr(fname, '.');
--	if (sfx) {
--		sfx++;
--		if (ENABLE_FEATURE_SEAMLESS_LZMA && strcmp(sfx, "lzma") == 0)
--			/* .lzma has no header/signature, just trust it */
-+	if (ENABLE_FEATURE_SEAMLESS_LZMA) {
-+		/* .lzma has no header/signature, can only detect it by extension */
-+		char *sfx = strrchr(fname, '.');
-+		if (sfx && strcmp(sfx+1, "lzma") == 0) {
- 			open_transformer_with_sig(fd, unpack_lzma_stream, "unlzma");
--		else
--		if ((ENABLE_FEATURE_SEAMLESS_GZ && strcmp(sfx, "gz") == 0)
--		 || (ENABLE_FEATURE_SEAMLESS_BZ2 && strcmp(sfx, "bz2") == 0)
--		 || (ENABLE_FEATURE_SEAMLESS_XZ && strcmp(sfx, "xz") == 0)
--		) {
--			setup_unzip_on_fd(fd, /*fail_if_not_detected:*/ 1);
-+			return fd;
- 		}
- 	}
-+	if ((ENABLE_FEATURE_SEAMLESS_GZ)
-+	 || (ENABLE_FEATURE_SEAMLESS_BZ2)
-+	 || (ENABLE_FEATURE_SEAMLESS_XZ)
-+	) {
-+		setup_unzip_on_fd(fd, /*fail_if_not_detected:*/ 1);
-+	}
- 
- 	return fd;
- }
--- 
-1.9.1
-
diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb b/meta/recipes-core/busybox/busybox_1.22.1.bb
index ae8eca7..3934278 100644
--- a/meta/recipes-core/busybox/busybox_1.22.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
@@ -34,7 +34,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-cross-menuconfig.patch \
            file://CVE-2014-9645_busybox_reject_module_names_with_slashes.patch \
            file://lzop-add-overflow-check.patch \
-           file://libarchive-open_zipped-does-not-need-to-check-extens.patch \
 "
 
 SRC_URI[tarball.md5sum] = "337d1a15ab1cb1d4ed423168b1eb7d7e"
-- 
1.9.1


