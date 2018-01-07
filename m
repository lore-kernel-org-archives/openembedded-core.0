Return-Path: <marex@denx.de>
X-Greylist: delayed 527 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 07 Jan 2018 16:28:15 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id EA42F77FC9
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 16:28:15 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3zF3Wk3Wbtz1qsT8;
	Sun,  7 Jan 2018 17:19:30 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3zF3Wk3LHkz1qqkJ;
	Sun,  7 Jan 2018 17:19:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id m1XzldDDSeq2; Sun,  7 Jan 2018 17:19:29 +0100 (CET)
X-Auth-Info: fj95381edU06h62ZD/qU7MVlozwOXZZAkdyDJ3JEuJo=
Received: from kurokawa.lan (ip-86-49-107-50.net.upcbroadband.cz
	[86.49.107.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun,  7 Jan 2018 17:19:29 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Jan 2018 17:19:20 +0100
Message-Id: <20180107161920.30937-2-marex@denx.de>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180107161920.30937-1-marex@denx.de>
References: <20180107161920.30937-1-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 2/2] kernel: Add optional patch_xenomai task
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
X-List-Received-Date: Sun, 07 Jan 2018 16:28:16 -0000

Add additional task, do_patch_xenomai, inserted between do_patch and
do_configure tasks. This task applies the cobalt patch to the kernel
sources for a specific machine. This is disabled by default, so use
PACKAGECONFIG[xenomai] of the kernel package to enable the patching.

You will also need a kernel recipe for a kernel version with ipipe
patch applied.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f7b612f84f..70fc39086c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -481,6 +481,22 @@ do_shared_workdir () {
 	fi
 }
 
+PACKAGECONFIG[xenomai] = ",,"
+
+do_patch_xenomai[depends] += "${@bb.utils.contains('PACKAGECONFIG', 'xenomai', 'xenomai:do_patch', '', d)}"
+do_patch_xenomai() {
+	set +e
+	cd ${S}
+
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xenomai', 'yes', 'no', d)}" = "yes" ]; then
+		${TMPDIR}/work-shared/${MACHINE}/xenomai-source/scripts/prepare-kernel.sh \
+			--arch=${TARGET_ARCH} \
+			--linux=${STAGING_KERNEL_DIR} ;
+	fi
+}
+
+addtask patch_xenomai before do_configure after do_patch
+
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
 sysroot_stage_all () {
 	:
-- 
2.11.0


