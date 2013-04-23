Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UUgeS-0005LI-UJ for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 19:05:10 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UUgNO-0007s6-Gj
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 18:47:30 +0200
Message-ID: <1366735649.5732.21.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Apr 2013 17:47:29 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] kernel-arch: Always use ld.bfd to link the kernel
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
X-List-Received-Date: Tue, 23 Apr 2013 17:05:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The kernel's penchant for custom linker scripts means that it doesn't
generally get on very well with gold.  Make sure we are using the BFD
linker here no matter what the distro default is set to.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/kernel-arch.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-arch.bbclass
b/meta/classes/kernel-arch.bbclass
index b3b71ba..4a140eb 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -53,6 +53,6 @@ TARGET_AR_KERNEL_ARCH ?= ""
 HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 
 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH}"
-KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld ${HOST_LD_KERNEL_ARCH}"
+KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 
-- 
1.7.10.4





