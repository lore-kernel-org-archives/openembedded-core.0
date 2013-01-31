Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1U0z9x-0000YQ-3U
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 19:46:55 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0VIV6YA024375;
	Thu, 31 Jan 2013 10:31:07 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 31 Jan 2013 13:31:03 -0500
Message-Id: <ce0860320d544f2e8c4833ff07712b24d5cc9570.1359656303.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359656303.git.bruce.ashfield@windriver.com>
References: <cover.1359656303.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1359656303.git.bruce.ashfield@windriver.com>
References: <cover.1359656303.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] kernel: avoid copying unnecessary files during do_install
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
X-List-Received-Date: Thu, 31 Jan 2013 18:47:03 -0000

From: Mark Asselstine <mark.asselstine@windriver.com>

kernel_do_install() populates $kerneldir with files needed to build
external modules. To accomplish this there are several copy commands
to get source from the kernel source tree and build trees after which
a 'clean' is performed. Since we are copying from the build tree we
get about 1G of .o and .cmd files copied over only to have them
removed when we clean. This adds additional IO overhead as well as
overhead caused by pseudo. By avoiding copying these files in the
first place we get multiple gains:
  * avoid initial copy
  * avoid file deletes during clean
  * reduce pseudo overhead

Additionally we are making use of cpio vs cp which tends to be
significantly faster at performing copies.

With these changes I observe a 15-30% decrease in the time to complete
the do_install() operation on the kernel.

[YOCTO #3517]

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e2a582b..cc61be6 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -143,10 +143,13 @@ kernel_do_install() {
 	# work and sysroots can be on different partitions, so we can't rely on
 	# hardlinking, unfortunately.
 	#
-	cp -fR * $kerneldir
+	find . -depth -not -name "*.cmd" -not -name "*.o" -not -path "./.*" -print0 | cpio --null -pdu $kerneldir
 	cp .config $kerneldir
 	if [ "${S}" != "${B}" ]; then
-		cp -fR ${S}/* $kerneldir
+		pwd="$PWD"
+		cd "${S}"
+		find . -depth -not -path "./.*" -print0 | cpio --null -pdu $kerneldir
+		cd "$pwd"
 	fi
 	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
 	install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
-- 
1.7.10.4



