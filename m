Received: from exprod5og109.obsmtp.com ([64.18.0.188])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Malcolm.Crossley@ge.com>) id 1QmW50-0002XZ-Hd
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 21:17:10 +0200
Received: from Cinmlip08.e2k.ad.ge.com ([12.71.149.1]) (using TLSv1) by
	exprod5ob109.postini.com ([64.18.4.12]) with SMTP
	ID DSNKTjG0tWWQojlQJitgCFVPlK9q0VKk0Z6r@postini.com;
	Thu, 28 Jul 2011 12:12:56 PDT
Received: from unknown (HELO cinmlef06.e2k.ad.ge.com) ([3.159.213.37])
	by Cinmlip08.e2k.ad.ge.com with ESMTP; 28 Jul 2011 11:42:15 -0400
Received: from LONMLVEM04.e2k.ad.ge.com ([3.159.240.52]) by
	cinmlef06.e2k.ad.ge.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 28 Jul 2011 11:39:11 -0400
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 28 Jul 2011 16:42:11 +0100
Message-ID: <65A75BC37EC7EE4F88AB5EB98759A97003E6E32F@LONMLVEM04.e2k.ad.ge.com>
In-Reply-To: <1F827C13-EF18-4D1E-AAA1-381361929F39@kernel.crashing.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [yocto] mpc8315e-rdb core-image-minimal fails
Thread-Index: AcxNMf01c9FpkKXxQh2sfhiX1lZa2wACkvvQ
References: <1F827C13-EF18-4D1E-AAA1-381361929F39@kernel.crashing.org>
From: "Crossley, Malcolm (GE Intelligent Platforms)" <Malcolm.Crossley@ge.com>
To: "Kumar Gala" <galak@kernel.crashing.org>,
	"Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
X-OriginalArrivalTime: 28 Jul 2011 15:39:11.0257 (UTC)
	FILETIME=[7F183090:01CC4D3C]
Cc: Yocto discussion list <yocto@yoctoproject.org>
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
X-List-Received-Date: Thu, 28 Jul 2011 19:17:10 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Hi Kumar,

I'm just debugging the same issue.

It's caused by folder for the target specific packages being mis-named
"powerpcppc603e" instead of "ppc603e" which the rpm package bbclass is
expecting.=20

I haven't figured out why this is happening yet but I have a workaround
which is to move ${BUILD_DIR}/deploy/rpm/powerpcppc603e to
${BUILD_DIR}/deploy/rpm/ppc603e.

I will let you know as soon as I find the cause.=20

Regards

Malcolm

-----Original Message-----
From: yocto-bounces@yoctoproject.org
[mailto:yocto-bounces@yoctoproject.org] On Behalf Of Kumar Gala
Sent: 28 July 2011 15:26
To: Patches and discussions about the oe-core layer
Cc: Yocto discussion list
Subject: [yocto] mpc8315e-rdb core-image-minimal fails

Anyone got any ideas about the following:

| ERROR: Function 'do_rootfs' failed (see
/local/home/galak/git/poky/build/tmp/work/mpc8315e_rdb-poky-linux/core-i
mage-minimal-1.0-r0/temp/log.do_rootfs.19834 for fu
rther information)
| Generating solve db for
/local/home/galak/git/poky/build/tmp/deploy/rpm/mpc8315e_rdb...
|    total:               1      0.000000 MB      1.573137 secs
|    fingerprint:       816      0.004148 MB      0.062215 secs
|    install:           272      0.000000 MB      0.384963 secs
|    dbadd:             272      0.000000 MB      0.375238 secs
|    dbget:            1111      0.000000 MB      0.003093 secs
|    dbput:             272      1.315744 MB      0.302582 secs
|    readhdr:          2721      2.573624 MB      0.178385 secs
|    hdrload:          1360      3.828344 MB      0.007262 secs
|    hdrget:          49259      0.000000 MB      0.048944 secs
| Generating solve db for
/local/home/galak/git/poky/build/tmp/deploy/rpm/all...
|    total:               1      0.000000 MB      0.111129 secs
|    fingerprint:        18      0.000024 MB      0.000280 secs
|    install:             6      0.000000 MB      0.044466 secs
|    dbadd:               6      0.000000 MB      0.039504 secs
|    dbget:              19      0.000000 MB      0.000103 secs
|    dbput:               6      0.018916 MB      0.006250 secs
|    readhdr:            61      0.038096 MB      0.000212 secs
|    hdrload:            33      0.063864 MB      0.000327 secs
|    hdrget:            983      0.000000 MB      0.001306 secs
| Generating solve db for
/local/home/galak/git/poky/build/tmp/deploy/rpm/all...
| Processing task-core-boot...
| error: Failed dependencies:
|       tinylogin is needed by task-core-boot-1.0-r7.mpc8315e_rdb
|       busybox is needed by task-core-boot-1.0-r7.mpc8315e_rdb
|       modutils-initscripts is needed by
task-core-boot-1.0-r7.mpc8315e_rdb
|       initscripts is needed by task-core-boot-1.0-r7.mpc8315e_rdb
|       update-alternatives-cworth is needed by
task-core-boot-1.0-r7.mpc8315e_rdb
|       udev is needed by task-core-boot-1.0-r7.mpc8315e_rdb
|       sysvinit is needed by task-core-boot-1.0-r7.mpc8315e_rdb
|       netbase is needed by task-core-boot-1.0-r7.mpc8315e_rdb
|       base-passwd is needed by task-core-boot-1.0-r7.mpc8315e_rdb
|       console-tools is needed by keymaps-1.0-r19.mpc8315e_rdb
|       initscripts is needed by keymaps-1.0-r19.mpc8315e_rdb
|       /bin/sh is needed by keymaps-1.0-r19.mpc8315e_rdb
NOTE: package core-image-minimal-1.0-r0: task do_rootfs: Failed
ERROR: Task 8
(/local/home/galak/git/poky/meta/recipes-core/images/core-image-minimal.
bb, do_rootfs) failed with exit code '1'
ERROR:
'/local/home/galak/git/poky/meta/recipes-core/images/core-image-minimal.
bb' failed

- k
_______________________________________________
yocto mailing list
yocto@yoctoproject.org
https://lists.yoctoproject.org/listinfo/yocto


