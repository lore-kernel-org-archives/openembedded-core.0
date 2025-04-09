Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F9AC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 14:30:03 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.10054.1744209000266787556
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 07:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=geSBStUO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 325BD44380;
	Wed,  9 Apr 2025 14:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744208998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oABtnEzuDCYNOM10ARvDIJn8169RaXy5+/EE4dgm7Ks=;
	b=geSBStUO8U/f2tm6uFjZJEz6Mlutqh8Qr8spwcFjebTihUZWq7GuagomEPAkybbOYw5wg0
	vflJZMucaMZC0AFet3UI9o2t53xHA1hyOmw9gTDFENbYyl/bgo6SgI2iZkklI9PwHwRk08
	3sqEvKzq+mQuNvV2hrcoO0y4iItYKmIF8yZlMvfZVPoidedge2a3Mlz7u8lv9POWx1sHfU
	myTynFeFqFJrcuMwyzi+yxzKRdkYazAfZ8FoR6xFqKFc0IEPsHUL2559Xx7J/87A3KD8Cc
	YMNU0D+uGL4PLtjLUheIgtr6UXXEhrYbILq9ZclUOHxGwWJpwxf8/c454hCTUA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Apr 2025 16:29:57 +0200
Message-Id: <D926HJUGOVD7.WS65R1LTLOYT@bootlin.com>
Subject: Re: [OE-core] [PATCH] wic: do not ignore ROOTFS_SIZE if the rootfs
 is modified
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <twoerner@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250408205709.7013-1-twoerner@gmail.com>
In-Reply-To: <20250408205709.7013-1-twoerner@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeivdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthifohgvrhhnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghms
 ggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 14:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214592

On Tue Apr 8, 2025 at 10:57 PM CEST, Trevor Woerner via lists.openembedded.=
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
> 		part /boot --ondisk=3Dvda --align 64 --size=3D100M --active --source bo=
otimg-partition --fstype=3Dext4 --label boot --sourceparams=3D"loader=3Du-b=
oot"
> 		part /     --ondisk=3Dvda                                 --source root=
fs            --fstype=3Dext4 --label root
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
> 		part /     --ondisk=3Dvda --exclude-path boot/            --source root=
fs            --fstype=3Dext4 --label root
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

Thanks for your patch.

I do have some build issue on the autobuilder:

2025-04-09 11:14:21,897 - oe-selftest - INFO - wic.Wic.test_exclude_path_wi=
th_extra_space (subunit.RemotedTestCase)
2025-04-09 11:14:21,898 - oe-selftest - INFO -  ... FAIL
...
[Wed Apr  9 11:01:08 2025] (1309377/1309395): 192.168.7.4:53040 UA:elfutils=
/0.192,Linux/x86_64,/ XFF: GET /buildid/da3aea1c8160034e1b0961a7f2b5ce5c5a9=
5553b/debuginfo 200 237848 0+9ms
ERROR: When reparsing /tmp/selftest-fetchw3a6djws/test.bb:do_checkuri, the =
basehash value changed from 84b9e23a83a764e7a5d8a96ee523199e2b1c604f4280a45=
030e248de0ff52962 to 4123da244f465feffecb2b4fd2b132b64851981ec2fb70bf9445df=
8b0ea6a69e. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake test -cdo_checkuri -Snone
ERROR: Then:
ERROR: $ bitbake test -cdo_checkuri -Sprintdiff

ERROR: When reparsing /tmp/selftest-fetchw3a6djws/test.bb:do_fetch, the bas=
ehash value changed from 6d55d6743729b615749dc016857d7e5f9c884a8b92f0d57f68=
e743f4910333d3 to fa7d6ea0563b60362418d2a6c5e41a6684183d01ec578b65abd0c64a9=
cfba7cf. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake test -cdo_fetch -Snone
ERROR: Then:
ERROR: $ bitbake test -cdo_fetch -Sprintdiff

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1329

I tried to reproduce this locally, and reproduced a fail with
"oe-selftest -r wic.Wic.test_exclude_path_with_extra_space", but with a
different error:

| INFO: Creating image(s)...
|
| DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-c=
ontrib/scripts/lib/wic/plugins/imager/direct.py
| DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-c=
ontrib/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
| DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-c=
ontrib/scripts/lib/wic/plugins/source/empty.py
| DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-c=
ontrib/scripts/lib/wic/plugins/source/bootimg-efi.py
| DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-c=
ontrib/scripts/lib/wic/plugins/source/bootimg-pcbios.py
| DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-c=
ontrib/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
| DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-c=
ontrib/scripts/lib/wic/plugins/source/bootimg-partition.py
| DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-c=
ontrib/scripts/lib/wic/plugins/source/rootfs.py
| DEBUG: loading plugin module /home/mdubois-briand/swat/oe-sefltest/poky-c=
ontrib/scripts/lib/wic/plugins/source/rawcopy.py
| DEBUG: _exec_cmd: install -d /home/mdubois-briand/swat/oe-sefltest/poky-c=
ontrib/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-w=
ic/boot.1
| DEBUG: ['install', '-d', '/home/mdubois-briand/swat/oe-sefltest/poky-cont=
rib/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/=
boot.1']
| DEBUG: _exec_cmd: output for install -d /home/mdubois-briand/swat/oe-sefl=
test/poky-contrib/build-st/tmp/work/qemux86_64-poky-linux/core-image-minima=
l/1.0/tmp-wic/boot.1 (rc =3D 0):
| ERROR: No boot files defined, IMAGE_BOOT_FILES unset for entry #1

So maybe I'm missing something here.

The exact branch I used for this build should be available in
https://web.git.yoctoproject.org/poky-ci-archive/tag/?h=3Dautobuilder.yocto=
project.org/valkyrie/a-full-1372,
but the mirror seems out of sync. I hope it will be there a bit later
today.

Can you have a look at this, please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


