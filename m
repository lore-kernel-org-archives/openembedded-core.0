Return-Path: <joel.maranhao@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id CF0AC757CE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 21:43:14 +0000 (UTC)
Received: by labbc20 with SMTP id bc20so62685715lab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 14:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=dZvNM9JdyqEmJje+mkY2I2DLmNtlZuPjntOOA2wIWdQ=;
	b=jDaQqqcix1aOrOZrS7rm6PFaMPh4yCunJI1DshCLb4JszM3szFeSMx3mydeD/j+9ps
	JYRoWbOnwb3uUzNGTSlyq1N4Q7H/CQ80sucQNvbGsEZmPJsLslIfaAME8j2yqzJ+BaIs
	ULFJlRMM0d01A07UlVt9ashuctqdHngI/wwLardZZmtPH4Z4UaIiFGrTnAK7bhd/fx9H
	WBKvplxdH2Jv8MyfnN0SrksdQvLm1NQf+EuWt0xBHAV9Ysaj53s/hpGQRD5LAIzKeUql
	cx/Dtti/EURAcUeWBxPUtyPFqyyYa7pemsEqXv8/Fzi/9bgGUdCxmLOFlg3taAytpdmk
	gBRA==
MIME-Version: 1.0
X-Received: by 10.152.116.6 with SMTP id js6mr14790026lab.28.1434663794546;
	Thu, 18 Jun 2015 14:43:14 -0700 (PDT)
Received: by 10.114.81.202 with HTTP; Thu, 18 Jun 2015 14:43:14 -0700 (PDT)
Date: Thu, 18 Jun 2015 23:43:14 +0200
Message-ID: <CAH2+=r9GKb9AkN01SNTvcvxCz4vFFiRgqmYV_0_a0G2h8YObxQ@mail.gmail.com>
From: =?UTF-8?B?am/Dq2wgbWFyYW5ow6Nv?= <joel.maranhao@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [yocto][meta-qt5] bitbake meta-toolchain-qt5 FAILED on Debian 8.1
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
X-List-Received-Date: Thu, 18 Jun 2015 21:43:16 -0000
Content-Type: multipart/alternative; boundary=001a11c237e8d8a06e0518d1b10d

--001a11c237e8d8a06e0518d1b10d
Content-Type: text/plain; charset=UTF-8

Hello there

Trying to build my Qt5 toolchain for Raspberry Pi2 on Yocto fido branch
(first timer).

Followed this brilliant tutorial
http://www.embarcados.com.br/raspberry-pi-2-qt5-yocto-parte-1/ and
http://www.embarcados.com.br/raspberry-pi-2-qt5-yocto-parte-2/ about the
building the toolchain.

I am getting the dependency error message below, and it looks like I may
have to simply give up on Debian Wheezy or Jessie (just want to make sure
with you guys before I do). Apparently this works on Ubuntu 14.04 which
requires me to get another machine. So any tips or tricks or way around
this would be great. Note that I absolutely do not need X11 for my project,
but it looks like I do need those libraries to build my toolchain.

THE FAILING COMMAND

    bitbake -v meta-toolchain-qt5

MY ERROR MESSAGE

Configuring packagegroup-core-standalone-sdk-target.
Collected errors:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for
packagegroup-qt5-toolchain-target:
 *  libx11-6 (>= 1.6.2) *  libxcb1 (>= 1.11) *  libxau6 (>= 1.0.8) *  libxdmcp6
(>= 1.1.1) *
 * opkg_install_cmd: Cannot install package
packagegroup-qt5-toolchain-target.

ERROR: Function failed: do_populate_sdk
ERROR: Logfile of failure stored in:
/home/otto/yocto/build/tmp/work/cortexa7hf-vfp-vfpv4-neon-poky-linux-gnueabi/meta-toolchain-qt5/1.0-r0/temp/log.do_populate_sdk.16122
ERROR: Task 7 (/home/otto/yocto/build/../poky/meta-qt5/recipes-qt/meta/
meta-toolchain-qt5.bb, do_populate_sdk) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3419 tasks of which 3418 didn't need to be
rerun and 1 failed.
No currently running tasks (3418 of 3420)

Summary: 1 task failed:
  /home/otto/yocto/build/../poky/meta-qt5/recipes-qt/meta/
meta-toolchain-qt5.bb, do_populate_sdk
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

I was able to narrow it down to this command

      /home/otto/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl -f
/home/otto/yocto/build/tmp/work/cortexa7hf-vfp-vfpv4-neon-poky-linux-gnueabi/meta-toolchain-qt5/1.0-r0/opkg.conf
-o
/home/otto/yocto/build/tmp/work/cortexa7hf-vfp-vfpv4-neon-poky-linux-gnueabi/meta-toolchain-qt5/1.0-r0/sdk/image/opt/poky/1.8/sysroots/cortexa7hf-vfp-vfpv4-neon-poky-linux-gnueabi
--force_postinstall --prefer-arch-to-version   install
packagegroup-core-standalone-sdk-target-dbg
packagegroup-core-standalone-sdk-target packagegroup-qt5-toolchain-target

packagegroup-qt5-toolchain-target seems to lift the dependency error.

MY BUILD CONFIGURATION

Build Configuration:
BB_VERSION        = "1.26.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Debian-8.1"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "raspberrypi2"
DISTRO            = "poky"
DISTRO_VERSION    = "1.8"
TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard vfpv4
cortexa7"
TARGET_FPU        = "vfp-vfpv4-neon"
meta-embarcados
meta-rpi          = "fido:3c1f9a1662bdb0f1a546fa87260a01ad547f7db8"
meta-qt5          = "fido:fc026381545650e10fdd488d5b2a3b2d78f87793"
meta-raspberrypi  = "fido:b896a7da70dd7a16ba7ffd664f7747cb37e1d142"
meta-oe
meta-ruby         = "fido:5b0305d9efa4b5692cd942586fb7aa92dba42d59"
meta
meta-yocto        = "fido:eb4a134a60e3ac26a48379675ad6346a44010339"

I have also detailed my attempts on Stackoverflow follow this link :
http://stackoverflow.com/questions/30830053/bitbake-meta-toolchain-qt5-failed-cannot-satisfy-x11-although-feature-was-remov


Happy pointers or advise will be greatly appreciated. Cheers!

--001a11c237e8d8a06e0518d1b10d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-size:12.8000001907349px">Hello there</d=
iv><div style=3D"font-size:12.8000001907349px"><br></div><div style=3D"font=
-size:12.8000001907349px">Trying to build my Qt5 toolchain for Raspberry Pi=
2 on Yocto fido branch (first timer).=C2=A0</div><div style=3D"font-size:12=
.8000001907349px"><br></div><div style=3D"font-size:12.8000001907349px">Fol=
lowed this brilliant tutorial=C2=A0<a href=3D"http://www.embarcados.com.br/=
raspberry-pi-2-qt5-yocto-parte-1/">http://www.embarcados.com.br/raspberry-p=
i-2-qt5-yocto-parte-1/</a> and=C2=A0<span style=3D"font-size:12.80000019073=
49px"><a href=3D"http://www.embarcados.com.br/raspberry-pi-2-qt5-yocto-part=
e-2/">http://www.embarcados.com.br/raspberry-pi-2-qt5-yocto-parte-2/</a> ab=
out the building the toolchain.</span><br></div><div style=3D"font-size:12.=
8000001907349px"><br></div><div style=3D"font-size:12.8000001907349px">I am=
 getting the dependency error message below, and it looks like I may have t=
o simply give up on Debian Wheezy or Jessie (just want to make sure with yo=
u guys before I do). Apparently this works on Ubuntu 14.04 which requires m=
e to get another machine. So any tips or tricks or way around this would be=
 great. Note that I absolutely do not need X11 for my project, but it looks=
 like I do need those libraries to build my toolchain.</div><div style=3D"f=
ont-size:12.8000001907349px"><br></div><div style=3D"font-size:12.800000190=
7349px">THE FAILING COMMAND</div><div style=3D"font-size:12.8000001907349px=
"><br></div><div style=3D"font-size:12.8000001907349px">=C2=A0 =C2=A0 bitba=
ke -v meta-toolchain-qt5<br></div><div style=3D"font-size:12.8000001907349p=
x"><br></div><div style=3D"font-size:12.8000001907349px">MY ERROR MESSAGE</=
div><div style=3D"font-size:12.8000001907349px"><br></div><div style=3D"fon=
t-size:12.8000001907349px"><div>Configuring packagegroup-core-standalone-sd=
k-target.</div><div>Collected errors:</div><div>=C2=A0* satisfy_dependencie=
s_for: Cannot satisfy the following dependencies for packagegroup-qt5-toolc=
hain-target:</div><div>=C2=A0*=C2=A0<span style=3D"white-space:pre-wrap">	<=
/span>libx11-6 (&gt;=3D 1.6.2) *=C2=A0<span style=3D"white-space:pre-wrap">=
	</span>libxcb1 (&gt;=3D 1.11) *=C2=A0<span style=3D"white-space:pre-wrap">=
	</span>libxau6 (&gt;=3D 1.0.8) *=C2=A0<span style=3D"white-space:pre-wrap"=
>	</span>libxdmcp6 (&gt;=3D 1.1.1) *=C2=A0</div><div>=C2=A0* opkg_install_c=
md: Cannot install package packagegroup-qt5-toolchain-target.</div><div><br=
></div><div>ERROR: Function failed: do_populate_sdk</div><div>ERROR: Logfil=
e of failure stored in: /home/otto/yocto/build/tmp/work/cortexa7hf-vfp-vfpv=
4-neon-poky-linux-gnueabi/meta-toolchain-qt5/1.0-r0/temp/log.do_populate_sd=
k.16122</div><div>ERROR: Task 7 (/home/otto/yocto/build/../poky/meta-qt5/re=
cipes-qt/meta/<a href=3D"http://meta-toolchain-qt5.bb/" target=3D"_blank">m=
eta-toolchain-qt5.bb</a>, do_populate_sdk) failed with exit code &#39;1&#39=
;</div><div>NOTE: Tasks Summary: Attempted 3419 tasks of which 3418 didn&#3=
9;t need to be rerun and 1 failed.</div><div>No currently running tasks (34=
18 of 3420)</div><div><br></div><div>Summary: 1 task failed:</div><div>=C2=
=A0 /home/otto/yocto/build/../poky/meta-qt5/recipes-qt/meta/<a href=3D"http=
://meta-toolchain-qt5.bb/" target=3D"_blank">meta-toolchain-qt5.bb</a>, do_=
populate_sdk</div><div>Summary: There were 2 ERROR messages shown, returnin=
g a non-zero exit code.</div></div><div style=3D"font-size:12.8000001907349=
px"><br></div><div style=3D"font-size:12.8000001907349px">I was able to nar=
row it down to this command</div><div style=3D"font-size:12.8000001907349px=
"><br></div><div style=3D"font-size:12.8000001907349px">=C2=A0 =C2=A0 =C2=
=A0 /home/otto/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl -f /ho=
me/otto/yocto/build/tmp/work/cortexa7hf-vfp-vfpv4-neon-poky-linux-gnueabi/m=
eta-toolchain-qt5/1.0-r0/opkg.conf -o /home/otto/yocto/build/tmp/work/corte=
xa7hf-vfp-vfpv4-neon-poky-linux-gnueabi/meta-toolchain-qt5/1.0-r0/sdk/image=
/opt/poky/1.8/sysroots/cortexa7hf-vfp-vfpv4-neon-poky-linux-gnueabi --force=
_postinstall --prefer-arch-to-version =C2=A0 install packagegroup-core-stan=
dalone-sdk-target-dbg packagegroup-core-standalone-sdk-target packagegroup-=
qt5-toolchain-target<br></div><div style=3D"font-size:12.8000001907349px"><=
br></div><div style=3D"font-size:12.8000001907349px">packagegroup-qt5-toolc=
hain-target seems to lift the dependency error.<br></div><div style=3D"font=
-size:12.8000001907349px"><br></div><span style=3D"font-size:12.80000019073=
49px">MY BUILD CONFIGURATION</span><br clear=3D"all" style=3D"font-size:12.=
8000001907349px"><div style=3D"font-size:12.8000001907349px"><br></div><div=
 style=3D"font-size:12.8000001907349px"><div>Build Configuration:</div><div=
>BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.26.0&quot;</div><div>BUI=
LD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&quot;</div><div>N=
ATIVELSBSTRING =C2=A0 =3D &quot;Debian-8.1&quot;</div><div>TARGET_SYS =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-poky-linux-gnueabi&quot;</div><div>MA=
CHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;raspberrypi2&quot;</div>=
<div>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky&quot;</=
div><div>DISTRO_VERSION =C2=A0 =C2=A0=3D &quot;1.8&quot;</div><div>TUNE_FEA=
TURES =C2=A0 =C2=A0 =3D &quot;arm armv7a vfp thumb neon callconvention-hard=
 vfpv4 cortexa7&quot;</div><div>TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &=
quot;vfp-vfpv4-neon&quot;</div><div>meta-embarcados =C2=A0=C2=A0</div><div>=
meta-rpi =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;fido:3c1f9a1662bdb0f1a=
546fa87260a01ad547f7db8&quot;</div><div>meta-qt5 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;fido:fc026381545650e10fdd488d5b2a3b2d78f87793&quot;</di=
v><div>meta-raspberrypi =C2=A0=3D &quot;fido:b896a7da70dd7a16ba7ffd664f7747=
cb37e1d142&quot;</div><div>meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=
</div><div>meta-ruby =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;fido:5b0305d9efa=
4b5692cd942586fb7aa92dba42d59&quot;</div><div>meta =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0</div><div>meta-yocto =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;fido:eb4a134a60e3ac26a48379675ad6346a44010339&quot;</div><div><br=
></div></div><div style=3D"font-size:12.8000001907349px">I have also detail=
ed my attempts on Stackoverflow follow this link :=C2=A0<a href=3D"http://s=
tackoverflow.com/questions/30830053/bitbake-meta-toolchain-qt5-failed-canno=
t-satisfy-x11-although-feature-was-remov" target=3D"_blank">http://stackove=
rflow.com/questions/30830053/bitbake-meta-toolchain-qt5-failed-cannot-satis=
fy-x11-although-feature-was-remov</a></div><div style=3D"font-size:12.80000=
01907349px"><br></div><div style=3D"font-size:12.8000001907349px"><br></div=
><div style=3D"font-size:12.8000001907349px">Happy pointers or advise will =
be greatly appreciated. Cheers!</div><div><br></div>
</div>

--001a11c237e8d8a06e0518d1b10d--
