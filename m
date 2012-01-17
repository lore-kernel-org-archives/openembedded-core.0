Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rn6rL-0007Ia-Mv
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 12:05:47 +0100
Received: by mail-ee0-f47.google.com with SMTP id d17so1792820eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 02:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=oJoNownw435TziQzrnqUx/bGGf5L7pd/YbR8Xqk5ttA=;
	b=EOVeg7jZVJJN8ZfnEdUfdD33yJKBJeqhB7JPBn3DU6pys/3G5O6+gTnMgeePvIEVB9
	gHFduDorSv1IeKN84J4hPykO8qqOZEHXucYNBvDs4hHGx2g67PzisXHzOYqAk4ubC6Vf
	+XpGCPh+AI2qiMdXrOEwx1RlH/576HZHS1Gtc=
Received: by 10.213.98.78 with SMTP id p14mr3874756ebn.145.1326797892854;
	Tue, 17 Jan 2012 02:58:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b49sm84538868eec.9.2012.01.17.02.58.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 02:58:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 11:58:03 +0100
Message-Id: <3682400320558e3f7094330e4ed99683e3deec31.1326797712.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <cover.1326797712.git.Martin.Jansa@gmail.com>
References: <cover.1326797712.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] gnutls: add readline to DEPENDS and add --with-libreadline-prefix
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
X-List-Received-Date: Tue, 17 Jan 2012 11:05:47 -0000

* without this patch it looks for readline in host's /usr/lib
  a) and fails if readline wasn't built before gnutls, because -I is set
     and cannot find header file, this case is better
     configure:33131: checking for readline
     configure:33156: x86_64-oe-linux-gcc    -m64 --sysroot=/OE/oe-core/tmp-eglibc/sysroots/qemux86-64 -std=gnu99 -o conftest -O2 -pipe -g -feliminate-unused-debug-types -I/OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/include -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed conftest.c  /usr/lib/libreadline.so >&5
     conftest.c:240:31: fatal error: readline/readline.h: No such file or directory

  b) and finds usable version there if readline was built and MACHINE is compatible with host
     (like qemux86-64 on amd64 host) and then it's passing -L/usr/lib (without sysroot prefix)
     to every build using libgnutls.la
     configure:33131: checking for readline
     configure:33156: x86_64-oe-linux-gcc    -m64 --sysroot=/OE/shr-core/tmp-eglibc/sysroots/qemux86-64 -std=gnu99 -o conftest -O2 -pipe -g -feliminate-unused-debug-types -I/OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/include -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed conftest.c  /usr/lib/libreadline.so >&5
     configure:33156: $? = 0
     configure:33173: result: yes
     configure:33185: checking how to link with libreadline
     configure:33187: result: /usr/lib/libreadline.so
     configure:33199: checking readline/readline.h usability
     configure:33199: x86_64-oe-linux-gcc    -m64 --sysroot=/OE/shr-core/tmp-eglibc/sysroots/qemux86-64 -std=gnu99 -c -O2 -pipe -g -feliminate-unused-debug-types -I/OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/include conftest.c >&5
     configure:33199: $? = 0
     configure:33199: result: yes
     configure:33199: checking readline/readline.h presence
     configure:33199: x86_64-oe-linux-gcc -E --sysroot=/OE/shr-core/tmp-eglibc/sysroots/qemux86-64    -m64 -I/OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/include conftest.c
     configure:33199: $? = 0
     configure:33199: result: yes
     configure:33199: checking for readline/readline.h
     configure:33199: result: yes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index cdcf85b..820faf6 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "GNU Transport Layer Security Library"
 HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
-DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap"
+DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap readline"
 
 INC_PR = "r3"
 
@@ -24,6 +24,7 @@ EXTRA_OECONF="--with-included-opencdk --with-included-libcfg --disable-rpath \
               --with-libgcrypt --with-libgcrypt-prefix=${STAGING_DIR_HOST}${prefix} \
               --with-libdl-prefix=${STAGING_DIR_HOST}${prefix} \
               --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
+              --with-libreadline-prefix=${STAGING_DIR_HOST}${prefix} \
               --with-lzo --disable-guile \
               --without-p11-kit \
               "
-- 
1.7.8.3



