Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E09076AC00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 01:16:24 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 128so13769922pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 18:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=E3BSXeIn/YuGiR+/e3Y1txis1fmIakTjhDDXowgsofk=;
	b=YCI2BLrDK+mnc86b0gghboIN2w7ImFTQLl8SOESGcKf5761bbQS+jGLM9wi2cyaVTo
	cwOG1uKDhTjOlCqgQtxQz2GCodU8wVRw8hGtjcQW6qbL3bBpZMXpkL9veGJQFvJMdBOn
	o4Y1VqHZRPjTowJKD6nBow3uUWm/cdbTzVAMmEoLV6lCCNAZQdiW3Nkoo07/5UPNechP
	kDsceJtORbQAGAqZpdynHpI+ySp1IGKRo1QJIKGnxn4uNpfjuTTN9p9+gISNEgTPiXqV
	x3Q9ZaPmcdGkgSCUNp8dVByDaxMrG8Jc07YGHgqa7k7xPCoK/9PKkEEineSbJXnpv01U
	bmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E3BSXeIn/YuGiR+/e3Y1txis1fmIakTjhDDXowgsofk=;
	b=ffEIrhx5EySLnNwpyLnxbD8Qgp7ts2EpU4XXmUV6ln9lq1WcvefAP/cRlbkYCIaBhq
	GGKuU9EZa+i21uHzt/0kchWWbSZ6z1JUSw/SxpyWiWChyjJ1K47GyocmXu/nrpOplWD1
	pHWxUekbPI0XPj9O8Ud0uLa0Gxa2dUCrKSJXVAdMWPUaWnu40FPxSWZtkVvKK/iwCoeM
	eY+IhpOHE9Mbu3MKAyFqOoN5cTrMHuVEbjlMYqOpRnFiOclevxvsCVysySqhdzyFe+Ag
	NXMDNbEaFfFOcdwYohx1AuQ1dRVCL8KMcPZ2aw0OwTSJC0AZtQZabmapdmr3HUqyjKKY
	93VQ==
X-Gm-Message-State: AA6/9RlJly7BWYSKJu55XaDywvh15Ba2p0mq9W2nqf/WSyKB73Qm7wr4J2YyFseYNAcGdg==
X-Received: by 10.99.115.21 with SMTP id o21mr416367pgc.176.1476753385994;
	Mon, 17 Oct 2016 18:16:25 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	w15sm50785931pfi.47.2016.10.17.18.16.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Oct 2016 18:16:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 18:16:19 -0700
Message-Id: <20161018011619.31677-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
Subject: [PATCH] gnutls_3.5.3.bb: Fix native build on distro with kernel < 3.4.17
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
X-List-Received-Date: Tue, 18 Oct 2016 01:16:25 -0000

When using distros which use old kernels gnutls fails to build
due to missing SYS_getrandom, therefore we need to check for this
before using it.
Fixes errorr e.g.

| ../../../gnutls-3.5.3/lib/nettle/rnd-linux.c: In function 'have_getrandom':
| ../../../gnutls-3.5.3/lib/nettle/rnd-linux.c:59:42: error: 'SYS_getrandom' undeclared (first use in this function)
|  #  define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*)dst, (size_t)s, (unsigned int)flags)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnutls/gnutls/check_SYS_getrandom.patch        | 35 ++++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.5.3.bb        |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch

diff --git a/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch b/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch
new file mode 100644
index 0000000..535c22a
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch
@@ -0,0 +1,35 @@
+From f26c3979ab0325edb2e410d287bc501cf00e0ac0 Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@redhat.com>
+Date: Mon, 22 Aug 2016 16:32:34 +0200
+Subject: [PATCH] rnd-linux: added check for SYS_getrandom being defined
+
+This allows to compile the getrandom() code in old Linux systems
+which do not have the system call defined.
+---
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ lib/nettle/rnd-linux.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/nettle/rnd-linux.c b/lib/nettle/rnd-linux.c
+index d7f07a6..7a24d05 100644
+--- a/lib/nettle/rnd-linux.c
++++ b/lib/nettle/rnd-linux.c
+@@ -56,7 +56,11 @@ static dev_t _gnutls_urandom_fd_rdev = 0;
+ # else
+ #  include <sys/syscall.h>
+ #  undef getrandom
+-#  define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*)dst, (size_t)s, (unsigned int)flags)
++#  if defined(SYS_getrandom)
++#   define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*)dst, (size_t)s, (unsigned int)flags)
++#  else
++#   define getrandom(dst,s,flags) -1
++#  endif
+ # endif
+ 
+ static unsigned have_getrandom(void)
+--
+libgit2 0.24.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.5.3.bb b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
index b2dbb07..0400588 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.3.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://0001-configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
             file://0001-Use-correct-include-dir-with-minitasn.patch \
+            file://check_SYS_getrandom.patch \
             file://CVE-2016-7444.patch \
            "
 SRC_URI[md5sum] = "6c2c7f40ddf52933ee3ca474cb8cb63c"
-- 
2.10.0


