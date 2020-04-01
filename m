Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.1777.1585728095592415410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 01:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=fdX6dVeO;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: parse error for token &{10 18 _netblocks.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.215.195, mailfrom: rahulk@mvista.com)
Received: by mail-pg1-f195.google.com with SMTP id 142so11728013pgf.11
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 01:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=IXuhQ0/d25M9aohhuMsE2f+6Ft/WE7z1GD9T96b0/pI=;
        b=fdX6dVeOO5qPuUpIHhu3TL9H++FaAohdU9obO1txdQJIwPloxsZdNqZwFvi9sZBkQI
         jVoWyoNkDW+BlhSnqjffZobnrdkyZV1cA6AulSKwV8SmW5h7UgtrJKDNg7b31G2TFMbs
         3NmREtouyK/zeEhTVuYuD2uavt3TIzdHvmC+Lp1zewvHMM/MRR/h6Sy9qLh1nJ6QVbTA
         6vMrq3pSTFdhMYw0cyVNwAA3lEy4XrD/jsjNkfI3tHxAPwVwpEds+TbeNtkEy0JCLPmy
         OgCALX2NIX9ACk7Jmodep08QW+VvUBNHrhvYJpd12n0I6jKcMRC9Tm+pED+/vueqGJfk
         a2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IXuhQ0/d25M9aohhuMsE2f+6Ft/WE7z1GD9T96b0/pI=;
        b=EHxrpNAm9UX/CRDS77lN5UybJO+UHAumjtW2RM80GP6MGGI+o21mM1/u6vdKetNzZa
         8oy8LvMTpcFSqGN2PhjXJeN+yjYc74rJD5/2vrSp+nhjALszZOahVuV3Sn8xRFQGPyA/
         sc9hL0NLawMreI1BMq96rrl4V4xJAEgAhRzpqDcRSRgKTaOCQC7xTz6+k5M9urWkWu3B
         z4ClDRRFu53N9SkWcll4JkRTxFELtg1HomQXrpHem7y0yYINycCBRdWyTDpoDAAgNzsg
         ES/KyEQk6UHVbaQ1FKGpbluYQt1Krsj4+wnOEA1/diyd5z132YsZExqqVEbW2x5Ct0US
         nt5Q==
X-Gm-Message-State: ANhLgQ162weV3Fl4mHMdJEdmImd9xt3SAzNzzw+bsVVVMRkYMyv5FkjE
	yWLUZxjgU/2uWlpDN6sCy6sv8yJ3CWg=
X-Google-Smtp-Source: ADFU+vuMhX3eBShhVVfuM0/OFHf+PEacqSvoiDUeS6NpJZcRwEYfoMuSz58/E/c07cpElez7IKhnxw==
X-Received: by 2002:a63:c06:: with SMTP id b6mr21529194pgl.218.1585728094203;
        Wed, 01 Apr 2020 01:01:34 -0700 (PDT)
Return-Path: <rahulk@mvista.com>
Received: from CelSys065.mvista.com ([36.255.87.199])
        by smtp.gmail.com with ESMTPSA id f69sm967416pfa.124.2020.04.01.01.01.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 01 Apr 2020 01:01:33 -0700 (PDT)
From: "Rahul Chauhan" <rahulk@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rahul Kumar <rahulk@mvista.com>
Subject: [PATCH] bzip2: Add test suite for bzip2
Date: Wed,  1 Apr 2020 13:30:58 +0530
Message-Id: <1585728058-5776-1-git-send-email-rahulk@mvista.com>
X-Mailer: git-send-email 2.7.4

[YOCTO #13444]

Signed-off-by: Rahul Kumar <rahulk@mvista.com>
---
 .../bzip2/0001-bzip2-modify-run-tests-script.patch | 218 +++++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2/Makefile.am      |   2 +
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb         |  15 +-
 3 files changed, 232 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch

diff --git a/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch
new file mode 100644
index 0000000..4da3bd6
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch
@@ -0,0 +1,218 @@
+From 3be937cadc9e379334eddc9e8042d46357f0330b Mon Sep 17 00:00:00 2001
+From: Rahul Kumar <rahulk@mvista.com>
+Date: Mon, 30 Mar 2020 12:17:00 +0530
+Subject: [PATCH] bzip2: modify run-tests script
+
+modify run-tests script to write PASS/FAIL as expected by the ptest infrastructure
+
+Signed-off-by: Rahul Kumar <rahulk@mvista.com>
+---
+ run-tests.sh | 83 +++++++++++++++++++++++++++++++-----------------------------
+ 1 file changed, 43 insertions(+), 40 deletions(-)
+
+diff --git a/run-tests.sh b/run-tests.sh
+index 1ba8c27..1eff62a 100755
+--- a/run-tests.sh
++++ b/run-tests.sh
+@@ -10,7 +10,7 @@
+ VALGRIND="valgrind"
+ VALGRIND_ARGS="-q --error-exitcode=9"
+ BZIP2="bzip2"
+-TESTS_DIR="."
++TESTS_DIR="./bzip2-tests"
+ IGNORE_MD5=0
+
+ for i in "$@"
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
+@@ -76,16 +76,16 @@ while IFS= read -r -d '' bzfile; do
+   echo "Processing ${bzfile}"
+
+   # Decompress it.
+-  echo "  Decompress..."
++  # echo "  Decompress..."
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
+@@ -93,20 +93,20 @@ while IFS= read -r -d '' bzfile; do
+   # Compress and decompress a copy
+   mv "${file}" "${copy}"
+   rm -f "${bzcopy}"
+-  echo "  Recompress..."
+-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} \
+-    || { echo "!!! bad compress result $?";
++  # echo "  Recompress..."
++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} && { echo "PASS: ${bzfile} Recompress "; } \
++    || { echo "FAIL: ${bzfile} Recompress";
+          badtests=("${badtests[@]}" $"${copy} bad result")
+          nogood=$[${nogood}+1]; continue; }
+-  echo "  Redecompress..."
+-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} \
+-    || { echo "!!! bad (re)decompress result $?";
++  # echo "  Redecompress..."
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
+@@ -114,16 +114,16 @@ while IFS= read -r -d '' bzfile; do
+   rm "${copy}"
+
+   # Now do it all again in "small" mode.
+-  echo "  Decompress (small)..."
++  # echo "  Decompress (small)..."
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
++    md5sum -c ${md5file} < ${file} > /dev/null 2>&1 && { echo "PASS: ${bzfile} Md5sum Matched"; } \
++      || { echo "FAIL: ${bzfile} Md5sum Matched";
+            badtests=("${badtests[@]}" $"${file} md5sum doesn't match")
+            nogood=$[${nogood}+1]; continue; }
+   fi
+@@ -131,20 +131,20 @@ while IFS= read -r -d '' bzfile; do
+   # Compress and decompress a copy
+   mv "${file}" "${copy}"
+   rm -f "${bzcopy}"
+-  echo "  Recompress (small)..."
+-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} \
+-    || { echo "!!! bad compress result $?";
++  # echo "  Recompress (small)..."
++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} && { echo "PASS: ${bzfile} Recompress (small)"; } \
++    || { echo "FAIL: ${bzfile} Recompress (small)";
+          badtests=("${badtests[@]}" $"${copy} bad result")
+          nogood=$[${nogood}+1]; continue; }
+-  echo "  Redecompress (small)..."
+-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} \
+-    || { echo "!!! bad (re)decompress result $?";
++  # echo "  Redecompress (small)..."
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
+@@ -169,14 +169,14 @@ nobad=0
+ badbad=0
+ while IFS= read -r -d '' badfile; do
+
+-  echo "Processing ${badfile}"
++  # echo "Processing ${badfile}"
+
+-  echo "  Trying to decompress..."
++  # echo "  Trying to decompress..."
+   ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${badfile}
+   ret=$?
+
+   if [[ ${ret} -eq 0 ]]; then
+-    echo "!!! badness not detected"
++    echo "FAIL: badness not detected"
+     nobad=$[${nobad}+1]
+     badtests=("${badtests[@]}" $"${badfile} badness not detected")
+     continue
+@@ -185,18 +185,20 @@ while IFS= read -r -d '' badfile; do
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
+-  echo "  Trying to decompress (small)..."
++  # echo "  Trying to decompress (small)..."
+   ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${badfile}
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
+@@ -234,5 +238,4 @@ if [[ ${results} -eq 0 ]]; then
+ else
+   echo "Bad results, look for !!! in the logs above"
+   printf ' - %s\n' "${badtests[@]}"
+-  exit 1
+ fi
+--
+2.7.4
diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am b/meta/recipes-extended/bzip2/bzip2/Makefile.am
index dcf6458..f917b23 100644
--- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
+++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
@@ -46,6 +46,7 @@ runtest:
 	else echo "FAIL: sample2 decompress"; fi
 	@if cmp sample3.tst sample3.ref; then echo "PASS: sample3 decompress";\
 	else echo "FAIL: sample3 decompress"; fi
+	./bzip2-tests/run-tests.sh
 
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
index 8e9b779..e8ec5c6 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -5,16 +5,25 @@ LZ77/LZ78-based compressors, and approaches the performance of the PPM family of
 HOMEPAGE = "https://sourceware.org/bzip2/"
 SECTION = "console/utils"
 LICENSE = "bzip2"
-LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"
-
+LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664 \
+                    file://../git/go/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
+                    file://../git/dotnetzip/License.txt;md5=9cb56871eed4e748c3bc7e8ff352a54f \
+                    file://../git/dotnetzip/License.zlib.txt;md5=cc421ccd22eeb2e5db6b79e6de0a029f \
+                    file://../git/commons-compress/LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327 \
+                   "
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
@@ -39,7 +48,7 @@ do_install_ptest () {
 
 FILES_libbz2 = "${libdir}/lib*${SOLIBS}"
 
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make bash"
 
 PROVIDES_append_class-native = " bzip2-replacement-native"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

