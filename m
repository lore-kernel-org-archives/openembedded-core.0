Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SB46X-00029s-3w
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 14:00:29 +0100
Received: by pbcum15 with SMTP id um15so2281912pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Ei8uEenHrd+qC0AIvERuaYOWCClWwFDoKso+g4NJo1U=;
	b=KcYrNJPvp4VFAPkm6Rf583L2JCNAKmE3YTqGTfdOznfzu6s37BK+7dC4MoaiYA1RsO
	aXegO4T3qzFNiWiZa3BavMulpwoDK46Wk3AmFhnG78XhMwJNX4iGcDfQJGZMhRknVj2z
	CggxGjQ6uot0qEJLM+QjUGyN1MfFs15znoh5IjZnT9jHJKw1ZH0SV6oivybrp5lq2b3s
	mk436TgfvDhl7CIPFPerLW+dd8MEimLPV02S+iEU2qvoTe/7x/IKtuS86mpOJmyKH08J
	OAQZQQiFjv62+aUZ/0IZm/jj5Xo1is1iX/KwKuBmXygY4uloKBMALpvFNd8lzh4cES7p
	dgDA==
Received: by 10.68.135.74 with SMTP id pq10mr29891799pbb.24.1332507092051;
	Fri, 23 Mar 2012 05:51:32 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id m6sm5799294pbd.5.2012.03.23.05.51.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 05:51:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 05:50:41 -0700
Message-Id: <1332507041-30674-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] gdb-cross-canadian: Fix linking issues when python support is enabled
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
X-List-Received-Date: Fri, 23 Mar 2012 13:00:29 -0000

gdb-cross-canadian was linking with static version of libpython
and looking for build host python when run. This could be mismatch
between python-nativesdk and build host provided python. So we
make it consistent to always use python-nativesdk

Instead of adding bunch of -L we add -rpath and -rpath-link
so that gdb finds all needed libraries in SDK and does not
reach out into host

This should fix yocto PR# 2077 as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |    7 ++++---
 .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index a7cac61..59412c4 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -1,4 +1,5 @@
 inherit cross-canadian
+inherit python-dir
 
 DESCRIPTION = "cross-canadian gdb for ${TARGET_ARCH} target - GNU debugger"
 PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
@@ -14,9 +15,9 @@ do_configure_prepend() {
 cat > ${WORKDIR}/python << EOF
 #! /bin/sh
 case "\$2" in
-        --includes) echo "-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}/" ;;
-        --ldflags) echo "-L${STAGING_LIBDIR}/../python${PYTHON_BASEVERSION}/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
-        --exec-prefix) echo "/usr" ;;
+        --includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}/" ;;
+        --ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
+        --exec-prefix) echo "${exec_prefix}/bin" ;;
         *) exit 1 ;;
 esac
 exit 0
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
index dbcffde..dfb7d81 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
@@ -1,7 +1,7 @@
 require gdb-common.inc
 require gdb-cross-canadian.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 EXPAT = "--with-expat"
-- 
1.7.5.4



