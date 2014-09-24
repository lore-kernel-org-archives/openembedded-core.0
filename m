Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E43A36FE64
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 11:38:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8OBcMmD019088
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Sep 2014 04:38:22 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 24 Sep 2014 04:38:22 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>
Date: Wed, 24 Sep 2014 19:38:08 +0800
Message-ID: <1ae0b3a4ea4c5fff1bd7a785b3d05d2ac6a0e394.1411558039.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411558039.git.hongxu.jia@windriver.com>
References: <cover.1411558039.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] scripts/postinst-intercepts: add update_info_dir
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
X-List-Received-Date: Wed, 24 Sep 2014 11:38:52 -0000
Content-Type: text/plain

We need to run it after all packages have been installed. Here is details:

NAME
  update_info_dir - update or create index file from all installed
  info files in directory

SYNOPSIS
  update_info_dir [options] [directory]

DESCRIPTION
  Update, or create, the index file dir of available documentation
  in $D/${infodir} (the default) or in given DIRECTORY. The index
  file info is the directory is usually presented by info browsers
  on startup.

OPTIONS
  -h,--help
    Display help and exit.

SEE ALSO
  emacs(1) info(1) install-info(1)

AUTHOR
  This manual page was written by Norbert Preining <preining@logic.at>,
  for the Debian GNU/Linux system (but may be used by others). This
  manual page was written for the Debian GNU/Linux distribution because
  the original script was designed  for  Debian  packaging system.

Signed-off-by: Norbert Preining <preining@logic.at>

Backport update-info-dir from ubuntu 1404, and add xz/bz2 compression support

[YOCTO #6751]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 scripts/postinst-intercepts/update_info_dir | 84 +++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100755 scripts/postinst-intercepts/update_info_dir

diff --git a/scripts/postinst-intercepts/update_info_dir b/scripts/postinst-intercepts/update_info_dir
new file mode 100755
index 0000000..8ef55ec
--- /dev/null
+++ b/scripts/postinst-intercepts/update_info_dir
@@ -0,0 +1,84 @@
+#!/bin/bash
+# update-info-dir
+# create a dir file from all installed info files
+# Copyright 2009 Norbert Preining
+# GPLv2
+
+INFODIR=$D${infodir}
+
+set -e
+
+#
+# since user's environment is taken over into root account when sudo-ing
+# we don't want that one's user LANGUAGE setting changes the messages in
+# the dir file. Unset LANGUAGE and reload /etc/environment to get
+# the system wide settings. See bug #536476
+unset LANGUAGE
+unset LANG
+if [ -r /etc/environment ] ; then
+  . /etc/environment
+fi
+if [ -r /etc/default/locale ] ; then
+  . /etc/default/locale
+fi
+
+Help ()
+{
+    echo "\
+SYNOPSIS: update-info-dir [-h,--help] [info-directory]
+
+(re-)creates the index of available documentation in info format
+(the file /usr/share/info/dir) which is usually presented by info browsers
+on startup."
+
+    exit 0
+}
+
+
+if [ "$1" = "-h" ] || [ "$1" == "--help" ]; then
+    Help
+fi
+
+if [ -n "$1" ] ; then
+  INFODIR="$1"
+fi
+
+if [ ! -d "$INFODIR" ] ; then
+  echo "Not a directory: $INFODIR." >&2
+  exit 1
+fi
+
+if [ -r "$INFODIR/dir" ] ; then
+  rm -f "$INFODIR/dir.old"
+  cp $INFODIR/dir $INFODIR/dir.old
+fi
+
+# we have to remove the dir file not make ginstall-info being surprised
+rm -f "$INFODIR/dir"
+
+errors=0
+find "$INFODIR" -type f | while read file ; do
+  case $file in
+    */dir|*/dir.old| \
+    *-[0-9]|*-[0-9].gz|*-[0-9].xz|*-[0-9].bz2| \
+    *-[1-9][0-9]|*-[1-9][0-9].gz|*-[1-9][0-9].xz|*-[1-9][0-9].bz2| \
+    *.png)
+      # these files are ignored
+      continue
+      ;;
+    *)
+      ${STAGING_BINDIR_NATIVE}/install-info "$file" "$INFODIR/dir" || {
+        errors=$[errors+1]
+      }
+      ;;
+  esac
+done
+
+if [ $errors -gt 0 ] ; then
+  echo "Updating the index of info documentation produced $errors errors."
+  exit 1
+fi
+
+exit 0
+
+# vim:set expandtab tabstop=2: #
-- 
1.9.1


