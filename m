Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2E007601A0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 15:25:51 +0000 (UTC)
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3hTYSJ0zlxz3hhpH;
	Thu,  7 Aug 2014 17:25:52 +0200 (CEST)
X-Auth-Info: 6XimPgoQB4sWwEmR0/wxJU5RlCw+CWBgh52HMEBCNyc=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3hTYSJ03N8z7S6S5; 
	Thu,  7 Aug 2014 17:25:51 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 17:25:46 +0200
Message-Id: <1407425146-2610-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH][RESEND] Yocto: qt4: Avoid duplicate flags in the g++-unix.conf
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
X-List-Received-Date: Thu, 07 Aug 2014 15:25:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The removed flags from this g++.conf file, which is installed to the
target as g++-unix.conf are added by gcc-base.conf . Do not add those
flags twice.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Eric Bénard <eric@eukrea.com>
---
 meta/recipes-qt/qt4/qt4-4.8.5/g++.conf | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/g++.conf b/meta/recipes-qt/qt4/qt4-4.8.5/g++.conf
index 8755031..be78c24 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.5/g++.conf
+++ b/meta/recipes-qt/qt4/qt4-4.8.5/g++.conf
@@ -5,32 +5,14 @@
 QMAKE_COMPILER = gcc
 
 QMAKE_CC       = $(OE_QMAKE_CC)
-QMAKE_CFLAGS       += -pipe $(OE_QMAKE_CFLAGS)
+QMAKE_CFLAGS       += $(OE_QMAKE_CFLAGS)
 QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += $(OE_QMAKE_CFLAGS)
-QMAKE_CFLAGS_DEPS	+= -M
-QMAKE_CFLAGS_WARN_ON	+= -Wall -W
-QMAKE_CFLAGS_WARN_OFF	+= -w
-QMAKE_CFLAGS_RELEASE	+=
-QMAKE_CFLAGS_DEBUG	+= -g
-QMAKE_CFLAGS_SHLIB	+= -fPIC
-QMAKE_CFLAGS_STATIC_LIB	+= -fPIC
-QMAKE_CFLAGS_YACC	+= -Wno-unused -Wno-parentheses
-QMAKE_CFLAGS_HIDESYMS   += -fvisibility=hidden
 QMAKE_CFLAGS_PRECOMPILE += -x c-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
 QMAKE_CFLAGS_USE_PRECOMPILE += -include ${QMAKE_PCH_OUTPUT_BASE}
 
 QMAKE_CXX      = $(OE_QMAKE_CXX)
-QMAKE_CXXFLAGS     += $$QMAKE_CFLAGS $(OE_QMAKE_CXXFLAGS)
-QMAKE_CXXFLAGS_DEPS	+= $$QMAKE_CFLAGS_DEPS
-QMAKE_CXXFLAGS_WARN_ON	+= $$QMAKE_CFLAGS_WARN_ON
-QMAKE_CXXFLAGS_WARN_OFF	+= $$QMAKE_CFLAGS_WARN_OFF
-QMAKE_CXXFLAGS_RELEASE	+= $$QMAKE_CFLAGS_RELEASE
+QMAKE_CXXFLAGS     += $(OE_QMAKE_CXXFLAGS)
 QMAKE_CXXFLAGS_RELEASE_WITH_DEBUGINFO += $$QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO
-QMAKE_CXXFLAGS_DEBUG	+= $$QMAKE_CFLAGS_DEBUG
-QMAKE_CXXFLAGS_SHLIB	+= $$QMAKE_CFLAGS_SHLIB
-QMAKE_CXXFLAGS_STATIC_LIB += $$QMAKE_CFLAGS_STATIC_LIB
-QMAKE_CXXFLAGS_YACC	+= $$QMAKE_CFLAGS_YACC
-QMAKE_CXXFLAGS_HIDESYMS += $$QMAKE_CFLAGS_HIDESYMS -fvisibility-inlines-hidden
 QMAKE_CXXFLAGS_PRECOMPILE += -x c++-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
 QMAKE_CXXFLAGS_USE_PRECOMPILE = $$QMAKE_CFLAGS_USE_PRECOMPILE
 
@@ -39,9 +21,6 @@ QMAKE_LINK_SHLIB   = $(OE_QMAKE_LINK)
 QMAKE_LINK_C		= $(OE_QMAKE_LINK)
 QMAKE_LINK_C_SHLIB	= $(OE_QMAKE_LINK)
 QMAKE_LFLAGS       += $(OE_QMAKE_LDFLAGS)
-QMAKE_LFLAGS_RELEASE	+=
-QMAKE_LFLAGS_DEBUG	+=
-QMAKE_LFLAGS_APP	+=
 QMAKE_LFLAGS_NOUNDEF	+= -Wl,--no-undefined
 QMAKE_LFLAGS_RPATH        = -Wl,-rpath-link,
 
-- 
2.0.1


