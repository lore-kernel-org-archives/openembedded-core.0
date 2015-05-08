Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC5E473F84
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 03:36:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t483aJ4r028686
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 May 2015 20:36:19 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 7 May 2015 20:36:19 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 7 May 2015 23:36:15 -0400
Message-ID: <c8a626c32fe55cc9478e5ada3b20f0e402a1b557.1431055930.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431055930.git.bruce.ashfield@windriver.com>
References: <cover.1431055930.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] kernel-yocto: propagate in tree defconfigs to WORKDIR
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
X-List-Received-Date: Fri, 08 May 2015 03:36:20 -0000
Content-Type: text/plain

As reported by Steffen Pankratz <Steffen.Pankratz@elektrobit.com>, the
previous logic of KBUILD_DEFCONFIG processing would not propagate an in
tree defcofig to WORKDIR if one was not already present.

We fix the propagation by copying the in tee config if a defconfig is
not already in WORKDIR.

Additionally we only warn (versus copying) if an in tree configuration
is specified, is different than the WORKDIR version and isn't copied.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 0dd5b4851361..88588d7cacc9 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -97,14 +97,15 @@ do_kernel_metadata() {
 	if [ -n "${KBUILD_DEFCONFIG}" ]; then
 		if [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
 			if [ -f "${WORKDIR}/defconfig" ]; then
-				# If the two defconfigs are the same, leave the existing one in place
+				# If the two defconfig's are different, warn that we didn't overwrite the
+				# one already placed in WORKDIR by the fetcher.
 				cmp "${WORKDIR}/defconfig" "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}"
 				if [ $? -ne 0 ]; then
-					bbnote "defconfig detected in WORKDIR. ${KBUILD_DEFCONFIG} skipped"
-				else
-					cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
-					sccs="${WORKDIR}/defconfig"
+					bbwarn "defconfig detected in WORKDIR. ${KBUILD_DEFCONFIG} skipped"
 				fi
+			else
+				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
+				sccs="${WORKDIR}/defconfig"
 			fi
 		else
 			bbfatal "A KBUILD_DECONFIG '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree"
-- 
2.1.0


