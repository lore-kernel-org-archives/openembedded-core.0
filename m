Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E524F6D783
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 07:52:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rAB7qP5M008663
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Nov 2013 23:52:25 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 10 Nov 2013 23:52:24 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Nov 2013 15:52:27 +0800
Message-ID: <1384156347-31665-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] elfutils: remove eu-objdump if it does not work
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
X-List-Received-Date: Mon, 11 Nov 2013 07:52:25 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

[YOCTO #5283]

eu-objdump does not work on mips, arm and ppc, so remove it from these
unsupported architectures

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.155.bb |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.155.bb b/meta/recipes-devtools/elfutils/elfutils_0.155.bb
index 1a8c3c7..dec3379 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.155.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.155.bb
@@ -47,6 +47,12 @@ do_configure_prepend() {
 	cp ${WORKDIR}/*dis.h ${S}/libcpu
 }
 
+do_install_append() {
+	if [ "${TARGET_ARCH}" != "x86_64" ] && [ ! `echo "${TARGET_ARCH}"|grep -q 'i.86'` ];then
+		rm ${D}${bindir}/eu-objdump
+	fi
+}
+
 # we can not build complete elfutils when using uclibc
 # but some recipes e.g. gcc 4.5 depends on libelf so we
 # build only libelf for uclibc case
-- 
1.7.10.4


