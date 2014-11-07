Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D5CF86B7CA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 13:58:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Nov 2014 05:58:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,332,1413270000"; d="scan'208";a="628322937"
Received: from moyraecc-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.isw.intel.com) ([10.252.122.2])
	by fmsmga002.fm.intel.com with ESMTP; 07 Nov 2014 05:57:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Nov 2014 13:57:06 +0000
Message-Id: <3f8e8add71fb0db7cf67be79451752b56980a681.1415368521.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1415368521.git.paul.eggleton@linux.intel.com>
References: <cover.1415368521.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1415368521.git.paul.eggleton@linux.intel.com>
References: <cover.1415368521.git.paul.eggleton@linux.intel.com>
Subject: [dizzy][PATCH 1/2] wget: Fix for CVE-2014-4887
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
X-List-Received-Date: Fri, 07 Nov 2014 13:58:03 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../wget/wget-1.15/wget_cve-2014-4877.patch        | 78 ++++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.15.bb            |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget-1.15/wget_cve-2014-4877.patch

diff --git a/meta/recipes-extended/wget/wget-1.15/wget_cve-2014-4877.patch b/meta/recipes-extended/wget/wget-1.15/wget_cve-2014-4877.patch
new file mode 100644
index 0000000..bfcc36e
--- /dev/null
+++ b/meta/recipes-extended/wget/wget-1.15/wget_cve-2014-4877.patch
@@ -0,0 +1,78 @@
+From 18b0979357ed7dc4e11d4f2b1d7e0f5932d82aa7 Mon Sep 17 00:00:00 2001
+From: Darshit Shah <darnir@gmail.com>
+Date: Sun, 07 Sep 2014 19:11:17 +0000
+Subject: CVE-2014-4877: Arbitrary Symlink Access
+
+Wget was susceptible to a symlink attack which could create arbitrary
+files, directories or symbolic links and set their permissions when
+retrieving a directory recursively through FTP. This commit changes the
+default settings in Wget such that Wget no longer creates local symbolic
+links, but rather traverses them and retrieves the pointed-to file in
+such a retrieval.
+
+The old behaviour can be attained by passing the --retr-symlinks=no
+option to the Wget invokation command.
+---
+diff --git a/doc/wget.texi b/doc/wget.texi
+index aef1f80..d7a4c94 100644
+--- a/doc/wget.texi
++++ b/doc/wget.texi
+@@ -1883,17 +1883,18 @@ Preserve remote file permissions instead of permissions set by umask.
+ 
+ @cindex symbolic links, retrieving
+ @item --retr-symlinks
+-Usually, when retrieving @sc{ftp} directories recursively and a symbolic
+-link is encountered, the linked-to file is not downloaded.  Instead, a
+-matching symbolic link is created on the local filesystem.  The
+-pointed-to file will not be downloaded unless this recursive retrieval
+-would have encountered it separately and downloaded it anyway.
+-
+-When @samp{--retr-symlinks} is specified, however, symbolic links are
+-traversed and the pointed-to files are retrieved.  At this time, this
+-option does not cause Wget to traverse symlinks to directories and
+-recurse through them, but in the future it should be enhanced to do
+-this.
++By default, when retrieving @sc{ftp} directories recursively and a symbolic link
++is encountered, the symbolic link is traversed and the pointed-to files are
++retrieved.  Currently, Wget does not traverse symbolic links to directories to
++download them recursively, though this feature may be added in the future.
++
++When @samp{--retr-symlinks=no} is specified, the linked-to file is not
++downloaded.  Instead, a matching symbolic link is created on the local
++filesystem.  The pointed-to file will not be retrieved unless this recursive
++retrieval would have encountered it separately and downloaded it anyway.  This
++option poses a security risk where a malicious FTP Server may cause Wget to
++write to files outside of the intended directories through a specially crafted
++@sc{.listing} file.
+ 
+ Note that when retrieving a file (not a directory) because it was
+ specified on the command-line, rather than because it was recursed to,
+diff --git a/src/init.c b/src/init.c
+index 09557af..3bdaa48 100644
+--- a/src/init.c
++++ b/src/init.c
+@@ -366,6 +366,22 @@ defaults (void)
+ 
+   opt.dns_cache = true;
+   opt.ftp_pasv = true;
++  /* 2014-09-07  Darshit Shah  <darnir@gmail.com>
++   * opt.retr_symlinks is set to true by default. Creating symbolic links on the
++   * local filesystem pose a security threat by malicious FTP Servers that
++   * server a specially crafted .listing file akin to this:
++   *
++   * lrwxrwxrwx   1 root     root           33 Dec 25  2012 JoCxl6d8rFU -> /
++   * drwxrwxr-x  15 1024     106          4096 Aug 28 02:02 JoCxl6d8rFU
++   *
++   * A .listing file in this fashion makes Wget susceptiple to a symlink attack
++   * wherein the attacker is able to create arbitrary files, directories and
++   * symbolic links on the target system and even set permissions.
++   *
++   * Hence, by default Wget attempts to retrieve the pointed-to files and does
++   * not create the symbolic links locally.
++   */
++  opt.retr_symlinks = true;
+ 
+ #ifdef HAVE_SSL
+   opt.check_cert = true;
+--
+cgit v0.9.0.2
diff --git a/meta/recipes-extended/wget/wget_1.15.bb b/meta/recipes-extended/wget/wget_1.15.bb
index c2fcca7..5375e4e 100644
--- a/meta/recipes-extended/wget/wget_1.15.bb
+++ b/meta/recipes-extended/wget/wget_1.15.bb
@@ -1,5 +1,6 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://fix_makefile.patch \
+           file://wget_cve-2014-4877.patch \
           "
 SRC_URI[md5sum] = "506df41295afc6486662cc47470b4618"
 SRC_URI[sha256sum] = "52126be8cf1bddd7536886e74c053ad7d0ed2aa89b4b630f76785bac21695fcd"
-- 
1.9.3


