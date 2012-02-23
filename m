Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0b4J-0003xO-Bj
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 16:58:55 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so619839eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 07:50:36 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.32.72 as permitted sender) client-ip=10.213.32.72; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.32.72 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.32.72])
	by 10.213.32.72 with SMTP id b8mr624646ebd.3.1330012236221 (num_hops =
	1); Thu, 23 Feb 2012 07:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ZiU9x+Rd5wQsjxC/BOCJn0LyfWRhtuX1m0JIqx745c0=;
	b=xy5IK5W3NPgsugLiHH1tx0+Ito1ZsmGOukmrsTDBfRyLqoQynf9+s5Qe4Rbc8Zo4TK
	Upymeke2xeTsonzJAhoL51Y4s1WY3zffMr8b6Wo1Zgylrne+4okyKtJNK1HpWfWSH7O6
	fN+LHR0JVCMnWEH5IzFrgT2DVL7xRrMzW2rgg=
Received: by 10.213.32.72 with SMTP id b8mr492882ebd.3.1330012235745;
	Thu, 23 Feb 2012 07:50:35 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s48sm6717263eem.0.2012.02.23.07.50.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 07:50:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 16:50:24 +0100
Message-Id: <3a155936ed32d2296f38a499c41490f215b6fb4d.1330012029.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1330012029.git.Martin.Jansa@gmail.com>
References: <cover.1330012029.git.Martin.Jansa@gmail.com>
Subject: [PATCH 08/11] e2fsprogs: remove ldconfig call from install-libs
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
X-List-Received-Date: Thu, 23 Feb 2012 15:58:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../e2fsprogs-1.42/remove.ldconfig.call.patch      |   28 ++++++++++++++++++++
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb  |    6 +++-
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/remove.ldconfig.call.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/remove.ldconfig.call.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/remove.ldconfig.call.patch
new file mode 100644
index 0000000..0e5fd7d
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/remove.ldconfig.call.patch
@@ -0,0 +1,28 @@
+When /etc/ld.so.cache is writeable by user running bitbake then it creates invalid cache
+(in my case libstdc++.so cannot be found after building zlib(-native) and I have to call
+touch */libstdc++.so && /sbin/ldconfig to fix it.
+
+So remove ldconfig call from make install-libs
+
+Upstream-Status: Inappropriate [disable feature]
+
+diff -uNr e2fsprogs-1.42.orig/lib/Makefile.elf-lib e2fsprogs-1.42/lib/Makefile.elf-lib
+--- e2fsprogs-1.42.orig/lib/Makefile.elf-lib	2010-06-14 05:07:36.000000000 +0200
++++ e2fsprogs-1.42/lib/Makefile.elf-lib	2012-02-23 14:26:07.021272275 +0100
+@@ -52,8 +52,6 @@
+ 		$(LN_S) -f $(ELF_INSTALL_DIR)/$(ELF_SONAME) \
+ 			$(DESTDIR)$(libdir)/$(ELF_IMAGE).so; \
+ 	fi			
+-	$(E) "	LDCONFIG"
+-	$(Q) -$(LDCONFIG)
+ 
+ install-strip: install
+ 	$(E) "	STRIP-LIB $(ELF_INSTALL_DIR)/$(ELF_LIB)"
+@@ -69,7 +67,6 @@
+ 	$(RM) -f $(DESTDIR)$(ELF_INSTALL_DIR)/$(ELF_LIB) \
+ 		$(DESTDIR)$(ELF_INSTALL_DIR)/$(ELF_SONAME) \
+ 		$(DESTDIR)$(libdir)/$(ELF_IMAGE).so
+-	-$(LDCONFIG)
+ 
+ clean::
+ 	$(RM) -rf elfshared
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
index 2289211..c40d02f 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
@@ -1,9 +1,11 @@
 require e2fsprogs.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "file://fallocate.patch \
-            file://acinclude.m4"
+            file://acinclude.m4 \
+            file://remove.ldconfig.call.patch \
+"
 
 SRC_URI[md5sum] = "a3c4ffd7352310ab5e9412965d575610"
 SRC_URI[sha256sum] = "55b46db0cec3e2eb0e5de14494a88b01ff6c0500edf8ca8927cad6da7b5e4a46"
-- 
1.7.8.4



