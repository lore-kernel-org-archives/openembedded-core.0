Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UWovm-0001pb-44 for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 16:20:25 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UWoeZ-0001Gd-6Z
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 16:02:03 +0200
Message-ID: <1367244122.14512.124.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 29 Apr 2013 15:02:02 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] kernel.bbclass: Don't include source files for "other" architectures in the sysroot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Apr 2013 14:21:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since the sysroot is per-machine, we can be fairly confident that any
out-of-tree modules which look at our sources will be building for the
same architecture that we are.  This being the case there's no need to
ship the sources for any other architectures, which saves disk space and
time (about 30 seconds in do_package, in a somewhat unscientific test
with ARCH=mips).

Of course, an even better fix would be to not install these files in the
first place, but deleting them is easier.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/kernel.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 00e27ef..ffb0b11 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -167,6 +167,7 @@ kernel_do_install() {
 	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
 	make -C $kerneldir _mrproper_scripts
 	find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
+	rm -rf $(find $kerneldir/arch -maxdepth 1 -not -path $kerneldir/arch/$ARCH -not -path $kerneldir/arch/Kconfig -not -path $kerneldir/arch/. -not -path $kerneldir/arch)
 	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
 
 	# As of Linux kernel version 3.0.1, the clean target removes
-- 
1.7.10.4





