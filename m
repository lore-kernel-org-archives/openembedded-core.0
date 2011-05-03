Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1QHNyX-0000Uf-6D
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 00:21:49 +0200
Received: by pwj9 with SMTP id 9so267308pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2011 15:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=NnNBzrA6iEB1gliqsQkxr/P28UTpviww9heOoGPHE6s=;
	b=NvpkyMUkMHQnzvqpzWhc9mXF7VsjfIz/Nl3m3D2Qh5h4MP4wZ6OnbhoyaZ8WCpeDeq
	WelBEbQskgRvWdg46E4k1B4HIBgKWkCpIHj+vTIoG2zu3ZvCkejkMk4tvV7/dpA1EJbI
	N+KM8ayFcMZDUk1XKBdcUgiCGsMqClkScRbEs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=DbGxkMkSqy51+F593PYRAYQoOt8Tq2Q5KIdD5/BN/esxrGEe26BMZOB2LfHOX+nD6+
	zEWAhdAtBZLftkXkqN2OLXk1Js+tIpdIN7jH2zBQKDTTC+H5l1rc3c0kmCjTssatRfd0
	m/E5jGAx9CrwS/YsrisoeDpcAjxLGvXGO7Iyc=
MIME-Version: 1.0
Received: by 10.68.47.231 with SMTP id g7mr501731pbn.203.1304461150276; Tue,
	03 May 2011 15:19:10 -0700 (PDT)
Received: by 10.68.56.161 with HTTP; Tue, 3 May 2011 15:19:10 -0700 (PDT)
Date: Wed, 4 May 2011 00:19:10 +0200
Message-ID: <BANLkTikxo4jWt7zKciXt1w4iiJYHg=WnqQ@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: error: LOOP: udev/ libudev during do_rootfs?
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
X-List-Received-Date: Tue, 03 May 2011 22:21:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

on oe-core I'm testing the addition of powerpc-linux-gnuspe targets.
Everything runs fine up to do_rootfs where I hit this "LOOP" error
which I found rather cryptic:

Seems a cyclic loop dependency. I have never seen this error, does
this ring a bell with someone?

| error: LOOP:
| error: removing udev-164-r1.ppce500v2 "Requires: libudev0 >= 164"
from tsort relations.
| error: removing libudev0-164-r1.ppce500v2 "Requires: udev = 164-r1"
from tsort relations.
| Preparing...                ##################################################
| ERROR: Function 'do_rootfs' failed

This is my abbreviated diff against oe-core (tip)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
+               "powerpc-linux-gnuspe":    "endian-big bit-32
common-glibc powerpc-common",\

diff --git a/meta/conf/distro/poky.conf b/meta/conf/distro/poky.conf
+GLIBCTARGETOS =
"linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d,1) in
['ppce500', 'ppce500v2']]}"


but I'm not sure if gnuspe is related.

Here is the full part of the log where the failure starts:

NOTE: Running task 1527 of 1528 (ID: 8,
/home/leon/sandbox/sidebranch/yocto/oe-core/meta/recipes-core/images/core-image-minimal.bb,
do_rootfs)
NOTE: package core-image-minimal-1.0-r0: task do_rootfs: Started
ERROR: Function 'do_rootfs' failed (see
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/temp/log.do_rootfs.12166
for further information)
ERROR: Logfile of failure stored in:
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/temp/log.do_rootfs.12166
Log data follows:
| + cd /home/leon/sandbox/sidebranch/yocto/oe-core/build
| + do_rootfs
| + rm -rf /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs
| + mkdir -p /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs
| + mkdir -p /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/images
| + '[' 0 '!=' 1 ']'
| + for devtable in
/home/leon/sandbox/sidebranch/yocto/oe-core/meta/files/device_table-minimal.txt
| + makedevs -r
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs
-D /home/leon/sandbox/sidebranch/yocto/oe-core/meta/files/device_table-minimal.txt
| + rootfs_rpm_do_rootfs
| + package_update_index_rpm
| + rpmarchs='all any noarch powerpc ppce500v2 p2020rdb'
| + '[' '!' -z '' ']'
| + packagedirs=
| + packagedirs_sdk=
| + for arch in '$rpmarchs'
| ++ echo all
| ++ sed -e s/powerpc/i686/
| + sdkarch=all
| + extension=-nativesdk
| + '[' all = all -o all = any -o all = noarch ']'
| + extension=
| + packagedirs='/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all
'
| + packagedirs_sdk='/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all
'
| + rm -rf /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all/solvedb
| + rm -rf /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all/solvedb
| + for arch in '$rpmarchs'
| ++ echo any
| ++ sed -e s/powerpc/i686/
| + sdkarch=any
| + extension=-nativesdk
| + '[' any = all -o any = any -o any = noarch ']'
| + extension=
| + packagedirs='/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/any
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all '
| + packagedirs_sdk='/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/any
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all '
| + rm -rf /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/any/solvedb
| + rm -rf /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/any/solvedb
| + for arch in '$rpmarchs'
| ++ echo noarch
| ++ sed -e s/powerpc/i686/
| + sdkarch=noarch
| + extension=-nativesdk
| + '[' noarch = all -o noarch = any -o noarch = noarch ']'
| + extension=
| + packagedirs='/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/noarch
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/any
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all '
| + packagedirs_sdk='/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/noarch
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/any
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all '
| + rm -rf /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/noarch/solvedb
| + rm -rf /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/noarch/solvedb
| + for arch in '$rpmarchs'
| ++ echo powerpc
| ++ sed -e s/powerpc/i686/
| + sdkarch=i686
| + extension=-nativesdk
| + '[' i686 = all -o i686 = any -o i686 = noarch ']'
| + packagedirs='/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/powerpc
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/noarch
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/any
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all '
| + packagedirs_sdk='/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/i686-nativesdk
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/noarch
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/any
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all '
| + rm -rf /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/powerpc/solvedb
| + rm -rf /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/i686-nativesdk/solvedb
| + for arch in '$rpmarchs'
| ++ echo ppce500v2
| ++ sed -e s/powerpc/i686/
| + sdkarch=ppce500v2
| + extension=-nativesdk
| + '[' ppce500v2 = all -o ppce500v2 = any -o ppce500v2 = noarch ']'
| + packagedirs='/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/powerpc
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/noarch
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/any
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all '
| + packagedirs_sdk='/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2-nativesdk
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/i686-nativesdk
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/noarch
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/any
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all '
| + rm -rf /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2/solvedb
| + rm -rf /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2-nativesdk/solvedb
| + for arch in '$rpmarchs'
| ++ echo p2020rdb
| ++ sed -e s/powerpc/i686/
| + sdkarch=p2020rdb
| + extension=-nativesdk
| + '[' p2020rdb = all -o p2020rdb = any -o p2020rdb = noarch ']'
| + packagedirs='/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/powerpc
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/noarch
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/any
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all '
| + packagedirs_sdk='/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb-nativesdk
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2-nativesdk
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/i686-nativesdk
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/noarch
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/any
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all '
| + rm -rf /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb/solvedb
| + rm -rf /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb-nativesdk/solvedb
| + cat /dev/null
| + for pkgdir in '$packagedirs'
| + '[' -e /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb/
']'
| + echo 'Generating solve db for
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb...'
| Generating solve db for
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb...
| + echo /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb/solvedb
| + '[' -d /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb/solvedb
']'
| + mkdir -p /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb/solvedb
| + echo '# Dynamically generated solve manifest'
| + find /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb
-maxdepth 1 -type f
| + rpm --dbpath /var/lib/rpm '--define=_openall_before_chroot 1' -i
--replacepkgs --replacefiles --oldpackage -D '_dbpath
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb/solvedb'
--justdb --noaid --nodeps --noorder --noscripts --notriggers
--noparentdirs --nolinktos --stats --ignoresize --nosignature
--nodigest -D '__dbi_txn create nofsync'
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb/solvedb/manifest
|    total:               1      0.000000 MB      0.113264 secs
|    fingerprint:        36      0.000190 MB      0.027744 secs
|    install:            12      0.000000 MB      0.043672 secs
|    dbadd:              12      0.000000 MB      0.039817 secs
|    dbget:              96      0.000000 MB      0.000429 secs
|    dbput:              12      0.040024 MB      0.024761 secs
|    readhdr:           121      0.080920 MB      0.000324 secs
|    hdrload:            63      0.126308 MB      0.000994 secs
|    hdrget:           1777      0.000000 MB      0.001941 secs
| + for pkgdir in '$packagedirs'
| + '[' -e /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2/
']'
| + echo 'Generating solve db for
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2...'
| Generating solve db for
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2...
| + echo /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2/solvedb
| + '[' -d /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2/solvedb
']'
| + mkdir -p /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2/solvedb
| + echo '# Dynamically generated solve manifest'
| + find /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2
-maxdepth 1 -type f
| + rpm --dbpath /var/lib/rpm '--define=_openall_before_chroot 1' -i
--replacepkgs --replacefiles --oldpackage -D '_dbpath
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2/solvedb'
--justdb --noaid --nodeps --noorder --noscripts --notriggers
--noparentdirs --nolinktos --stats --ignoresize --nosignature
--nodigest -D '__dbi_txn create nofsync'
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2/solvedb/manifest
|    total:               1      0.000000 MB      9.997324 secs
|    fingerprint:      8064      0.083866 MB      1.236376 secs
|    install:          2688      0.000000 MB      4.044528 secs
|    dbadd:            2688      0.000000 MB      3.981213 secs
|    dbget:           26954      0.000000 MB      0.022300 secs
|    dbput:            2688     11.758372 MB      3.476440 secs
|    readhdr:         26881     23.555538 MB      0.095639 secs
|    hdrload:         18119     55.068242 MB      0.161399 secs
|    hdrget:         472164      0.000000 MB      0.205723 secs
| + for pkgdir in '$packagedirs'
| + '[' -e /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/powerpc/
']'
| + for pkgdir in '$packagedirs'
| + '[' -e /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/noarch/
']'
| + for pkgdir in '$packagedirs'
| + '[' -e /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/any/
']'
| + for pkgdir in '$packagedirs'
| + '[' -e /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all/
']'
| + echo 'Generating solve db for
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all...'
| Generating solve db for
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all...
| + echo /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all/solvedb
| + '[' -d /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all/solvedb
']'
| + mkdir -p /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all/solvedb
| + echo '# Dynamically generated solve manifest'
| + find /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all
-maxdepth 1 -type f
| + rpm --dbpath /var/lib/rpm '--define=_openall_before_chroot 1' -i
--replacepkgs --replacefiles --oldpackage -D '_dbpath
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all/solvedb'
--justdb --noaid --nodeps --noorder --noscripts --notriggers
--noparentdirs --nolinktos --stats --ignoresize --nosignature
--nodigest -D '__dbi_txn create nofsync'
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all/solvedb/manifest
|    total:               1      0.000000 MB      0.046624 secs
|    fingerprint:         9      0.000012 MB      0.000045 secs
|    install:             3      0.000000 MB      0.007139 secs
|    dbadd:               3      0.000000 MB      0.006542 secs
|    dbget:              12      0.000000 MB      0.000028 secs
|    dbput:               3      0.008972 MB      0.001883 secs
|    readhdr:            31      0.018328 MB      0.002691 secs
|    hdrload:            16      0.029560 MB      0.000155 secs
|    hdrget:            489      0.000000 MB      0.000347 secs
| + cat /dev/null
| + for pkgdir in '$packagedirs_sdk'
| + '[' -e /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb-nativesdk/
']'
| + for pkgdir in '$packagedirs_sdk'
| + '[' -e /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2-nativesdk/
']'
| + for pkgdir in '$packagedirs_sdk'
| + '[' -e /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/i686-nativesdk/
']'
| + for pkgdir in '$packagedirs_sdk'
| + '[' -e /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/noarch/
']'
| + for pkgdir in '$packagedirs_sdk'
| + '[' -e /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/any/
']'
| + for pkgdir in '$packagedirs_sdk'
| + '[' -e /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all/
']'
| + echo 'Generating solve db for
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all...'
| Generating solve db for
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all...
| + echo /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all/solvedb
| + '[' -d /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all/solvedb
']'
| + continue
| + package_generate_rpm_conf
| + printf '_solve_dbpath '
| + colon=false
| ++ cat /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/solvedb.conf
| + for each in '`cat
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/solvedb.conf`'
| + '[' false == true ']'
| + printf %s /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb/solvedb
| + colon=true
| + for each in '`cat
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/solvedb.conf`'
| + '[' true == true ']'
| + printf :
| + printf %s /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2/solvedb
| + colon=true
| + for each in '`cat
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/solvedb.conf`'
| + '[' true == true ']'
| + printf :
| + printf %s /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all/solvedb
| + colon=true
| + printf '\n'
| + printf '_solve_dbpath '
| + colon=false
| ++ cat /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/solvedb-sdk.conf
| + for each in '`cat
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/solvedb-sdk.conf`'
| + '[' false == true ']'
| + printf %s /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all/solvedb
| + colon=true
| + printf '\n'
| + mkdir -p /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/etc/rpm/
| + mkdir -p /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/var/lib/rpm
| + mkdir -p /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/var/lib/rpm/log
| + cat
| + export INSTALL_ROOTFS_RPM=/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs
| + INSTALL_ROOTFS_RPM=/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs
| + export INSTALL_PLATFORM_RPM=powerpc
| + INSTALL_PLATFORM_RPM=powerpc
| + export INSTALL_CONFBASE_RPM=/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/solvedb
| + INSTALL_CONFBASE_RPM=/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/solvedb
| + export 'INSTALL_PACKAGES_NORMAL_RPM=task-core-boot '
| + INSTALL_PACKAGES_NORMAL_RPM='task-core-boot '
| + export INSTALL_PACKAGES_ATTEMPTONLY_RPM=
| + INSTALL_PACKAGES_ATTEMPTONLY_RPM=
| + export INSTALL_PACKAGES_LINGUAS_RPM=
| + INSTALL_PACKAGES_LINGUAS_RPM=
| + export INSTALL_PROVIDENAME_RPM=
| + INSTALL_PROVIDENAME_RPM=
| + export INSTALL_TASK_RPM=populate_sdk
| + INSTALL_TASK_RPM=populate_sdk
| + INSTALL_PLATFORM_EXTRA_RPM=
| + for each_arch in all any noarch powerpc ppce500v2 p2020rdb
| + INSTALL_PLATFORM_EXTRA_RPM='all '
| + for each_arch in all any noarch powerpc ppce500v2 p2020rdb
| + INSTALL_PLATFORM_EXTRA_RPM='any all '
| + for each_arch in all any noarch powerpc ppce500v2 p2020rdb
| + INSTALL_PLATFORM_EXTRA_RPM='noarch any all '
| + for each_arch in all any noarch powerpc ppce500v2 p2020rdb
| + INSTALL_PLATFORM_EXTRA_RPM='powerpc noarch any all '
| + for each_arch in all any noarch powerpc ppce500v2 p2020rdb
| + INSTALL_PLATFORM_EXTRA_RPM='ppce500v2 powerpc noarch any all '
| + for each_arch in all any noarch powerpc ppce500v2 p2020rdb
| + INSTALL_PLATFORM_EXTRA_RPM='p2020rdb ppce500v2 powerpc noarch any all '
| + export INSTALL_PLATFORM_RPM
| + package_install_internal_rpm
| + local target_rootfs=/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs
| + local platform=powerpc
| + local 'platform_extra=p2020rdb ppce500v2 powerpc noarch any all '
| + local confbase=/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/solvedb
| + local 'package_to_install=task-core-boot '
| + local package_attemptonly=
| + local package_lingusa=
| + local providename=
| + local task=populate_sdk
| + mkdir -p /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/etc/rpm/
| + echo powerpc-poky-linux-gnu
| + '[' '!' -z 'p2020rdb ppce500v2 powerpc noarch any all ' ']'
| + for pt in '$platform_extra'
| + echo 'p2020rdb-.*-linux.*'
| + for pt in '$platform_extra'
| + echo 'ppce500v2-.*-linux.*'
| + for pt in '$platform_extra'
| + echo 'powerpc-.*-linux.*'
| + for pt in '$platform_extra'
| + echo 'noarch-.*-linux.*'
| + for pt in '$platform_extra'
| + echo 'any-.*-linux.*'
| + for pt in '$platform_extra'
| + echo 'all-.*-linux.*'
| + mkdir -p /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/etc/rpm/sysinfo
| + echo /
| + '[' '!' -z '' ']'
| + mkdir -p /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/install
| + echo '# Install manifest'
| + '[' xlinux-gnuspe = xlinux ']'
| + '[' xlinux-gnuspe = xlinux-gnueabi ']'
| + '[' '!' -z 'task-core-boot ' ']'
| + for pkg in '${package_to_install}'
| + echo 'Processing task-core-boot...'
| Processing task-core-boot...
| ++ resolve_package_rpm task-core-boot
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/solvedb.conf
| ++ local pkg=task-core-boot
| ++ local conffile=/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/solvedb.conf
| ++ local pkg_name=
| +++ cat /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/solvedb.conf
| ++ for solve in '`cat ${conffile}`'
| +++ rpm --dbpath /var/lib/rpm '--define=_openall_before_chroot 1' -D
'_dbpath /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb/solvedb'
-D '__dbi_txn create nofsync' -q --yaml task-core-boot
| +++ grep -i Packageorigin
| +++ cut -d : -f 2
| ++ pkg_name='
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb/task-core-boot-1.0-r7.p2020rdb.rpm'
| ++ '[' -n ' /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb/task-core-boot-1.0-r7.p2020rdb.rpm'
']'
| ++ break
| ++ echo /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb/task-core-boot-1.0-r7.p2020rdb.rpm
| + pkg_name=/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb/task-core-boot-1.0-r7.p2020rdb.rpm
| + '[' -z /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb/task-core-boot-1.0-r7.p2020rdb.rpm
']'
| + echo /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb/task-core-boot-1.0-r7.p2020rdb.rpm
| ++ cat /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/solvedb.macro
| + rpm --dbpath /var/lib/rpm '--define=_openall_before_chroot 1'
--predefine '_rpmds_sysinfo_path
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/etc/rpm/sysinfo'
--predefine '_rpmrc_platform_path
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/etc/rpm/platform'
-D '_dbpath /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/install'
-D '_solve_dbpath
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/p2020rdb/solvedb:/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/ppce500v2/solvedb:/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/deploy/rpm/all/solvedb'
-D '__dbi_txn create nofsync' -U --justdb --noscripts --notriggers
--noparentdirs --nolinktos --ignoresize
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/install/install.manifest
| error: LOOP:
| error: removing busybox-udhcpc-1.17.3-r2.ppce500v2 "Requires(post):
/bin/sh" from tsort relations.
| error: removing busybox-1.17.3-r2.ppce500v2 "Requires(hint):
busybox-udhcpc" from tsort relations.
| error: LOOP:
| error: removing busybox-syslog-1.17.3-r2.ppce500v2 "Requires(post):
/bin/sh" from tsort relations.
| error: removing busybox-1.17.3-r2.ppce500v2 "Requires(hint):
busybox-syslog" from tsort relations.
| error: LOOP:
| error: removing libudev0-164-r1.ppce500v2 "Requires: udev = 164-r1"
from tsort relations.
| error: removing udev-164-r1.ppce500v2 "Requires: libudev0 >= 164"
from tsort relations.
| + '[' '!' -z '' ']'
| + loop=0
| + '[' 0 -eq 1 ']'
| + echo 'Manifest:
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/install/install.manifest'
| Manifest: /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/install/install.manifest
| + rpm --dbpath /var/lib/rpm '--define=_openall_before_chroot 1' -D
'_dbpath /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/install'
-qa --yaml -D '__dbi_txn create nofsync private'
| + grep -i Packageorigin
| + cut -d : -f 2
| + rpm --dbpath /var/lib/rpm '--define=_openall_before_chroot 1'
--root /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs
--predefine '_rpmds_sysinfo_path
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/etc/rpm/sysinfo'
--predefine '_rpmrc_platform_path
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/etc/rpm/platform'
-D '_dbpath /var/lib/rpm' --noscripts --notriggers --noparentdirs
--nolinktos -D '__dbi_txn create nofsync private' -Uhv
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/install/install_solution.manifest
| error: LOOP:
| error: removing busybox-1.17.3-r2.ppce500v2 "Requires(hint):
busybox-udhcpc" from tsort relations.
| error: removing busybox-udhcpc-1.17.3-r2.ppce500v2 "Requires(post):
/bin/sh" from tsort relations.
| error: LOOP:
| error: removing busybox-syslog-1.17.3-r2.ppce500v2 "Requires(post):
/bin/sh" from tsort relations.
| error: removing busybox-1.17.3-r2.ppce500v2 "Requires(hint):
busybox-syslog" from tsort relations.
| error: LOOP:
| error: removing udev-164-r1.ppce500v2 "Requires: libudev0 >= 164"
from tsort relations.
| error: removing libudev0-164-r1.ppce500v2 "Requires: udev = 164-r1"
from tsort relations.
| Preparing...                ##################################################
| ERROR: Function 'do_rootfs' failed (see
/home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/temp/log.do_rootfs.12166
for further information)
NOTE: package core-image-minimal-1.0-r0: task do_rootfs: Failed
ERROR: Task 8 (/home/leon/sandbox/sidebranch/yocto/oe-core/meta/recipes-core/images/core-image-minimal.bb,
do_rootfs) failed with exit code '1'
ERROR: '/home/leon/sandbox/sidebranch/yocto/oe-core/meta/recipes-core/images/core-image-minimal.bb'
failed

Regards,
-- 
Leon



-- 
Leon


