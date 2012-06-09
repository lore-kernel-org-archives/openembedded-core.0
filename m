Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdOwE-00044V-JJ
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 18:54:59 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so3570867pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2012 09:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7Yjoy1wE+/xI0GiUQgYU2cWabpJN4j8FoEMVVKV2yAk=;
	b=stwydwnASUFEhU9mZWhnUnplsOyhUTzZ4VXokk9vZWBa4ilzXkPV8zo7egLettJMst
	1syS88+OHGPs8E+E0Pae2hk32HqSBoLUuKUG7IawnhrXRbsZh+tTqnLFanCV0SlZ8aAw
	tkW3jD94Mtcp6PBxgqizek+VDzZcmJSUS5ONM70VsohnaBQDDGfBpR51U8K+oaC+xw+z
	5Xn+DSz0MM4U6a/HSDC+AlQ3kAswvLJL5ZeFXybSl69z0+6Aqs+O4bl0ymCEHGE5smg3
	Ts8kjxoEiuhkirHNDo3laKOWWhlQZU3EgR0vNao66J9xqVWlVRI7lIiFsfn8TAObVdR5
	G6Dw==
Received: by 10.68.132.201 with SMTP id ow9mr7513097pbb.160.1339260269381;
	Sat, 09 Jun 2012 09:44:29 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hc7sm11897651pbc.54.2012.06.09.09.44.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jun 2012 09:44:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2012 09:43:09 -0700
Message-Id: <e85710255addf84bd1e2028cb8986650c15de7ef.1339259893.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
References: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339259893.git.raj.khem@gmail.com>
References: <cover.1339259893.git.raj.khem@gmail.com>
Subject: [PATCH 11/16] cmake.bbclass: Add OECMAKE_C_LINK_FLAGS and OECMAKE_CXX_LINK_FLAGS variables
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
X-List-Received-Date: Sat, 09 Jun 2012 16:55:00 -0000

In some cases we need to specify linker flags and right
now we do not have a way to communicate that to cmake
based systems. cmake defines CMAKE_C_LINK_FLAGS and CMAKE_CXX_LINK_FLAGS
for these needs. This patch therefore defines two local variables
namely OECMAKE_C_LINK_FLAGS and OECMAKE_CXX_LINK_FLAGS which
can be altered by recipes to tweak linker flags

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/cmake.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index dcd974a..eda45dd 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -23,6 +23,8 @@ OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS}"
 OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} -fpermissive"
 OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${CPPFLAGS} -DNDEBUG"
 OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${CXXFLAGS} -DNDEBUG"
+OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
+OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"
 
 OECMAKE_RPATH ?= ""
 OECMAKE_PERLNATIVE_DIR ??= ""
@@ -40,6 +42,8 @@ set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
 set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
 set( CMAKE_C_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "CFLAGS for release" )
 set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "CXXFLAGS for release" )
+set( CMAKE_C_LINK_FLAGS "${OECMAKE_C_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
+set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 
 # only search in the paths provided so cmake doesnt pick
 # up libraries and tools from the native build machine
-- 
1.7.5.4



