Return-Path: <net147@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id EB514606AC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2013 09:52:49 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id bi5so1954994pad.22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2013 02:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NWHt1vDvo3GAac2bwm4ZLz3F9IN7QXpujtkuEvMo+0g=;
	b=zULJx1CaOp/3ufjBMWTatoqcZUuTGLdz52nA1kbGzMoEEuW42Df20XLZM1cHY8Xryl
	PA+kpMdlxtJU8/5x9V4llRpKSqmuk2Lw/81izmg+J5a8CwBO4zVMiwF1LSucFyAfJx1i
	ZzUmmHEvYOxULku47dWC40AfN1hKkVwo0GWSMVjb3amHVlcd7eezB6ASOxh+RTD1Ejj/
	YXL1u+CxSiWXUkz/rZZE9o7FLpiUKfkDtAPbfSSfeOgc5XwM7QBxcL8Zd6N8Z9HOtq0R
	245r/5wL1gtqqAsJCxkovt0ET/qDsmPsK8IQ5R9+Zwon6ep7KvrX39oReEoo39b7Bngd
	D23Q==
X-Received: by 10.66.240.2 with SMTP id vw2mr26960367pac.137.1374400370435;
	Sun, 21 Jul 2013 02:52:50 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id r7sm9364510pao.18.2013.07.21.02.52.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 21 Jul 2013 02:52:49 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2013 20:07:42 +1000
Message-Id: <1374401262-6077-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] gcc-4.8: fix compiling GCC when /usr/lib/libstdc++.so is present
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
X-List-Received-Date: Sun, 21 Jul 2013 09:52:50 -0000

libtool is picking up libstdc++.so from /usr/lib when trying to link
libasan due to libstdc++.la containing libdir="/usr/lib". If compiling
for x86 and the host has 64-bit /usr/lib/libstdc++.so, the compilation
fails linking libasan with:
/usr/lib/libstdc++.so: could not read symbols: File in wrong format

To resolve this, patch libtool to look for the library in the path the
.la is contained in rather than use the libdir which usually points to
a host path.

[YOCTO #4879]

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc                 |  1 +
 .../gcc/gcc-4.8/0041-libtool-avoid-libdir.patch       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0041-libtool-avoid-libdir.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index dafa241..42355f2 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -70,6 +70,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0038-gcc-4.8-build-args.patch \
 	   file://0039-gcc-4.8-PR57717.patch \
 	   file://0040-fix-g++-sysroot.patch \
+	   file://0041-libtool-avoid-libdir.patch \
 	  "
 SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
 SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0041-libtool-avoid-libdir.patch b/meta/recipes-devtools/gcc/gcc-4.8/0041-libtool-avoid-libdir.patch
new file mode 100644
index 0000000..2dd9610
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0041-libtool-avoid-libdir.patch
@@ -0,0 +1,19 @@
+Avoid using libdir from .la which usually points to a host path
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+diff --git a/ltmain.sh b/ltmain.sh
+index a03433f..1902a90 100644
+--- a/ltmain.sh
++++ b/ltmain.sh
+@@ -5628,6 +5628,9 @@ func_mode_link ()
+ 	    absdir="$abs_ladir"
+ 	    libdir="$abs_ladir"
+ 	  else
++	    # Instead of using libdir from .la which usually points to a host path,
++	    # use the path the .la is contained in.
++	    libdir="$abs_ladir"
+ 	    dir="$libdir"
+ 	    absdir="$libdir"
+ 	  fi
-- 
1.8.3.2


