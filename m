Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web12.1058.1587667211423703688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 11:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=VkC5S2EW;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.214.195, mailfrom: rahulk@mvista.com)
Received: by mail-pl1-f195.google.com with SMTP id z6so2689244plk.10
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 11:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=9SeOwTBJCz7X62XII13nqnPzGGC28Y9d93Zv56VLw8Y=;
        b=VkC5S2EWqFCDymHKVdJvsJ5PLE3zxcOjKYX9w0IVZUymVQ1ehPm/UNm/AeVV7LZo8l
         5yjD4tGharT3kOAx1kIbcfEk1ZMDyKYrBOFHnO81aJaL+X7LBXXUiUoE1VydWB35//r1
         CahJg4F9JC19sCLgbp23Fqyd787t3zhOXFi55gE0Hq45Cl4ALXGMiBvVL2pDB3wyJl0w
         fVdmgrPaTPbCN/TRNmQhUrOxorwcoCIPIKnTbPHuEMJa64JR3szorSrX17jeaCzmfD3o
         Fg8xBSk3P74jb0IlZSv06yB1yl4K22/caJhRxPS4apM8XQlaeYh+D4PYHK91AH0qNBXk
         DaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9SeOwTBJCz7X62XII13nqnPzGGC28Y9d93Zv56VLw8Y=;
        b=r4+gynvyqHHjBt16mXO/dAXWqa6QuvRpSYi+ZyGLvLm4lBo9hdZEICN6h5AVsfIs2Z
         utt2SZSsJp5uUZU1PJs0lmGMk4GqZKuiLei6Ue+Rgp7hFgzvsiprZIuA6zG76ls5SRmd
         Fe4oIcaVu1pELoEgo3ESqmvwcbrYu2xjtLT23nv/ciQoFvhvFqaXhkBQEO0/0Tch8YVJ
         1Lo96FGVTizcWqvqfIxMs2+vGAigWbY7sRcFvLWGZ3hgwGbyN5IaZgHPteGgGDqxUSSR
         EKx79cDFStnyHwfZySnzzId1GoF/WsjpW2/h79Ecbp/5G9ZKR9Ixz3iYVSy3HwuYhDl5
         Hnvw==
X-Gm-Message-State: AGi0PuYxw7qmHFvflUKQiaLWhecsixuHOf5MdZPbgJU1r3T10/FmymiQ
	Fbo5T+4VXNoCWPFPSusuJTEEQN+h1mg=
X-Google-Smtp-Source: APiQypKceCQtvQl6UV43OrfQrAl02mZ6oitP6trlasnyJqd4tSygz5QULse6Rt0a4laTpWwesTeSew==
X-Received: by 2002:a17:90a:1f8f:: with SMTP id x15mr2100726pja.76.1587667210042;
        Thu, 23 Apr 2020 11:40:10 -0700 (PDT)
Return-Path: <rahulk@mvista.com>
Received: from CelSys065.mvista.com ([36.255.87.194])
        by smtp.gmail.com with ESMTPSA id k63sm3059545pjb.6.2020.04.23.11.40.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Apr 2020 11:40:09 -0700 (PDT)
From: "Rahul Kumar" <rahulk@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rahul Kumar <rahulk@mvista.com>
Subject: [PATCH v2] bzip2: Add test suite for bzip2
Date: Fri, 24 Apr 2020 00:09:47 +0530
Message-Id: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
X-Mailer: git-send-email 2.7.4

Source: git://sourceware.org/git/bzip2-tests.git
Type: Enhancement
Description:
bzip2 now has a test suite available at git://sourceware.org/git/bzip2-tests.git.

This is a collection of "interesting" .bz2 files that can be used to
test bzip2 works correctly. They come from different projects.

Some files are deliberately bad, and are use to see how bzip2 handles
corrupt files. They are explicitly not intended to decompress correctly,
but to catch errors in bzip2 trying to deal with deliberately bad data.
All such files have a name ending in .bz2.bad.

All non-bad files end in bz2. And should come with a .md5 file for
the original input file. The .md5 file is used to check that bzip2
could correctly decompress the file. The original (non-compressed)
files are deliberately not checked in.

It will by default test with the command 'bzip2', running under
valgrind (if installed on the system).

For each .bz2 file found it is decompressed, recompressed and
decompressed again. Once with the default bzip2 settings and
once in --small (-s) mode.

For each .bz2.bad file decompression is tried twice also. In
default mode and small mode. The bzip2 binary is expected to
return either 1 or 2 as exit status. Any other exit code is
interpreted as failure.

License:
   In bzip2-tests source code Each directory should contain a README
   file explaining where the .bz2 files originally came from.
   Plus a reference to the (Free Software) license that the project
   files were distributed under.

   Adding GPLv3+ License to the bzip2 recipe. Since we modify the
   bzip2-tests.git/run-tests.sh script and we can redistribute it and/or
   modify it under the terms of the GNU General Public License (GPL);
   either version 3, or (at your option) any later version.

   since all other files and directories are unchanged and We are simply
   using the compressed files as data so we are ignoring the license info for
   these files and directories in bzip2-tests.git

Test Summery:
   On qemux86-64/kvm the ptest results with extra filesystem space (atleast 114688) are:

TOTAL: 	396
PASS: 	396
SKIP: 	0
XFAIL: 	0
FAIL: 	0
XPASS: 	0
ERROR: 	0

All tests passed
DURATION: 517

[YOCTO #13444]

Signed-off-by: Rahul Kumar <rahulk@mvista.com>
---
 .../bzip2/0001-bzip2-modify-run-tests-script.patch | 188 +++++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2/Makefile.am      |   2 +
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb         |   9 +-
 3 files changed, 197 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch

diff --git a/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch
new file mode 100644
index 0000000..900a9aa
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch
@@ -0,0 +1,188 @@
+From 8e704bc7bf25f892968eac8bcb40a205248ff5b2 Mon Sep 17 00:00:00 2001
+From: Rahul Kumar <rahulk@mvista.com>
+Date: Mon, 30 Mar 2020 12:17:00 +0530
+Subject: [PATCH] bzip2: modify run-tests script
+
+1) modify run-tests script to write PASS/FAIL as expected by the ptest infrastructure
+
+2) Since the discrete md5sum does not have a short form of --status.And minimal base
+   images does not support commands with long form arguments so dropping this
+   argument
+
+Upstream-Status: Submitted [bzip2-devel@sourceware.org]
+- Submitted to bzip2 mailing list and waiting approval
+
+Signed-off-by: Rahul Kumar <rahulk@mvista.com>
+---
+ run-tests.sh | 62 ++++++++++++++++++++++++++++++++----------------------------
+ 1 file changed, 33 insertions(+), 29 deletions(-)
+
+diff --git a/run-tests.sh b/run-tests.sh
+index 1ba8c27..771584d 100755
+--- a/run-tests.sh
++++ b/run-tests.sh
+@@ -40,21 +40,21 @@ case $i in
+ esac
+ done
+
+-if ! type "valgrind" > /dev/null; then
++if ! type "valgrind" > /dev/null 2>&1; then
+   VALGRIND=""
+   VALGRIND_ARGS=""
+ fi
+
+ echo "Testing ${BZIP2} in directory ${TESTS_DIR}"
+ if [ "$VALGRIND" != "" ]; then
+-  echo "  using valgrind"
++  echo "Using valgrind: Yes"
+ else
+-  echo "  NOT using valgrind"
++  echo "Using valgrind: No"
+ fi
+ if [[ ${IGNORE_MD5} -eq 0 ]]; then
+-  echo "  checking md5 sums"
++  echo "Checking md5 sums: Yes"
+ else
+-  echo "  NOT checking md5 sums"
++  echo "Checking md5 sums: No"
+ fi
+
+ # Remove any left over tesfilecopies from previous runs first.
+@@ -78,14 +78,14 @@ while IFS= read -r -d '' bzfile; do
+   # Decompress it.
+   echo "  Decompress..."
+   rm -f "${file}"
+-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${bzfile} \
+-    || { echo "!!! bad decompress result $?";
++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${bzfile} && { echo "PASS: ${bzfile} Decompress"; } \
++    || { echo "FAIL: ${bzfile} Decompress";
+          badtests=("${badtests[@]}" $"${bzfile} bad decompress result")
+          nogood=$[${nogood}+1]; continue; }
+
+   if [[ ${IGNORE_MD5} -ne 1 ]]; then
+-    md5sum --check --status ${md5file} < ${file} \
+-      || { echo "!!! md5sum doesn't match decompressed file";
++    md5sum -c ${md5file} < ${file} && { echo "PASS: ${bzfile} md5sum Matched"; } \
++      || { echo "FAIL: ${bzfile} md5sum Matched";
+            badtests=("${badtests[@]}" $"${file} md5sum doesn't match")
+            nogood=$[${nogood}+1]; continue; }
+   fi
+@@ -94,19 +94,19 @@ while IFS= read -r -d '' bzfile; do
+   mv "${file}" "${copy}"
+   rm -f "${bzcopy}"
+   echo "  Recompress..."
+-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} \
+-    || { echo "!!! bad compress result $?";
++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} && { echo "PASS: ${bzfile} Recompress "; } \
++    || { echo "FAIL: ${bzfile} Recompress";
+          badtests=("${badtests[@]}" $"${copy} bad result")
+          nogood=$[${nogood}+1]; continue; }
+   echo "  Redecompress..."
+-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} \
+-    || { echo "!!! bad (re)decompress result $?";
++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} && { echo "PASS: ${bzfile} Redecompress"; } \
++    || { echo "FAIL: ${bzfile} Redecompress";
+          badtests=("${badtests[@]}" $"${bzcopy} bad result")
+          nogood=$[${nogood}+1]; continue; }
+
+   if [[ ${IGNORE_MD5} -ne 1 ]]; then
+-    md5sum --check --status ${md5file} < ${copy} \
+-      || { echo "!!! md5sum doesn't match (re)decompressed file";
++    md5sum -c ${md5file} < ${copy} && { echo "PASS: ${bzfile} md5sum Matched"; } \
++      || { echo "FAIL: ${bzfile} md5sum Matched";
+            badtests=("${badtests[@]}" $"${copy} md5sum doesn't match")
+            nogood=$[${nogood}+1]; continue; }
+   fi
+@@ -116,14 +116,14 @@ while IFS= read -r -d '' bzfile; do
+   # Now do it all again in "small" mode.
+   echo "  Decompress (small)..."
+   rm -f "${file}"
+-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${bzfile} \
+-    || { echo "!!! bad decompress result $?";
++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${bzfile} &&{ echo "PASS: ${bzfile} Decompress (small)"; } \
++    || { echo "FAIL: ${bzfile} Decompress (small)";
+          badtests=("${badtests[@]}" $"${bzfile} bad decompress result")
+          nogood=$[${nogood}+1]; continue; }
+
+   if [[ ${IGNORE_MD5} -ne 1 ]]; then
+-    md5sum --check --status ${md5file} < ${file} \
+-      || { echo "!!! md5sum doesn't match decompressed file";
++    md5sum -c ${md5file} < ${file} && { echo "PASS: ${bzfile} Md5sum Matched"; } \
++      || { echo "FAIL: ${bzfile} Md5sum Matched";
+            badtests=("${badtests[@]}" $"${file} md5sum doesn't match")
+            nogood=$[${nogood}+1]; continue; }
+   fi
+@@ -132,19 +132,19 @@ while IFS= read -r -d '' bzfile; do
+   mv "${file}" "${copy}"
+   rm -f "${bzcopy}"
+   echo "  Recompress (small)..."
+-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} \
+-    || { echo "!!! bad compress result $?";
++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} && { echo "PASS: ${bzfile} Recompress (small)"; } \
++    || { echo "FAIL: ${bzfile} Recompress (small)";
+          badtests=("${badtests[@]}" $"${copy} bad result")
+          nogood=$[${nogood}+1]; continue; }
+   echo "  Redecompress (small)..."
+-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} \
+-    || { echo "!!! bad (re)decompress result $?";
++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} && { echo "PASS: ${bzfile} Redecompress (small)"; } \
++    || { echo "FAIL: ${bzfile} Redecompress (small)";
+          badtests=("${badtests[@]}" $"${bzcopy} bad result")
+          nogood=$[${nogood}+1]; continue; }
+
+   if [[ ${IGNORE_MD5} -ne 1 ]]; then
+-    md5sum --check --status ${md5file} < ${copy} \
+-      || { echo "!!! md5sum doesn't match (re)decompressed file";
++    md5sum -c ${md5file} < ${copy} && { echo "PASS: ${bzfile} md5sum Matched"; } \
++      || { echo "FAIL: ${bzfile} md5sum : Miss Matched";
+            badtests=("${badtests[@]}" $"${copy} md5sum doesn't match")
+            nogood=$[${nogood}+1]; continue; }
+   fi
+@@ -176,7 +176,7 @@ while IFS= read -r -d '' badfile; do
+   ret=$?
+
+   if [[ ${ret} -eq 0 ]]; then
+-    echo "!!! badness not detected"
++    echo "FAIL: badness not detected"
+     nobad=$[${nobad}+1]
+     badtests=("${badtests[@]}" $"${badfile} badness not detected")
+     continue
+@@ -185,10 +185,12 @@ while IFS= read -r -d '' badfile; do
+   # Assumes "normal" badness is detected by exit code 1 or 2.
+   # A crash or valgrind issue will be reported with something else.
+   if [[ ${ret} != 1 ]] && [[ ${ret} != 2 ]]; then
+-    echo "!!! baddness caused baddness in ${BZIP2}"
++    echo "FAIL: baddness caused baddness in ${BZIP2}"
+     badbad=$[${badbad}+1]
+     badtests=("${badtests[@]}" $"${badfile} badness caused baddness")
+     continue
++  else
++    echo "PASS: Correctly found data integrity errors in ${badfile} during decompress."
+   fi
+
+   echo "  Trying to decompress (small)..."
+@@ -196,7 +198,7 @@ while IFS= read -r -d '' badfile; do
+   ret=$?
+
+   if [[ ${ret} -eq 0 ]]; then
+-    echo "!!! badness not detected"
++    echo "FAIL: badness not detected "
+     nobad=$[${nobad}+1]
+     badtests=("${badtests[@]}" $"${badfile} badness not detected")
+     continue
+@@ -205,10 +207,12 @@ while IFS= read -r -d '' badfile; do
+   # Assumes "normal" badness is detected by exit code 1 or 2.
+   # A crash or valgrind issue will be reported with something else.
+   if [[ ${ret} != 1 ]] && [[ ${ret} != 2 ]]; then
+-    echo "!!! baddness caused baddness in ${BZIP2}"
++    echo "FAIL: baddness caused baddness in ${BZIP2}"
+     badbad=$[${badbad}+1]
+     badtests=("${badtests[@]}" $"${badfile} badness caused baddness")
+     continue
++  else
++    echo "PASS: Correctly found data integrity errors in ${badfile} during decompress (small)"
+   fi
+
+ done < <(find ${TESTS_DIR} -type f -name \*\.bz2.bad -print0)
+--
+2.7.4
diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am b/meta/recipes-extended/bzip2/bzip2/Makefile.am
index dcf6458..aab6558 100644
--- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
+++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
@@ -46,6 +46,7 @@ runtest:
 	else echo "FAIL: sample2 decompress"; fi
 	@if cmp sample3.tst sample3.ref; then echo "PASS: sample3 decompress";\
 	else echo "FAIL: sample3 decompress"; fi
+	./bzip2-tests/run-tests.sh --tests-dir="$(PWD)/bzip2-tests"
 
 install-ptest:
 	sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
@@ -56,6 +57,7 @@ install-ptest:
 	cp $(srcdir)/sample1.bz2	$(DESTDIR)/
 	cp $(srcdir)/sample2.bz2	$(DESTDIR)/
 	cp $(srcdir)/sample3.bz2	$(DESTDIR)/
+	cp -rf $(srcdir)/../git		$(DESTDIR)/bzip2-tests
 	ln -s $(bindir)/bzip2		$(DESTDIR)/bzip2
 
 install-exec-hook:
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 8e9b779..983fabd 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -4,17 +4,22 @@ Huffman coding. Compression is generally considerably better than that achieved
 LZ77/LZ78-based compressors, and approaches the performance of the PPM family of statistical compressors."
 HOMEPAGE = "https://sourceware.org/bzip2/"
 SECTION = "console/utils"
-LICENSE = "bzip2"
+LICENSE = "bzip2 & GPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"
 
 SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
+           git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests \
            file://configure.ac;subdir=${BP} \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest \
+           file://0001-bzip2-modify-run-tests-script.patch;patchdir=${WORKDIR}/git \
            "
+
 SRC_URI[md5sum] = "67e051268d0c475ea773822f7500d0e5"
 SRC_URI[sha256sum] = "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
 
+SRCREV_bzip2-tests = "8b0198efda1603cf81fa2c7a9bb673dd22ae1661"
+
 UPSTREAM_CHECK_URI = "https://www.sourceware.org/pub/bzip2/"
 
 PACKAGES =+ "libbz2"
@@ -39,7 +44,7 @@ do_install_ptest () {
 
 FILES_libbz2 = "${libdir}/lib*${SOLIBS}"
 
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make bash"
 
 PROVIDES_append_class-native = " bzip2-replacement-native"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

