Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8FpA-0003ZS-Jb for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 20:22:40 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QINWts007419 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 19:23:32 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UpqDF-9h6f91
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 19:23:32 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QINSBB007411
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 19:23:30 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2011 19:17:04 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317061031.26109.85.camel@ted>
Mime-Version: 1.0
Subject: insane/QA Warnings summary
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
X-List-Received-Date: Mon, 26 Sep 2011 18:22:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I did some checks on master to see where we were at with the QA warnings
from insane.bbclass. I've trimmed this log to only list one line per
recipe that has the problem. The situation isn't perhaps as bad as it
could be. I've listed general errors first, then the GNU_HASH and RPATH
ones separately. These are against world+big image+sdk toolchain builds.
We're about at the point where we might need to start opening individual
bugs to get straglers resolved. I'm particularly keen to get the general
warnings fixed as once those are done, we can enable those checks to
become errors.

General warnings (non-machine specific):
($ cat qa.log | grep -v RPATH | grep -v Desktop | grep -v HASH)
sqlite3-nativesdk-3.7.7.1: non debug package contains .debug directory: sqlite3-nativesdk path /work/x86_64-nativesdk-pokysdk-linux/sqlite3-nativesdk-3.7.7.1-r0/packages-split/sqlite3-nativesdk/opt/poky/1.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/.debug/libsqlite3.so
pseudo-nativesdk-1.1.1: non debug package contains .debug directory: pseudo-nativesdk path /work/x86_64-nativesdk-pokysdk-linux/pseudo-nativesdk-1.1.1-r2/packages-split/pseudo-nativesdk/opt/poky/1.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/pseudo/lib64/.debug/libpseudo.so

(qemux86):
gcc-4.6.1+svnr175454: non -dev/-dbg/-nativesdk package contains symlink .so: gcc path '/work/i586-poky-linux/gcc-4.6.1+svnr175454-r11/packages-split/gcc/usr/libexec/gcc/i586-poky-linux/4.6.1/liblto_plugin.so'
grub-1.99: Architecture did not match (3 to 62) on /work/i586-poky-linux/grub-1.99-r1/packages-split/grub/usr/lib/grub/i386-pc/efiemu64.o
gcc-cross-canadian-i586-4.6.1+svnr175454: non -dev/-dbg/-nativesdk package contains symlink .so: gcc-cross-canadian-i586 path '/work/x86_64-nativesdk-pokysdk-linux/gcc-cross-canadian-i586-4.6.1+svnr175454-r11/packages-split/gcc-cross-canadian-i586/opt/poky/1.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.6.1/liblto_plugin.so'

(qemuarm):
gcc-4.6.1+svnr175454: non -dev/-dbg/-nativesdk package contains symlink .so: gcc path '/work/armv5te-poky-linux-gnueabi/gcc-4.6.1+svnr175454-r11/packages-split/gcc/usr/libexec/gcc/arm-poky-linux-gnueabi/4.6.1/liblto_plugin.so'
gcc-cross-canadian-arm-4.6.1+svnr175454: non -dev/-dbg/-nativesdk package contains symlink .so: gcc-cross-canadian-arm path '/work/x86_64-nativesdk-pokysdk-linux/gcc-cross-canadian-arm-4.6.1+svnr175454-r11/packages-split/gcc-cross-canadian-arm/opt/poky/1.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/armv5te-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.1/liblto_plugin.so'

RPATH Issues (general):
pseudo-nativesdk-1.1.1: package pseudo-nativesdk contains bad RPATH /media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/opt/poky/1.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib in file /media/build1/poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/pseudo-nativesdk-1.1.1-r2/packages-split/pseudo-nativesdk/opt/poky/1.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/pseudo/lib64/libpseudo.so

(qemux86):
readline-6.2: readline: /work/armv5te-poky-linux-gnueabi/readline-6.2-r0/packages-split/readline/usr/lib/libhistory.so.6 contains probably-redundant RPATH /usr/lib
tcl-8.5.9: tcl: /work/armv5te-poky-linux-gnueabi/tcl-8.5.9-r1/packages-split/tcl/usr/bin/tclsh8.5 contains probably-redundant RPATH /usr/lib
directfb-1.4.12: directfb: /work/armv5te-poky-linux-gnueabi/directfb-1.4.12-r0/packages-split/directfb/usr/lib/libfusion-1.4.so.5 contains probably-redundant RPATH /usr/lib
slang-2.2.4: slang: /work/armv5te-poky-linux-gnueabi/slang-2.2.4-r6/packages-split/slang/usr/bin/slsh contains probably-redundant RPATH /usr/lib
python-2.6.6: package python-sqlite3 contains bad RPATH /media/build1/poky/build/tmp/sysroots/qemuarm/usr/lib in file /media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/python-2.6.6-r2.10/packages-split/python-sqlite3/usr/lib/python2.6/lib-dynload/_sqlite3.so
binutils-2.21.1a: binutils: /work/armv5te-poky-linux-gnueabi/binutils-2.21.1a-r0/packages-split/binutils/usr/lib/libbfd-2.21.1.so contains probably-redundant RPATH /usr/lib
opensp-1.5: opensp: /work/armv5te-poky-linux-gnueabi/opensp-1.5-r2/packages-split/opensp/usr/lib/libosp.so.3.0.0 contains probably-redundant RPATH /usr/lib
qt-x11-free-3.3.7: package qt-x11-plugins-imageformats contains bad RPATH /usr/lib:/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/qt-x11-free-3.3.7-r1/qt-x11-free-3.3.7/plugins/imageformats in file /media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/qt-x11-free-3.3.7-r1/packages-split/qt-x11-plugins-imageformats/usr/plugins/imageformats/libqjpeg.so

(qemuarm):
readline-6.2: readline: /work/i586-poky-linux/readline-6.2-r0/packages-split/readline/usr/lib/libhistory.so.6 contains probably-redundant RPATH /usr/lib
python-2.6.6: package python-sqlite3 contains bad RPATH /media/build1/poky/build/tmp/sysroots/qemux86/usr/lib in file /media/build1/poky/build/tmp/work/i586-poky-linux/python-2.6.6-r2.10/packages-split/python-sqlite3/usr/lib/python2.6/lib-dynload/_sqlite3.so
slang-2.2.4: slang: /work/i586-poky-linux/slang-2.2.4-r6/packages-split/slang/usr/lib/slang/v2/modules/socket-module.so contains probably-redundant RPATH /usr/lib
binutils-2.21.1a: binutils: /work/i586-poky-linux/binutils-2.21.1a-r0/packages-split/binutils/usr/lib/libbfd-2.21.1.so contains probably-redundant RPATH /usr/lib
directfb-1.4.12: directfb: /work/i586-poky-linux/directfb-1.4.12-r0/packages-split/directfb/usr/lib/libfusion-1.4.so.5 contains probably-redundant RPATH /usr/lib
tcl-8.5.9: tcl: /work/i586-poky-linux/tcl-8.5.9-r1/packages-split/tcl/usr/bin/tclsh8.5 contains probably-redundant RPATH /usr/lib
opensp-1.5: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/lib/libosp.so.3.0.0 contains probably-redundant RPATH /usr/lib
qt-x11-free-3.3.7: package qt-x11-plugins-imageformats contains bad RPATH /usr/lib:/media/build1/poky/build/tmp/work/i586-poky-linux/qt-x11-free-3.3.7-r1/qt-x11-free-3.3.7/plugins/imageformats in file /media/build1/poky/build/tmp/work/i586-poky-linux/qt-x11-free-3.3.7-r1/packages-split/qt-x11-plugins-imageformats/usr/plugins/imageformats/libqjpeg.so


GNU_HASH Issues (qemuarm):
libgcc-4.6.1+svnr175454: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/libgcc-4.6.1+svnr175454-r11/packages-split/libgcc/lib/libgcc_s.so.1'
libaio-0.3.107: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/libaio-0.3.107-r0/packages-split/libaio/usr/lib/libaio.so.1.0.1'
zip-3.0: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/zip-3.0-r0/packages-split/zip/usr/bin/zipsplit'
wireless-tools-29: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/wireless-tools-1_29-r2/packages-split/libiw/usr/lib/libiw.so.29'
hostap-utils-0.4.7: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/hostap-utils-0.4.7-r4/packages-split/hostap-utils/usr/sbin/hostap_io_debug'
gdbm-1.8.3: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/gdbm-1.8.3-r4/packages-split/gdbm/usr/lib/libgdbm.so.3.0.0'
openssl-0.9.8r: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/openssl-0.9.8r-r5/packages-split/libcrypto/usr/lib/libcrypto.so.0.9.8'
pth-2.0.7: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/pth-2.0.7-r1/packages-split/pth/usr/lib/libpth.so.20.0.27'
irda-utils-0.9.18: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/irda-utils-0.9.18-r0/packages-split/irda-utils/usr/sbin/dongle_attach'
setserial-2.17: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/setserial-2.17-r3/packages-split/setserial/usr/bin/setserial'
makedevs-1.0.0: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/makedevs-1.0.0-r7/packages-split/makedevs/sbin/makedevs'
unzip-6.0: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/unzip-1_6.0-r1/packages-split/unzip/usr/bin/unzip'
blktrace-1.0.1+git1+1e09f6e9012826fca69fa07222b7bc53c3e629ee: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/blktrace-1.0.1+git1+1e09f6e9012826fca69fa07222b7bc53c3e629ee-r2/packages-split/blktrace/usr/bin/blkparse'
zeroconf-0.9: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/zeroconf-0.9-r1/packages-split/zeroconf/usr/sbin/zeroconf'
perl-5.12.3: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/perl-5.12.3-r5/packages-split/perl-lib/usr/lib/libperl.so.5.12.3'
libxml-parser-perl-2.40: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/libxml-parser-perl-2.40-r4/packages-split/libxml-parser-perl/usr/lib/perl/vendor_perl/5.12.3/auto/XML/Parser/Expat/Expat.so'
chkconfig-1.3.52: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/chkconfig-1.3.52-r1/packages-split/chkconfig/usr/sbin/alternatives'
logrotate-3.7.9: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/logrotate-3.7.9-r0/packages-split/logrotate/usr/sbin/logrotate'
tcf-agent-0.0+svnr1855: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/tcf-agent-0.0+svnr1855-r1/packages-split/tcf-agent/usr/sbin/tcf-agent'
openssl-0.9.8r: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/openssl-0.9.8r-r6/packages-split/libcrypto/usr/lib/libcrypto.so.0.9.8'
qt-x11-free-3.3.7: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/qt-x11-free-3.3.7-r1/packages-split/qt-x11-plugins-imageformats/usr/plugins/imageformats/libqjpeg.so'
openssl-0.9.8r: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/openssl-0.9.8r-r6/packages-split/libcrypto/usr/lib/libcrypto.so.0.9.8'
gtk-theme-torturer-0.0.0+git1+99962ae39bb5aadb31929b25c58e1a053f9c9545: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/gtk-theme-torturer-0.0.0+git1+99962ae39bb5aadb31929b25c58e1a053f9c9545-r0/packages-split/gtk-theme-torturer/usr/bin/torturer'
puzzles-r9175: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/armv5te-poky-linux-gnueabi/puzzles-r9175-r0/packages-split/puzzles/usr/games/solo'

(qemux86):
libgcc-4.6.1+svnr175454: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/libgcc-4.6.1+svnr175454-r11/packages-split/libgcc/lib/libgcc_s.so.1'
zip-3.0: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/zip-3.0-r0/packages-split/zip/usr/bin/zipnote'
wireless-tools-29: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/wireless-tools-1_29-r2/packages-split/libiw/usr/lib/libiw.so.29'
hostap-utils-0.4.7: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/hostap-utils-0.4.7-r4/packages-split/hostap-utils/usr/sbin/hostap_diag'
gdbm-1.8.3: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/gdbm-1.8.3-r4/packages-split/gdbm/usr/lib/libgdbm.so.3.0.0'
irda-utils-0.9.18: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/irda-utils-0.9.18-r0/packages-split/irda-utils/usr/sbin/irattach'
openssl-0.9.8r: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/openssl-0.9.8r-r5/packages-split/openssl/usr/bin/openssl'
perl-5.12.3: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/perl-5.12.3-r5/packages-split/perl-module-opcode/usr/lib/perl/5.12.3/auto/Opcode/Opcode.so'
qemugl-0.0+git1+d888bbc723c00d197d34a39b5b7448660ec1b1c0: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/qemugl-0.0+git1+d888bbc723c00d197d34a39b5b7448660ec1b1c0-r8/packages-split/qemugl/usr/lib/libGL-qemu.so.1.2'
libgcc-4.6.1+svnr175454: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/libgcc-4.6.1+svnr175454-r11/packages-split/libgcc/lib/libgcc_s.so.1'
libxml-parser-perl-2.40: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/libxml-parser-perl-2.40-r4/packages-split/libxml-parser-perl/usr/lib/perl/vendor_perl/5.12.3/auto/XML/Parser/Expat/Expat.so'
libaio-0.3.107: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/libaio-0.3.107-r0/packages-split/libaio/usr/lib/libaio.so.1.0.1'
pth-2.0.7: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/pth-2.0.7-r1/packages-split/pth/usr/lib/libpth.so.20.0.27'
chkconfig-1.3.52: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/chkconfig-1.3.52-r1/packages-split/chkconfig/usr/sbin/alternatives'
makedevs-1.0.0: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/makedevs-1.0.0-r7/packages-split/makedevs/sbin/makedevs'
setserial-2.17: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/setserial-2.17-r3/packages-split/setserial/usr/bin/setserial'
blktrace-1.0.1+git1+1e09f6e9012826fca69fa07222b7bc53c3e629ee: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/blktrace-1.0.1+git1+1e09f6e9012826fca69fa07222b7bc53c3e629ee-r2/packages-split/blktrace/usr/bin/blkparse'
logrotate-3.7.9: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/logrotate-3.7.9-r0/packages-split/logrotate/usr/sbin/logrotate'
unzip-6.0: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/unzip-1_6.0-r1/packages-split/unzip/usr/bin/unzip'
tcf-agent-0.0+svnr1855: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/tcf-agent-0.0+svnr1855-r1/packages-split/tcf-agent/usr/sbin/tcf-agent'
libacpi-0.2: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/libacpi-0.2-r2/packages-split/libacpi/usr/lib/libacpi.so.0'
gtk-theme-torturer-0.0.0+git1+99962ae39bb5aadb31929b25c58e1a053f9c9545: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/gtk-theme-torturer-0.0.0+git1+99962ae39bb5aadb31929b25c58e1a053f9c9545-r0/packages-split/gtk-theme-torturer/usr/bin/torturer'
zeroconf-0.9: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/zeroconf-0.9-r1/packages-split/zeroconf/usr/sbin/zeroconf'
puzzles-r9175: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/puzzles-r9175-r0/packages-split/puzzles/usr/games/solo'
qt-x11-free-3.3.7: No GNU_HASH in the elf binary: '/media/build1/poky/build/tmp/work/i586-poky-linux/qt-x11-free-3.3.7-r1/packages-split/qt-x11-plugins-imageformats/usr/plugins/imageformats/libqjpeg.so'

(I know Khem has a patch for libgcc)

Cheers,

Richard



