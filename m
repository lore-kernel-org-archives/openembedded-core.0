Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04BF17078D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 20:42:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6OKgGxt017278
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jul 2014 13:42:16 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 24 Jul 2014 13:42:15 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 24 Jul 2014 16:41:51 -0400
Message-ID: <4e6a5c1d1e04252e6e1d74da470d9dac378499e7.1406234258.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1406234258.git.bruce.ashfield@windriver.com>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] kernel: don't copy .so.dbg files into kernel source install
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
X-List-Received-Date: Thu, 24 Jul 2014 20:42:20 -0000
Content-Type: text/plain

In 3.16+ x86-64 kernel builds produce a vdso64.so.dbg file. If this file is
copied into the kernel source install multiple QA failures are triggered.
Specifically, this file triggers a debug package split that results in
files installed but not shipped, and invalid .debug file errors.

By ensuring that .so files are not copied, we avoid this incorrect split
with no impact on future build phases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b2e9d4cb3631..128987303233 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -232,7 +232,7 @@ kernel_do_install() {
 	# dir. This ensures the original Makefiles are used and not the
 	# redirecting Makefiles in the build directory.
 	#
-	find . -depth -not -name "*.cmd" -not -name "*.o" -not -path "./Documentation*" -not -path "./source*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
+	find . -depth -not -name "*.cmd" -not -name "*.o" -not -name "*.so.dbg" -not -path "./Documentation*" -not -path "./source*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
 	cp .config $kerneldir
 	if [ "${S}" != "${B}" ]; then
 		pwd="$PWD"
-- 
1.8.1.2


