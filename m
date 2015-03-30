Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 57E4373C0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 02:50:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t2U2oj82021830
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Mar 2015 19:50:45 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 29 Mar 2015 19:50:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 29 Mar 2015 19:50:44 -0700
Message-ID: <2ffba68fe82f6fb17429d630b3255625d3489b98.1427683823.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1427683823.git.liezhi.yang@windriver.com>
References: <cover.1427683823.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pcmciautils: fix for parallel build
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
X-List-Received-Date: Mon, 30 Mar 2015 02:50:45 -0000
Content-Type: text/plain

Fixed:
Compiling lex_config.c.
  src/lex_config.l:34:25: fatal error: yacc_config.h: No such file or directory

There was a patch for fixing the paralle issue before, so modify the
patch again.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../Makefile-fix-for-parallel-build.patch          |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch
index e9eaab7..c9a7ada 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch
@@ -10,6 +10,10 @@ Fixed:
 |                            ^
 |   compilation terminated.
 
+And:
+Compiling lex_config.c.
+  src/lex_config.l:34:25: fatal error: yacc_config.h: No such file or directory
+
 Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
@@ -18,14 +22,16 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index d45fdc3..de2a5f9 100644
+index d45fdc3..d4ffd7e 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -246,7 +246,7 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/startup.o src/yacc_config.o src/lex_config
+@@ -246,7 +246,9 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/startup.o src/yacc_config.o src/lex_config
  	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/startup.o src/yacc_config.o src/lex_config.o $(LIB_OBJS) $(ARCH_LIB_OBJS)
  	$(QUIET) $(STRIPCMD) $@
  
 -yacc_config.o lex_config.o: %.o: %.c
++lex_config.o: yacc_config.h
++
 +yacc_config.o lex_config.o: %.o: %.c: %.h
  	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
  
-- 
1.7.9.5


