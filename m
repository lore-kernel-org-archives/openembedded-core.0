Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
 by mx.groups.io with SMTP id smtpd.web12.8745.1628694463533485291
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 08:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=binIWrYs;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.18, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id DppUmLJU7HBkXDppVm3ZiL; Wed, 11 Aug 2021 16:07:41 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=fI+iIaSe c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=MhDmnRu9jo8A:10 a=Q4-j1AaZAAAA:8 a=xGBGulLp4P8ArtM1ACgA:9 a=CjuIK1q_8ugA:10
 a=YzhLYHfkAAAA:8 a=-An2I_7KAAAA:8 a=u0eky40w7l-twc6OIKsA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=6iqyyUokzKIM7e-RUlh-:22 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=8ZfIcs+s1oFHvuIzEdme3i1wWpGS9g0BtHVKNRESquE=; b=binIW
	rYsZccxEdLac/M+vkq6Y1iFUrC5H0s2CIP8prML8rBay+UMl+YNNkPmaIkrO/scl8ri/gRSzgs/Lk
	rEaloHX6Vi/+Sz83NYqEte/BO0K0rgdBhjmg2/tWJDiMBHYb89kLCwIVzk3c5K7ZYcw73+lRg6JDq
	vD2wb3T6BT5VAonez/P0ZCtJkUvnFulr5miyoLY4a3B8qtEikA+5QRiOYHVm3AIMjvghyq30Wmu4/
	3rFkxn9MDnFui3KO+WKAtMk4byWnjM06DvjaF22IglUA4zvNcF/kVy5lQVfbwrwgp375CzJ4wZJiv
	xUGADMGYX3nboHt4LV8jWiYS1c8uQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1mDppU-0007mD-14; Wed, 11 Aug 2021 16:07:40 +0100
Date: Wed, 11 Aug 2021 16:07:40 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Seebs <seebs@seebs.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] pseudo: Outdated records for newly-ignored paths in database cause mismatches
Message-ID: <20210811150740.GA18191@mcrowe.com>
References: <20210809121951.GA480@mcrowe.com>
 <20210809090916.18dd75fe@seebsdell>
MIME-Version: 1.0
In-Reply-To: <20210809090916.18dd75fe@seebsdell>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfGxgqHg8S4q8qjsdKTW3Rkm7UUcaJ7t7/T21CAZ4CgY01iPdo7YQKeRvxkzdjWRqzjahwu4Ii7gNLJQcQd+HwyV+nVRqdAWwgmdfYovXby7Ew4WJqY+u
 gM7mTZziVFhzQ/gWDoMRTBIv2f6rFG3qFi0pN5Fk6/gMFvQWVbwGdWXXtM/EkSzgZWwt2Le7Xitx6A==
X-Groupsio-MsgNum: 154721
Content-Type: multipart/mixed; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 09 August 2021 at 09:09:16 -0500, Seebs wrote:
> On Mon, 9 Aug 2021 13:19:51 +0100
> "Mike Crowe via lists.openembedded.org"
> <yocto=mac.mcrowe.com@lists.openembedded.org> wrote:
> 
> > Cleaning the work directory makes the problem go away because that
> > deletes the pseudo databases.
> > 
> > Does the above make sense as an explanation for these errors? If so,
> > is there a good way to avoid these errors?
> 
> Good diagnostic work, makes sense to me. It would make some sense for
> pseudo to ignore mismatches involving ignored paths, but it wasn't
> originally designed with the ignored paths concept, so it currently
> doesn't.

Thanks for the review.

I have a test case and patch for pseudo (attached) to detect newly-ignored
paths and warn rather than abort on them, but I'm not really convinced that
it is the right solution. Ideally the errant entry would be removed from
the database too in order to avoid having to continue to consult the ignore
list.

It's not even clear to me that oe-core continuing to use an existing pseudo
database after the value of PSEUDO_CLIENT_IGNORE_PATH changes is a sane
thing to expect to work. Perhaps we could just arrange to force a whole new
work directory in that case?

Thanks.

Mike.

--LZvS9be/3tNcYl/X
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-pseudo-Path-mismatch-on-now-ignored-path-should-not-.patch"

From e81aeff391148280d76609e5782bf7f0a115f72e Mon Sep 17 00:00:00 2001
From: Mike Crowe <mcrowe@brightsign.biz>
Date: Wed, 11 Aug 2021 15:55:55 +0100
Subject: [PATCH] pseudo: Path mismatch on now-ignored path should not be fatal

If a database survives from before a change to PSEUDO_CLIENT_IGNORE_PATH
then there's a risk that the now-ignored files have been deleted and
their inodes re-used without pseudo noticing. Such files are reported as
path mismatches which provoke aborts.

Let's check to see whether the database filename would now be ignored,
and if so just warn about the mismatch rather than aborting.

Unfortunately the test case for this doesn't fit into the existing
infrastructure since the server must be restarted during the test.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 pseudo.c                                      |  2 +
 run_tests.sh                                  | 16 ++++++++
 .../standalone-test-newly-ignored-mismatch.sh | 41 +++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100755 test/standalone-test-newly-ignored-mismatch.sh

diff --git a/pseudo.c b/pseudo.c
index 528fe1b..30b0a36 100644
--- a/pseudo.c
+++ b/pseudo.c
@@ -695,6 +695,8 @@ pseudo_op(pseudo_msg_t *msg, const char *program, const char *tag, char **respon
 					 */
 					pseudo_debug(PDBGF_FILE, "inode mismatch for '%s' -- old one was marked for deletion.\n",
 						msg->path);
+				} else if (path_by_ino && pseudo_client_ignore_path(path_by_ino)) {
+					pseudo_diag("path mismatch on now-ignored '%s'", path_by_ino);
 				} else {
 					pseudo_diag("path mismatch [%d link%s]: ino %llu db '%s' req '%s'.\n",
 						msg->nlink,
diff --git a/run_tests.sh b/run_tests.sh
index c637c27..a0b8675 100755
--- a/run_tests.sh
+++ b/run_tests.sh
@@ -48,5 +48,21 @@ do
     fi
     rm -rf var/pseudo/*
 done
+for file in test/standalone-test*.sh
+do
+    filename=${file#test/}
+    let num_tests++
+    mkdir -p var/pseudo
+    $file ${opt_verbose}
+    if [ "$?" -eq "0" ]; then
+        let num_passed_tests++
+        if [ "${opt_verbose}" == "-v" ]; then
+            echo "${filename%.sh}: Passed."
+        fi
+    else
+        echo "${filename/%.sh}: Failed."
+    fi
+    rm -rf var/pseudo/*
+done
 echo "${num_passed_tests}/${num_tests} test(s) passed."
 
diff --git a/test/standalone-test-newly-ignored-mismatch.sh b/test/standalone-test-newly-ignored-mismatch.sh
new file mode 100755
index 0000000..bf7d5f7
--- /dev/null
+++ b/test/standalone-test-newly-ignored-mismatch.sh
@@ -0,0 +1,41 @@
+#!/bin/bash
+#
+# SPDX-License-Identifier: LGPL-2.1-only
+#
+export PSEUDO_PREFIX=${PWD}
+pseudo=bin/pseudo
+
+trap "rm -rf testdir" EXIT
+rm -rf testdir
+mkdir testdir || exit 1
+
+mkdir -p testdir/to-be-ignored
+mkdir -p testdir/not-ignored
+
+create_files() {
+    for i in a b c d e f g h i j; do
+	for j in 0 1 2 3 4 5 6 7 8 9; do
+	    touch testdir/to-be-ignored/$i$j
+	done
+    done
+}
+
+test_results() {
+    for i in a b c d e f g h i j; do
+	for j in 0 1 2 3 4 5 6 7 8 9; do
+	    touch testdir/not-ignored/$i$j
+	done
+    done
+}
+
+export -f create_files
+export -f test_results
+
+export PSEUDO_IGNORE_PATHS=/initial
+
+$pseudo /bin/bash -c "create_files"
+rm testdir/to-be-ignored/*
+
+# Kill server so that we can change the value of PSEUDO_IGNORE_PATHS
+$pseudo -S
+PSEUDO_IGNORE_PATHS=${PWD}/testdir/to-be-ignored $pseudo /bin/bash -c "test_results"
-- 
2.30.2


--LZvS9be/3tNcYl/X--
