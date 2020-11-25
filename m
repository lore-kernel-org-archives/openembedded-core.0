Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.6626.1606311055863217712
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 05:30:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=DJ9mGAX0;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=3597; q=dns/txt; s=axis-central1;
  t=1606311056; x=1637847056;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=eJ9ti1NBmfLse6XbkdItACFh7UDH9A6raClqlL7t7kA=;
  b=DJ9mGAX0FqkjODW0vaUqrTIKBzkGSL/VzikvVNJpD2N6eNH70qrnXgxx
   4jJqW9DEGzjVfItRKb7Jtt1hZzsOd92gy759XxIdQB7ivMDi58RN1hBew
   rTpB2Grv7ZeFirCLnNeGcnazlo8KYQ+XdW67x91doODpimaakweHtUDM7
   fKlz89eUO1wrCO0qd+5KdWm54cSGs3ZWVZ/T3dA6VOjh0l5j4ww43K9zQ
   vG78ljAPMIsps4ymJg0JhNVXG5TQnhPjRs8ll/bqBT4ISPiMSpU+bSI2o
   qVF8fYSVtg4Scc1TCEChkobSwcrXABLcvEcwExpo+n47qGyaGp67FJfpL
   Q==;
IronPort-SDR: 5OksQEwxxuxxJfhWM3yT+SLypL4FFBbHiGIDlkhh8mr4emVn1m9x2AhCd74/Ax92is5DIC96l8
 RQQHChA1Ac4uUqim+BpVV6FvWtQTH3qHVcUrWZXhBft0rnUdGfsLqNEXvksSZHVukrteVy2ECf
 9ZEbpZTZ5V6TEe+j6Z3khouQhmVRoTeUKY0zKrF8/7uIq02tKlyNXHIOftnN2WrKLwcrvSV1iB
 bWrCt3EP7vrxLLIqaoTNRlOxB+c00YCSjJ0wwFtbZ1H6A9FvzO5YOB61zFDzfbsp+En/qTsJgb
 3zI=
X-IronPort-AV: E=Sophos;i="5.78,368,1599516000"; 
   d="scan'208";a="15421899"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/4] bitbake.conf: Add all layers (from BBLAYERS) to PSEUDO_IGNORE_PATHS
Date: Wed, 25 Nov 2020 14:30:38 +0100
Message-ID: <9d90bc03e13030cfa8c46aafcd6d3c4c1cc6ba25.1606310940.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <cover.1606310940.git.pkj@axis.com>
References: <cover.1606310940.git.pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Instead of ignoring ${COREBASE}/meta in PSEUDO_IGNORE_PATHS (which may
or may not ignore all layers depending on how they are named and placed
under ${COREBASE}), ignore all layers.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/bitbake.conf                      | 2 +-
 meta/conf/machine/include/tune-thunderx.inc | 2 +-
 scripts/contrib/bb-perf/bb-matrix-plot.sh   | 8 +++++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0d38eac094..9742fe4fe2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -685,7 +685,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta,${CCACHE_DIR}"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${@','.join(d.getVar('BBLAYERS').split())},${CCACHE_DIR}"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf/machine/include/tune-thunderx.inc
index d1aaf4891e..dadcadedc6 100644
--- a/meta/conf/machine/include/tune-thunderx.inc
+++ b/meta/conf/machine/include/tune-thunderx.inc
@@ -11,7 +11,7 @@ ARMPKGARCH_tune-thunderx ?= "thunderx"
 ARMPKGARCH_tune-thunderx_be ?= "thunderx"
 
 TUNE_FEATURES_tune-thunderx = "${TUNE_FEATURES_tune-aarch64} thunderx"
-TUNE_FEATURES_tune-thunderx_be = "${TUNE_FEATURES_tune-thunderx} bigendian"
+TUNE_FEATURES_tune-thunderx_be = "${TUNE_FEATURES_tune-aarch64_be} thunderx"
 BASE_LIB_tune-thunderx = "lib64"
 BASE_LIB_tune-thunderx_be = "lib64"
 
diff --git a/scripts/contrib/bb-perf/bb-matrix-plot.sh b/scripts/contrib/bb-perf/bb-matrix-plot.sh
index e7bd129e9e..450afcb559 100755
--- a/scripts/contrib/bb-perf/bb-matrix-plot.sh
+++ b/scripts/contrib/bb-perf/bb-matrix-plot.sh
@@ -90,10 +90,12 @@ fi
 # Determine the dgrid3d mesh dimensions size
 MIN=$(tail -n +2 "$DATFILE" | cut -d ' ' -f 1 | sed 's/^0*//' | sort -n | uniq | head -n1)
 MAX=$(tail -n +2 "$DATFILE" | cut -d ' ' -f 1 | sed 's/^0*//' | sort -n | uniq | tail -n1)
-BB_CNT=$[${MAX} - $MIN + 1]
+#BB_CNT=$[${MAX} - $MIN + 1]
+BB_CNT=$[(${MAX} - $MIN)/4 + 1]
 MIN=$(tail -n +2 "$DATFILE" | cut -d ' ' -f 2 | sed 's/^0*//' | sort -n | uniq | head -n1)
 MAX=$(tail -n +2 "$DATFILE" | cut -d ' ' -f 2 | sed 's/^0*//' | sort -n | uniq | tail -n1)
-PM_CNT=$[${MAX} - $MIN + 1]
+#PM_CNT=$[${MAX} - $MIN + 1]
+PM_CNT=$[(${MAX} - $MIN)/4 + 1]
 
 
 (cat <<EOF
@@ -118,7 +120,7 @@ set output "$PLOT_BASENAME-pm.png"
 replot
 
 set view 60,30
-set term wxt size $SIZE
+set term qt size $SIZE
 replot
 EOF
 ) | gnuplot --persist
