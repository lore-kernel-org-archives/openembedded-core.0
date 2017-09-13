Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id C096C78468
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 20:44:41 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id k20so2792273wre.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 13:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=m93sN6UZzX4I1cmfeMaECnu9RJAn9oHpX0VLmiXl1Sw=;
	b=pvX5eqFZ+E/R/9pvLD06SH+OUAe1mw0JRuAAdjBw9Wgug78UH6Xzz2pxSDq/WF59XS
	Pw0DkFzQSAOKzbfvHQIIA6x/i2EoksIIjQp3DngiRzYXQiO8qdeGB2b0y95ZiKCqN3Bj
	71/TC5BNEOA2skkUYMfFaSgRLO4VeooyJQ2NTWuCNLqp7XdYxQXO/b8W/RXz8oJKFFbt
	VULFJ/dmjqimda56+awvNux86JWHRZmBlobkWTQCCjsAdS4y8DQBBwhW+EIDw0YPsvzC
	322pkccih0kXFZDsyOBO6py4W9u05EH9SWoZSBJPR9p2odLMf04qAFy7sEigTVJkUdA1
	FNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m93sN6UZzX4I1cmfeMaECnu9RJAn9oHpX0VLmiXl1Sw=;
	b=ac4L6x0wzADrhmCAjPwHNOgBE1301QwggmwkKX7ZRN7+Kz1WmutyG6HPeVztyt1UYE
	KEfh0kIFyjd6SGniE+EUkGOGh3DEx9xFvR6bMdLB7QAwcouLp49WZ+exM40KgtoN7pXI
	2hSwXHcQuyglNsHLWYRX75vbLH+UfEXsBYBgUFfabOUpDYMhVvbp/+qBZSRSJFRnH+ww
	nZ8QiNCIVo/InctrRPcvakI+Qi+3oJvMR0AxWYcJ0nr98iiSzr82vsUX87gQOcKtGsHb
	Ip5NJ0KuB2zMQinJ9IsUBCHWEbi7V+lAx8qovCNkdQ2jwK4qCf25dFZEXt+RXFfE7q9k
	SwpQ==
X-Gm-Message-State: AHPjjUisFzzDAgcfrlHJWJg5tmJcMdPh9LJNUzzQ3iasNF21Fsv69DXh
	CzTfvvzcuFd6fzaO
X-Google-Smtp-Source: ADKCNb4hKqY/dYSzxhzLTJIBanzP4IQneRfIIIYtvFuGRzMs6Q4AZ1+jGnTcc74IMVmgea99I67ZJg==
X-Received: by 10.223.160.23 with SMTP id k23mr16581610wrk.212.1505335482116; 
	Wed, 13 Sep 2017 13:44:42 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b89sm30148405wrd.42.2017.09.13.13.44.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 13:44:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Sep 2017 22:46:59 +0200
Message-Id: <20170913204659.1919-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [RFC][PATCH] insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
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
X-List-Received-Date: Wed, 13 Sep 2017 20:44:42 -0000

* we often see QA warnings like:
  glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-en-gb/usr/lib/locale/en_GB/LC_MEASUREMENT is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
  glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-nn-no.iso-8859-1/usr/lib/locale/nn_NO.ISO-8859-1/LC_MEASUREMENT is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
  but we don't know the root cause of it.
* the only theory we currently have is that it's a bug in pseudo when
  inode is being reused for different files, which is supported by
  pseudo.log entries:

  Good build:
  pseudo$ grep -v "^path mismatch" pseudo.log
  debug_logfile: fd 2
  pid 7975 [parent 7974], doing new pid setup and server start
  Setup complete, sending SIGUSR1 to pid 7974.
  db cleanup for server shutdown, 17:33:58.787
  memory-to-file backup complete, 17:33:58.787.
  db cleanup finished, 17:33:58.787

  Build with QA host-user-contaminated issue:
  ERROR: foo-1.0.0-r0 do_package_qa: QA Issue: foo: file-with-wrong-UID is owned
  by uid 2001, which is the same as the user running bitbake. This may be due to
  host contamination [host-user-contaminated]

  pseudo$ grep "file-with-wrong-UID" pseudo.log
  inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in request.
  creat ignored for existing file 'file-with-wrong-UID'.
  inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in request.
  inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in request.
  inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in request.
  inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in request.
  inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in request.
  inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in request.
  path mismatch [1 link]: ino 13242270 db 'file-with-wrong-UID' req 'some-other-unrelated-file'.
  creat for 'some-other-unrelated-file' replaces existing 13242270 ['file-with-wrong-UID'].
  db cleanup for server shutdown, 02:16:23.685
  memory-to-file backup complete, 02:16:23.685.
  db cleanup finished, 02:16:23.685

  And some-other-unrelated-file is really some different file, not just hardlink
  to the same file from some different directory (like between WORKDIR and sysroot
  other "path mismatch" entries show).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/insane.bbclass | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 78b41caf99..617bf7011d 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1237,6 +1237,41 @@ python do_qa_unpack() {
         bb.warn('%s: the directory %s (%s) pointed to by the S variable doesn\'t exist - please set S within the recipe to point to where the source has been unpacked to' % (d.getVar('PN'), d.getVar('S', False), s_dir))
 }
 
+python do_qa_pseudo() {
+    ###########################################################################
+    # Check pseudo.log for unexpected errors
+    #
+    # Typical pseudo.log contains many "^path mismatch" lines for all the hardlinked files
+    # e.g. in some smaller component I see 231/237 lines to be "^path mismatch" other 6
+    # lines are setup and cleanup lines like this:
+    # debug_logfile: fd 2
+    # pid 7975 [parent 7974], doing new pid setup and server start
+    # Setup complete, sending SIGUSR1 to pid 7974.
+    # db cleanup for server shutdown, 17:33:58.787
+    # memory-to-file backup complete, 17:33:58.787.
+    # db cleanup finished, 17:33:58.787
+    #
+    # but if there is one of:
+    # "^inode mismatch"
+    # "^creat ignored for existing file"
+    # "^creat for.*replaces existing"
+    # then there might be some bigger issue which sometimes results in host-user-contaminated QA warnings
+    ###########################################################################
+
+    import subprocess
+
+    pseudodir = d.getVar('PSEUDO_LOCALSTATEDIR')
+    bb.note("Checking pseudo.log for common errors")
+    pseudolog = os.path.join(pseudodir, "pseudo.log")
+    statement = "grep" \
+        " -e '^inode mismatch'" \
+        " -e '^creat ignored for existing file'" \
+        " -e '^creat for.*replaces existing'" \
+        " %s" % pseudolog
+    if subprocess.call("%s -q" % statement, shell=True) == 0:
+        bb.fatal("This %s indicates errors, see %s or grep -v '^path mismatch' %s" % (pseudolog, statement, pseudolog))
+}
+
 # The Staging Func, to check all staging
 #addtask qa_staging after do_populate_sysroot before do_build
 do_populate_sysroot[postfuncs] += "do_qa_staging "
@@ -1249,6 +1284,11 @@ do_configure[postfuncs] += "do_qa_configure "
 # Check does S exist.
 do_unpack[postfuncs] += "do_qa_unpack"
 
+# Check pseudo.log for unexpected errors
+# For some reason do_build postfunction isn't executed
+# do_build[postfuncs] += "do_qa_pseudo"
+addtask do_qa_pseudo after do_populate_sysroot do_packagedata do_package before do_build
+
 python () {
     import re
     
-- 
2.14.1


