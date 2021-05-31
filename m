Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.49009.1622493253185579938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 13:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Ot1imTxv;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1622493253;
  x=1654029253;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n6dJWxewWoia/opoVVkth8BCHAI2o/CMZfH/kgryI6I=;
  b=Ot1imTxvoDmuuwMwAvMHnhFhfu/x7cFrghcCdPVmI3HxOZZVm9BnUZPt
   wgFtoxhyYOdiiuCyBHJ6v3WtSi9XZohPz9Yly9OARi/LBnwXBRiixjfyn
   sq3tzoXqTle8f6hqP+Y7Tv8mOpBpyIoha8Y6kmMKVT7974240V7atUkLP
   S40jsBPX4FpgzwMIFT6dEEYlIHZbtsQjMsT4EvD1+U3U63I2E2DfjOxaD
   hQ7lYXmm6Gs2THasvSWoarGZ2Eyc0RUQx+1odX3mJdFtYyZ3p5UndXDmf
   UFNimn+vRW3+SjBe1p6ChVtdTxvZsvb1CokBRH3+rBxifRlEpI3k0bu73
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] util-linux.inc: Do not modify BPN
Date: Mon, 31 May 2021 22:34:03 +0200
Message-ID: <20210531203404.29716-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Changing BPN to be "util-linux" regardless if it is the util-linux
recipe or the util-linux-libuuid recipe that is being built was an
easy way to allow ${BPN} and ${BP} to be used in the SRC_URI for both
recipes. However, it causes problems for native.bbclass where there
are expectations that ${BPN} and ${PN} match each other.

Use "util-linux" directly in the SRC_URI instead to avoid the problem.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
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
