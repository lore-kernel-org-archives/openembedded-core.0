Return-Path: <vm.rod25@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id EB316605F1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 15:45:48 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so43064111ied.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 08:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=SkfoKMHgQ7t4j9hcRTrdtvGnMMhNxtPZXgYtvpFIvz0=;
	b=sCxxxVyO33+4f7zRoYek6jpt18+0TgmrYejbc07+AzO/0byI1ihH700TMHzxymlM63
	nHG6/S69keDtDeo2zYLBCKKsiRaTF/rkrGP6iiY6P+08bAZVw9ycFS0EiIJZhcEeqA+R
	ubH25nFi3fyih47TV5yktf2iU+Qdm728cZ+0JeMxr5xarpn+O4egMBzgQIfLzjW0e4kc
	08eGEWyHImz1EjEBZXNxJROLlKHjyu/oIaYTVBrLkiqGbzLdwdb4CNS83H9odvKWFn7Q
	iXp3HMQJwz8egoVwdbLdx5rZlJSvvVQ2jDkJZ95WvIBPvxBsIXUi4g0Ss+wf8fSB2wm6
	104w==
MIME-Version: 1.0
X-Received: by 10.50.111.10 with SMTP id ie10mr5455539igb.15.1428767149635;
	Sat, 11 Apr 2015 08:45:49 -0700 (PDT)
Received: by 10.50.141.228 with HTTP; Sat, 11 Apr 2015 08:45:49 -0700 (PDT)
Date: Sat, 11 Apr 2015 10:45:49 -0500
Message-ID: <CAK5mtex2DWeHiDc3mHtQDnUcVSrHyUcjb-ON0KdKRFgV5CEcVQ@mail.gmail.com>
From: Victor Rodriguez <vm.rod25@gmail.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-core@lists.openembedded.org
Subject: How to export variable in bitbake build for MPICH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Apr 2015 15:45:49 -0000
Content-Type: multipart/alternative; boundary=089e0149c0546bbf51051374c680

--089e0149c0546bbf51051374c680
Content-Type: text/plain; charset=UTF-8

HI MPICH build is facing a problem due to the fact that the configure has a
variable call BASH_SHELL the which set the bash shell of the developer
computer. However if the developer has /usr/bin/bash  the configure set
this for the rest of compilation ( you can check this in config.log). Due
to the fact that Yocto just has /bin/bash the build of any image that
includes mpich fails.

ERROR: Unable to install packages. Command
'/home/vrodri3/poky/build/tmp/sysroots/x86_64-linux/usr/bin/smart --quiet
--data-dir=/home/vrodri3/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs/var/lib/smart
install -y mpich@i586 gcc@i586 run-postinsts@all
packagegroup-core-boot@qemux86 bash@i586' returned 1:
error: Can't install mpich-3.1.1-r0@i586: no package provides /usr/bin/bash


I tested on the mpich src and the problem is fixed with a simple :

export BASH_SHELL=/bin/bash

( configure does not have an option for this )

I have 2 points :

1) When I do the same export and then bitbake os-core-image-minimal the
build still fails , Why is that happening?

2) What is the best way to fix this ? How can I set the environment
variable on the recipe ? Should I patch the Configure ?

Thanks a lot and regards

Victor Rodriguez

--089e0149c0546bbf51051374c680
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>HI MPICH build is facing a problem due to the fa=
ct that the configure has a variable call BASH_SHELL the which set the bash=
 shell of the developer computer. However if the developer has /usr/bin/bas=
h=C2=A0 the configure set this for the rest of compilation ( you can check =
this in config.log). Due to the fact that Yocto just has /bin/bash the buil=
d of any image that includes mpich fails. <br><br>ERROR: Unable to install =
packages. Command &#39;/home/vrodri3/poky/build/tmp/sysroots/x86_64-linux/u=
sr/bin/smart --quiet --data-dir=3D/home/vrodri3/poky/build/tmp/work/qemux86=
-poky-linux/core-image-minimal/1.0-r0/rootfs/var/lib/smart install -y mpich=
@i586 gcc@i586 run-postinsts@all packagegroup-core-boot@qemux86 bash@i586&#=
39; returned 1:<br>error: Can&#39;t install mpich-3.1.1-r0@i586: no package=
 provides /usr/bin/bash<br><br><br></div>I tested on the mpich src and the =
problem is fixed with a simple : <br><br>export BASH_SHELL=3D/bin/bash<br><=
br></div><div>( configure does not have an option for this ) <br></div><div=
><br></div><div>I have 2 points : <br><br></div><div>1) When I do the same =
export and then bitbake os-core-image-minimal the build still fails , Why i=
s that happening?<br><br></div><div>2) What is the best way to fix this ? H=
ow can I set the environment variable on the recipe ? Should I patch the Co=
nfigure ?=C2=A0 <br><br></div><div>Thanks a lot and regards<br><br></div><d=
iv>Victor Rodriguez<br><br></div></div>

--089e0149c0546bbf51051374c680--
