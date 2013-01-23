Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ty4M5-0007tQ-6N
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 18:43:29 +0100
Received: by mail-pb0-f49.google.com with SMTP id un15so4784100pbc.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 09:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=qESBAGF82fJbZVTf3RsRxORjUvA+L6aVuvc6S8MfgBg=;
	b=pDsOQyXXPLgZ+eGonKSnR8nyYfT4fWKSmW1xGpDyKS396vIUkj4HQDihwMerk4ywTx
	1UnUj1IlARvWMF0G2fWYc342OYTcVzv3WCp5VPSlM54D4h/lVR4NABk9pydvJgGXIv09
	4UHe20+4vHWtbru0tfWnYkjteugsP6QWtHBG0I0bkSP08CShFpJDpV5ConLClTV8EUN2
	Bs7KTcJS/Ad6onvhexvH7a3jG0HxBfRTRXHPyw6C0Cgy3ef8ePJnVvHMKTP/3EpT+5qN
	LkpTH7l9bjUsvwfHRHmd8lSTFFtWdPta9AO/szAmSDNS+VyzdR0ZLnsEfyGDFgNaMuqJ
	qKHQ==
X-Received: by 10.68.135.40 with SMTP id pp8mr5568322pbb.63.1358962068469;
	Wed, 23 Jan 2013 09:27:48 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ql9sm13143199pbc.61.2013.01.23.09.27.45
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 23 Jan 2013 09:27:47 -0800 (PST)
Date: Wed, 23 Jan 2013 18:27:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130123172748.GB14381@jama.palm1.palmone.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: File conflicts between PN-doc packages
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
X-List-Received-Date: Wed, 23 Jan 2013 17:43:30 -0000
X-Groupsio-MsgNum: 34296
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm testing changes to allow world-image builds=20
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3505

And even with very small subset of oe-core I got a lot of file
conflicts mostly between PN-doc packages.

We can return --force-overwrite to do_rootfs installs, but that=20
only moves this issue to end user trying to install e.g.=20
util-linux-doc and e2fsprogs-doc.

Do we want u-a used for stuff like doc?=20

What about conflicting .debug stuff from console-tools-dbg and kbd-dbg?

We can use:
1) u-a
   + most correct behavior
   - more metadata
2) RCONFLICTS
   + proper message to end user
3) EXCLUDE_FROM_WORLD_IMAGE
   - doesn't test installation for all PACKAGEs just because some are confl=
icting
4) EXCLUDED_PACKAGES_FROM_WORLD_IMAGE
   + exclude only some items from PACKAGES list
5) some combination of above
   e.g. RCONFLICTS for PN-dbg, u-a for PN-doc

Here is whole list, but be aware that this is only about 2/5 of oe-core, 33=
3 recipes from 826.
|  * check_data_file_clashes: Package gcc-doc wants to install file rootfs/=
usr/share/info/dir
|       But that file is already provided by package  * automake-doc
|  * check_data_file_clashes: Package eglibc-doc wants to install file root=
fs/usr/share/info/dir
|       But that file is already provided by package  * automake-doc
|  * check_data_file_clashes: Package initramfs-framework-base wants to ins=
tall file rootfs/init
|       But that file is already provided by package  * initramfs-live-boot
|  * check_data_file_clashes: Package initramfs-framework-base wants to ins=
tall file rootfs/init
|       But that file is already provided by package  * initramfs-live-boot
|  * check_data_file_clashes: Package tinylogin wants to install file rootf=
s/sbin/sulogin
|       But that file is already provided by package  * sysvinit-sulogin
|  * check_data_file_clashes: Package initramfs-boot wants to install file =
rootfs/init
|       But that file is already provided by package  * initramfs-live-boot
|  * check_data_file_clashes: Package eglibc-mtrace wants to install file r=
ootfs/usr/bin/mtrace
|       But that file is already provided by package  * eglibc-scripts
|  * check_data_file_clashes: Package eglibc-mtrace wants to install file r=
ootfs/usr/bin/mtrace
|       But that file is already provided by package  * eglibc-scripts
|  * check_data_file_clashes: Package coreutils-doc wants to install file r=
ootfs/usr/share/man/man1/groups.1
|       But that file is already provided by package  * shadow-doc
|  * check_data_file_clashes: Package initramfs-boot wants to install file =
rootfs/init
|       But that file is already provided by package  * initramfs-live-boot
|  * check_data_file_clashes: Package binutils-doc wants to install file ro=
otfs/usr/share/info/standards.info
|       But that file is already provided by package  * autoconf-doc
|  * check_data_file_clashes: Package tinylogin wants to install file rootf=
s/sbin/sulogin
|       But that file is already provided by package  * sysvinit-sulogin
|  * check_data_file_clashes: Package initramfs-boot wants to install file =
rootfs/init
|       But that file is already provided by package  * initramfs-live-boot
|  * check_data_file_clashes: Package initramfs-framework-base wants to ins=
tall file rootfs/init
|       But that file is already provided by package  * initramfs-live-boot
|  * check_data_file_clashes: Package initramfs-framework-base wants to ins=
tall file rootfs/init
|       But that file is already provided by package  * initramfs-live-boot
|  * check_data_file_clashes: Package tinylogin wants to install file rootf=
s/sbin/sulogin
|       But that file is already provided by package  * sysvinit-sulogin
|  * check_data_file_clashes: Package eglibc-mtrace wants to install file r=
ootfs/usr/bin/mtrace
|       But that file is already provided by package  * eglibc-scripts
|  * check_data_file_clashes: Package kbd-dbg wants to install file rootfs/=
usr/bin/.debug/setleds
|       But that file is already provided by package  * console-tools-dbg
|  * check_data_file_clashes: Package kbd-dbg wants to install file rootfs/=
usr/bin/.debug/showkey
|       But that file is already provided by package  * console-tools-dbg
|  * check_data_file_clashes: Package kbd-dbg wants to install file rootfs/=
usr/bin/.debug/dumpkeys
|       But that file is already provided by package  * console-tools-dbg
|  * check_data_file_clashes: Package kbd-dbg wants to install file rootfs/=
usr/bin/.debug/setmetamode
|       But that file is already provided by package  * console-tools-dbg
|  * check_data_file_clashes: Package kbd-dbg wants to install file rootfs/=
usr/bin/.debug/kbd_mode
|       But that file is already provided by package  * console-tools-dbg
|  * check_data_file_clashes: Package kbd-dbg wants to install file rootfs/=
usr/bin/.debug/getkeycodes
|       But that file is already provided by package  * console-tools-dbg
|  * check_data_file_clashes: Package kbd-dbg wants to install file rootfs/=
usr/bin/.debug/loadkeys
|       But that file is already provided by package  * console-tools-dbg
|  * check_data_file_clashes: Package kbd-dbg wants to install file rootfs/=
usr/bin/.debug/psfaddtable
|       But that file is already provided by package  * console-tools-dbg
|  * check_data_file_clashes: Package kbd-dbg wants to install file rootfs/=
usr/bin/.debug/setkeycodes
|       But that file is already provided by package  * console-tools-dbg
|  * check_data_file_clashes: Package kbd-dbg wants to install file rootfs/=
usr/bin/.debug/psfgettable
|       But that file is already provided by package  * console-tools-dbg
|  * check_data_file_clashes: Package kbd-dbg wants to install file rootfs/=
usr/bin/.debug/psfstriptable
|       But that file is already provided by package  * console-tools-dbg
|  * check_data_file_clashes: Package util-linux-doc wants to install file =
rootfs/usr/share/man/man8/fsck.8
|       But that file is already provided by package  * e2fsprogs-doc
|  * check_data_file_clashes: Package util-linux-doc wants to install file =
rootfs/usr/share/man/man8/blkid.8
|       But that file is already provided by package  * e2fsprogs-doc
|  * check_data_file_clashes: Package util-linux-doc wants to install file =
rootfs/usr/share/man/man8/findfs.8
|       But that file is already provided by package  * e2fsprogs-doc
|  * check_data_file_clashes: Package util-linux-doc wants to install file =
rootfs/usr/share/man/man8/sulogin.8
|       But that file is already provided by package  * sysvinit-doc
|  * check_data_file_clashes: Package util-linux-doc wants to install file =
rootfs/usr/share/man/man3/uuid.3
|       But that file is already provided by package  * libossp-uuid-doc
|  * check_data_file_clashes: Package util-linux-doc wants to install file =
rootfs/usr/share/man/man3/libblkid.3
|       But that file is already provided by package  * e2fsprogs-doc
|  * check_data_file_clashes: Package util-linux-doc wants to install file =
rootfs/usr/share/man/man1/utmpdump.1
|       But that file is already provided by package  * sysvinit-doc
|  * check_data_file_clashes: Package util-linux-doc wants to install file =
rootfs/usr/share/man/man1/mountpoint.1
|       But that file is already provided by package  * sysvinit-doc
|  * check_data_file_clashes: Package util-linux-doc wants to install file =
rootfs/usr/share/man/man1/reset.1
|       But that file is already provided by package  * ncurses-doc
|  * check_data_file_clashes: Package util-linux-doc wants to install file =
rootfs/usr/share/man/man1/wall.1
|       But that file is already provided by package  * sysvinit-doc
|  * check_data_file_clashes: Package util-linux-doc wants to install file =
rootfs/usr/share/man/man1/mesg.1
|       But that file is already provided by package  * sysvinit-doc
|  * check_data_file_clashes: Package util-linux-doc wants to install file =
rootfs/usr/share/man/man1/last.1
|       But that file is already provided by package  * sysvinit-doc
|  * check_data_file_clashes: Package tinylogin wants to install file rootf=
s/sbin/sulogin
|       But that file is already provided by package  * sysvinit-sulogin

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEAHZQACgkQN1Ujt2V2gBzRbACdH6Qw5SHABBbEH6gHZG6g4Mty
/uwAn1Q8n4yfxmDi7Lca6QbYDSypvRdE
=62BH
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
