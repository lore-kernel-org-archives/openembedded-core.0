Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QfBTO-0007Mv-Kd
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 15:52:02 +0200
Received: by gxk3 with SMTP id 3so831362gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 06:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Z33I782Ul9aD4gvrx4/qPi8xqjEIwfvAZhyLXHX8mZY=;
	b=DEtGqqlhfXX3SguDiqpTCPwfo1h7t4vEiDZsgRIufwPpa0gybDdbfezsRIRoMjTgsq
	ER7fVoFfA5qYyUlGtyrhX7e4NgK/r8ziSuiDC84lz6AxcpPxFxeGlePc5HKC2W33lxis
	yzCUj4fGY3i1AZR/dgGvciWj/sikcS8Ekpzko=
Received: by 10.236.200.133 with SMTP id z5mr879054yhn.272.1310132889747;
	Fri, 08 Jul 2011 06:48:09 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id p50sm2650140yhj.0.2011.07.08.06.48.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jul 2011 06:48:08 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 13:47:42 +0000
Message-Id: <e2367cc216c5875ca20eef2b9fbdf6af9719c86d.1310132765.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1310132765.git.otavio@ossystems.com.br>
References: <cover.1310132765.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1310132765.git.otavio@ossystems.com.br>
References: <cover.1310132765.git.otavio@ossystems.com.br>
Subject: [PATCH 3/8] cmake.bbclass: use CPPFLAGS and CXXFLAGS
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

Some classes, as for example nativesdk, defines CPPFLAGS and CXXFLAGS
to be passed to compiler. Using those makes more sense and avoid some
hacks on packages using CMake.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/cmake.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 011c232..672325e 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -19,10 +19,10 @@ OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
 OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
 
 # Compiler flags
-OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${TARGET_CPPFLAGS}"
-OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${TARGET_CPPFLAGS} -fpermissive"
-OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
-OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
+OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS}"
+OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} -fpermissive"
+OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${CPPFLAGS} -DNDEBUG"
+OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${CXXFLAGS} -DNDEBUG"
 
 OECMAKE_RPATH ?= ""
 
-- 
1.7.2.5



