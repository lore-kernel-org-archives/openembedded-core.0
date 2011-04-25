Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQyw-0003y8-16
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:58:02 +0200
Received: by pxi1 with SMTP id 1so1934504pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=+8KsPWjma4B6bFyy5wxg5XU4Q1mWYDxssglJhc/6J7Y=;
	b=kG6qTent+icSWjBnvGBaAF1+DhSCn5PZWVNI4tegNj/2Jw9kDD6hee46IiC8EeNz0T
	135fu6EuiOv4S99JepZ1l90oX+SNvyrBbw3I4iwtm3xBGHp7BsJWy99WXdCbSh8evUU+
	1mFoykKLB+o5K6ef8ykW6BUx1MI40wMwaR8Iw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PaDTP8O/cCgk90KIEaKUl7nwOMQZFNw90oN7HlnXXDcPIoNHsbfN8mT3ttVWCGqh4o
	SRh6KMv0qmpqIQyfBs30NUc77u7sP8BCfpO+U0YaS2D24FyqlbLKzo4edqT4Flc3PB3G
	brmtGkmX1zg7+0MArmb7kZqSBRpM0/VIIve5o=
Received: by 10.68.47.6 with SMTP id z6mr6338407pbm.310.1303757730958;
	Mon, 25 Apr 2011 11:55:30 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id s7sm4060104pba.18.2011.04.25.11.55.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:55:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:55:24 -0700
Message-Id: <e5c0091a01641a3a2b55321cf5b4a5a9e91ef8e5.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 13/17] perl_5.12.2.bb: Undefine features not found in uclibc
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
X-List-Received-Date: Mon, 25 Apr 2011 18:58:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../perl/perl-5.12.2/native-ssp.patch              |   16 ----------------
 meta/recipes-devtools/perl/perl_5.12.2.bb          |   16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch

diff --git a/meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch b/meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch
deleted file mode 100644
index e1e6f08..0000000
--- a/meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status:Inappropriate [embedded specific]
-
-Fix for compiling with ssp enabled gcc:
-See http://bugs.openembedded.net/show_bug.cgi?id=1980
-
-diff -Naur perl-5.8.7.orig/cflags.SH perl-5.8.7/cflags.SH
---- perl-5.8.7.orig/cflags.SH	2002-09-30 10:59:07.000000000 +0000
-+++ perl-5.8.7/cflags.SH	2005-10-02 04:08:39.000000000 +0000
-@@ -165,6 +165,8 @@
- esac
- 
-     : Can we perhaps use $ansi2knr here
-+    [[ $file == regcomp ]] && export ccflags="${ccflags} -fno-stack-protector"
-+    [[ $file == regexec ]] && export ccflags="${ccflags} -fno-stack-protector"
-     echo "$cc -c -DPERL_CORE $ccflags $optimize $warn"
-     eval "$also "'"$cc -DPERL_CORE -c $ccflags $optimize $warn"'
diff --git a/meta/recipes-devtools/perl/perl_5.12.2.bb b/meta/recipes-devtools/perl/perl_5.12.2.bb
index 9ce8156..b841e7d 100644
--- a/meta/recipes-devtools/perl/perl_5.12.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.12.2.bb
@@ -131,6 +131,12 @@ do_configure() {
                        -e "s,\(getnetent_r_proto=\)'\w+',\1'0',g" \
                        -e "s,\(d_sockatmark=\)'define',\1'undef',g" \
                        -e "s,\(d_sockatmarkproto=\)'\w+',\1'0',g" \
+                       -e "s,\(d_eaccess=\)'define',\1'undef',g" \
+                       -e "s,\(d_stdio_ptr_lval=\)'define',\1'undef',g" \
+                       -e "s,\(d_stdio_ptr_lval_sets_cnt=\)'define',\1'undef',g" \
+                       -e "s,\(d_stdiobase=\)'define',\1'undef',g" \
+                       -e "s,\(d_stdstdio=\)'define',\1'undef',g" \
+                       -e "s,-fstack-protector,-fno-stack-protector,g" \
                     config.sh-${TARGET_ARCH}-${TARGET_OS}
         fi
 
@@ -145,6 +151,16 @@ do_configure() {
 	       -e 's,/perl5,/perl,g' \
             config.sh-${TARGET_ARCH}-${TARGET_OS}
 
+       case "${TARGET_ARCH}" in                                                                      
+                x86_64 | powerpc | s390)                                                              
+                        sed -i -e "s,\(need_va_copy=\)'undef',\1'define',g" \                         
+                                config.sh-${TARGET_ARCH}-${TARGET_OS}                                 
+                        ;;                                                                            
+                arm)                                                                                  
+                        sed -i -e "s,\(d_u32align=\)'undef',\1'define',g" \                           
+                                config.sh-${TARGET_ARCH}-${TARGET_OS}                                 
+                        ;;                                                                            
+        esac                                                                                          
         # These are strewn all over the source tree
         for foo in `grep -I -m1 \/usr\/include\/.*\\.h ${WORKDIR}/* -r | cut -f 1 -d ":"` ; do
             echo Fixing: $foo
-- 
1.7.4.1



