Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CACC6606E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 08:32:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1C8WVhU012547
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Feb 2015 00:32:33 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 12 Feb 2015 00:32:31 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Feb 2015 16:26:07 +0800
Message-ID: <1423729567-14273-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: chris_larson@mentor.com
Subject: [PATCH] libnewt-python: remove make var LIBNEWTSH
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
X-List-Received-Date: Thu, 12 Feb 2015 08:32:34 -0000
Content-Type: text/plain

Var LIBNEWTSH which points to libnewt.so in STAGING_LIBDIR is passed to
make. But during do_compile, LIBNEWTSH is rebuilt. Check the log that
gcc populates file into STAGING_LIBDIR directly:

i586-poky-linux-gcc  -m32 -march=i586
--sysroot=/poky/builds/build/tmp/sysroots/qemux86 -shared -o
/poky/builds/build/tmp/sysroots/qemux86/usr/lib/libnewt.so.0.52.18
...

It is not a proper operation export file into STAGING_LIBDIR during
compile. So remove the var LIBNEWTSH.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/newt/libnewt-python_0.52.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/newt/libnewt-python_0.52.18.bb b/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
index d591fbd..ecc670e 100644
--- a/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
+++ b/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
@@ -12,7 +12,7 @@ EXTRA_OEMAKE += "PYTHONVERS=${PYTHON_DIR}"
 
 do_compile () {
 	VERSION="$(sed -n 's/^VERSION = //p' Makefile)"
-	oe_runmake "LIBNEWTSH=${STAGING_LIBDIR}/libnewt.so.$VERSION" _snack.so
+	oe_runmake _snack.so
 }
 
 do_install () {
-- 
1.9.1


