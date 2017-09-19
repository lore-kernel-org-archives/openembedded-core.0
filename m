Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC5A780B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 15:16:26 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id z39so284843wrb.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/95GgCeiWujg+Fc3LHHRbHYM8THt+RYn3NQ4j1wdBIM=;
	b=oKwiYsInOn5EXNhfVZImVic4EvydrURbyi+SuNTuCTlxktvwilL/4Z1gWgI4A+8ZmR
	qwdXdkY1j3vlqtJTu92TNtm8baF3W7ifGeMWuk2SbRpmBKLD0o7FDfRkCPmVhmsiGpK0
	NZewKmJtF+XnfkEOaUqlQl1bmZzereNmzzHIy9nbXJbhQ7nkl3bC7cGrg+++8EcoJU3g
	zJUbYuakYRNoz0UYCwGcduPvA0VyfZwpQgSaOhVUTj/llbJnOVKZofjMvnwZ/yk19AZd
	AmRd4mPU598MQu57XbkHWxd+2m1p7Ngt6ay9cS6zPPXxr9hRw/Zljz6dt8bDORWiCyaU
	gisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/95GgCeiWujg+Fc3LHHRbHYM8THt+RYn3NQ4j1wdBIM=;
	b=ZUMYMZ3dQ3ujudMj4q3QXxFXVi8wjgl6m3AsxQ+q+gUWyNhClJJ6mxxBqpksuG4TKL
	lfihe0vgJ/0m3O0q5ZS3H7ExHR5+yNODaWUZI5n9aVaB1z/dcPc5Ai2BriCV4+BOuTuU
	bGwl/TtyYXR+svDbsc9Jge616QYHTqPo1wz1ej6S/5VRNTU+KYJt2tt6ocATCHDYrt1c
	0bQBxztsrJENhlnnKAZYgOktVR1izXPbJWO1pyKLMelOHlM03L4eOEYx0qrFMzOtYvCJ
	jdYD7bD1SzLMF7y2EltuaKpk6AxHWOtM2rGxL34/eXtqqa/QjXxROCPMJPG+7PHRkzAY
	l35g==
X-Gm-Message-State: AHPjjUj4Zz/bmPiCoDkuZN7ukXYc2MKQnCKGG8LIc9JTki+adO20hCT1
	fbRV+SzGGVw2W18mnzu6BBSBYw==
X-Google-Smtp-Source: AOwi7QBFZBxTXIEYuUPqAPsec3p4z3GHnydn+jIkGUKYs8CdtpSyfGhfcBjxZ/5U+j4lRMVg9/df9w==
X-Received: by 10.223.163.83 with SMTP id d19mr1774463wrb.84.1505834186846;
	Tue, 19 Sep 2017 08:16:26 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 61sm9209241wre.44.2017.09.19.08.16.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 08:16:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Sep 2017 17:18:51 +0200
Message-Id: <20170919151851.25093-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170913204659.1919-1-Martin.Jansa@gmail.com>
References: <20170913204659.1919-1-Martin.Jansa@gmail.com>
Subject: [RFC][PATCHv2] insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
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
X-List-Received-Date: Tue, 19 Sep 2017 15:16:26 -0000

* we often see QA warnings like:
  glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-en-gb/usr/lib/locale/en_GB/LC_MEASUREMENT is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
  glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-nn-no.iso-8859-1/usr/lib/locale/nn_NO.ISO-8859-1/LC_MEASUREMENT is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
  but we don't know the root cause of it.
* don't trigger error from '^inode mismatch'
* show parts of pseudo.log in console
  many builds are executed in tmpfs, so I cannot check the pseudo.log later
* lower from error to warn as I hate all my builds reporting failure
  just because of this pseudo debug
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
 meta/classes/insane.bbclass | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 0a3b528ddb..76cd92709b 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1238,6 +1238,44 @@ python do_qa_unpack() {
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
+        " -e '^creat ignored for existing file'" \
+        " -e '^creat for.*replaces existing'" \
+        " %s" % pseudolog
+    if subprocess.call("%s -q" % statement, shell=True) == 0:
+        statement2 = "grep -v '^path mismatch' %s" % pseudolog
+        statement2_count = "grep -v '^path mismatch' -c %s" % pseudolog
+        output = subprocess.check_output(statement2, shell=True).decode("utf-8")
+        output_count = subprocess.check_output(statement2_count, shell=True).decode("utf-8").replace('\n', '')
+        bb.warn("This %s indicates %s errors, see %s or %s [qa_pseudo]: %s" % (pseudolog, output_count, statement, statement2, output))
+}
+
 # The Staging Func, to check all staging
 #addtask qa_staging after do_populate_sysroot before do_build
 do_populate_sysroot[postfuncs] += "do_qa_staging "
@@ -1250,6 +1288,11 @@ do_configure[postfuncs] += "do_qa_configure "
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


