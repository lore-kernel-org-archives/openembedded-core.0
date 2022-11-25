Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49323C433FE
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 07:47:16 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.42081.1669362429808078756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 23:47:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=QBVjL7XA;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1669362430;
  x=1700898430;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e9lWYsCqBDRoWxbQk4Bd5oUNflYONKYJwgFpl5sqpus=;
  b=QBVjL7XARM0vk7gKTmjF0METGCumzCXfw9YHCDBed4oYkjiZEuFZDIaO
   Z7z3H5dFg/0VQL2ucJFoYywwbHrLtlB+Kfc0fEMsSMCWwdu6CypgYBnXZ
   4yov18j93hKOYzaqRnbd66qfg1pT0Azhbl+723QacIIsciYpRiSDTtno7
   MFVoCjPrtY6J7zGdZzP13OqQDpcMUvFcPFzTvhvwsmxMuMpbQojmYGLAv
   kIxqVJyfGqBrUpREF6kI62bDowHfODz9+lxBI96BD31RDp7IkEJk2NlSo
   8fjKkJqS0mnXZkV8KtM+/uiWmDFwMCbf0eqtN0Vw1qgiBQqfW+YkEUfWx
   w==;
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] kbd: Don't build tests
Date: Fri, 25 Nov 2022 08:47:07 +0100
Message-ID: <20221125074707.1108889-1-olani@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 07:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173762

Add --disable-tests to EXTRA_OECONF as the tests are not usable in
ptest - they can only run in-situ - and fails to build when building
with -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/recipes-core/kbd/kbd_2.5.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/kbd_2.5.1.bb
index aa3ab6e121..7662b8f685 100644
--- a/meta/recipes-core/kbd/kbd_2.5.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
 
 SRC_URI[sha256sum] = "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
 
+EXTRA_OECONF = "--disable-tests"
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                   "
 
-- 
2.30.2


