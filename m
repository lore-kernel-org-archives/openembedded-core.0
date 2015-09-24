Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 46F9B60232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 06:13:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8O6D8tC028708
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 23:13:08 -0700 (PDT)
Received: from Flora.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Wed, 23 Sep 2015 23:13:07 -0700
From: Yuanjie Huang <Yuanjie.Huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Sep 2015 14:17:16 +0800
Message-ID: <1443075436-28974-1-git-send-email-Yuanjie.Huang@windriver.com>
X-Mailer: git-send-email 2.5.3
MIME-Version: 1.0
Subject: [PATCH] gcc-multilib-config: Expand ccargs variable
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
X-List-Received-Date: Thu, 24 Sep 2015 06:13:09 -0000
Content-Type: text/plain

From: Yuanjie Huang <yuanjie.huang@windriver.com>

The ccargs obtained from get_tune_parameters may not be fully expanded,
so that the gcc_multilib_setup function can be confused, and generates
invalid MULTILIB_OPTIONS in GCC Makefile fragment, which will break the
multilib feature of target gcc.

To address problems above, this patch modifies gcc_multilib_setup
function to expand ccargs before use.

Upstream-Status: Inappropriate [configuration]

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-multilib-config.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 6d1775e..c94e77c 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -191,7 +191,7 @@ python gcc_multilib_setup() {
         # take out '-' mcpu='s and march='s from parameters
         opts = []
         whitelist = (d.getVar("MULTILIB_OPTION_WHITELIST", True) or "").split()
-        for i in tune_parameters['ccargs'].split():
+        for i in d.expand(tune_parameters['ccargs']).split():
             if i in whitelist:
                 # Need to strip '-' from option
                 opts.append(i[1:])
-- 
1.8.5.2.233.g932f7e4


