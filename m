Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5FEC369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 11:40:42 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.47841.1744630837670197814
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 04:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=otz/bwuZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6AB56438FF;
	Mon, 14 Apr 2025 11:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744630835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+XWcbMY1nf3UnEnrQG52ik+ldOZE9yAY+75SKAS8i9M=;
	b=otz/bwuZ+XW/xvUOQdYLYOS1yMUl1dZnp9cTpLnpn3EMkGgLe9S40G1Eh2xo3PR8VSD4G5
	uCG2/HqfkomU4TfZPc+ruGo2KR58Lgm9C188iVSjziFFInpfxU5TRX5L8SdWoHlBruz87O
	O0whxRRWOPfktIxM26cUw5V5/jx6zcLcK/bI0QSL2xzeLEEpO1/1R/LShNfDM/8vOT+179
	ep29RL1YQNljBjq1CE9q/9SdVrIJmh8odRRhNqlotAOQVX3nlK84DpWW8iTRsy6rr0HcTU
	Xogzk4W5oD/+BzHAoJCFNADOeTobvNu6rhdtLJJ7lW0GN+tBAt/iKuLxCmRX2g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Apr 2025 13:40:34 +0200
Message-Id: <D96C0KR6XEKH.25C14VR7MLUOK@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] wic: do not ignore ROOTFS_SIZE if the
 rootfs is modified
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <twoerner@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250410113626.9057-1-twoerner@gmail.com>
In-Reply-To: <20250410113626.9057-1-twoerner@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemfegvtggsmegsgedvkeemudgvhedumeeljeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemfegvtggsmegsgedvkeemudgvhedumeeljeelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthifohgvrhhnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguv
 gguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 11:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214801

On Thu Apr 10, 2025 at 1:36 PM CEST, Trevor Woerner via lists.openembedded.=
org wrote:
> If the *.wks file contains a "--source rootfs" then
> lib/wic/plugins/source/rootfs.py will be invoked to generate (what is ass=
umed
> to be) the rootfs partition. If the rootfs partition needs to be tweaked =
or
> modified, the "rootfs.py" plugin will make a copy of the filesystem and t=
hen
> perform the changes on that copy. In other words, if the "--source rootfs=
"
> line of the *.wks file also contains any of:
>
> 	--exclude-path
> 	--include-path
> 	--change-directory
> 	--use-label (i.e. modify etc/fstab)
>
> then the rootfs will be copied first, then the copy is modified.
>
> If, for example, the unmodified IMAGE_ROOTFS is:
>
> 	.../tmp/work/qemuarm64_secureboot-oe-linux/core-image-base/1.0/rootfs
>
> then the copy would be made at:
>
> 	.../tmp/work/qemuarm64_secureboot-oe-linux/core-image-base/1.0/tmp-wic/r=
ootfs${LINENO}
>
> where ${LINENO} is the line number where this "--source rootfs" line appe=
ars
> in the *wks file.
>
> When it comes time to make an actual partition of a specific filesystem t=
ype,
> lib/wic/partition.py::prepare_rootfs() is called. It is in this function =
that
> wic figures out if any extra size needs to be added. The bitbake variable=
 used
> to specify the ultimate rootfs size is ROOTFS_SIZE, and since this variab=
le is
> only valid for the rootfs (and not any other partitions), the code also
> verifies that the partition being created is ${IMAGE_ROOTFS}:
>
> 	rsize_bb =3D get_bitbake_var('ROOTFS_SIZE')
> 	rdir =3D get_bitbake_var('IMAGE_ROOTFS')
> 	if rsize_bb and rdir =3D=3D rootfs_dir:
> 		<use rsize_bb>
> 	else:
> 		<calculate the partition size using "du -ks $p">
>
> As noted above, if lib/wic/plugins/source/rootfs.py has made a copy, then=
 the
> "rdir =3D=3D rootfs_dir" clause will fail and the code will assume this p=
artition
> is not a rootfs since the strings do not compare equal.
>
> Therefore, in order to determine if this is a rootfs, retain the existing
> "rdir =3D=3D rootfs_dir" comparison, but also add another one to check wh=
ether or
> not this is a wic-generated copy of the rootfs.
>
> STEPS TO REPRODUCE:
> 	- start with the following *wks file:
> 		bootloader --ptable gpt
> 		part /boot --size=3D100M --active --fstype=3Dext4 --label boot
> 		part /     --source rootfs      --fstype=3Dext4 --label root
> 	- and the following extra variable in conf/local.conf:
> 		IMAGE_ROOTFS_EXTRA_SPACE =3D "500000"
> 	- build an image
> 	- run it in qemu
> 		$ runqemu slirp nographic serial
> 	- verify the root partition has extra space:
> 		root@qemuarm64-secureboot:~# df -h
> 		Filesystem                Size      Used Available Use% Mounted on
> 		/dev/root               721.5M     67.4M    600.6M  10% /
> 		devtmpfs                477.7M         0    477.7M   0% /dev
> 		tmpfs                    40.0K         0     40.0K   0% /mnt
> 		tmpfs                   489.3M     92.0K    489.2M   0% /run
> 		tmpfs                   489.3M     68.0K    489.2M   0% /var/volatile
> 		/dev/vda1               120.4M     19.9M     91.4M  18% /boot
> 	- modify the "/" line of the *wks file to be:
> 		part /     --source rootfs      --fstype=3Dext4 --label root --exclude-=
path boot/
> 	- build image
>
> 	when it fails:
> 		root@qemuarm64-secureboot:~# df -h
> 		Filesystem                Size      Used Available Use% Mounted on
> 		/dev/root                73.4M     41.9M     25.8M  62% /
> 		devtmpfs                477.7M         0    477.7M   0% /dev
> 		tmpfs                    40.0K         0     40.0K   0% /mnt
> 		tmpfs                   489.3M     92.0K    489.2M   0% /run
> 		tmpfs                   489.3M     68.0K    489.2M   0% /var/volatile
> 		/dev/vda1               120.4M     19.9M     91.4M  18% /boot
>
> 	after this fix:
> 		root@qemuarm64-secureboot:~# df -h
> 		Filesystem                Size      Used Available Use% Mounted on
> 		/dev/root               721.5M     47.4M    620.6M   7% /
> 		devtmpfs                477.7M         0    477.7M   0% /dev
> 		tmpfs                    40.0K         0     40.0K   0% /mnt
> 		tmpfs                   489.3M     92.0K    489.2M   0% /run
> 		tmpfs                   489.3M     68.0K    489.2M   0% /var/volatile
> 		/dev/vda1               120.4M     19.9M     91.4M  18% /boot
>
> Doing the math we see that the /boot partition is ~20MB and in the first =
image
> the / partition contains this ~20MB in addition to the rest of the rootfs=
.
> This ~20MB is completely wasted since it is used in the / partition, but =
then
> the /boot partition is mounted on top of it, making the /boot directory o=
f /
> inaccessible. After the fix the / partition has an additional ~20MB since=
 the
> /boot portion is excluded.
>
> Fixes [YOCTO #15555]
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---

Hi Trevor,

Thanks for the v2, but I believe we still have an issue. Maybe a missing de=
pendency?

2025-04-13 19:18:05,421 - oe-selftest - INFO - FAIL: wic.Wic.test_exclude_p=
ath_with_extra_space (subunit.RemotedTestCase)
2025-04-13 19:18:05,421 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2025-04-13 19:18:05,421 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/=
selftest/cases/wic.py", line 567, in test_exclude_path_with_extra_space
    size_of_root_partition =3D int(runCmd("wic ls %s" % wicout).output.spli=
t('\n')[2].split()[3])
                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/=
utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'wic ls /srv/pokybuild/yocto-worker/oe-selftest-deb=
ian/build/build-st-2511849/tmp/deploy/images/qemux86-64/core-image-minimal-=
qemux86-64.rootfs-20250413181535.wic' returned non-zero exit status 1:
ERROR: Can't find executable parted

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1350

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


