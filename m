Return-Path: <Yue.Tao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B49386D82F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2013 08:33:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAS8Xj39016277
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2013 00:33:45 -0800 (PST)
Received: from localhost.localdomain (128.224.162.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 28 Nov 2013 00:33:45 -0800
From: Yue Tao <Yue.Tao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Nov 2013 16:34:48 +0800
Message-ID: <1385627688-19959-1-git-send-email-Yue.Tao@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Subject: [PATCH] python: do not replace ccache in the middle of a path
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
X-List-Received-Date: Thu, 28 Nov 2013 08:33:47 -0000
Content-Type: text/plain

Python recipe did a sed s/ccache/$(CCACHE) on the Makefile, which
replaces all "ccache" including ones that consist of a full path.
This leads to build error when building in a project path with
"ccache" in its name. Fix it by only replacing "ccache " with
"$(CCACHE) ".

Signed-off-by: Lei Liu <lei.liu2@windriver.com>
---
 meta/recipes-devtools/python/python_2.7.3.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 887e02e..b560b82 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -61,7 +61,7 @@ do_compile() {
         cd -
 
 	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
-	sed -i -e s,ccache,'$(CCACHE)', Makefile
+	sed -i -e s,ccache\ ,'$(CCACHE) ', Makefile
 
 	# remove any bogus LD_LIBRARY_PATH
 	sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
-- 
1.7.5.4


