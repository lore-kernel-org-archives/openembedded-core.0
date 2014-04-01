Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4D86F8DE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 02:57:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s312vMAb005107
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 19:57:22 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Mon, 31 Mar 2014 19:57:21 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Apr 2014 10:57:15 +0800
Message-ID: <1396321035-29904-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH] kernel: don't populate source symbolic link
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
X-List-Received-Date: Tue, 01 Apr 2014 02:57:23 -0000
Content-Type: text/plain

From: Ming Liu <ming.liu@windriver.com>

/usr/src/kernel/source deployed by kernel-dev package is symbolically
linking to a build-time kernel source folder, which make no sense when
cross-compiling.

Fixed by not populating it at install stage.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 19b159b..6ed1cb7 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -232,7 +232,7 @@ kernel_do_install() {
 	# dir. This ensures the original Makefiles are used and not the
 	# redirecting Makefiles in the build directory.
 	#
-	find . -depth -not -name "*.cmd" -not -name "*.o" -not -path "./Documentation*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
+	find . -depth -not -name "*.cmd" -not -name "*.o" -not -path "./Documentation*" -not -path "./source*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
 	cp .config $kerneldir
 	if [ "${S}" != "${B}" ]; then
 		pwd="$PWD"
-- 
1.8.1.2


