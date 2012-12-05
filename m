Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJto-00075e-Kh
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 19:41:00 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2120737eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=xA3gJB2iT8HIZd02oCDz2xRDQ1F8hGwzEKYjl0VjA40=;
	b=YyEJvfFRW4OnnCmhFPPe6+GCSmlvpHXbhlvD1+M/6UFXrSC+X3pVAG3GTP1DiF8jGB
	Zj/rwexMmuJIKn8kTkTLbwhmKtCGru9+WVtlZggUNDRyRKLfJ9v4EjR2e0lRnjYw13Bb
	qHRDGbiDn5OKGktj3S+lOcQwK/yapSEmOsUd205BKFQwVsjRgEpz77kKQzWmcOyG/i3c
	JWFg23PlUTlqAgMNhXpY9hJPHmEnecCEGsMy3VamsH1sYcVGwIfxmaIs8/Jjkig7FHFO
	71oiaLhrCD3IrPsjmp9ym0GVj5rpFh5trIbpWQvYNmKNVDEfrcIRkrc/tuHBUGFtrc1R
	7z0Q==
Received: by 10.14.2.196 with SMTP id 44mr63467507eef.25.1354731984651;
	Wed, 05 Dec 2012 10:26:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q44sm10675205eep.5.2012.12.05.10.26.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:26:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:26:04 +0100
Message-Id: <964cf2f279a8d56c5da1247e9533164a504abbc1.1354731942.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354731942.git.Martin.Jansa@gmail.com>
References: <cover.1354731942.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731942.git.Martin.Jansa@gmail.com>
References: <cover.1354731942.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/5] scripts/sstate-diff-machines.sh: add simple script to compare sstate checksums between MACHINEs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 18:41:07 -0000

* takes tmpdir, machines and targets from command arguments or env variables

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-diff-machines.sh | 107 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100755 scripts/sstate-diff-machines.sh

diff --git a/scripts/sstate-diff-machines.sh b/scripts/sstate-diff-machines.sh
new file mode 100755
index 0000000..f2c151a
--- /dev/null
+++ b/scripts/sstate-diff-machines.sh
@@ -0,0 +1,107 @@
+#!/bin/sh
+
+# Used to compare sstate checksums between MACHINES
+# Execute script and compare generated list.M files
+
+# It's also usefull to keep older sstate checksums
+# to be able to find out why something is rebuilding 
+# after updating metadata
+
+# $ diff \
+#     sstate-diff/1349348392/fake-cortexa8/list.M \
+#     sstate-diff/1349348392/fake-cortexa9/list.M \
+#     | wc -l
+# 538
+
+# Then to compare sigdata use something like:
+# $ ls sstate-diff/1349348392/*/armv7a-vfp-neon*/linux-libc-headers/*do_configure*sigdata*
+#   sstate-diff/1349348392/fake-cortexa8/armv7a-vfp-neon-oe-linux-gnueabi/linux-libc-headers/3.4.3-r0.do_configure.sigdata.cb73b3630a7b8191e72fc469c5137025
+#   sstate-diff/1349348392/fake-cortexa9/armv7a-vfp-neon-oe-linux-gnueabi/linux-libc-headers/3.4.3-r0.do_configure.sigdata.f37ada177bf99ce8af85914df22b5a0b
+# $ bitbake-diffsigs stamps.1349348392/*/armv7a-vfp-neon*/linux-libc-headers/*do_configure*sigdata*
+#   basehash changed from 8d0bd67bb1da6f68717760fc3ef43171 to e869fa61426e88e9c30726ba88a1216a
+#   Variable TUNE_CCARGS value changed from  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 to  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a9
+
+# Global vars
+tmpdir=
+machines=
+targets=
+default_machines="qemuarm qemux86 qemux86-64"
+default_targets="core-image-base"
+
+usage () {
+  cat << EOF
+Welcome to utility to compare sstate checksums between different MACHINEs.
+$0 <OPTION>
+
+Options:
+  -h, --help
+        Display this help and exit.
+
+  --tmpdir=<tmpdir>
+        Specify tmpdir, will use the environment variable TMPDIR if it is not specified.
+        Something like /OE/oe-core/tmp-eglibc (no / at the end).
+  
+  --machines=<machines>
+        List of MACHINEs separated by space, will use the environment variable MACHINES if it is not specified.
+        Default value is "qemuarm qemux86 qemux86-64".
+  
+  --targets=<targets>
+        List of targets separated by space, will use the environment variable TARGETS if it is not specified.
+        Default value is "core-image-base".
+EOF
+}
+
+# Print error information and exit.
+echo_error () {
+  echo "ERROR: $1" >&2
+  exit 1
+}
+
+while [ -n "$1" ]; do
+  case $1 in
+    --tmpdir=*)
+      tmpdir=`echo $1 | sed -e 's#^--tmpdir=##' | xargs readlink -e`
+      [ -d "$tmpdir" ] || echo_error "Invalid argument to --tmpdir"
+      shift
+        ;;
+    --machines=*)
+      machines=`echo $1 | sed -e 's#^--machines="*\([^"]*\)"*#\1#'`
+      shift
+        ;;
+    --targets=*)
+      targets=`echo $1 | sed -e 's#^--targets="*\([^"]*\)"*#\1#'`
+      shift
+        ;;
+    --help|-h)
+      usage
+      exit 0
+        ;;
+    *)
+      echo "Invalid arguments $*"
+      echo_error "Try '$0 -h' for more information."
+        ;;
+  esac
+done
+
+# tmpdir directory, use environment variable TMPDIR
+# if it was not specified, otherwise, error.
+[ -n "$tmpdir" ] || tmpdir=$TMPDIR
+[ -n "$tmpdir" ] || echo_error "No tmpdir found!"
+[ -d "$tmpdir" ] || echo_error "Invalid tmpdir \"$tmpdir\""
+[ -n "$machines" ] || machines=$MACHINES
+[ -n "$machines" ] || machines=$default_machines
+[ -n "$targets" ] || targets=$TARGETS
+[ -n "$targets" ] || targets=$default_targets
+
+OUTPUT=${tmpdir}/sstate-diff/`date "+%s"`
+
+for M in ${machines}; do
+  find ${tmpdir}/stamps/ -name \*sigdata\* | xargs rm -f
+  mkdir -p ${OUTPUT}/${M}
+  export MACHINE=${M}; bitbake -S ${targets} | tee -a ${OUTPUT}/${M}/log;
+  cp -ra ${tmpdir}/stamps/* ${OUTPUT}/${M}
+  find ${OUTPUT}/${M} -name \*sigdata\* | sed "s#${OUTPUT}/${M}/##g" | sort > ${OUTPUT}/${M}/list
+  M_UNDERSCORE=`echo ${M} | sed 's/-/_/g'`
+  sed "s/${M_UNDERSCORE}/MACHINE/g; s/${M}/MACHINE/g" ${OUTPUT}/${M}/list | sort > ${OUTPUT}/${M}/list.M
+  find ${tmpdir}/stamps/ -name \*sigdata\* | xargs rm -f
+done
-- 
1.8.0



