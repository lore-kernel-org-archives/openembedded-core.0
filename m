Return-Path: <tobias.henkel@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 2936E6D8C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 08:34:03 +0000 (UTC)
Received: from duffman.bmw-carit.intra (duffman.bmw-carit.intra
	[192.168.101.67])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tobias.henkel)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id DE01B402F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 08:05:21 +0100 (CET)
From: Tobias Henkel <tobias.henkel@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2013 09:34:01 +0100
Message-Id: <1384245243-20247-8-git-send-email-tobias.henkel@oss.bmw-carit.de>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1384245243-20247-1-git-send-email-tobias.henkel@oss.bmw-carit.de>
References: <1384245243-20247-1-git-send-email-tobias.henkel@oss.bmw-carit.de>
Subject: [PATCH 7/9] icecc: Support shell evaluation of KERNEL_CC
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
X-List-Received-Date: Tue, 12 Nov 2013 08:34:04 -0000

From: Tobias Henkel <tobias.henkel@bmw-carit.de>

In the current implementation a KERNEL_CC variable containing shell
evaluation breaks the build process. Shell expansion is not happening
before general expansion in get_cross_kernel_cc which results in a
syntax error and an aborted parse process.

Before expanding the KERNEL_CC variable get_cross_kernel_cc now checks
for backticks or '$(' in the KERNEL_CC variable and performs a shell
evaluation using a call to echo if it finds one.

Signed-off-by: Tobias Henkel <tobias.henkel@bmw-carit.de>
---
 meta/classes/icecc.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index debc05d..0c9b260 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -41,7 +41,13 @@ def icecc_dep_prepend(d):
 DEPENDS_prepend += "${@icecc_dep_prepend(d)} "
 
 def get_cross_kernel_cc(bb,d):
-    kernel_cc = d.expand('${KERNEL_CC}')
+    kernel_cc = d.getVar('KERNEL_CC')
+
+    # evaluate the expression by the shell if necessary
+    if '`' in kernel_cc or '$(' in kernel_cc:
+        kernel_cc = os.popen("echo %s" % kernel_cc).read()[:-1]
+
+    kernel_cc = d.expand(kernel_cc)
     kernel_cc = kernel_cc.replace('ccache', '').strip()
     kernel_cc = kernel_cc.split(' ')[0]
     kernel_cc = kernel_cc.strip()
-- 
1.8.3.1


