Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RUGmq-00007Z-B8
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Nov 2011 12:51:16 +0100
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 5C9B4EB40B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2011 12:24:39 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ai0YAILL0E5T4zgTPGdsb2JhbAAMMAirGAEBAQE3giQBAh4BTgEEBgQtAwECChYYAwIBAgExDBsGAgEBBYgEtgmDX4NSgzEEjgGGSZIM
X-IronPort-AV: E=Sophos;i="4.69,575,1315173600"; d="scan'208,223";a="3315607"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.19])
	by ipb3.telenor.se with ESMTP; 26 Nov 2011 12:24:38 +0100
Message-ID: <4ED0CC76.4040606@emagii.com>
Date: Sat, 26 Nov 2011 12:24:38 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Sat, 26 Nov 2011 11:51:16 -0000
X-Groupsio-MsgNum: 12969
Content-Type: multipart/mixed; boundary="------------090504000708080201070101"

--------------090504000708080201070101
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Downloaded the latest, and tried building console-image for qemuarm.
Host = Ubuntu 11.04 i686.

Looked through the build log, and thought I'd share it with the list.


A number of warnings (see below)

Seen a couple of errors as well.

1.    ERROR: Function 'useradd_sysroot' failed
         Tried to access "/etc/group" but this was locked.
         Problem disappeared the next time I rebuilt.

2.    "ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz" is no longer 
available.
         tzdata , same problem.
         The recipe is located in two places.
         meta-openembedded/meta-oe/recipes-extended/tz*/tz*.bb have the 
problem
         This is what the build uses.

3.    When I ran into this problem, I exited with ctrl-C.
         This left some recipes in the middle of a fetch ,and the build 
could not continue.
         I had to "bitbake -c clean <package>" on all problematic 
packages to recover.
         Seems a little bit fragile to me.

4.     linux-3.0 recipe in meta-ti does not build (On Ubuntu 11.10 x64).
         Fails in the fetch stage.
         I removed the layer, since it was not needed for qemuarm.

5.    When compiling on a Ubuntu 11.10 x64 host  (linux 3.x host)
         tiff won't build.
         Did:
             bitbake console-image"
             bitbake -c clean tiff
             bitbake  tiff
         - No luck
         Reading through the mailing list, I found someone which deleted
         $TMPDIR and then
             bitbake tiff
             bitbake console-image
         That worked for me as well once, second time, same problem.
         Problem is that #include <iostream> fails.

         I noted that "iostream" is built and available in 
<sysroot>/usr/include/c++
         On the host, it is located in /usr/incolude/c++/<version>
         "tiff" build seems to be OK with Ubuntu 11.04 i686.

BR
Ulf Samuelsson


------------------------------------------------------------------------------------------
The following packages could not be downloaded.

http://kernel.org/pub/linux/utils/util-linux-ng/v2.19/util-linux-2.19.1.tar.bz2
http://kernel.org/pub/linux/libs/pam/library/Linux-PAM-1.1.4.tar.bz2
http://kernel.org/pub/linux/kernel/people/jsipek/guilt/guilt-0.33.tar.gz
http://kernel.org/pub/linux/utils/kernel/module-init-tools/module-init-tools-3.16.tar.bz2
http://kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.22.tar.bz2
http://kernel.org/pub/linux/utils/usb/usbutils/usbutils-0.91.tar.gz
http://kernel.org/pub/linux/bluetooth/bluez-4.96.tar.gz
http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-2.1.tar.gz
http://kernel.org/pub/linux/utils/kbd/kbd-1.15.2.tar.bz2
http://kernel.org/pub/linux/utils/kernel/pcmcia/pcmciautils-018.tar.bz2
http://www.kernel.org/pub/linux/network/connman/connman-0.77.tar.gz
ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz


WARNING: zip: No generic license file exists for: Info-ZIP at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: zip: There is also no SPDXLICENSEMAP for this license type: 
Info-ZIP at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses

WARNING: tcp-wrappers: No generic license file exists for: tcp-wrappers 
at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: tcp-wrappers: There is also no SPDXLICENSEMAP for this license 
type: tcp-wrappers at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses

WARNING: Missing md5 SRC_URI checksum for 
/home/downloads/downloads/hicolor-icon-theme-0.12.tar.gz, consider 
adding to the recipe:
SRC_URI[md5sum] = "55cafbcef8bcf7107f6d502149eb4d87"
WARNING: Missing sha256 SRC_URI checksum for 
/home/downloads/downloads/hicolor-icon-theme-0.12.tar.gz, consider 
adding to the recipe:
SRC_URI[sha256sum] = 
"9edca690617eaa19054951ca53501c802180262be8880ed84754ac46c93bec73"

WARNING: perl: No generic license file exists for: Artistic|GPL at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: perl: There is also no SPDXLICENSEMAP for this license type: 
Artistic|GPL at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses

WARNING: gmp: No generic license file exists for: LGPLv3&GPLv3 at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: gmp: There is also no SPDXLICENSEMAP for this license type: 
LGPLv3&GPLv3 at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses

WARNING: bzip2: No generic license file exists for: bzip2 at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: bzip2: There is also no SPDXLICENSEMAP for this license type: 
bzip2 at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses

WARNING: busybox: No generic license file exists for: bzip2 at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: busybox: There is also no SPDXLICENSEMAP for this license type: 
bzip2 at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses

WARNING: ntp: No generic license file exists for: ntp at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: ntp: There is also no SPDXLICENSEMAP for this license type: ntp 
at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses

WARNING: For recipe resolvconf, the following files/directories were 
installed but not shipped in any package:
WARNING:   /usr/sbin

WARNING: 
/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/qemuarm-angstrom-linux-gnueabi/sysvinit-inittab-2.88dsf-r6/sysvinit-2.88dsf/COPYING 
could not be copied for some reason. It may not exist. WARN for now.

WARNING: python: No generic license file exists for: PSFv2 at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: python: There is also no SPDXLICENSEMAP for this license type: 
PSFv2 at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses

WARNING: dnsmasq-dbus: No generic license file exists for: GPLv2GPLv3 at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: dnsmasq-dbus: There is also no SPDXLICENSEMAP for this license 
type: GPLv2GPLv3 at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses

WARNING: elfutils: No generic license file exists for: Exception at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: elfutils: There is also no SPDXLICENSEMAP for this license 
type: Exception at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses

WARNING: libgcc: No generic license file exists for: 
GCCRUNTIMELIBRARYEXCEPTION at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: libgcc: There is also no SPDXLICENSEMAP for this license type: 
GCCRUNTIMELIBRARYEXCEPTION at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses

WARNING: gcc-cross: No generic license file exists for: 
GCCRUNTIMELIBRARYEXCEPTION at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: gcc-cross: There is also no SPDXLICENSEMAP for this license 
type: GCCRUNTIMELIBRARYEXCEPTION at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses

WARNING: gcc-cross-initial: No generic license file exists for: 
GCCRUNTIMELIBRARYEXCEPTION at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: gcc-cross-initial: There is also no SPDXLICENSEMAP for this 
license type: GCCRUNTIMELIBRARYEXCEPTION at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses

WARNING: gcc-cross-intermediate: No generic license file exists for: 
GCCRUNTIMELIBRARYEXCEPTION at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: gcc-cross-intermediate: There is also no SPDXLICENSEMAP for 
this license type: GCCRUNTIMELIBRARYEXCEPTION at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses

WARNING: gcc-runtime: No generic license file exists for: 
GCCRUNTIMELIBRARYEXCEPTION at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: gcc-runtime: There is also no SPDXLICENSEMAP for this license 
type: GCCRUNTIMELIBRARYEXCEPTION at 
/home/ulf/projects/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses

WARNING: For recipe eglibc, the following files/directories were 
installed but not shipped in any package:
WARNING:   /usr/lib/locale

WARNING: For recipe libgcc, the following files/directories were 
installed but not shipped in any package:
WARNING:   /usr/src
WARNING:   /usr/src/debug

WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libgcc-4.5-r43+svnr178923/packages-split/libgcc/lib/libgcc_s.so.1'

WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/zip-3.0-r0/packages-split/zip/usr/bin/zipsplit'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/zip-3.0-r0/packages-split/zip/usr/bin/zip'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/zip-3.0-r0/packages-split/zip/usr/bin/zipnote'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/zip-3.0-r0/packages-split/zip/usr/bin/zipcloak'

WARNING: For recipe ncurses, the following files/directories were 
installed but not shipped in any package:
WARNING:   /usr/lib/terminfo

WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/gdbm-1.8.3-r4/packages-split/gdbm/usr/lib/libgdbm.so.3.0.0'

WARNING: For recipe openssl, the following files/directories were 
installed but not shipped in any package:
WARNING:   /usr/lib/engines
WARNING:   /usr/lib/ssl/private
WARNING:   /usr/lib/ssl/certs

WARNING: For recipe readline, the following files/directories were 
installed but not shipped in any package:
WARNING:   /usr/bin
WARNING: QA Issue: readline: 
/work/armv5te-angstrom-linux-gnueabi/readline-6.2-r0/packages-split/readline/usr/lib/libhistory.so.6 
contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: readline: 
/work/armv5te-angstrom-linux-gnueabi/readline-6.2-r0/packages-split/readline/usr/lib/libhistory.so.6.2 
contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: readline: 
/work/armv5te-angstrom-linux-gnueabi/readline-6.2-r0/packages-split/readline/usr/lib/libreadline.so.6.2 
contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: readline: 
/work/armv5te-angstrom-linux-gnueabi/readline-6.2-r0/packages-split/readline/usr/lib/libreadline.so.6 
contains probably-redundant RPATH /usr/lib

WARNING: For recipe cracklib, the following files/directories were 
installed but not shipped in any package:
WARNING:   /usr/lib/python2.7
WARNING:   /usr/lib/python2.7/site-packages

WARNING: For recipe libcgroup, the following files/directories were 
installed but not shipped in any package:
WARNING:   /lib/security/pam_cgroup.la
WARNING:   /lib/security/.debug
WARNING:   /lib/security/.debug/pam_cgroup.so
WARNING:   /lib/security/.debug/pam_cgroup.so.0.0.0
WARNING:   /lib/security/.debug/pam_cgroup.so.0
WARNING: For recipe libgcrypt, the following files/directories were 
installed but not shipped in any package:
WARNING:   /usr/sbin

WARNING: For recipe dbus, the following files/directories were installed 
but not shipped in any package:
WARNING:   /usr/lib/dbus-1.0/test

WARNING: For recipe glib-2.0, the following files/directories were 
installed but not shipped in any package:
WARNING:   /usr/lib/gio
WARNING:   /usr/lib/gio/modules

WARNING: For recipe perl, the following files/directories were installed 
but not shipped in any package:
WARNING:   /usr/lib/perl/site_perl
WARNING:   /usr/lib/perl/site_perl/5.14.2

WARNING: For recipe angstrom-version, the following files/directories 
were installed but not shipped in any package:
WARNING:   /usr/src
WARNING:   /usr/src/debug

WARNING: For recipe dbus-glib, the following files/directories were 
installed but not shipped in any package:
WARNING:   /etc
WARNING:   /etc/bash_completion.d
WARNING:   /etc/bash_completion.d/dbus-bash-completion.sh
WARNING:   /usr/libexec/dbus-bash-completion-helper

WARNING: For recipe alsa-utilsWARNING, the following files/directories 
were installed but not shipped in any package:
WARNING:   /var
WARNING:   /var/lib
WARNING:   /var/lib/alsa
WARNING: For recipe udev, the following files/directories were installed 
but not shipped in any package:
WARNING:   /usr/sbin

WARNING: For recipe avahi, the following files/directories were 
installed but not shipped in any package:
WARNING:   /usr/lib/avahi

WARNING: For recipe bluez4, the following files/directories were 
installed but not shipped in any package:
WARNING:   /usr/lib/bluetooth
WARNING:   /usr/lib/bluetooth/plugins

WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-lib/usr/lib/libperl.so.5.14.2'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode-symbol/usr/lib/perl/5.14.2/auto/Encode/Symbol/Symbol.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode-unicode/usr/lib/perl/5.14.2/auto/Encode/Unicode/Unicode.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode-jp/usr/lib/perl/5.14.2/auto/Encode/JP/JP.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode-cn/usr/lib/perl/5.14.2/auto/Encode/CN/CN.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode-tw/usr/lib/perl/5.14.2/auto/Encode/TW/TW.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode-kr/usr/lib/perl/5.14.2/auto/Encode/KR/KR.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode-byte/usr/lib/perl/5.14.2/auto/Encode/Byte/Byte.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode-ebcdic/usr/lib/perl/5.14.2/auto/Encode/EBCDIC/EBCDIC.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-b/usr/lib/perl/5.14.2/auto/B/B.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-unicode/usr/lib/perl/5.14.2/auto/Unicode/Normalize/Normalize.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-unicode/usr/lib/perl/5.14.2/auto/Unicode/Collate/Collate.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-mro/usr/lib/perl/5.14.2/auto/mro/mro.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-posix/usr/lib/perl/5.14.2/auto/POSIX/POSIX.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-fcntl/usr/lib/perl/5.14.2/auto/Fcntl/Fcntl.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-devel/usr/lib/perl/5.14.2/auto/Devel/PPPort/PPPort.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-devel/usr/lib/perl/5.14.2/auto/Devel/Peek/Peek.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-devel/usr/lib/perl/5.14.2/auto/Devel/DProf/DProf.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-io/usr/lib/perl/5.14.2/auto/IO/IO.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-list/usr/lib/perl/5.14.2/auto/List/Util/Util.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-opcode/usr/lib/perl/5.14.2/auto/Opcode/Opcode.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-cwd/usr/lib/perl/5.14.2/auto/Cwd/Cwd.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-file/usr/lib/perl/5.14.2/auto/File/Glob/Glob.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-compress/usr/lib/perl/5.14.2/auto/Compress/Raw/Bzip2/Bzip2.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-compress/usr/lib/perl/5.14.2/auto/Compress/Raw/Zlib/Zlib.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-sdbm-file/usr/lib/perl/5.14.2/auto/SDBM_File/SDBM_File.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-attributes/usr/lib/perl/5.14.2/auto/attributes/attributes.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-math/usr/lib/perl/5.14.2/auto/Math/BigInt/FastCalc/FastCalc.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-text/usr/lib/perl/5.14.2/auto/Text/Soundex/Soundex.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-re/usr/lib/perl/5.14.2/auto/re/re.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-sys/usr/lib/perl/5.14.2/auto/Sys/Syslog/Syslog.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-sys/usr/lib/perl/5.14.2/auto/Sys/Hostname/Hostname.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-threads/usr/lib/perl/5.14.2/auto/threads/threads.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-threads/usr/lib/perl/5.14.2/auto/threads/shared/shared.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-storable/usr/lib/perl/5.14.2/auto/Storable/Storable.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-hash/usr/lib/perl/5.14.2/auto/Hash/Util/Util.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-hash/usr/lib/perl/5.14.2/auto/Hash/Util/FieldHash/FieldHash.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-ipc/usr/lib/perl/5.14.2/auto/IPC/SysV/SysV.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-digest/usr/lib/perl/5.14.2/auto/Digest/MD5/MD5.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-digest/usr/lib/perl/5.14.2/auto/Digest/SHA/SHA.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-gdbm-file/usr/lib/perl/5.14.2/auto/GDBM_File/GDBM_File.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-i18n/usr/lib/perl/5.14.2/auto/I18N/Langinfo/Langinfo.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-data/usr/lib/perl/5.14.2/auto/Data/Dumper/Dumper.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-filter/usr/lib/perl/5.14.2/auto/Filter/Util/Call/Call.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-socket/usr/lib/perl/5.14.2/auto/Socket/Socket.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-time/usr/lib/perl/5.14.2/auto/Time/HiRes/HiRes.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-time/usr/lib/perl/5.14.2/auto/Time/Piece/Piece.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-perlio/usr/lib/perl/5.14.2/auto/PerlIO/encoding/encoding.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-perlio/usr/lib/perl/5.14.2/auto/PerlIO/scalar/scalar.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-perlio/usr/lib/perl/5.14.2/auto/PerlIO/via/via.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-mime/usr/lib/perl/5.14.2/auto/MIME/Base64/Base64.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode/usr/lib/perl/5.14.2/auto/Encode/Encode.so'

WARNING: For recipe ntp, the following files/directories were installed 
but not shipped in any package:
WARNING:   /usr/sbin
WARNING:   /usr/lib

WARNING: For recipe netbase, the following files/directories were 
installed but not shipped in any package:
WARNING:   /usr/sbin

WARNING: For recipe systemd, the following files/directories were 
installed but not shipped in any package:
WARNING:   /usr/lib/binfmt.d
WARNING:   /usr/lib/sysctl.d
WARNING:   /usr/lib/modules-load.d

WARNING: For recipe linux-yocto, the following files/directories were 
installed but not shipped in any package:
WARNING:   /etc/modprobe.d
WARNING:   /lib/modules/3.0.8-yocto-standard+/modules.builtin
WARNING:   /lib/modules/3.0.8-yocto-standard+/modules.order
WARNING:   /lib/modules/3.0.8-yocto-standard+/build
WARNING:   /lib/modules/3.0.8-yocto-standard+/source

WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/irda-utils-0.9.18-r0/packages-split/irda-utils/usr/sbin/dongle_attach'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/irda-utils-0.9.18-r0/packages-split/irda-utils/usr/sbin/irdaping'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/irda-utils-0.9.18-r0/packages-split/irda-utils/usr/sbin/irattach'

WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/hostap-utils-0.4.7-r4/packages-split/hostap-utils/usr/sbin/hostap_io_debug'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/hostap-utils-0.4.7-r4/packages-split/hostap-utils/usr/sbin/hostap_rid'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/hostap-utils-0.4.7-r4/packages-split/hostap-utils/usr/sbin/hostap_diag'
WARNING: QA Issue: No GNU_HASH in the elf binary: 
'/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/wireless-tools-1_29-r2/packages-split/libiw/usr/lib/libiw.so.29'

ERROR: Function 'useradd_sysroot' failed (see 
/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/systemd-git-r6/temp/log.do_install.30331 
for further information)
ERROR: Logfile of failure stored in: 
/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/systemd-git-r6/temp/log.do_install.30331
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| ERROR: Function 'useradd_sysroot' failed (see 
/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/systemd-git-r6/temp/log.do_install.30331 
for further information)
| + cd 
/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/systemd-git-r6/git
| + useradd_sysroot
| + export 
PSEUDO=/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/pseudo
| + 
PSEUDO=/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/pseudo
| + export 
PSEUDO_LOCALSTATEDIR=/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm/var/pseudo
| + 
PSEUDO_LOCALSTATEDIR=/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm/var/pseudo
| + 
D=/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm
| + useradd_preinst
| + OPT=
| + SYSROOT=
| + test 
x/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm 
'!=' x
| + 
SYSROOT=/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm
| + OPT='--root 
/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm'
| + GROUPADD_PARAM='-r lock'
| + USERADD_PARAM=
| + test 'x-r lock' '!=' x
| + echo 'Running groupadd commands...'
| Running groupadd commands...
| ++ echo '-r lock'
| ++ cut -d ';' -f 1
| + opts='-r lock'
| ++ echo '-r lock'
| ++ cut -d ';' -f 2-
| + remaining='-r lock'
| + test 'x-r lock' '!=' x
| ++ echo '-r lock'
| ++ awk '{ print $NF }'
| + groupname=lock
| ++ grep '^lock:' 
/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm/etc/group
| ++ true
| + group_exists=
| + test x = x
| + eval 
/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/pseudo 
groupadd --root 
/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm 
-r lock
| ++ 
/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/pseudo 
groupadd --root 
/home/ulf/projects/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm 
-r lock
| groupadd: cannot lock /etc/group; try again later.
NOTE: package systemd-git-r6: task do_install: Failed
ERROR: Task 158 
(/home/ulf/projects/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd_git.bb, 
do_install) failed with exit code '1'


-- 
Best Regards
Ulf Samuelsson
eMagii


--------------090504000708080201070101
Content-Type: text/x-patch;
 name="0001-tzcode-Change-tarball-location.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-tzcode-Change-tarball-location.patch"

From f0b388c34980d1c22d49a770a3968c4aed3fde98 Mon Sep 17 00:00:00 2001
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 26 Nov 2011 09:15:20 +0100
Subject: [PATCH 1/2] tzcode: Change tarball location

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@telia.com>
---
 meta-oe/recipes-extended/tzcode/tzcode-native.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/tzcode/tzcode-native.inc b/meta-oe/recipes-extended/tzcode/tzcode-native.inc
index b946e71..0c7c1ca 100644
--- a/meta-oe/recipes-extended/tzcode/tzcode-native.inc
+++ b/meta-oe/recipes-extended/tzcode/tzcode-native.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 INC_PR = "r4"
 
 SRC_URI = " \
-        ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode-${PV};subdir=${BPN}-${PV} \
-        ftp://elsie.nci.nih.gov/pub/tzdata${TZDATA_PV}.tar.gz;name=tzdata-${TZDATA_PV};subdir=${BPN}-${PV} \
+        http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode-${PV};subdir=${BPN}-${PV} \
+        http://www.iana.org/time-zones/repository/releases/tzdata${TZDATA_PV}.tar.gz;name=tzdata-${TZDATA_PV};subdir=${BPN}-${PV} \
 	"
 
 inherit native
-- 
1.7.4.1


--------------090504000708080201070101
Content-Type: text/x-patch;
 name="0002-tzdata-Change-tarball-location.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0002-tzdata-Change-tarball-location.patch"

From 7c6dc15fe61b367a32324959036488059d130722 Mon Sep 17 00:00:00 2001
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 26 Nov 2011 09:15:57 +0100
Subject: [PATCH 2/2] tzdata: Change tarball location

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@telia.com>
---
 meta-oe/recipes-extended/tzdata/tzdata.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-extended/tzdata/tzdata.inc b/meta-oe/recipes-extended/tzdata/tzdata.inc
index ceec924..9192d9b 100644
--- a/meta-oe/recipes-extended/tzdata/tzdata.inc
+++ b/meta-oe/recipes-extended/tzdata/tzdata.inc
@@ -11,7 +11,7 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
              timezone-australia timezone-europe timezone-indian \
              timezone-iso3166.tab timezone-pacific timezone-zone.tab"
 
-SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz;subdir=${BPN}-${PV}"
+SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;subdir=${BPN}-${PV}"
 
 TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
          factory solar87 solar88 solar89 etcetera backward systemv \
-- 
1.7.4.1


--------------090504000708080201070101--
