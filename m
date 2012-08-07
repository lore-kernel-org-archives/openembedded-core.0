Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1SyZn3-0007c2-1i
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 04:45:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q772XE3b019824
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 19:33:14 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 6 Aug 2012 19:33:14 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Aug 2012 10:31:57 +0800
Message-ID: <1344306717-6352-2-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <1344306717-6352-1-git-send-email-sen.zhang@windriver.com>
References: <1344306717-6352-1-git-send-email-sen.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] image-mklibs: pass correct libdir to mklibs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2012 02:45:01 -0000
Content-Type: text/plain

libdir should be specified, or else mklibs won't work for 64bit targets.
It wouldn't be able to find the libs.

    Traceback (most recent call last):
      File "<build>/bitbake_build/tmp/sysroots/i686-linux/usr/bin/x86_64-wrs-linux/mklibs", line 553, in <module>
        header = elf_header(find_lib(libraries.copy().pop()))
      File "<build>/bitbake_build/tmp/sysroots/i686-linux/usr/bin/x86_64-wrs-linux/mklibs", line 89, in elf_header
        raise Exception("Cannot find lib: " + obj)
    Exception: Cannot find lib:

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 meta/classes/image-mklibs.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index 7623815..66b0f52 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -38,6 +38,7 @@ mklibs_optimize_image_doit() {
 
 	mklibs -v \
 		--ldlib ${dynamic_loader} \
+		--libdir ${baselib} \
 		--sysroot ${PKG_CONFIG_SYSROOT_DIR} \
 		--root ${IMAGE_ROOTFS} \
 		--target `echo ${TARGET_PREFIX} | sed 's/-$//' ` \
-- 
1.7.7.6



