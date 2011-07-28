Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/kyWCIH7jxcsuxTbqR8juWy1YI9bM0awg=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmSpz-0004iV-D1
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 17:49:28 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6SFj7UG008153;
	Thu, 28 Jul 2011 10:45:09 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <65A75BC37EC7EE4F88AB5EB98759A97003E6E32F@LONMLVEM04.e2k.ad.ge.com>
Date: Thu, 28 Jul 2011 10:45:08 -0500
Message-Id: <315B4992-8E1A-4DD3-8D3D-E8FD2436B365@kernel.crashing.org>
References: <1F827C13-EF18-4D1E-AAA1-381361929F39@kernel.crashing.org>
	<65A75BC37EC7EE4F88AB5EB98759A97003E6E32F@LONMLVEM04.e2k.ad.ge.com>
To: "Crossley, Malcolm (GE Intelligent Platforms)" <Malcolm.Crossley@ge.com>
X-Mailer: Apple Mail (2.1084)
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] mpc8315e-rdb core-image-minimal fails
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
X-List-Received-Date: Thu, 28 Jul 2011 15:49:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I think I know the cause, let me dig up the change that is related.  =
What bit is looking for just ppc603e?

- k

On Jul 28, 2011, at 10:42 AM, Crossley, Malcolm (GE Intelligent =
Platforms) wrote:

> Hi Kumar,
>=20
> I'm just debugging the same issue.
>=20
> It's caused by folder for the target specific packages being mis-named
> "powerpcppc603e" instead of "ppc603e" which the rpm package bbclass is
> expecting.=20
>=20
> I haven't figured out why this is happening yet but I have a =
workaround
> which is to move ${BUILD_DIR}/deploy/rpm/powerpcppc603e to
> ${BUILD_DIR}/deploy/rpm/ppc603e.
>=20
> I will let you know as soon as I find the cause.=20
>=20
> Regards
>=20
> Malcolm
>=20
> -----Original Message-----
> From: yocto-bounces@yoctoproject.org
> [mailto:yocto-bounces@yoctoproject.org] On Behalf Of Kumar Gala
> Sent: 28 July 2011 15:26
> To: Patches and discussions about the oe-core layer
> Cc: Yocto discussion list
> Subject: [yocto] mpc8315e-rdb core-image-minimal fails
>=20
> Anyone got any ideas about the following:
>=20
> | ERROR: Function 'do_rootfs' failed (see
> =
/local/home/galak/git/poky/build/tmp/work/mpc8315e_rdb-poky-linux/core-i
> mage-minimal-1.0-r0/temp/log.do_rootfs.19834 for fu
> rther information)
> | Generating solve db for
> /local/home/galak/git/poky/build/tmp/deploy/rpm/mpc8315e_rdb...
> |    total:               1      0.000000 MB      1.573137 secs
> |    fingerprint:       816      0.004148 MB      0.062215 secs
> |    install:           272      0.000000 MB      0.384963 secs
> |    dbadd:             272      0.000000 MB      0.375238 secs
> |    dbget:            1111      0.000000 MB      0.003093 secs
> |    dbput:             272      1.315744 MB      0.302582 secs
> |    readhdr:          2721      2.573624 MB      0.178385 secs
> |    hdrload:          1360      3.828344 MB      0.007262 secs
> |    hdrget:          49259      0.000000 MB      0.048944 secs
> | Generating solve db for
> /local/home/galak/git/poky/build/tmp/deploy/rpm/all...
> |    total:               1      0.000000 MB      0.111129 secs
> |    fingerprint:        18      0.000024 MB      0.000280 secs
> |    install:             6      0.000000 MB      0.044466 secs
> |    dbadd:               6      0.000000 MB      0.039504 secs
> |    dbget:              19      0.000000 MB      0.000103 secs
> |    dbput:               6      0.018916 MB      0.006250 secs
> |    readhdr:            61      0.038096 MB      0.000212 secs
> |    hdrload:            33      0.063864 MB      0.000327 secs
> |    hdrget:            983      0.000000 MB      0.001306 secs
> | Generating solve db for
> /local/home/galak/git/poky/build/tmp/deploy/rpm/all...
> | Processing task-core-boot...
> | error: Failed dependencies:
> |       tinylogin is needed by task-core-boot-1.0-r7.mpc8315e_rdb
> |       busybox is needed by task-core-boot-1.0-r7.mpc8315e_rdb
> |       modutils-initscripts is needed by
> task-core-boot-1.0-r7.mpc8315e_rdb
> |       initscripts is needed by task-core-boot-1.0-r7.mpc8315e_rdb
> |       update-alternatives-cworth is needed by
> task-core-boot-1.0-r7.mpc8315e_rdb
> |       udev is needed by task-core-boot-1.0-r7.mpc8315e_rdb
> |       sysvinit is needed by task-core-boot-1.0-r7.mpc8315e_rdb
> |       netbase is needed by task-core-boot-1.0-r7.mpc8315e_rdb
> |       base-passwd is needed by task-core-boot-1.0-r7.mpc8315e_rdb
> |       console-tools is needed by keymaps-1.0-r19.mpc8315e_rdb
> |       initscripts is needed by keymaps-1.0-r19.mpc8315e_rdb
> |       /bin/sh is needed by keymaps-1.0-r19.mpc8315e_rdb
> NOTE: package core-image-minimal-1.0-r0: task do_rootfs: Failed
> ERROR: Task 8
> =
(/local/home/galak/git/poky/meta/recipes-core/images/core-image-minimal.
> bb, do_rootfs) failed with exit code '1'
> ERROR:
> =
'/local/home/galak/git/poky/meta/recipes-core/images/core-image-minimal.
> bb' failed
>=20
> - k
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto



