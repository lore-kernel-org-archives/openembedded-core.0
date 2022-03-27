Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D3EC433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 05:50:58 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.2942.1648360257089775688
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Mar 2022 22:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=JoBNo2UF;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648360257;
  x=1679896257;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7ojqOhpvZEu9Ro2DpGuIDS+/a/rHhEwEK4Rxl07A7iI=;
  b=JoBNo2UFItXaWReo/UEwiwYFWTvZxhY4uqEC5v0P0Uk8/HeTDLkctWzG
   L8q5kt+NCP27pgbFAVwfmnQnLA+FMsvy2OVwHoQg+HFwWkSKI54LdmX3/
   romeBBL1nZy/SDzKpHuJE6I2vmKyRiMBuYHt7KtTsFnx62ZoozBNPy4Qg
   X+Dq1AblBSPsmzlsLkPOsOmgcKFBOXqH3lmt3uenpRjzyNOb/qrm57G/a
   wv+jXSK8DtwI77Y+p9dRSYYB12omYU9Tubi0DExeeXMBc+fikybmZt7TX
   zB9CGb/IK0XfTcJm3QekNB1L2d36pSx8K5B89P8LCXu3hVoJL6IB5Vus1
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3: Add a dependency on ncurses
Date: Sun, 27 Mar 2022 07:50:51 +0200
Message-ID: <20220327055051.17188-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 05:50:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163662

This avoids the following configuration error:

  The necessary bits to build these optional modules were not found:
  _curses               _curses_panel

which happens if the "readline" PACKAGECONFIG is disabled.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/python/python3_3.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.10.3.bb b/meta/recipes-devtools/python/python3_3.10.3.bb
index 4e7c6f71e3..5c0f0a9eb2 100644
--- a/meta/recipes-devtools/python/python3_3.10.3.bb
+++ b/meta/recipes-devtools/python/python3_3.10.3.bb
@@ -70,7 +70,7 @@ ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config
 ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
 
 
-DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl2 autoconf-archive-native"
+DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl2 autoconf-archive-native ncurses"
 DEPENDS:append:class-target = " python3-native"
 DEPENDS:append:class-nativesdk = " python3-native"
 

