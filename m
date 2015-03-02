Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B0D3772130
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 11:40:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="61159281"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Mar 2015 19:36:45 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t22BdUKQ012141
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Mar 2015 19:39:30 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 2 Mar 2015 19:40:24 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Mar 2015 19:34:48 +0800
Message-ID: <1425296088-8201-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH] gcc-source: fix bug to avoid building error.
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
X-List-Received-Date: Mon, 02 Mar 2015 11:40:27 -0000
Content-Type: text/plain

gcc-source don't do do_package_write_rpm, so we should set
PACKAGES = "" to avoid the building error if we want generate srpm,
otherwise, we get the error as below.

ERROR: Task do_deploy_archives in meta/recipes-devtools/gcc/gcc-source_4.9.bb \
       depends upon non-existent task do_package_write_rpm in \
       meta/recipes-devtools/gcc/gcc-source_4.9.bb

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 968830a..10e9285 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -19,6 +19,7 @@ STAMPCLEAN = "${STAMPS_DIR}/work-shared/gcc-[0-9]*-*"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
+PACKAGES = ""
 
 python do_preconfigure () {
     import subprocess
-- 
1.9.1


