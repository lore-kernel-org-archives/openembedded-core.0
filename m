Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T8j7z-0007kR-GX
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 04:44:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q842WCCN000859
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Sep 2012 19:32:13 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Mon, 3 Sep 2012 19:32:12 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 4 Sep 2012 10:32:18 +0800
Message-ID: <c0b57d127fb7e75fad45cf48fd5c5ab4782b130c.1346666634.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346666634.git.kai.kang@windriver.com>
References: <cover.1346666634.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] ghostscript: disable libidn support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 02:44:36 -0000
Content-Type: text/plain

If libidn is just populated to sysroot but rpm packages are not created,
build ghostscript will check libidn automatically and then depends on
libidn. But package libidn doesn't exist, so build image which contains
ghostscript will fail with:

| error: Failed dependencies:
| 	libidn11 >= 1.25 is needed by ghostscript-9.05-r2.i586
| 	libidn.so.11(LIBIDN_1.0) is needed by ghostscript-9.05-r2.i586
| 	libidn.so.11 is needed by ghostscript-9.05-r2.i586

Disable libidn support to fix this issue.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../ghostscript/ghostscript_9.05.bb                |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
index dc6e481..1c18b21 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
@@ -15,7 +15,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c5326026692dbed183f0558f926580f8"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
 DEPENDS_virtclass-native = ""
@@ -36,7 +36,7 @@ SRC_URI[md5sum] = "f7c6f0431ca8d44ee132a55d583212c1"
 SRC_URI[sha256sum] = "593f77f7584704bdf9de41598a084a4208c3ad3b940a1de1faaf8f59a15cc207"
 
 EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec --without-jasper \
-                --with-fontpath=${datadir}/fonts --with-install-cups"
+                --with-fontpath=${datadir}/fonts --with-install-cups --without-libidn"
 
 # This has been fixed upstream but for now we need to subvert the check for time.h
 # http://bugs.ghostscript.com/show_bug.cgi?id=692443
-- 
1.7.5.4



