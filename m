Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D946260097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 08:35:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9M8ZdxR024942
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 01:35:40 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 22 Oct 2014 01:35:39 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Oct 2014 16:35:43 +0800
Message-ID: <1413966943-8920-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] python3: do not replace ccache in the middle of a path
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
X-List-Received-Date: Wed, 22 Oct 2014 08:35:41 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Python recipe did a sed s/ccache/$(CCACHE) on the Makefile, which
replaces all "ccache" including ones that consist of a full path.
This leads to build error when building in a project path with
"ccache" in its name. Fix it by only replacing "ccache " with
"$(CCACHE) ".

Same fix on python 2.xx is:
1181112cf65bc[python: do not replace ccache in the ]

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/python/python3_3.3.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb b/meta/recipes-devtools/python/python3_3.3.3.bb
index a1cb120..4497e02 100644
--- a/meta/recipes-devtools/python/python3_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3_3.3.3.bb
@@ -84,7 +84,7 @@ do_compile() {
         cd -
 
 	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
-	sed -i -e s,ccache,'$(CCACHE)', Makefile
+	sed -i -e s,ccache\ ,'$(CCACHE) ', Makefile
 
 	# remove any bogus LD_LIBRARY_PATH
 	sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
-- 
1.7.10.4


