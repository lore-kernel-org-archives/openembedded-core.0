Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id AABEF77399
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 22:39:01 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2017 14:39:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,143,1484035200"; d="scan'208";a="64367283"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by fmsmga006.fm.intel.com with ESMTP; 10 Feb 2017 14:39:02 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 16:46:24 -0600
Message-Id: <1486766784-23808-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] scripts/contrib/patchtest: run patchtest on local branch
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
X-List-Received-Date: Fri, 10 Feb 2017 22:39:03 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The script run patchtest on local branch commits, printing results into
stdout. This script is useful to test patches before sending to the
mailing list.

Examples:

$ git checkout master-next-1.9
Branch master-next-1.9 set up to track remote branch master-next-1.9 from origin.
Switched to a new branch 'master-next-1.9'

  $ ~/scripts/contrib/patchtest.sh
  166e70e: Robert Yang: Thu Apr 2 12:01:37 2015 +0100: patch: fix CVE-2015-1196: FAIL
   Issue             Missing or incorrectly formatted CVE tag in commit message [test_cve_presence_in_commit_message]
    Suggested fix    Include a "CVE-xxxx-xxxx" tag in the commit message
   Issue             Missing or incorrectly formatted CVE tag in included patch file [test_cve_tag_format]
    Suggested fix    Correct or include the CVE tag on cve patch with format: "CVE: CVE-YYYY-XXXX"

  eaa4536: Robert Yang: Thu Apr 2 12:01:37 2015 +0100: wget: 1.16.1 -> 1.16.2: OK

  3c29ce3: Robert Yang: Thu Apr 2 12:01:38 2015 +0100: git: 2.3.0 -> 2.3.1: OK

  85491f6: Khem Raj: Thu Apr 2 12:01:38 2015 +0100: gdb: Upgrade 7.8.1 -> 7.9: OK

  f701142: Robert Yang: Thu Apr 2 12:01:38 2015 +0100: binutils: upgrade to 2.25: OK

  385d0b1: Khem Raj: Thu Apr 2 12:01:39 2015 +0100: binutils: Fix ICE in gold: OK

[YOCTO #10720]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/contrib/patchtest.sh | 118 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100755 scripts/contrib/patchtest.sh

diff --git a/scripts/contrib/patchtest.sh b/scripts/contrib/patchtest.sh
new file mode 100755
index 0000000..7fe5666
--- /dev/null
+++ b/scripts/contrib/patchtest.sh
@@ -0,0 +1,118 @@
+#!/bin/bash
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# patchtest: Run patchtest on commits starting at master
+#
+# Copyright (c) 2017, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+#
+set -o errexit
+
+# Default values
+pokydir=''
+
+usage() {
+CMD=$(basename $0)
+cat <<EOM
+Usage: $CMD [-h] [-p pokydir]
+  -p pokydir  Defaults to current directory
+EOM
+>&2
+    exit 1
+}
+
+function clone() {
+    local REPOREMOTE=$1
+    local REPODIR=$2
+    if [ ! -d $REPODIR ]; then
+	git clone $REPOREMOTE $REPODIR --quiet
+    else
+	( cd $REPODIR; git pull --quiet )
+    fi
+}
+
+while getopts ":p:h" opt; do
+    case $opt in
+	p)
+	    pokydir=$OPTARG
+	    ;;
+	h)
+	    usage
+	    ;;
+	\?)
+	    echo "Invalid option: -$OPTARG" >&2
+	    usage
+	    ;;
+	:)
+	    echo "Option -$OPTARG requires an argument." >&2
+	    usage
+	    ;;
+    esac
+done
+shift $((OPTIND-1))
+
+CDIR="$PWD"
+
+# default pokydir to current directory if user did not specify one
+if [ -z "$pokydir" ]; then
+    pokydir="$CDIR"
+fi
+
+PTENV="$PWD/patchtest"
+PT="$PTENV/patchtest"
+PTOE="$PTENV/patchtest-oe"
+
+if ! which virtualenv > /dev/null; then
+    echo "Install virtualenv before proceeding"
+    exit 1;
+fi
+
+# activate the virtual env
+virtualenv $PTENV --quiet
+source $PTENV/bin/activate
+
+cd $PTENV
+
+# clone or pull
+clone git://git.yoctoproject.org/patchtest $PT
+clone git://git.yoctoproject.org/patchtest-oe $PTOE
+
+# install requirements
+pip install -r $PT/requirements.txt --quiet
+pip install -r $PTOE/requirements.txt --quiet
+
+PATH="$PT:$PT/scripts:$PATH"
+
+# loop through parent to HEAD and execute patchtest on each commit
+for commit in $(git rev-list master..HEAD --reverse)
+do
+    shortlog="$(git log "$commit^1..$commit" --pretty='%h: %aN: %cd: %s')"
+    log="$(git format-patch "$commit^1..$commit" --stdout | patchtest - -r $pokydir -s $PTOE/tests --base-commit $commit^1 --json 2>/dev/null | create-summary --fail --only-results)"
+    if [ -z "$log" ]; then
+	shortlog="$shortlog: OK"
+    else
+	shortlog="$shortlog: FAIL"
+    fi
+    echo "$shortlog"
+    echo "$log" | sed -n -e '/Issue/p' -e '/Suggested fix/p'
+    echo ""
+done
+
+deactivate
+
+cd $CDIR
-- 
2.1.4


