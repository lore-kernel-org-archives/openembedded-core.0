Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SaatY-0001jI-Oy
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jun 2012 01:04:36 +0200
Received: by dalh21 with SMTP id h21so3474733dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 15:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wXyP1Lq8i+5/vYbIBQVq/wyxInE8qUdKihGalr0r1IQ=;
	b=iuJjaszIxuNkZ55fNytT8wMWFyUyOI6Ss74p9t3bML7+rOqe1pCY/Ix0T2eOJ/PbeP
	Ty4b4Sax8Ga8uLupuvPxIO08Nusq+sPpgF6br3knkB5F4rFkLbLzL+KfJzaJw/f7lZeM
	57pP8SAJCzQxyNqGYAQM+fJSCQosAtlbkjSKUcZx+8v/e7nrL5XvTCFqfIViT299Trdv
	SoknDG/J9ZKmop+uS6tjKjLWwKWdfVQ5bvBD2MEykDXxs+uUPIg1N3t1XyT7SKfSusAP
	E7NYQt+ZIA/CKTrEG8O56WEpyYhMBqil2TxJYpOaM4sDrFPhWPoA0az83ob1YNX50UQk
	pO1Q==
Received: by 10.68.203.35 with SMTP id kn3mr13664598pbc.163.1338591254604;
	Fri, 01 Jun 2012 15:54:14 -0700 (PDT)
Received: from localhost.localdomain (ip68-110-79-242.ph.ph.cox.net.
	[68.110.79.242])
	by mx.google.com with ESMTPS id vc6sm2635772pbc.6.2012.06.01.15.54.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jun 2012 15:54:13 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2012 15:53:58 -0700
Message-Id: <cc84038158ec9e94942af867b655e59176dc98ea.1338591147.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.10.3
In-Reply-To: <cover.1338591147.git.chris_larson@mentor.com>
References: <cover.1338591147.git.chris_larson@mentor.com>
In-Reply-To: <cover.1338591147.git.chris_larson@mentor.com>
References: <cover.1338591147.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] external-sourcery-toolchain: forcibly create usr/lib
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
X-List-Received-Date: Fri, 01 Jun 2012 23:04:37 -0000

From: Christopher Larson <chris_larson@mentor.com>

If the usr/lib directory doesn't exist, the toolchain can fail to even try to
find crti.o in a completely different directory. This causes a failure for the
case where baselib is lib64.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../meta/external-sourcery-toolchain.bb            |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/meta/external-sourcery-toolchain.bb b/meta/recipes-core/meta/external-sourcery-toolchain.bb
index b67410b..74c82ec 100644
--- a/meta/recipes-core/meta/external-sourcery-toolchain.bb
+++ b/meta/recipes-core/meta/external-sourcery-toolchain.bb
@@ -24,7 +24,7 @@ PROVIDES += "\
 	virtual/linux-libc-headers \
 "
 PV = "${CSL_VER_MAIN}"
-PR = "r6"
+PR = "r7"
 
 #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/${CSL_TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
 
@@ -78,6 +78,10 @@ external_toolchain_sysroot_adjust() {
 		rm -f ${SYSROOT_DESTDIR}/$dest_sysroot
 		ln -s . ${SYSROOT_DESTDIR}/$dest_sysroot
 	fi
+
+	# If the usr/lib directory doesn't exist, the toolchain fails to even
+	# try to find crti.o in a completely different directory (usr/lib64)
+	install -d ${SYSROOT_DESTDIR}/usr/lib
 }
 
 PACKAGES =+ "libgcc libgcc-dev libstdc++ libstdc++-dev libstdc++-staticdev linux-libc-headers linux-libc-headers-dev gdbserver gdbserver-dbg"
-- 
1.7.4.1



