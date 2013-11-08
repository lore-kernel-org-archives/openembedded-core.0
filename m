Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8CA6D2F5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 15:17:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA8FHFUU024921; Fri, 8 Nov 2013 15:17:15 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CiVZr4COJijm; Fri,  8 Nov 2013 15:17:15 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA8FHBRX024918
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 8 Nov 2013 15:17:13 GMT
Message-ID: <1383923827.2345.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 08 Nov 2013 15:17:07 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: [PATCH] kernel: Use hardlinks during do_install for speed
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
X-List-Received-Date: Fri, 08 Nov 2013 15:17:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Whilst the comment says we can't do this, its incorrect, install operates
on WORKDIR and its hard for different parts of WORKDIR to be on different
filesystems. Hardlinking instead of copying is therefore a nice performance
gain.

Also, completely skip the Documentation directory (adding a dummy Makefile
to keep make happy) and tweak the other cp commands to link since if we
don't we'd get "this is the same file" type errors from cp for some kernel
versions.

For do_install on linux-yocto, this takes it from 227s -> 84s.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a4db9f5..0b6360f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -236,20 +236,21 @@ kernel_do_install() {
 	# dir. This ensures the original Makefiles are used and not the
 	# redirecting Makefiles in the build directory.
 	#
-	# work and sysroots can be on different partitions, so we can't rely on
-	# hardlinking, unfortunately.
-	#
-	find . -depth -not -name "*.cmd" -not -name "*.o" -not -path "./.*" -print0 | cpio --null -pdu $kerneldir
+	find . -depth -not -name "*.cmd" -not -name "*.o" -not -path "./Documentation*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
 	cp .config $kerneldir
 	if [ "${S}" != "${B}" ]; then
 		pwd="$PWD"
 		cd "${S}"
-		find . -depth -not -path "./.*" -print0 | cpio --null -pdu $kerneldir
+		find . -depth -not -path "./Documentation*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
 		cd "$pwd"
 	fi
 	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
 	install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
 
+	# Dummy Makefile so the clean below works
+        mkdir $kerneldir/Documentation
+        touch $kerneldir/Documentation/Makefile
+
 	#
 	# Clean and remove files not needed for building modules.
 	# Some distributions go through a lot more trouble to strip out
@@ -262,22 +263,21 @@ kernel_do_install() {
 	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
 	make -C $kerneldir _mrproper_scripts
 	find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
-	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
 
 	# As of Linux kernel version 3.0.1, the clean target removes
 	# arch/powerpc/lib/crtsavres.o which is present in
 	# KBUILD_LDFLAGS_MODULE, making it required to build external modules.
 	if [ ${ARCH} = "powerpc" ]; then
-		cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
+		cp -nl arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
 	fi
 
 	# Necessary for building modules like compat-wireless.
 	if [ -f include/generated/bounds.h ]; then
-		cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
+		cp -nl include/generated/bounds.h $kerneldir/include/generated/bounds.h
 	fi
 	if [ -d arch/${ARCH}/include/generated ]; then
 		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
-		cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
+		cp -fnlR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
 	fi
 
 	# Remove the following binaries which cause strip or arch QA errors



