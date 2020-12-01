Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web11.358.1606846332325516692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=CFwe2RdA;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=1745; q=dns/txt; s=axis-central1;
  t=1606846335; x=1638382335;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=XbOzmR40kpU0MwXF2XJRA4ZadrrQECpQPEHZWZC6B1M=;
  b=CFwe2RdA26u0bc9w6vnnPPCho8OxUhv6i5b28MQ6U578/vtXFMKNSS6f
   sY8fNVfR59dzgb4fx2p3Ixp6IvJ808wxEMg9u9+ROfH2GVzPyyX/jMG2G
   Od1IbKuNTQoCekEEvSkgmUfgkZ8EH5G6fs4ki1z/1rBPYkzmu4zDOIOKn
   RXuXcJA2fO0LY9jHIqS14KIwhhkXIbNDXTPl3mL9MLyrbYaRQq90xltr4
   Bx5WGcgfFqNeKFNwjKQ03IEAP3GL9eIVdN6ZxN3F91IjU3Wv5g8alhNMw
   eTxH/gmv8blxLX7qAYKoqZlfz0G07Ydt2avPMfVaxJ3u4xoOlMRsAWA08
   A==;
IronPort-SDR: DwboOvkXsOvY7KditDKTILWXejXih5RLdt6YqI8FqWP3ZjX3G2+9FZ5CFdZ/iwcnpfm6VAWenC
 fj2iAAJZSj2N1AiMAhVnf2XjbcKbiKx28wdGZAS4OGl5oWxQZsXSS32eqlusiPgp76BtAjygS+
 GjdCm9pb/EE0vRsFbNBL+IW3MJCEM4iZ+c3cMqrPyZtvhZB2YGIleiVlW6TFcyvHbGs3Gm4Otl
 +KIPh0y1I2ywZzThTopcVFOM7R/oLQVrznkk/nzX0znFs+anlTHzpPo1Yj9JxQAaToo9C7sSfd
 1sQ=
X-IronPort-AV: E=Sophos;i="5.78,385,1599516000"; 
   d="scan'208";a="15074583"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv3 2/5] bitbake.conf: Add all layers (from BBLAYERS) to PSEUDO_IGNORE_PATHS
Date: Tue, 1 Dec 2020 19:11:48 +0100
Message-ID: <b7bae6e1633fba206d9c7abad93d79fbe7b0f654.1606846217.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <cover.1606846217.git.pkj@axis.com>
References: <cover.1606846217.git.pkj@axis.com>
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
