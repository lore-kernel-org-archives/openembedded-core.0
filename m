Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023A1C83F10
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 16:07:57 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.39142.1752336470284249396
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 09:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=aQP946nE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250712160745ff7ae4c83ab620c466-9ydwcg@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250712160745ff7ae4c83ab620c466
        for <openembedded-core@lists.openembedded.org>;
        Sat, 12 Jul 2025 18:07:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=3Ydx4ipSoqW4XIH/siZ54etsMkXyjbkt61/eaACdDe8=;
 b=aQP946nElM1SU24iaxT5cdw2669g69ihVFE0AuUiqBdO2J5o6tQDBqzyfnAiKrKZVjYN4G
 a/kHpoOjf51HWy/nZfzb4Z6Dk11AtWXJrm+oaKUC+mGtej8RXsjkUBlx5iiRNhMMET4cmj6n
 Ot34lu350UcTmZAtKS9sNTg5hAUUBz2/4W+jeJkB5pfIhb71K40l+5DnyE81t+QHPg9z8Tc/
 oJlt7vLDsV0oiiVkn0lwbdDioFwH2qr3iBhKaQGnMDHdQt5Kvmv0feNLw8mzwIAV4NEHWxyZ
 6ZvBWvjwhBJat5T+ZoOVjoLeoHU41CZh4ZK1xdFgmqC+OmMXk/xWRL8g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH] busybox: apply patch for CVE-2023-39810
Date: Sat, 12 Jul 2025 18:06:56 +0200
Message-Id: <20250712160656.484167-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 16:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220193

From: Peter Marko <peter.marko@siemens.com>

Backport patch referencing this CVE.

Note that the hardening is not activated by default, it adds defconfig
option to enable it.
Since it introduces a breaking change, it shouldn't be enabled in LTS
release by default.
This patch makes busybox cpio equivalent in this release to what is
currently in master and in kirkstone.
Also note that gnu cpio also does not have this hardening, but the CVE
is created only against busybox.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../busybox/busybox/CVE-2023-39810.patch      | 136 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-39810.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2023-39810.patch b/meta/recipes-core/busybox/busybox/CVE-2023-39810.patch
new file mode 100644
index 0000000000..821ab3508f
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2023-39810.patch
@@ -0,0 +1,136 @@
+From 9a8796436b9b0641e13480811902ea2ac57881d3 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Wed, 2 Oct 2024 10:12:05 +0200
+Subject: [PATCH] archival: disallow path traversals (CVE-2023-39810)
+
+Create new configure option for archival/libarchive based extractions to
+disallow path traversals.
+As this is a paranoid option and might introduce backward
+incompatibility, default it to no.
+
+Fixes: CVE-2023-39810
+
+Based on the patch by Peter Kaestle <peter.kaestle@nokia.com>
+
+function                                             old     new   delta
+data_extract_all                                     921     945     +24
+strip_unsafe_prefix                                  101     102      +1
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 25/0)               Total: 25 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2023-39810
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=9a8796436b9b0641e13480811902ea2ac57881d3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ archival/Config.src                        | 11 +++++++++++
+ archival/libarchive/data_extract_all.c     |  8 ++++++++
+ archival/libarchive/unsafe_prefix.c        |  6 +++++-
+ scripts/kconfig/lxdialog/check-lxdialog.sh |  2 +-
+ testsuite/cpio.tests                       | 23 ++++++++++++++++++++++
+ 5 files changed, 48 insertions(+), 2 deletions(-)
+
+diff --git a/archival/Config.src b/archival/Config.src
+index 6f4f30c43..cbcd7217c 100644
+--- a/archival/Config.src
++++ b/archival/Config.src
+@@ -35,4 +35,15 @@ config FEATURE_LZMA_FAST
+ 	This option reduces decompression time by about 25% at the cost of
+ 	a 1K bigger binary.
+ 
++config FEATURE_PATH_TRAVERSAL_PROTECTION
++	bool "Prevent extraction of filenames with /../ path component"
++	default n
++	help
++	busybox tar and unzip remove "PREFIX/../" (if it exists)
++	from extracted names.
++	This option enables this behavior for all other unpacking applets,
++	such as cpio, ar, rpm.
++	GNU cpio 2.15 has NO such sanity check.
++# try other archivers and document their behavior?
++
+ endmenu
+diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchive/data_extract_all.c
+index 049c2c156..8a69711c1 100644
+--- a/archival/libarchive/data_extract_all.c
++++ b/archival/libarchive/data_extract_all.c
+@@ -65,6 +65,14 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 		} while (--n != 0);
+ 	}
+ #endif
++#if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
++	/* Strip leading "/" and up to last "/../" path component */
++	dst_name = (char *)strip_unsafe_prefix(dst_name);
++#endif
++// ^^^ This may be a problem if some applets do need to extract absolute names.
++// (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
++// You might think that rpm needs it, but in my tests rpm's internal cpio
++// archive has names like "./usr/bin/FOO", not "/usr/bin/FOO".
+ 
+ 	if (archive_handle->ah_flags & ARCHIVE_CREATE_LEADING_DIRS) {
+ 		char *slash = strrchr(dst_name, '/');
+diff --git a/archival/libarchive/unsafe_prefix.c b/archival/libarchive/unsafe_prefix.c
+index 33e487bf9..667081195 100644
+--- a/archival/libarchive/unsafe_prefix.c
++++ b/archival/libarchive/unsafe_prefix.c
+@@ -14,7 +14,11 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
+ 			cp++;
+ 			continue;
+ 		}
+-		if (is_prefixed_with(cp, "/../"+1)) {
++		/* We are called lots of times.
++		 * is_prefixed_with(cp, "../") is slower than open-coding it,
++		 * with minimal code growth (~few bytes).
++		 */
++		if (cp[0] == '.' && cp[1] == '.' && cp[2] == '/') {
+ 			cp += 3;
+ 			continue;
+ 		}
+diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
+index 5075ebf2d..910ca1f7c 100755
+--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
++++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
+@@ -55,7 +55,7 @@ trap "rm -f $tmp" 0 1 2 3 15
+ check() {
+         $cc -x c - -o $tmp 2>/dev/null <<'EOF'
+ #include CURSES_LOC
+-main() {}
++int main() { return 0; }
+ EOF
+ 	if [ $? != 0 ]; then
+ 	    echo " *** Unable to find the ncurses libraries or the"       1>&2
+diff --git a/testsuite/cpio.tests b/testsuite/cpio.tests
+index 85e746589..a4462c53e 100755
+--- a/testsuite/cpio.tests
++++ b/testsuite/cpio.tests
+@@ -154,6 +154,29 @@ testing "cpio -R with extract" \
+ " "" ""
+ SKIP=
+ 
++# Create an archive containing a file with "../dont_write" filename.
++# See that it will not be allowed to unpack.
++# NB: GNU cpio 2.15 DOES NOT do such checks.
++optional FEATURE_PATH_TRAVERSAL_PROTECTION
++rm -rf cpio.testdir
++mkdir -p cpio.testdir/prepare/inner
++echo "file outside of destination was written" > cpio.testdir/prepare/dont_write
++echo "data" > cpio.testdir/prepare/inner/to_extract
++mkdir -p cpio.testdir/extract
++testing "cpio extract file outside of destination" "\
++(cd cpio.testdir/prepare/inner && echo -e '../dont_write\nto_extract' | cpio -o -H newc) | (cd cpio.testdir/extract && cpio -vi 2>&1)
++echo \$?
++ls cpio.testdir/dont_write 2>&1" \
++"\
++cpio: removing leading '../' from member names
++../dont_write
++to_extract
++1 blocks
++0
++ls: cpio.testdir/dont_write: No such file or directory
++" "" ""
++SKIP=
++
+ # Clean up
+ rm -rf cpio.testdir cpio.testdir2 2>/dev/null
+ 
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index c3131eb453..92c7c65a3e 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -53,6 +53,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-syslogd-fix-wrong-OPT_locallog-flag-detection.patch \
            file://0002-start-stop-daemon-fix-tests.patch \
            file://0003-start-stop-false.patch \
+           file://CVE-2023-39810.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"

