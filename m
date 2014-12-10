Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 692B87253A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:34:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBAAYEcM024240
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 02:34:14 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.20.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 02:34:13 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 05:34:03 -0500
Message-ID: <0247524f2f7ae076fdac8773c3baa0794e5697dd.1418207154.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418207154.git.bruce.ashfield@windriver.com>
References: <cover.1418207154.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] kernel: fix out of tree module builds
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
X-List-Received-Date: Wed, 10 Dec 2014 10:34:16 -0000
Content-Type: text/plain

With the kernel build optimizations, we no longer copy the source from
the built kernel into the staging dir, since the kernel is unpacked and built
directly from the staging dir.

This means that a few build artifacts need to be restored to allow out of
tree modules to once again build.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 0d335a589121..348041449cb0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -223,6 +223,28 @@ kernel_do_install() {
 	#
 
 	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
+	
+	# Copy files required for module builds
+	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
+	cp Module.symvers $kerneldir/
+	cp .config $kerneldir/
+	mkdir -p $kerneldir/include/config
+	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+
+	# As of Linux kernel version 3.0.1, the clean target removes
+	# arch/powerpc/lib/crtsavres.o which is present in
+	# KBUILD_LDFLAGS_MODULE, making it required to build external modules.
+	if [ ${ARCH} = "powerpc" ]; then
+		cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
+	fi
+
+	mkdir -p $kerneldir/include/generated/
+	cp -fR include/generated/* $kerneldir/include/generated/
+
+	if [ -d arch/${ARCH}/include/generated ]; then
+		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
+		cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
+	fi
 }
 do_install[prefuncs] += "package_get_auto_pr"
 
-- 
2.1.0


