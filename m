Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.224])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1SgRxY-0001F4-CE
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 04:44:56 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvwEALOR3k/LO4Se/2dsb2JhbABEtViBB4MYKIEpiAq3So5XgxsDiECSWooHgm0
X-IronPort-AV: E=Sophos;i="4.75,789,1330876800"; 
   d="scan'208";a="5485621"
Received: from unknown (HELO gentoo_vm.DMA.local) ([203.59.132.158])
	by icp-osb-irony-out7.iinet.net.au with ESMTP;
	18 Jun 2012 10:31:07 +0800
From: James Limbouris <james@digitalmatter.com.au>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2012 10:33:33 +0800
Message-Id: <1339986813-17890-1-git-send-email-james@digitalmatter.com.au>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] debian.bbclass: invoke target objdump
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
X-List-Received-Date: Mon, 18 Jun 2012 02:44:56 -0000

Using the host objdump can lead to errors like:

objdump: library.so.1.0.0: File format is ambiguous
objdump: Matching formats: elf32-littlearm elf32-littlearm-symbian elf32-littlearm-vxworks

with certain configurations of binutils.

Signed-off-by: James Limbouris <james@digitalmatter.com.au>
---
 meta/classes/debian.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 3637e2e..bb4ae11 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -60,7 +60,7 @@ python debian_package_name_hook () {
 				for f in files:
 					if so_re.match(f):
 						fp = os.path.join(root, f)
-						cmd = (d.getVar('BUILD_PREFIX', True) or "") + "objdump -p " + fp + " 2>/dev/null"
+						cmd = (d.getVar('TARGET_PREFIX', True) or "") + "objdump -p " + fp + " 2>/dev/null"
 						fd = os.popen(cmd)
 						lines = fd.readlines()
 						fd.close()
-- 
1.7.3.4



