Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADA0CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 06:37:07 +0000 (UTC)
Subject: Re: [walnascar][PATCH 3/3] systemd.bbclass: Make systemd_postinst run as intended
To: openembedded-core@lists.openembedded.org
From: "Martin Siegumfeldt" <mns@gomspace.com>
X-Originating-Location: DK (79.171.149.174)
X-Originating-Platform: Linux Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 24 Sep 2025 23:36:59 -0700
References: <DB5PR02MB10213F2B4B71975FD52650035EF1CA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213F2B4B71975FD52650035EF1CA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Message-ID: <20743.1758782219733650322@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="uXI8MW70VGnoetaY2lE6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 06:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224000

--uXI8MW70VGnoetaY2lE6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks Peter,

Below is what I expect to be the relevant part of the log file:

Created symlink '/home/martin/work/distro-gomspace_tmp/build/tmp/work/nanom=
ind_z7020_zed-gomspace-linux-gnueabi/nanomind-dev-image/1.0/rootfs/etc/syst=
emd/system/multi-user.target.wants/busybox-klogd.service' =E2=86=92 '/usr/l=
ib/systemd/system/busybox-klogd.service'.
Created symlink '/home/martin/work/distro-gomspace_tmp/build/tmp/work/nanom=
ind_z7020_zed-gomspace-linux-gnueabi/nanomind-dev-image/1.0/rootfs/etc/syst=
emd/system/multi-user.target.wants/sysstat.service' =E2=86=92 '/usr/lib/sys=
temd/system/sysstat.service'.
Failed to enable unit: Refusing to operate on template unit nanomind-gpio-c=
trl@.service when destination unit multi-user.target is a non-template unit
Failed to enable unit: Refusing to operate on template unit nanomind-bank-c=
trl@.service when destination unit multi-user.target is a non-template unit
Created symlink '/home/martin/work/distro-gomspace_tmp/build/tmp/work/nanom=
ind_z7020_zed-gomspace-linux-gnueabi/nanomind-dev-image/1.0/rootfs/etc/syst=
emd/system/multi-user.target.wants/redis.service' =E2=86=92 '/usr/lib/syste=
md/system/redis.service'.
.
.
.
Configuring sysstat.
Configuring nanomind-gpio-ctrl.
nanomind-gpio-ctrl.postinst returned 1, marking as unpacked only, configura=
tion required on target.
Configuring nanomind-bank-ctrl.
nanomind-bank-ctrl.postinst returned 1, marking as unpacked only, configura=
tion required on target.
Configuring bash-completion.
Configuring libiio-bash-completion.

The particular service file is described as:

[Unit]
Description=3DGPIO Control Service (%i)
[Service]
Type=3Doneshot
RemainAfterExit=3Dyes
ExecStart=3D/usr/bin/gpioset --daemonize --chip gpiochip0 %i=3D1
ExecStartPost=3D/bin/sleep .3
ExecStopPost=3D/usr/bin/gpioset --toggle 0 --chip gpiochip0 %i=3D0
ExecStopPost=3D/bin/sleep .3
[Install]
WantedBy=3Dmulti-user.target

AFAICT, the issue only applies for template units - other seem to install/c=
onfigure fine.

What puzzles me is why I am seemingly the only one running into this - I co=
nsider both the recipe and service file to be quite standard...

--uXI8MW70VGnoetaY2lE6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Thanks Peter,</div>
<div>&nbsp;</div>
<div>Below is what I expect to be the relevant part of the log file:</div>
<div>&nbsp;</div>
<div>Created symlink '/home/martin/work/distro-gomspace_tmp/build/tmp/work/=
nanomind_z7020_zed-gomspace-linux-gnueabi/nanomind-dev-image/1.0/rootfs/etc=
/systemd/system/multi-user.target.wants/busybox-klogd.service' &rarr; '/usr=
/lib/systemd/system/busybox-klogd.service'.<br />Created symlink '/home/mar=
tin/work/distro-gomspace_tmp/build/tmp/work/nanomind_z7020_zed-gomspace-lin=
ux-gnueabi/nanomind-dev-image/1.0/rootfs/etc/systemd/system/multi-user.targ=
et.wants/sysstat.service' &rarr; '/usr/lib/systemd/system/sysstat.service'.=
<br />Failed to enable unit: Refusing to operate on template unit nanomind-=
gpio-ctrl@.service when destination unit multi-user.target is a non-templat=
e unit<br />Failed to enable unit: Refusing to operate on template unit nan=
omind-bank-ctrl@.service when destination unit multi-user.target is a non-t=
emplate unit<br />Created symlink '/home/martin/work/distro-gomspace_tmp/bu=
ild/tmp/work/nanomind_z7020_zed-gomspace-linux-gnueabi/nanomind-dev-image/1=
.0/rootfs/etc/systemd/system/multi-user.target.wants/redis.service' &rarr; =
'/usr/lib/systemd/system/redis.service'.<br />.</div>
<div>.</div>
<div>.</div>
<div>Configuring sysstat.<br />Configuring nanomind-gpio-ctrl.<br />nanomin=
d-gpio-ctrl.postinst returned 1, marking as unpacked only, configuration re=
quired on target.<br />Configuring nanomind-bank-ctrl.<br />nanomind-bank-c=
trl.postinst returned 1, marking as unpacked only, configuration required o=
n target.<br />Configuring bash-completion.<br />Configuring libiio-bash-co=
mpletion.</div>
<div>&nbsp;</div>
<div>The particular service file is described as:</div>
<div>&nbsp;</div>
<div>
<div>[Unit]<br />Description=3DGPIO Control Service (%i)</div>
<div>[Service]<br />Type=3Doneshot<br />RemainAfterExit=3Dyes<br />ExecStar=
t=3D/usr/bin/gpioset --daemonize --chip gpiochip0 %i=3D1<br />ExecStartPost=
=3D/bin/sleep .3<br />ExecStopPost=3D/usr/bin/gpioset --toggle 0 --chip gpi=
ochip0 %i=3D0<br />ExecStopPost=3D/bin/sleep .3</div>
<div>[Install]<br />WantedBy=3Dmulti-user.target</div>
<div>&nbsp;</div>
<div>AFAICT, the issue only applies for template units - other seem to inst=
all/configure fine.</div>
<div>&nbsp;</div>
<div>What puzzles me is why I am seemingly the only one running into this -=
 I consider both the recipe and service file to be quite standard...</div>
</div>

--uXI8MW70VGnoetaY2lE6--

