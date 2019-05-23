Return-Path: <jma1@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A08017E3FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 07:21:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4N7LbhR005483
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 00:21:37 -0700 (PDT)
Received: from pek-lpggp2 (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 23 May 2019 00:21:36 -0700
Received: by pek-lpggp2 (Postfix, from userid 20544)	id 04B38721632; Thu, 23
	May 2019 15:04:01 +0800 (CST)
From: Jiping Ma <jiping.ma2@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <jiping.ma2@windriver.com>
Date: Thu, 23 May 2019 15:03:56 +0800
Message-ID: <1558595036-35165-2-git-send-email-jiping.ma2@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558595036-35165-1-git-send-email-jiping.ma2@windriver.com>
References: <1558595036-35165-1-git-send-email-jiping.ma2@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] [V2][PATCH] dhcp:"dhclient -x eth0" action is not correct.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 May 2019 07:21:36 -0000
Content-Type: text/plain

Please ignore V1 of [OE-core][PATCH] dhcp:"dhclient -x eth0" action is not correct.

The action of "dhclient -x eth0" and "dhclient -r eth0" is
same when enable ENABLE_GENTLE_SHUTDOWN. Disable ENABLE_GENTLE_SHUTDOWN
that will use the default signal hander.

Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
---
 .../dhcp/0006-site.h-enable-gentle-shutdown.patch  | 27 ----------------------
 meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb       |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch b/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch
deleted file mode 100644
index 6ef70cc..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 01641d146e4e6bea954e4a4ee1f6230b822665b4 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 15 Aug 2017 15:37:49 +0800
-Subject: [PATCH 06/11] site.h: enable gentle shutdown
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
-Rebase to 4.3.6
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- includes/site.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: dhcp-4.4.1/includes/site.h
-===================================================================
---- dhcp-4.4.1.orig/includes/site.h
-+++ dhcp-4.4.1/includes/site.h
-@@ -295,7 +295,7 @@
-    situations.  We plan to revisit this feature and may
-    make non-backwards compatible changes including the
-    removal of this define.  Use at your own risk.  */
--/* #define ENABLE_GENTLE_SHUTDOWN */
-+#define ENABLE_GENTLE_SHUTDOWN
- 
- /* Include old error codes.  This is provided in case you
-    are building an external program similar to omshell for
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
index ca0daa1..b4c0d5d 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
@@ -5,7 +5,6 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://0003-link-with-lcrypto.patch \
             file://0004-Fix-out-of-tree-builds.patch \
             file://0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch \
-            file://0006-site.h-enable-gentle-shutdown.patch \
             file://0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch \
             file://0009-remove-dhclient-script-bash-dependency.patch \
             file://0012-dhcp-correct-the-intention-for-xml2-lib-search.patch \
-- 
1.9.1


