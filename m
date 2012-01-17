Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rn6rS-0007Ia-RK
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 12:05:54 +0100
Received: by mail-ee0-f47.google.com with SMTP id d17so1792820eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 02:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Rx1ZIyxutJzwmZjHSE+sUuuwFkX1r3QFInfaLJs1FVI=;
	b=DV2UdI/o8AQh7vXkuH8uJYROYQwP/M/ldWa8k3kxHk3i16uwbD0u5zLFhZfYqKB+oR
	Jd8WbqOYiQVPoUvrq5GTCxFTO6XTUt1MttrtNHd8EZIbitjAix9JUb4JAfwkY527Dp7Z
	FhxTbduSSi9h40EwwM39cySwZ6ZytiFQh1YXo=
Received: by 10.213.13.214 with SMTP id d22mr4895962eba.148.1326797900023;
	Tue, 17 Jan 2012 02:58:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 28sm19371077eed.0.2012.01.17.02.58.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 02:58:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 11:58:04 +0100
Message-Id: <e95749ee595dd9ad32f4d2510fcd8e3f3a01a4ff.1326797712.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <3682400320558e3f7094330e4ed99683e3deec31.1326797712.git.Martin.Jansa@gmail.com>
References: <3682400320558e3f7094330e4ed99683e3deec31.1326797712.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1326797712.git.Martin.Jansa@gmail.com>
References: <cover.1326797712.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] gnutls.inc: set libz prefix
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
X-List-Received-Date: Tue, 17 Jan 2012 11:05:55 -0000

* without this patch host's zlib is used, similar to issue with
  libreadline it's important if host's zlib is compatible with MACHINE
  and in this case zlib was in DEPENDS so header was always available in
  sysroot
  lib/config.log:
  configure:18288: checking whether to include zlib compression support
  configure:18291: result: yes
  configure:18786: checking for libz
  configure:18808: x86_64-oe-linux-gcc    -m64 --sysroot=/OE/shr-core/tmp-eglibc/sysroots/qemux86-64 -o conftest -O2 -pipe -g -feliminate-unused-debug-types -I/OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/include -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed conftest.c /usr/lib/libz.so  >&5
  configure:18808: $? = 0
  configure:18818: result: yes
  configure:18825: checking how to link with libz
  configure:18827: result: /usr/lib/libz.so

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 820faf6..5991540 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap readline"
 
-INC_PR = "r3"
+INC_PR = "r4"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -25,6 +25,7 @@ EXTRA_OECONF="--with-included-opencdk --with-included-libcfg --disable-rpath \
               --with-libdl-prefix=${STAGING_DIR_HOST}${prefix} \
               --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
               --with-libreadline-prefix=${STAGING_DIR_HOST}${prefix} \
+              --with-libz-prefix=${STAGING_DIR_HOST}${prefix} \
               --with-lzo --disable-guile \
               --without-p11-kit \
               "
-- 
1.7.8.3



