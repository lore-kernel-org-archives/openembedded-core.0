Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2BAB6729D9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 12:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBLCSdK8001302 for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 12:28:39 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6z0gD-zJLlUd
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 12:28:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBLCSQH8001299
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 12:28:38 GMT
Message-ID: <1419164943.13316.51.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Dec 2014 12:29:03 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] kernel-devsrc: Handle ppc crtsaves.o explictly for now
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
X-List-Received-Date: Sun, 21 Dec 2014 12:29:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Resolve kernel module build failures for qemuppc by including crtsaves.o.

I'm not particularly happy to be doing this, it should perhaps be contained 
in the kernel-dev package. Until the overlap between kernel-devsrc and 
kernel-dev is resolved, this at least removed the regressions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 2872f17..1557c27 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -46,6 +46,14 @@ do_install() {
         cd ${S}
         find . -type d -name '.git*' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
         oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean _mrproper_scripts
+
+        # As of Linux kernel version 3.0.1, the clean target removes
+        # arch/powerpc/lib/crtsavres.o which is present in
+        # KBUILD_LDFLAGS_MODULE, making it required to build external modules.
+        if [ ${ARCH} = "powerpc" ]; then
+                mkdir -p $kerneldir/arch/powerpc/lib/
+                cp ${S}/arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
+        fi
 }
 
 PACKAGES = "kernel-devsrc"



