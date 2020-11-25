Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.6814.1606312101042048800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 05:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=jqyrpDds;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=1745; q=dns/txt; s=axis-central1;
  t=1606312101; x=1637848101;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=XbOzmR40kpU0MwXF2XJRA4ZadrrQECpQPEHZWZC6B1M=;
  b=jqyrpDds1plQWxpTHaNFibSgZmhxXIANs/pePJvw8pSx/A1H6UkM+MDI
   Jy7lPBjBIZzfaOpqiHv/4H6D+j+9mLaXBOGhhIyxQ5JAMpwYv1sjHN4iS
   61E5qNfEhiBrMJCInExt6JHMdge9yNJR9WWti83Z6odE0uHOPeykFQWfs
   BlYvB9BcFvm7tD9WC3YiaHlqRLn8133/f++7Hr95za9C+BdDxPddFGBvh
   xdR8+n6QFgOEGqQXDmRBN+4BIQ4Il5qc17gzJVozsycGcNNI5MeE/EFjE
   usj2lS3fRprdKuZu5cyRyedMv4TuQLni5NTAIUh4KCj3A5MeeNa1nwCsw
   w==;
IronPort-SDR: mOlGz6RYeEN9Dk13M4GFOgK9XyQsLWAPtUco+IQNkR+pI+wxPrMQ/NOeSem3F+vZGr8QLDKKm2
 BqYYhd14pJxueG9pcdmiYpdfl/aRwyzfk/ONYAsd28KSTCRyiFsYGP+TKAZWtwbAHoiU3/VS5m
 mMAU8+v5XfMti0ljarq+ksJxE9urAhIF+89I9LbuaDfIe/xxit7Bun8k/j8Zh0kQne3s8rCzUX
 yikENEYqLrubl61sLEQJoKFWuA5SlS2lHqv46qOA0W2Q22eQRxjrQVT/RFgKdjHSyNREY70RqR
 k1U=
X-IronPort-AV: E=Sophos;i="5.78,368,1599516000"; 
   d="scan'208";a="15422712"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 2/4] bitbake.conf: Add all layers (from BBLAYERS) to PSEUDO_IGNORE_PATHS
Date: Wed, 25 Nov 2020 14:48:11 +0100
Message-ID: <1063ac2765fba21715cd281104fc72163d988e1d.1606312002.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <cover.1606312002.git.pkj@axis.com>
References: <cover.1606312002.git.pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Instead of ignoring ${COREBASE}/meta in PSEUDO_IGNORE_PATHS (which may
or may not ignore all layers depending on how they are named and placed
under ${COREBASE}), ignore all layers.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
