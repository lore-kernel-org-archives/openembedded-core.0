Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id BD8F27325A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:46 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id q63so146458272pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=TQiSfcRaODGcZGN0yHq8KlA2aCU1tJ3N6QVaIpnKXGc=;
	b=ZsVpUfkpfOUI5pnPxiZGJxFdvgzaCkX9VTtyC2IqWOh6qO5EJUrfp+5Zt+jP6HWrNE
	Wo/8dBbHRK4EmfHepuBd99F8U51EqSFem5PvUAs8v989x8SG7qx+bXNYALe90Da2yTRG
	KGVBC9oJtHda1OFc0AvQiRsN3HGOtt+lqAt+4hm6lwlpCTfTZqYchTOfV9i1NqmTvHX9
	1HKGRMXdEMXNJUu/kk0Dagmobv9Rfrrf4PxbVRVXk5z9n1mBybd148mvl2tGxLM+OCw9
	6femu9e9idsF8lDCzurFiJ0K3wZq21E4rY1ih+0n8N0eOU6adfmzNdJk+hRIVf5KvGhd
	PDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=TQiSfcRaODGcZGN0yHq8KlA2aCU1tJ3N6QVaIpnKXGc=;
	b=PEishG3yx9l2FQQqnbZR6gx+66UlD3estbQX7nxrkDre8INcsOIkYI8r6UGNYHTgfS
	748SMkcz7ExGaXKw2U7fUU/CxMzGWS13T/Y9jkXe5uOVTW+F/zhYxABn4ff44O0qFuiO
	pBubuE/1gaT4EslJaHsBHH90KarURf6Vq91Unk48fFL5EoAp8Dx84zqZEhMcITxpfphv
	8pCJEmhGm4lZwe4x/wlhbqn/kvQFzEmVTuUaZ0uNELYdggHEYyQa3nxJtC8St7aYyNHU
	fM+x3PMLntWMlUZIfZXXxNk+WpzxfvN9AfN5pRb+0z3JJtK4HYR+nW5SJ3YuB/D4yE7+
	2ICQ==
X-Gm-Message-State: ALoCoQmeEZYcUu2ygh1hum9nwpejN48dxSggu97WHaVPrfYz6aS2CB9RkJMqf4b8jtUxmMDpXlErzSXBwagWOlJLjZmJoVNSBw==
X-Received: by 10.98.73.207 with SMTP id r76mr28619606pfi.118.1453030667818;
	Sun, 17 Jan 2016 03:37:47 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:26 -0800
Message-Id: <c100f21dd01aebdf0f0330401123115e82c9072d.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 53/73] pcmciautils: Fix parallel build and include sys/types.h
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:47 -0000

parallel build patch was removing dependencies on .c files mistakenly
just adding src/yacc_config.h to dependencies in existing rule should
have fixed the original build race

include sys/types.h in lex_config.l for getting u_long definition

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-fix-a-parallel-building-issue.patch        | 18 +++++++-----------
 .../pcmciautils/pcmciautils-018/lex_sys_types.patch | 21 +++++++++++++++++++++
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb     |  1 +
 3 files changed, 29 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-018/lex_sys_types.patch

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-parallel-building-issue.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-parallel-building-issue.patch
index 7b01040..3125df4 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-parallel-building-issue.patch
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-parallel-building-issue.patch
@@ -26,20 +26,16 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  Makefile | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
-diff --git a/Makefile b/Makefile
-index d45fdc3..4c53bc2 100644
---- a/Makefile
-+++ b/Makefile
-@@ -246,8 +246,7 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/startup.o src/yacc_config.o src/lex_config
+Index: pcmciautils-018/Makefile
+===================================================================
+--- pcmciautils-018.orig/Makefile
++++ pcmciautils-018/Makefile
+@@ -246,7 +246,7 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/st
  	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/startup.o src/yacc_config.o src/lex_config.o $(LIB_OBJS) $(ARCH_LIB_OBJS)
  	$(QUIET) $(STRIPCMD) $@
  
 -yacc_config.o lex_config.o: %.o: %.c
--	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
-+src/lex_config.o:src/yacc_config.h
++yacc_config.o lex_config.o: %.o: %.c src/yacc_config.h
+ 	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
  
  debugtools: ccdv $(CBDUMP) $(CISDUMP)
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/lex_sys_types.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/lex_sys_types.patch
new file mode 100644
index 0000000..d4c2bed
--- /dev/null
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils-018/lex_sys_types.patch
@@ -0,0 +1,21 @@
+Include sys/types.h for u_long definition
+
+Fix errors like
+In file included from src/lex_config.l:34:0:
+src/yacc_config.y:45:5: error: unknown type name 'u_long'
+     u_long num;
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: pcmciautils-018/src/lex_config.l
+===================================================================
+--- pcmciautils-018.orig/src/lex_config.l
++++ pcmciautils-018/src/lex_config.l
+@@ -22,6 +22,7 @@
+ #include <unistd.h>
+ #include <string.h>
+ #include <syslog.h>
++#include <sys/types.h>
+ 
+ #ifdef HAS_WORDEXP
+ #include <wordexp.h>
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
index 6a1c366..5c34081 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -2,6 +2,7 @@ require pcmciautils.inc
 
 SRC_URI += "file://makefile_fix.patch \
             file://0001-fix-a-parallel-building-issue.patch \
+            file://lex_sys_types.patch \
 "
 
 SRC_URI[md5sum] = "5d85669b3440baa4532363da6caaf1b4"
-- 
2.7.0


