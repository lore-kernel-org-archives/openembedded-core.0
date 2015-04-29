Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 30B4073C48
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 05:29:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T5T8dV009975
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 22:29:08 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 28 Apr 2015 22:29:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2015 22:29:07 -0700
Message-ID: <a436dd7690883f500377fc4b20ef58c6632dc3ab.1430285314.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1430285314.git.liezhi.yang@windriver.com>
References: <cover.1430285314.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] pcmciautils: fix for parallel build
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
X-List-Received-Date: Wed, 29 Apr 2015 05:29:10 -0000
Content-Type: text/plain

Fixed:
Compiling lex_config.c.
  src/lex_config.l:34:25: fatal error: yacc_config.h: No such file or directory

There was a patch for fixing the paralle issue before, so modify the
patch again.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../Makefile-fix-for-parallel-build.patch          |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch
index c9a7ada..d0bb3d6 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch
@@ -18,11 +18,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ Makefile |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index d45fdc3..d4ffd7e 100644
+index d45fdc3..963453a 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -246,7 +246,9 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/startup.o src/yacc_config.o src/lex_config
@@ -30,9 +30,9 @@ index d45fdc3..d4ffd7e 100644
  	$(QUIET) $(STRIPCMD) $@
  
 -yacc_config.o lex_config.o: %.o: %.c
-+lex_config.o: yacc_config.h
-+
-+yacc_config.o lex_config.o: %.o: %.c: %.h
++lex_config.o: lex_config.c yacc_config.h
++	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
++yacc_config.o: yacc_config.c
  	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
  
  debugtools: ccdv $(CBDUMP) $(CISDUMP)
-- 
1.7.9.5


