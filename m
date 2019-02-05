Return-Path: <sjl@vctlabs.com>
X-Greylist: delayed 452 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Feb 2019 00:42:39 UTC
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA417C07B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 00:42:39 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 5D13F280484; Mon,  4 Feb 2019 16:39:01 -0800 (PST)
Date: Mon, 4 Feb 2019 16:39:01 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190205003901.GG21493@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-core@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH] kernel-devsrc: restore compatibility with kernel < v4.10
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
X-List-Received-Date: Tue, 05 Feb 2019 00:42:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The kernel commit that added the syscall table generation tools
for ARM platform (ARM: convert to generated system call tables)
wasn't merged until kernel release v4.10.

Current assumption in kernel-devsrc recipe is that these syscall
scripts exist, which breaks the build for external board layers that are
still using 4.9.x kernels:

  cp: cannot stat ‘arch/arm/tools/syscall*’: No such file or directory

so only try to install the scripts when they actually exist.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 361ad21..5822019 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -157,7 +157,12 @@ do_install() {
 	    # include a few files for 'make prepare'
 	    cp -a --parents arch/arm/tools/gen-mach-types $kerneldir/build/
 	    cp -a --parents arch/arm/tools/mach-types $kerneldir/build/
-	    cp -a --parents arch/arm/tools/syscall* $kerneldir/build/
+
+	    # ARM syscall table tools only exist for kernels v4.10 or later
+            SYSCALL_TOOLS=$(find arch/arm/tools -name "syscall*")
+            if [ -n "$SYSCALL_TOOLS" ] ; then
+	        cp -a --parents $SYSCALL_TOOLS $kerneldir/build/
+            fi
 
             cp -a --parents arch/arm/kernel/module.lds $kerneldir/build/
 	fi
-- 
1.9.4


