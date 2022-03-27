Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B35C433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 01:47:24 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.1723.1648345642384152885
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Mar 2022 18:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=f4m1YnMG;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648345643;
  x=1679881643;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=h85BMjNfVn8zWp9GDtDQdkBNRpEw/dETI6uhYh9vRJY=;
  b=f4m1YnMGplJJKEIly2px4M5EELVrVfXKmk6dZHD1/pHY3hXNE4/PyZRR
   i4BivqTx28YNXdinOYM2GFgRBOf7oEulyQO2DYLTuTx+wigBtbVcYHjrl
   8nA7F+0d+64UyLg1ZlYOYo2WHYGax+NE/fJgsHReigONIz9LnFWkV5HvA
   s032QWSSZiv/AMEXBi3M3/eyyqjFECxLYHJauUsfG+8JXTU8fotmWAaj4
   7v49/WZHLVjRmwzaDERbKu+ypYEQncTwf/6NDZ+0+32lReT5+i9rG8eQH
   PQODBcr6wQ7XNomvGA30SgG2pWto+oZj6ewMyBaohIgVpGge4uPLe6Npw
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libdnf: Add a dependency on util-linux
Date: Sun, 27 Mar 2022 03:47:18 +0200
Message-ID: <20220327014718.10627-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 01:47:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163660

This avoids the following configuration error:

  -- Checking for module 'smartcols'
  --   No package 'smartcols' found
  CMake Error at .../usr/share/cmake-3.22/Modules/FindPkgConfig.cmake:603 (message):
   A required package was not found

which happens if glib-2.0 is configured without the libmount
PACKAGECONFIG that otherwise depends on util-linux.

Signed-off-by: Peter Kjellerstedt <pkj@axis.com>
---
 meta/recipes-devtools/libdnf/libdnf_0.66.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
index 1bfe901c8a..2558f96851 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "glib-2.0 libsolv libcheck librepo rpm gtk-doc libmodulemd json-c swig-native"
+DEPENDS = "glib-2.0 libsolv libcheck librepo rpm gtk-doc libmodulemd json-c swig-native util-linux"
 
 inherit gtk-doc gobject-introspection cmake pkgconfig setuptools3-base
 

