Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QWvOE-00022c-6y
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 21:04:34 +0200
Received: by yxe1 with SMTP id 1so461584yxe.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 12:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=NOSxQjNTpcsyKVCljY5gXAXwGCfynGJGpN6eJJqxb1o=;
	b=ZSGED12s5zdDThSFjqV5KmN1dNIbKo4btg9Xq1spO0ro8gdj8/cQtkOZcUV6gtTYlH
	92+PFz6usxjPN9PhRfqDisG+S+pf+6+I+ogs2FxaD+blpffjsRP1AHPp3J/9pRtuPiJD
	24HLMwyW/qu6erGLATnOH0EqP3S2zV8wWTaDY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=vNdyjQE9zX4ublgMA2Pl/QPhlvTgpLFrrg7QMMfDXUOWTvG75Ibjv2+I1NtS5NgNHr
	n0gh4yhXGhC8KIndY1+UrReuRkEdfbLnAqOZi5j4mFrboqzhpCkIvCQbIShnEiP7BXAW
	gV+O46o77FUckNkml8MWOqez/IkLC3Xgsurm0=
Received: by 10.236.185.3 with SMTP id t3mr153723yhm.175.1308164466254;
	Wed, 15 Jun 2011 12:01:06 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id w66sm407379yhi.38.2011.06.15.12.01.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Jun 2011 12:01:05 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jun 2011 19:00:52 +0000
Message-Id: <1308164452-18751-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] cmake: refactor recipe
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
X-List-Received-Date: Wed, 15 Jun 2011 19:04:34 -0000

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



