Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QkRZW-0008BP-EM
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jul 2011 04:04:06 +0200
Received: by pzk1 with SMTP id 1so4594662pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 18:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=coKC7MbNWcwGKjIm8SS6DMzTvySzNaWrVhFuRBSzKwg=;
	b=gGMaMIyEJc6thBcQ1N2LC4rpLk/7TpkW/F3aOJ/1js23nFCikWOh9yTA7b/XFHrkZG
	iILciG/+DZkXqTCIsVH/uPPUgaD9/hvhFmkk/3V/E9uxeoFnpvj90mqeHA5ji8b3cAws
	p/IOGe9x2DHM/oXe3QxPcJaGyRAEIEqFfGsUk=
Received: by 10.68.44.34 with SMTP id b2mr3391659pbm.85.1311386396131;
	Fri, 22 Jul 2011 18:59:56 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d3sm2255957pbh.37.2011.07.22.18.59.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jul 2011 18:59:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 18:59:48 -0700
Message-Id: <1311386389-9819-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 1/2] siteinfo: Rework the siteinfo for powerpc to fix uclibc fallout
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
X-List-Received-Date: Sat, 23 Jul 2011 02:04:06 -0000

I believe that powerpc-linux is now a common file across 32bit/64bit
linux for powerpc be it uclibc or glibc. I compared the differences
between powerpc-linux-uclibc and powerpc-linux files and it
powerpc-linux was more uptodate and all the new stuff it had was needed
for uclibc anyway so we do not need to keep exact copy of powerpc-linux
as powerpc-linux-uclibc instead we use powerpc-linux for powerpc/uclibc
targets.

Secondly linux specific files were added in archinfo dictionary
which I think logically belongs to targetinfo dictionary therefore
moved them to targetinfo

now uclibc/powerpc is buildable again

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/siteinfo.bbclass  |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)
 delete mode 100644 meta/site/powerpc-linux-uclibc

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index c5308b3..056c519 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -33,11 +33,11 @@ def siteinfo_data(d):
         "mips64": "endian-big bit-64 mips64-common",
         "mips64el": "endian-little bit-64 mips64-common",
         "mipsel": "endian-little bit-32 mips-common",
-        "powerpc": "endian-big bit-32 powerpc-common powerpc32-linux",
+        "powerpc": "endian-big bit-32 powerpc-common",
         "nios2": "endian-little bit-32 nios2-common",
-        "powerpc64": "endian-big bit-64 powerpc-common powerpc-linux powerpc64-linux",
-        "ppc": "endian-big bit-32 powerpc-common powerpc32-linux",
-        "ppc64": "endian-big bit-64 powerpc-common powerpc-linux powerpc64-linux",
+        "powerpc64": "endian-big bit-64 powerpc-common",
+        "ppc": "endian-big bit-32 powerpc-common",
+        "ppc64": "endian-big bit-64 powerpc-common",
         "sh3": "endian-little bit-32 sh-common",
         "sh4": "endian-little bit-32 sh-common",
         "sparc": "endian-big bit-32",
@@ -62,8 +62,12 @@ def siteinfo_data(d):
         "arm-linux-uclibceabi": "arm-linux-uclibc",
         "armeb-linux-gnueabi": "armeb-linux",
         "armeb-linux-uclibceabi": "armeb-linux-uclibc",
-        "powerpc-linux-gnuspe": "powerpc-linux",
-        "powerpc-linux-uclibcspe": "powerpc-linux-uclibc",
+        "powerpc-linux": "powerpc32-linux",
+        "powerpc-linux-uclibc": "powerpc-linux powerpc32-linux",
+        "powerpc-linux-gnuspe": "powerpc-linux powerpc32-linux",
+        "powerpc-linux-uclibcspe": "powerpc-linux powerpc32-linux powerpc-linux-uclibc",
+        "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux",
+        "powerpc64-linux": "powerpc-linux",
     }
 
     hostarch = d.getVar("HOST_ARCH", True)
diff --git a/meta/site/powerpc-linux-uclibc b/meta/site/powerpc-linux-uclibc
deleted file mode 100644
index e69de29..0000000
-- 
1.7.4.1



