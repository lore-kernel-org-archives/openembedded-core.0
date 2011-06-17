Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QXaSX-0004YP-6r
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 16:55:45 +0200
Received: by mail-yw0-f47.google.com with SMTP id 12so857481ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 07:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=Z33I782Ul9aD4gvrx4/qPi8xqjEIwfvAZhyLXHX8mZY=;
	b=WXmAQui0nRtQExgyBg1mWkvTeORWO3zJb+SSb4WmBoaA6rSR03Ohj4+Jh8f9ZA62ux
	NOxl72CBlBCuEc24dkCZ50k8deIygsGRi90aJyHu+/z4y4yoBsL5Hkm5os31QJpEECxV
	iVZVRzb1a7C39xcaXXDI+XlpA+2vyqfl9nGWU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=lL6Ji5d2wrpaqXLrsZzfVzmXyRCQrEa9Y896oYsGUG1/z09BdJsXxtQ/ziLrTnQSuG
	WZL+OyPmsU0CsnsNBasip0O0+8J5138PMJnT1tWDai5Wo7n9rDZEmQk0hPOWbLOQ4ssy
	Tk/XoCr/WBt3ICHyD+d335KvWBV882kwcjce0=
Received: by 10.236.193.73 with SMTP id j49mr3167827yhn.332.1308322338526;
	Fri, 17 Jun 2011 07:52:18 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id k10sm1754092yhj.50.2011.06.17.07.52.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2011 07:52:15 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2011 14:51:38 +0000
Message-Id: <8eda0375c21f8217e55da2746ef3fffab3caff53.1308322247.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1308322247.git.otavio@ossystems.com.br>
References: <cover.1308322247.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1308322247.git.otavio@ossystems.com.br>
References: <cover.1308322247.git.otavio@ossystems.com.br>
Subject: [PATCH 4/9] cmake.bbclass: use CPPFLAGS and CXXFLAGS
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
X-List-Received-Date: Fri, 17 Jun 2011 14:55:45 -0000

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



