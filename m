Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.6586.1623407605728440640
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jun 2021 03:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=G/gDwWTg;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1623407606;
  x=1654943606;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a5cjtNJTeotRozCvWr4iQgIb3X4HN4gf4PELC7ABMu0=;
  b=G/gDwWTgbV1oXK4eSTnmRpcq8i8x4Sit+tcgMM0N7vYndE4dvf4EdjhX
   Q4bXAleRHrlP5PwA6tKaXfxOpXaaFWM8IAzJ9zikA4PHHW3Ul8aRNfaZR
   kt9amP3ncKebLL32Pn+4LuJ3dAoHzzmQBEFFgnoeQJoN9Gx7pCLxEfBLg
   /tKyR5+9L29mU9zZ2CNyoNjDfWOI/xIYyWpQalYLL7bYbnFhjXcqX27EE
   J5L/LwbU/RydKfB7VymuLelbH287LoUDtCSnMVQ5gxUL5aLz8z7WEQYrA
   251WCdRlg4GVNo0rUnKtrtP4qCxTFmsMpaTVk8EYLexNpPl899HNt1xxO
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>, Anuj Mittal
	<anuj.mittal@intel.com>
Subject: [hardknott][PATCH 1/2] util-linux.inc: Do not modify BPN
Date: Fri, 11 Jun 2021 12:32:57 +0200
Message-ID: <20210611103258.27368-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Changing BPN to be "util-linux" regardless if it is the util-linux
recipe or the util-linux-libuuid recipe that is being built was an
easy way to allow ${BPN} and ${BP} to be used in the SRC_URI for both
recipes. However, it causes problems for native.bbclass where there
are expectations that ${BPN} and ${PN} match each other.

Use "util-linux" directly in the SRC_URI instead to avoid the problem.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/util-linux/util-linux.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index cbf6102ee0..6b47f417aa 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -27,8 +27,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/util-linux:"
 MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
-BPN = "util-linux"
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
            file://configure-sbindir.patch \
            file://runuser.pamd \
            file://runuser-l.pamd \
