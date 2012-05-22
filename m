Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SWut3-0001jc-BK
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 21:36:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4MJQimT017892
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 12:26:44 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 22 May 2012 12:26:43 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 May 2012 14:30:14 -0500
Message-ID: <6777566927feaf706578c180ceea1181807bf0ac.1337714416.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1337714416.git.mark.hatle@windriver.com>
References: <cover.1337714416.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 20/30] util-linux: use new update-alternatives
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
X-List-Received-Date: Tue, 22 May 2012 19:36:53 -0000
Content-Type: text/plain

In addition to switching to the new update-alternatives, it was discovered
that the sln, shutdown, halt, reboot and related commands were never generated.
Remove these from the list.  (These appear to have been removed from util-linux
some time ago.)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc       |  212 +++++----------------
 meta/recipes-core/util-linux/util-linux_2.21.1.bb |    2 +-
 2 files changed, 45 insertions(+), 169 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 024b55c..688a5be 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -43,15 +43,15 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
 FILES_util-linux-agetty = "${base_sbindir}/agetty"
-FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${PN}"
+FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${BPN}"
 FILES_util-linux-cfdisk = "${base_sbindir}/cfdisk"
 FILES_util-linux-sfdisk = "${sbindir}/sfdisk"
-FILES_util-linux-swaponoff = "${base_sbindir}/swapon.${PN} ${sbindir}/swapoff.${PN}"
-FILES_util-linux-losetup = "${base_sbindir}/losetup.${PN}"
-FILES_util-linux-mount = "${base_bindir}/mount.${PN}"
+FILES_util-linux-swaponoff = "${base_sbindir}/swapon.${BPN} ${sbindir}/swapoff.${BPN}"
+FILES_util-linux-losetup = "${base_sbindir}/losetup.${BPN}"
+FILES_util-linux-mount = "${base_bindir}/mount.${BPN}"
 FILES_util-linux-mcookie = "${bindir}/mcookie"
-FILES_util-linux-umount = "${base_bindir}/umount.${PN}"
-FILES_util-linux-readprofile = "${base_sbindir}/readprofile.${PN}"
+FILES_util-linux-umount = "${base_bindir}/umount.${BPN}"
+FILES_util-linux-readprofile = "${base_sbindir}/readprofile.${BPN}"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 
 FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
@@ -85,29 +85,6 @@ do_compile () {
 	oe_runmake ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}' 
 }
 
-checklink() {
-	local targ link value
-	targ="$1"
-	link="$2"
-	ext="$3"
-	if test -h "$link"
-	then
-		value="$(readlink "$link")"
-		if test "$value" = "$targ"
-		then
-			rm "$link"
-			ln -s "$targ"."${PN}" "$link$ext"
-			return 0
-		else
-			echo "$link: '$value' found '$targ' expected" >&2
-			return 1
-		fi
-	else
-		echo "$link: not a symbolic link" >&2
-		return 1
-	fi
-}
-
 do_install () {
 	# with ccache the timestamps on compiled files may
 	# end up earlier than on their inputs, this allows
@@ -119,7 +96,7 @@ do_install () {
 	mkdir -p ${D}${base_bindir}
 
         sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
-        sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix fsck.minix losetup swapon fdisk readprofile fsck blkid sln blockdev"
+        sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon fdisk readprofile fsck blkid blockdev"
         usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice wall setsid chrt flock"
         binprogs_a="dmesg kill more umount mount login reset"
 
@@ -141,161 +118,60 @@ do_install () {
                 done
         fi
 
-        for p in $usrbinprogs_a; do
-                if [ -f "${D}${bindir}/$p" ]; then
-                        mv "${D}${bindir}/$p" "${D}${bindir}/$p.${PN}"
-                fi
-        done
-
-        for p in $binprogs_a; do
-                if [ -f "${D}${base_bindir}/$p" ]; then
-                        mv "${D}${base_bindir}/$p" "${D}${base_bindir}/$p.${PN}"
-                fi
-        done
-
-        for p in $sbinprogs_a; do
-                if [ -f "${D}${base_sbindir}/$p" ]; then
-                        mv "${D}${base_sbindir}/$p" "${D}${base_sbindir}/$p.${PN}"
-                fi
-        done
-	
 	install -d ${D}${sysconfdir}/default/
 	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall
 
-	# note ${PN} in swapon.${PN}, swapon is an alternative link that is
-	# not guaranteed to provide multiple functions, similar for shutdown
-	ln -sf swapon.${PN} ${D}${base_sbindir}/swapoff.${PN}
-	ln -sf shutdown.${PN} ${D}${base_sbindir}/reboot.${PN}
-	ln -sf shutdown.${PN} ${D}${base_sbindir}/halt.${PN}
-	ln -sf shutdown.${PN} ${D}${base_sbindir}/fastboot
-	ln -sf shutdown.${PN} ${D}${base_sbindir}/fasthalt
-
-	rm -f ${D}${sbindir}/halt
-	rm -f ${D}${sbindir}/reboot
-	rm -f ${D}${sbindir}/fastboot
-	rm -f ${D}${sbindir}/fasthalt
+	ln -sf swapon   ${D}${base_sbindir}/swapoff
 	rm -f ${D}${sbindir}/swapoff
 }
 
-pkg_postinst_${PN} () {
-	update-alternatives --install ${base_bindir}/dmesg dmesg dmesg.${PN} 100
-	update-alternatives --install ${base_bindir}/kill kill kill.${PN} 100
-	update-alternatives --install ${base_bindir}/more more more.${PN} 100
-	update-alternatives --install ${base_sbindir}/mkswap mkswap mkswap.${PN} 100
-	update-alternatives --install ${base_sbindir}/blockdev blockdev blockdev.${PN} 100
-	test -x ${base_sbindir}/pivot_root.${PN} && \
-	update-alternatives --install ${base_sbindir}/pivot_root pivot_root pivot_root.${PN} 100
-#	update-alternatives --install ${base_sbindir}/sln sln sln.${PN} 100
-	update-alternatives --install ${base_sbindir}/mkfs.minix mkfs.minix mkfs.minix.${PN} 100
-	update-alternatives --install ${bindir}/hexdump hexdump hexdump.${PN} 100
-	update-alternatives --install ${bindir}/last last last.${PN} 100
-	update-alternatives --install ${bindir}/logger logger logger.${PN} 100
-	update-alternatives --install ${bindir}/mesg mesg mesg.${PN} 100
-	update-alternatives --install ${bindir}/renice renice renice.${PN} 100
-	update-alternatives --install ${bindir}/wall wall wall.${PN} 100
-	update-alternatives --install ${bindir}/setsid setsid setsid.${PN} 100
-	update-alternatives --install ${bindir}/chrt chrt chrt.${PN} 100
-	update-alternatives --install ${bindir}/flock flock flock.${PN} 100
-	
-	# There seems to be problem, atleast on nslu2, with these, untill they are
-	# fixed the busybox ones have higher priority
-	update-alternatives --install ${base_sbindir}/hwclock hwclock hwclock.${PN} 10
-	update-alternatives --install ${base_sbindir}/shutdown shutdown shutdown.${PN} 10
-	update-alternatives --install ${base_sbindir}/reboot reboot reboot.${PN} 10
-	update-alternatives --install ${base_sbindir}/halt halt halt.${PN} 10
-}
+inherit update-alternatives
 
-pkg_prerm_${PN} () {
-	test -x ${base_sbindir}/pivot_root.${PN} && \
-	update-alternatives --remove pivot_root pivot_root.${PN}
-	update-alternatives --remove dmesg dmesg.${PN}
-	update-alternatives --remove kill kill.${PN}
-	update-alternatives --remove more more.${PN}
-	update-alternatives --remove halt halt.${PN}
-	update-alternatives --remove hwclock hwclock.${PN}
-	update-alternatives --remove mkswap mkswap.${PN}
-	update-alternatives --remove blockdev blockdev.${PN}
-	update-alternatives --remove reboot reboot.${PN}
-	update-alternatives --remove shutdown shutdown.${PN}
-#	update-alternatives --remove sln sln.${PN}
-	update-alternatives --remove mkfs.minix mkfs.minix.${PN}
-	update-alternatives --remove hexdump hexdump.${PN}
-	update-alternatives --remove last last.${PN}
-	update-alternatives --remove logger logger.${PN}
-	update-alternatives --remove mesg mesg.${PN}
-	update-alternatives --remove renice renice.${PN}
-	update-alternatives --remove wall wall.${PN}
-	update-alternatives --remove setsid setsid.${PN}
-	update-alternatives --remove chrt chrt.${PN}
-	update-alternatives --remove flock flock.${PN}
-}
+ALTERNATIVE_PRIORITY = "100"
 
-pkg_postinst_util-linux-fdisk () {
-	update-alternatives --install ${base_sbindir}/fdisk fdisk fdisk.${PN} 100
-}
+ALTERNATIVE_${PN}  = "dmesg kill more reset mkswap blockdev pivot_root"
+ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg renice wall"
+ALTERNATIVE_${PN} += "setsid chrt flock hwclock"
 
-pkg_prerm_util-linux-fdisk () {
-	update-alternatives --remove fdisk fdisk.${PN}
-}
+ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
+ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
+ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
+ALTERNATIVE_LINK_NAME[reset] = "${base_bindir}/reset"
+ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
+ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
+ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
+ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
 
-pkg_postinst_util-linux-agetty () {
-	update-alternatives --install ${base_sbindir}/getty getty agetty 100
-}
+# There seems to be problem, atleast on nslu2, with these, untill they are
+# fixed the busybox ones have higher priority
+ALTERNATIVE_PRIORITY[hwclock] = "10"
+ALTERNATIVE_LINK_NAME[hwclock] = "${base_sbindir}/hwclock"
 
-pkg_prerm_util-linux-agetty () {
-	update-alternatives --remove getty agetty
-}
+ALTERNATIVE_util-linux-fdisk = "fdisk"
+ALTERNATIVE_LINK_NAME[fdisk] = "${base_sbindir}/fdisk"
 
-pkg_postinst_util-linux-mount () {
-	update-alternatives --install ${base_bindir}/mount mount mount.${PN} 100
-}
+ALTERNATIVE_util-linux-agetty = "getty"
+ALTERNATIVE_LINK_NAME[getty] = "${base_sbindir}/getty"
+ALTERNATIVE_TARGET[getty] = "${base_sbindir}/agetty"
 
-pkg_prerm_util-linux-mount () {
-	update-alternatives --remove mount mount.${PN}
-}
+ALTERNATIVE_util-linux-mount = "mount"
+ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
 
-pkg_postinst_util-linux-umount () {
-	update-alternatives --install ${base_bindir}/umount umount umount.${PN} 100
-}
+ALTERNATIVE_util-linux-umount = "umount"
+ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
 
-pkg_prerm_util-linux-umount () {
-	update-alternatives --remove umount umount.${PN}
-}
+ALTERNATIVE_util-linux-losetup = "losetup"
+ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
 
-pkg_postinst_util-linux-losetup () {
-	update-alternatives --install ${base_sbindir}/losetup losetup losetup.${PN} 100
-}
+ALTERNATIVE_util-linux-swaponoff = "swapoff swapon"
+ALTERNATIVE_LINK_NAME[swapoff] = "${base_sbindir}/swapoff"
+ALTERNATIVE_LINK_NAME[swapon] = "${base_sbindir}/swapon"
 
-pkg_prerm_util-linux-losetup () {
-	update-alternatives --remove losetup losetup.${PN}
-}
-
-pkg_postinst_util-linux-swaponoff () {
-	update-alternatives --install ${base_sbindir}/swapoff swapoff swapoff.${PN} 100
-	update-alternatives --install ${base_sbindir}/swapon swapon swapon.${PN} 100
-}
-
-pkg_prerm_util-linux-swaponoff () {
-	update-alternatives --remove swapoff swapoff.${PN}
-	update-alternatives --remove swapon swapon.${PN}
-}
-
-pkg_postinst_util-linux-fsck () {	
-	update-alternatives --install ${base_sbindir}/fsck.minix fsck.minix fsck.minix.${PN} 100
-	update-alternatives --install ${base_sbindir}/fsck fsck fsck.${PN} 100
-}
-
-pkg_prerm_util-linux-fsck () {
-	update-alternatives --remove fsck.minix fsck.minix.${PN}
-	update-alternatives --remove fsck fsck.${PN}
-}
+ALTERNATIVE_util-linux-fsck = "fsck.minix fsck"
+ALTERNATIVE_LINK_NAME[fsck.minix] = "${base_sbindir}/fsck.minix"
+ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
 
-pkg_postinst_util-linux-blkid () {
-	update-alternatives --install ${base_sbindir}/blkid blkid blkid.${PN} 100
-}
-
-pkg_prerm_util-linux-blkid () {
-	update-alternatives --remove blkid blkid.${PN}
-}
+ALTERNATIVE_util-linux-blkid = "blkid"
+ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.1.bb b/meta/recipes-core/util-linux/util-linux_2.21.1.bb
index 12faba0..8492cdf 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.21"
-PR = "r0"
+PR = "r1"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.3.4



