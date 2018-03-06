Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5274A78ABF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 18:11:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w26IBSfg012059
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Mar 2018 10:11:28 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Mar 2018 10:10:55 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Mar 2018 13:11:17 -0500
Message-ID: <ec429c69e513354601aced943560b99c72058dd8.1520359364.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1520359364.git.bruce.ashfield@windriver.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] kernel: make copying of crtsavres.o conditional
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
X-List-Received-Date: Tue, 06 Mar 2018 18:11:28 -0000
Content-Type: text/plain

As of the 4.13 kernel, there are configuration + linker combinations
that do not need (or build) crtsavres.o for ppc64 targets. The commit
of interest is:

    commit efe0160cfd40a99c052a00e174787c1f4158a9cd
    Author: Nicholas Piggin <npiggin@gmail.com>
    Date:   Fri May 12 01:56:52 2017 +1000

        powerpc/64: Linker on-demand sfpr functions for modules

        For final link, the powerpc64 linker generates fpr save/restore
        functions on-demand, placing them in the .sfpr section. Starting with
        binutils 2.25, these can be provided for non-final links with
        --save-restore-funcs. Use that where possible for module links.

        This saves about 200 bytes per module (~60kB) on powernv defconfig
        build.

        Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
        Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

As such, our arch test for crtsavres.o is not enough, we add a secondary
existence check before trying the copy.

[YOCTO #12576]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 321c0a47bb2e..9bc0e4125124 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -466,8 +466,10 @@ do_shared_workdir () {
 	# arch/powerpc/lib/crtsavres.o which is present in
 	# KBUILD_LDFLAGS_MODULE, making it required to build external modules.
 	if [ ${ARCH} = "powerpc" ]; then
-		mkdir -p $kerneldir/arch/powerpc/lib/
-		cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
+		if [ -e arch/powerpc/lib/crtsavres.o ]; then
+			mkdir -p $kerneldir/arch/powerpc/lib/
+			cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
+		fi
 	fi
 
 	if [ -d include/generated ]; then
-- 
2.5.0


