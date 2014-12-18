Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2EAB67278E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 08:53:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBI8re6C028320
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 18 Dec 2014 00:53:41 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 18 Dec 2014 00:53:40 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 16:50:57 +0800
Message-ID: <5bf74cfd004ffdc09d42a0c0bb3cf4881e0fc634.1418885577.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418885577.git.kai.kang@windriver.com>
References: <cover.1418885577.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/19] linux-yocto: depend on libgcc for aarch64
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
X-List-Received-Date: Thu, 18 Dec 2014 08:53:52 -0000
Content-Type: text/plain

Make aarch aarch64 kernel depend on libgcc.

In arch/arm64/Makefile, it adds LIBGCC to libs-y:

LIBGCC          := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
libs-y          += $(LIBGCC)

In file Makefile in top directory, libs-y is assigned to to var
KBUILD_VMLINUX_MAIN. It uses script link-vmlinux.sh to link vmlinux.o,
and when execute function vmlinux_link() in link-vmlinux.sh,
KBUILD_VMLINUX_MAIN is passed to ${LD}.

If build without libgcc, the value of LIBGCC is just libgcc.a without
parent directory. linux-yocto fails to build:

|   LD      vmlinux.o
| aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or directory

Add libgcc to aarch64 kernel dependency.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4ed3188..9018985 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 INC_PR = "r4"
 
 DEPENDS += "xz-native bc-native"
+DEPENDS_append_aarch64 = " libgcc"
 
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
-- 
1.9.1


