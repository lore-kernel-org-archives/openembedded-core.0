Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SRq3z-0002Xz-Aj
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 21:27:11 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.wrs.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q48JHE4o029985;
	Tue, 8 May 2012 12:17:16 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  8 May 2012 15:23:14 -0400
Message-Id: <8afd5747802c4eb0e8296e440bd7366393595f8e.1336504721.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1336504721.git.bruce.ashfield@windriver.com>
References: <cover.1336504721.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1336504721.git.bruce.ashfield@windriver.com>
References: <cover.1336504721.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] kernel-yocto: export GUILT_BASE
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
X-List-Received-Date: Tue, 08 May 2012 19:27:11 -0000

One of the patch backends to linux-yocto is guilt, which normally
tracks patches under .git. But .git isn't something that can be
checked into a SCM and repeated. So it has been moved under meta/patches
and committed to the meta branch.

If devshell is used, GUILT_BASE isn't set, so patch manipulations will
fail. We export GUILT_BASE and point it at the meta directory when
devshell is invoked for linux-yocto.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index c6425b2..fb9dce1 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -290,4 +290,10 @@ do_kernel_link_vmlinux() {
 	ln -sf ../../../vmlinux
 }
 
+OE_TERMINAL_EXPORTS += "GUILT_BASE"
+python do_devshell () {
+    d.setVar("GUILT_BASE", "meta")
+    oe_terminal( d.getVar('SHELL', True), 'OpenEmbedded Developer Shell', d)
+}
+
 
-- 
1.7.0.4



