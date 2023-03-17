Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF3DC74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 10:09:47 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.15653.1679047778169657176
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 03:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pd71i-00E5YJ-QF; Fri, 17 Mar 2023 12:09:35 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pd71i-00Dq2N-GT; Fri, 17 Mar 2023 12:09:34 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Jerome Forissier <jerome.forissier@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] e2fsprogs: switch from master to debian/master branch to fix compatibility
Date: Fri, 17 Mar 2023 12:09:23 +0200
Message-Id: <20230317100923.3295331-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: RCPT_COUNT_THREE(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230317100923.3295331-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 10:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178747

From: Jerome Forissier <jerome.forissier@linaro.org>

When trying to use e2fsck <= 1.47.0 on the root filesystem (for example,
to resize a partition after copying the image to a USB stick on a
computer running current Ubuntu [22.04] or Debian), an error is
reported:

 e2fsck 1.46.5 (30-Dec-2021)
 /dev/sdb2 has unsupported feature(s): FEATURE_C12
 e2fsck: Get a newer version of e2fsck!

This has been discussed in [2] and a fix was made for use by
Debian-based distros in [3]. Let's pick that version.

Link: [1] https://gitlab.com/Linaro/trusted-reference-stack/trs/-/issues/1
Link: [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1031622
Link: [3] https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=debian/master&id=1181f164c48574a4813bfa203dbd7b4123154021

Binary compatibility of generated ext4 file system images is important
so it's better to use the "debian/master" branch.

Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc                   | 2 +-
 .../e2fsprogs/{e2fsprogs_1.47.0.bb => e2fsprogs_1.47.0-2.bb}    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.0.bb => e2fsprogs_1.47.0-2.bb} (99%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index f41a5d0b4e..2f54896e8c 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
 SECTION = "base"
 DEPENDS = "util-linux attr autoconf-archive"
 
-SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master"
+SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=debian/master"
 S = "${WORKDIR}/git"
 
 inherit autotools gettext texinfo pkgconfig multilib_header update-alternatives ptest
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0-2.bb
similarity index 99%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0-2.bb
index 2620610903..9bf89ba0c4 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0-2.bb
@@ -10,7 +10,7 @@ SRC_URI:append:class-native = " \
            file://quiet-debugfs.patch \
            "
 
-SRCREV = "f4c9cc4bedacde8408edda3520a32d3842290112"
+SRCREV = "1181f164c48574a4813bfa203dbd7b4123154021"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.34.1


