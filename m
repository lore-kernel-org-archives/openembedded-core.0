Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TsCYK-0003q8-AM
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 14:15:51 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r07D0VAA010857
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 7 Jan 2013 14:00:32 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TsCJb-00036z-58; Mon, 07 Jan 2013 14:00:31 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 14:00:30 +0100
Message-Id: <1357563630-11930-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.11.7
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
Subject: [PATCH] util-linux: moved 'reset' into own subpackage
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
X-List-Received-Date: Mon, 07 Jan 2013 13:15:52 -0000

From: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>

The 'reset' tool from util-linux is a shell script calling 'tput' which is
provided by 'ncurses'.  To avoid a 'util-linux' -> 'ncurses' dependency,
'reset' is put into an own subpackage which can be installed on demand.

Because most (all) systems are using 'busybux' which provides an
alternative 'reset' implementation, this should not cause too much
regressions.

Signed-off-by: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
---
 meta/recipes-core/util-linux/util-linux.inc       | 15 +++++++++++----
 meta/recipes-core/util-linux/util-linux_2.22.1.bb |  2 +-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index cd79895..667232c 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -33,7 +33,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-mount util-linux-readprofile util-linux-libblkid \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
-             util-linux-mkfs util-linux-mcookie util-linux-systemd"
+             util-linux-mkfs util-linux-mcookie util-linux-systemd util-linux-reset"
 
 EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
                 --disable-makeinstall-chown --enable-elvtune --enable-init \
@@ -60,6 +60,7 @@ FILES_util-linux-mcookie = "${bindir}/mcookie"
 FILES_util-linux-umount = "${base_bindir}/umount.${BPN}"
 FILES_util-linux-readprofile = "${base_sbindir}/readprofile.${BPN}"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
+FILES_util-linux-reset = "${base_bindir}/reset"
 
 FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
 FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
@@ -75,6 +76,9 @@ FILES_util-linux-blkid = "${base_sbindir}/blkid*"
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
 RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 
+# reset calls 'tput'
+RDEPENDS_util-linux-reset += "ncurses"
+
 FILES_${PN}-systemd = "${systemd_unitdir}/system/"
 
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup"
@@ -83,6 +87,7 @@ RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-l
 RRECOMMENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-native = ""
 
+
 do_compile () {
 	set -e
 	install ${WORKDIR}/MCONFIG ${S}/MCONFIG
@@ -138,15 +143,13 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 
-ALTERNATIVE_${PN}  = "dmesg kill more reset mkswap blockdev pivot_root"
+ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root"
 ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg renice wall"
 ALTERNATIVE_${PN} += "setsid chrt flock hwclock utmpdump eject"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
 ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
-ALTERNATIVE_LINK_NAME[reset] = "${bindir}/reset"
-ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
 ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
 ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
@@ -185,4 +188,8 @@ ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
 ALTERNATIVE_util-linux-blkid = "blkid"
 ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
 
+ALTERNATIVE_util-linux-reset = "reset"
+ALTERNATIVE_LINK_NAME[reset] = "${bindir}/reset"
+ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
+
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-core/util-linux/util-linux_2.22.1.bb b/meta/recipes-core/util-linux/util-linux_2.22.1.bb
index f5d777f..d734951 100644
--- a/meta/recipes-core/util-linux/util-linux_2.22.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.22.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.22"
-PR = "r2"
+PR = "r3"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.11.7



