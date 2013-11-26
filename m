Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F51F6AE3B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 05:17:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAQ5H8aR025408
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 21:17:09 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 25 Nov 2013 21:17:06 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Nov 2013 13:17:09 +0800
Message-ID: <1385443029-15848-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] elfutils: fix the condition check before remove eu-objdump
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
X-List-Received-Date: Tue, 26 Nov 2013 05:17:10 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

"grep -q" does not write anything to standard output, the result is same as 
a empty string, The second test becomes [!""] which is a fixed true value 

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.155.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.155.bb b/meta/recipes-devtools/elfutils/elfutils_0.155.bb
index 594dfb0..14eac26 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.155.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.155.bb
@@ -48,7 +48,7 @@ do_configure_prepend() {
 }
 
 do_install_append() {
-	if [ "${TARGET_ARCH}" != "x86_64" ] && [ ! `echo "${TARGET_ARCH}"|grep -q 'i.86'` ];then
+	if [ "${TARGET_ARCH}" != "x86_64" ] && [ -z `echo "${TARGET_ARCH}"|grep 'i.86'` ];then
 		rm ${D}${bindir}/eu-objdump
 	fi
 }
-- 
1.7.10.4


