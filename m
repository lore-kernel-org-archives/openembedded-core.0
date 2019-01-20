Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7000079F3D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jan 2019 11:54:23 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f188so8264801wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jan 2019 03:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NFcCcUesRVMC3tjb43z0NevuAsE7SREUJCL4lsN9OWE=;
	b=TW9yuRCr2IjF4JcnulOs4Ra2JrGbfH5U8IAU7ZM3CaAk5yqxoBSUzBompCLHOYKgze
	xq+nAZQ3vc0MqdCJxhv9LlSNcJ0qNoQD7n7yO32KEqYv332qobtPJvFxWAb0IwJlMtmQ
	V4Xh/biYapJvh0Z1uJrtXjBxmddW+Jx7quGGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NFcCcUesRVMC3tjb43z0NevuAsE7SREUJCL4lsN9OWE=;
	b=D6/kRFYIK0Jx9B8F/Bl5eBabbAeWTMqQKxHGGd8Kj3HY5WW60x2CPIJKer+aryfWwR
	YErO0LWKLwlwieZ7cyMTG05kGO+QLB6VAp4I35p3HRwJ0KNr1M+NM05wLJm5aJ79gtAO
	xda+Y2bcz/VA+TCOgETbN/JBonx/W3plPA3pAEyYcwm5KdGmW+k9nh+aqOg/4CQt5BpQ
	ga+rZowY9++DUti+137dWwwPOT+UTxRsTi5lkGBpnB9q1Nt0M/JJKbxo+txOSoVt8egE
	sAAZoRnXe3YRw6O2qpxS9vQk8kBG3mpdXC1ijx6UJNpYAF6Hx5ulJpsGTBc8TSSZntGu
	8N4Q==
X-Gm-Message-State: AJcUukff+2+KWvBZ5Knhlg6mnGlumdACoPSKG9sEIuiwjPZbrlOkkdh8
	D3hoMq89pXWHEnthlZPE6dY0fX42XNE=
X-Google-Smtp-Source: ALg8bN7HPngDRnaCle1AMIaYYIPPf6L96WW+8MyiDunGdF4DbWtAwX4xAybHSbzQ6mp2zrv9zxtaxQ==
X-Received: by 2002:a1c:888d:: with SMTP id
	k135mr22196893wmd.137.1547985263533; 
	Sun, 20 Jan 2019 03:54:23 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f18sm74975550wrs.92.2019.01.20.03.54.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jan 2019 03:54:22 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Jan 2019 11:54:21 +0000
Message-Id: <20190120115421.23866-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] scripts/contrib/build-perf-test-wrapper.sh: Improve interaction with autobuilder automation
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
X-List-Received-Date: Sun, 20 Jan 2019 11:54:23 -0000
Content-Transfer-Encoding: 8bit

This tweaks the script to:

* Ensure directories exist and can be written to
* Allow the downloads directory to be specified
* Error early if the phantomjs or optipng dependencies are not installed
* Allow the location of the globalres.log file to be specified

This means that the main build directory can be destroyed and any state
from the script is stored elsewhere allowing it to be triggered
automatically from the autobuilder infrastructure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/contrib/build-perf-test-wrapper.sh | 37 +++++++++++++++++++---
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index 19bee1dd034..7cbb5d794f1 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -33,7 +33,9 @@ Optional arguments:
   -c COMMITISH      test (checkout) this commit, <branch>:<commit> can be
                     specified to test specific commit of certain branch
   -C GIT_REPO       commit results into Git
+  -d DOWNLOAD_DIR   directory to store downloaded sources in
   -E EMAIL_ADDR     send email report
+  -g GLOBALRES_DIR  where to place the globalres file
   -P GIT_REMOTE     push results to a remote Git repository
   -R DEST           rsync reports to a remote destination
   -w WORK_DIR       work dir for this script
@@ -51,19 +53,26 @@ get_os_release_var () {
 commitish=""
 oe_build_perf_test_extra_opts=()
 oe_git_archive_extra_opts=()
-while getopts "ha:c:C:E:P:R:w:x" opt; do
+while getopts "ha:c:C:d:E:g:P:R:w:x" opt; do
     case $opt in
         h)  usage
             exit 0
             ;;
-        a)  archive_dir=`realpath -s "$OPTARG"`
+        a)  mkdir -p "$OPTARG"
+            archive_dir=`realpath -s "$OPTARG"`
             ;;
         c)  commitish=$OPTARG
             ;;
-        C)  results_repo=`realpath -s "$OPTARG"`
+        C)  mkdir -p "$OPTARG"
+            results_repo=`realpath -s "$OPTARG"`
+            ;;
+        d)  download_dir=`realpath -s "$OPTARG"`
             ;;
         E)  email_to="$OPTARG"
             ;;
+        g)  mkdir -p "$OPTARG"
+            globalres_dir=`realpath -s "$OPTARG"`
+            ;;
         P)  oe_git_archive_extra_opts+=("--push" "$OPTARG")
             ;;
         R)  rsync_dst="$OPTARG"
@@ -86,6 +95,17 @@ if [ $# -ne 0 ]; then
     exit 1
 fi
 
+if [ -n "$email_to" ]; then
+    if ! [ -x "$(command -v phantomjs)" ]; then
+        echo "ERROR: Sending email needs phantomjs."
+        exit 1
+    fi
+    if ! [ -x "$(command -v optipng)" ]; then
+        echo "ERROR: Sending email needs optipng."
+        exit 1
+    fi
+fi
+
 # Open a file descriptor for flock and acquire lock
 LOCK_FILE="/tmp/oe-build-perf-test-wrapper.lock"
 if ! exec 3> "$LOCK_FILE"; then
@@ -146,11 +166,18 @@ if [ -z "$base_dir" ]; then
 fi
 echo "Using working dir $base_dir"
 
+if [ -z "$download_dir" ]; then
+    download_dir="$base_dir/downloads"
+fi
+if [ -z "$globalres_dir" ]; then
+    globalres_dir="$base_dir"
+fi
+
 timestamp=`date "+%Y%m%d%H%M%S"`
 git_rev=$(git rev-parse --short HEAD)  || exit 1
 build_dir="$base_dir/build-$git_rev-$timestamp"
 results_dir="$base_dir/results-$git_rev-$timestamp"
-globalres_log="$base_dir/globalres.log"
+globalres_log="$globalres_dir/globalres.log"
 machine="qemux86"
 
 mkdir -p "$base_dir"
@@ -161,7 +188,7 @@ auto_conf="$build_dir/conf/auto.conf"
 echo "MACHINE = \"$machine\"" > "$auto_conf"
 echo 'BB_NUMBER_THREADS = "8"' >> "$auto_conf"
 echo 'PARALLEL_MAKE = "-j 8"' >> "$auto_conf"
-echo "DL_DIR = \"$base_dir/downloads\"" >> "$auto_conf"
+echo "DL_DIR = \"$download_dir\"" >> "$auto_conf"
 # Disabling network sanity check slightly reduces the variance of timing results
 echo 'CONNECTIVITY_CHECK_URIS = ""' >> "$auto_conf"
 # Possibility to define extra settings
-- 
2.19.1


