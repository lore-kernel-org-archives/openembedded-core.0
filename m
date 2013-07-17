Return-Path: <net147@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1EFD86B1C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 08:24:46 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fa11so1718264pad.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 01:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=f+znUj9y6jENWZ0jFWkDeZzmolNMQS4dQjbn84vMvzY=;
	b=GFpKBeRtUS321ZHf72YOg9ue6w8LA4a/K8lYaCUnp+s9qfQlt3S/EndVGSh8Cx4oHj
	XGl+4kdIxE+3t5cz6p3nR8cQa/cPPfCqzyhGZXiTThaKJ5+LITNSH1+nULNjnjxIhIEF
	iUk2nFVxos1MuVnMXKZaYzh5A3l2qiLTaAoz+Hmm1pzA/nnTKOIkzYVwUCP/dcbejUoj
	b5OpWTiaFSrzu1hiRq8HHvXlyQVXuyNFzi0rUnp/RGz3xURsTXSaGy6dAa6wfZI8jx1O
	1W7I+5Z/F9Y3ArzDUwLC2/N13nhpxRKdm1KPHVOqTtV9aX7bGS961z2KdiAkQVee7aI1
	AJkQ==
X-Received: by 10.66.178.143 with SMTP id cy15mr1810227pac.105.1374049486560; 
	Wed, 17 Jul 2013 01:24:46 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id ai6sm9087055pad.15.2013.07.17.01.24.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 17 Jul 2013 01:24:45 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2013 18:40:22 +1000
Message-Id: <1374050422-5056-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] cmake.bbclass: set ar/ld/nm/objcopy/objdump/ranlib/strip native paths
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
X-List-Received-Date: Wed, 17 Jul 2013 08:24:46 -0000

The CMAKE_{AR,LINKER,NM,OBJCOPY,OBJDUMP,RANLIB,STRIP} cmake variables
are currently set to values like CMAKE_LINKER-NOTFOUND for native
recipes because the host paths are not searched. This is because the
CMAKE_FIND_ROOT_PATH_MODE_PROGRAM cmake variable is set to ONLY.

To resolve this, explicitly set the variables using FIND_PROGRAM and
pass the CMAKE_FIND_ROOT_PATH_BOTH option so the host paths are also
searched.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/cmake.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 310242e..31166e0 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -69,6 +69,18 @@ set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
 EOF
 }
 
+cmake_do_generate_toolchain_file_append_class-native() {
+	cat >> ${WORKDIR}/toolchain.cmake <<EOF
+FIND_PROGRAM(CMAKE_AR ${AR} CMAKE_FIND_ROOT_PATH_BOTH)
+FIND_PROGRAM(CMAKE_LINKER ${LD} CMAKE_FIND_ROOT_PATH_BOTH)
+FIND_PROGRAM(CMAKE_NM ${NM} CMAKE_FIND_ROOT_PATH_BOTH)
+FIND_PROGRAM(CMAKE_OBJCOPY ${OBJCOPY} CMAKE_FIND_ROOT_PATH_BOTH)
+FIND_PROGRAM(CMAKE_OBJDUMP ${OBJDUMP} CMAKE_FIND_ROOT_PATH_BOTH)
+FIND_PROGRAM(CMAKE_RANLIB ${RANLIB} CMAKE_FIND_ROOT_PATH_BOTH)
+FIND_PROGRAM(CMAKE_STRIP ${STRIP} CMAKE_FIND_ROOT_PATH_BOTH)
+EOF
+}
+
 addtask generate_toolchain_file after do_patch before do_configure
 
 cmake_do_configure() {
-- 
1.8.3.2


