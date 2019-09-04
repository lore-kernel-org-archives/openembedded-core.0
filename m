Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C2ADA7DE37
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 01:43:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x841hM4n003586
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Sep 2019 18:43:22 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 3 Sep 2019 18:43:22 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <bruce.ashfield@gmail.com>, <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Sep 2019 18:43:22 -0700
Message-ID: <20190904014322.96351-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] kernel-devsrc: copy mmiowb.h and modpost from ${B} of kernel
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
X-List-Received-Date: Wed, 04 Sep 2019 01:43:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There are two errors when compile an out of tree kernel module
using sdk:

1. "In file included from ./include/linux/seqlock.h:36:0,
                 from ./include/linux/time.h:6,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:10,
                 from kernel-module/char.c:1:
./include/linux/spinlock.h:60:10: fatal error: asm/mmiowb.h: No such
file or directory"

mmiowb.h is generated to ${B}/arch/${ARCH}/include/generated/asm/.

And there is only generated/ under ${B}/arch/${ARCH}/include/,
so I copy whole ${B}/arch/${ARCH}/include/ to $kerneldir/build/
in case of other files under generated/ is needed in the future.

2. "/bin/sh: scripts/mod/modpost: No such file or directory"

Copy above files or directory to $kerneldir/build/ fix the errors.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 3900489..feff9f1 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -80,6 +80,12 @@ do_install() {
 
 	cp .config $kerneldir/build
 
+	if [ -d arch/${ARCH}/include ]; then
+	    cp -a --parents arch/${ARCH}/include $kerneldir/build/
+	fi
+
+	cp --parents scripts/mod/modpost $kerneldir/build/
+
 	# This scripts copy blow up QA, so for now, we require a more
 	# complex 'make scripts' to restore these, versus copying them
 	# here. Left as a reference to indicate that we know the scripts must
-- 
2.8.1


