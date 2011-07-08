Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QfBTO-0007MN-OG
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 15:52:02 +0200
Received: by mail-gx0-f175.google.com with SMTP id 3so831351gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 06:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=NOSxQjNTpcsyKVCljY5gXAXwGCfynGJGpN6eJJqxb1o=;
	b=fPL/XZhwLuI3l+3PTxv1gm3zXkppeDSvxumaZ2BdbvNOQ7PArs7cUB+HycJiPHfqtb
	z7ZEdhUwxENQUjvsfMJFt9KJ7BbDpa9AQS5vex0HrJB4913rpsvjMbOD8LZfI3L0Iis9
	pOkASbj17bHz2aI3UVPk0dNCpDb+lueoAEiJ4=
Received: by 10.150.201.6 with SMTP id y6mr2175446ybf.10.1310132892149;
	Fri, 08 Jul 2011 06:48:12 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id p50sm2650140yhj.0.2011.07.08.06.48.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jul 2011 06:48:11 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 13:47:43 +0000
Message-Id: <973d4ca48ffb9053b786075679dbc2514e1c587b.1310132765.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1310132765.git.otavio@ossystems.com.br>
References: <cover.1310132765.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1310132765.git.otavio@ossystems.com.br>
References: <cover.1310132765.git.otavio@ossystems.com.br>
Subject: [PATCH 4/8] cmake: refactor recipe
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
X-List-Received-Date: Fri, 08 Jul 2011 13:52:02 -0000

 * use INC_PR;
 * show configure's failure on error;
 * gather major version from PV;

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/cmake/cmake-native_2.8.3.bb |    4 ++--
 meta/recipes-devtools/cmake/cmake.inc             |    6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.3.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.3.bb
index 29b3d87..a68a25f 100644
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.3.bb
@@ -1,7 +1,7 @@
-CMAKE_MAJOR_VERSION="2.8"
 require cmake.inc
 inherit native
-PR = "r1"
+
+PR = "${INC_PR}.1"
 
 SRC_URI[md5sum] = "a76a44b93acf5e3badda9de111385921"
 SRC_URI[sha256sum] = "689ed02786b5cefa5515c7716784ee82a82e8ece6be5a3d629ac3cc0c05fc288"
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index eed9346..ec37a10 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -9,11 +9,15 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://Copyright.txt;md5=f372516292ff7c33337bf16a74a5f9a8 \
                     file://Source/cmake.h;beginline=1;endline=10;md5=341736dae83c9e344b53eeb1bc7d7bc2"
 
+INC_PR = "r1"
+
+CMAKE_MAJOR_VERSION = "${@'.'.join(bb.data.getVar('PV',d,1).split('.')[0:2])}"
+
 SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://support-oe-qt4-tools-names.patch"
 
 inherit autotools
 
 do_configure () {
-	./configure --prefix=${prefix} || die "./bootstrap failed"
+	./configure --prefix=${prefix}
 }
-- 
1.7.2.5



