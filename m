Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA537C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 09:42:23 +0000 (UTC)
Subject: [langdale] Issues enabling systemd template service using WantedBy construct
To: openembedded-core@lists.openembedded.org
From: "Martin Siegumfeldt" <mns@gomspace.com>
X-Originating-Location: Aalborg, North Denmark, DK (85.191.191.35)
X-Originating-Platform: Linux Chrome 111
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 13 Mar 2023 02:42:18 -0700
Message-ID: <GSzN.1678700538964397448.rmo3@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="jcPIQoGPnjhj6UxcxHJl"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 09:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178423

--jcPIQoGPnjhj6UxcxHJl
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

We are seeing some systemd service issues during the process of bumping Yoc=
to baseline from thud to langdale. The following service:

Unit]
Description=3D"Nanocom TR600 Monitor Application slot %i"
RequiresMountsFor=3D/data
Wants=3Dredis.service
After=3Dredis.service
PartOf=3Dtr600@%i.service tr600-dma@%i.service
After=3Dtr600@%i.service tr600-dma@%i.service
Requires=3Dgs-dtoverlay.service
After=3Dgs-dtoverlay.service

[Service]
ExecStart=3D/usr/bin/nanocom-tr600-monitor --service-instance-name=3D%i
WorkingDirectory=3D/data
Restart=3Dalways
RestartSec=3D5

[Install]
WantedBy=3Dtr600@%i.service tr600-dma@%i.service

is intended started whenever any of the tr600/tr600-dma template services a=
re started. The following tr600 services are defined within the recipe:

SYSTEMD_SERVICE:${BPN} =3D "\
${BPN}@a.service \
${BPN}@b.service \
${BPN}@c.service \
${BPN}-dma@a.service \
${BPN}-dma@b.service \
${BPN}-dma@c.service \
"

and equivalently the nanocom-tr600-monitor services from it's recipe:

SYSTEMD_SERVICE:${BPN} =3D "\
${BPN}@a.service \
${BPN}@b.service \
${BPN}@c.service \
"

in the thud baseline we observe the following lines from the log.do_rootfs =
file:

Started /mnt/build/tmp/work/nanomind_z7045_nv3-gomspace-linux-gnueabi/nanoc=
om-sdr-image/1.0-r0/recipe-sysroot-native/usr/bin/systemctl --root=3D/mnt/b=
uild/tmp/work/nanomind_z7045_nv3-gomspace-linux-gnueabi/nanocom-sdr-image/1=
.0-r0/rootfs enable nanocom-tr600-monitor@a.service nanocom-tr600-monitor@b=
.service nanocom-tr600-monitor@c.service
Try to find location of template nanocom-tr600-monitor@.service of instance=
 nanocom-tr600-monitor@a.service...
Found nanocom-tr600-monitor@a.service in /lib/systemd/system/nanocom-tr600-=
monitor@.service
WantedBy=3Dtr600@%i.service found in nanocom-tr600-monitor@a.service
Enabled nanocom-tr600-monitor@a.service for tr600@a.service.
WantedBy=3Dtr600-dma@%i.service found in nanocom-tr600-monitor@a.service
Enabled nanocom-tr600-monitor@a.service for tr600-dma@a.service.

and the rootfs content:

ll rootfs/etc/systemd/system | grep tr600
drwxr-xr-x=C2=A0 2 martin martin 4096 Mar=C2=A0 9 21:40 tr600@a.service.wan=
ts/
drwxr-xr-x=C2=A0 2 martin martin 4096 Mar=C2=A0 9 21:40 tr600@b.service.wan=
ts/
drwxr-xr-x=C2=A0 2 martin martin 4096 Mar=C2=A0 9 21:40 tr600@c.service.wan=
ts/
drwxr-xr-x=C2=A0 2 martin martin 4096 Mar=C2=A0 9 21:40 tr600-dma@a.service=
.wants/
drwxr-xr-x=C2=A0 2 martin martin 4096 Mar=C2=A0 9 21:40 tr600-dma@b.service=
.wants/
drwxr-xr-x=C2=A0 2 martin martin 4096 Mar=C2=A0 9 21:40 tr600-dma@c.service=
.wants/

which works as expected when flashed.

On the langdale baseline, the created 'wants' links appear to be missing th=
e template expansion:

ll rootfs/etc/systemd/system | grep tr600
drwxr-xr-x=C2=A0 2 martin martin 4096 Mar=C2=A0 9=C2=A0 2018 tr600-dma@%i.s=
ervice.wants/
drwxr-xr-x=C2=A0 2 martin martin 4096 Mar=C2=A0 9=C2=A0 2018 tr600@%i.servi=
ce.wants/

and the dependency does not work when flashed.

I have looked into the systemctl script (that has been refactored and porte=
d from shell to python in between the baselines) but did not manage to loca=
te the root cause. IMHO, it looks to be a regression but I have not managed=
 to find the smoking gun.

Does anyone have a clue on this?

Thanks,
Martin

--jcPIQoGPnjhj6UxcxHJl
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi all,</div>
<div>&nbsp;</div>
<div>We are seeing some systemd service issues during the process of bumpin=
g Yocto baseline from thud to langdale. The following service:</div>
<div><br />Unit]</div>
<div>Description=3D"Nanocom TR600 Monitor Application slot %i"</div>
<div>RequiresMountsFor=3D/data</div>
<div>Wants=3Dredis.service</div>
<div>After=3Dredis.service</div>
<div>PartOf=3Dtr600@%i.service tr600-dma@%i.service</div>
<div>After=3Dtr600@%i.service tr600-dma@%i.service</div>
<div>Requires=3Dgs-dtoverlay.service</div>
<div>After=3Dgs-dtoverlay.service</div>
<div>&nbsp;</div>
<div>[Service]</div>
<div>ExecStart=3D/usr/bin/nanocom-tr600-monitor --service-instance-name=3D%=
i</div>
<div>WorkingDirectory=3D/data</div>
<div>Restart=3Dalways</div>
<div>RestartSec=3D5</div>
<div>&nbsp;</div>
<div>[Install]</div>
<div>WantedBy=3Dtr600@%i.service tr600-dma@%i.service</div>
<div>&nbsp;</div>
<div>is intended started whenever any of the tr600/tr600-dma template servi=
ces are started. The following tr600 services are defined within the recipe=
:</div>
<div>&nbsp;</div>
<div>SYSTEMD_SERVICE:${BPN} =3D "\</div>
<div>&nbsp; &nbsp; ${BPN}@a.service \</div>
<div>&nbsp; &nbsp; ${BPN}@b.service \</div>
<div>&nbsp; &nbsp; ${BPN}@c.service \</div>
<div>&nbsp; &nbsp; ${BPN}-dma@a.service \</div>
<div>&nbsp; &nbsp; ${BPN}-dma@b.service \</div>
<div>&nbsp; &nbsp; ${BPN}-dma@c.service \</div>
<div>&nbsp; &nbsp; "</div>
<div>&nbsp;</div>
<div>and equivalently the nanocom-tr600-monitor services from it's recipe:<=
/div>
<div>&nbsp;</div>
<div>SYSTEMD_SERVICE:${BPN} =3D "\</div>
<div>&nbsp; &nbsp; ${BPN}@a.service \</div>
<div>&nbsp; &nbsp; ${BPN}@b.service \</div>
<div>&nbsp; &nbsp; ${BPN}@c.service \</div>
<div>&nbsp; &nbsp; "</div>
<div>&nbsp;</div>
<div>in the thud baseline we observe the following lines from the log.do_ro=
otfs file:</div>
<div>&nbsp;</div>
<div>Started /mnt/build/tmp/work/nanomind_z7045_nv3-gomspace-linux-gnueabi/=
nanocom-sdr-image/1.0-r0/recipe-sysroot-native/usr/bin/systemctl --root=3D/=
mnt/build/tmp/work/nanomind_z7045_nv3-gomspace-linux-gnueabi/nanocom-sdr-im=
age/1.0-r0/rootfs enable nanocom-tr600-monitor@a.service nanocom-tr600-moni=
tor@b.service nanocom-tr600-monitor@c.service</div>
<div>Try to find location of template nanocom-tr600-monitor@.service of ins=
tance nanocom-tr600-monitor@a.service...</div>
<div>Found nanocom-tr600-monitor@a.service in /lib/systemd/system/nanocom-t=
r600-monitor@.service</div>
<div>WantedBy=3Dtr600@%i.service found in nanocom-tr600-monitor@a.service</=
div>
<div>Enabled nanocom-tr600-monitor@a.service for tr600@a.service.</div>
<div>WantedBy=3Dtr600-dma@%i.service found in nanocom-tr600-monitor@a.servi=
ce</div>
<div>Enabled nanocom-tr600-monitor@a.service for tr600-dma@a.service.&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;</div>
<div>&nbsp;</div>
<div>and the rootfs content:</div>
<div>&nbsp;</div>
<div>ll rootfs/etc/systemd/system | grep tr600</div>
<div>drwxr-xr-x&nbsp; 2 martin martin 4096 Mar&nbsp; 9 21:40 tr600@a.servic=
e.wants/</div>
<div>drwxr-xr-x&nbsp; 2 martin martin 4096 Mar&nbsp; 9 21:40 tr600@b.servic=
e.wants/</div>
<div>drwxr-xr-x&nbsp; 2 martin martin 4096 Mar&nbsp; 9 21:40 tr600@c.servic=
e.wants/</div>
<div>drwxr-xr-x&nbsp; 2 martin martin 4096 Mar&nbsp; 9 21:40 tr600-dma@a.se=
rvice.wants/</div>
<div>drwxr-xr-x&nbsp; 2 martin martin 4096 Mar&nbsp; 9 21:40 tr600-dma@b.se=
rvice.wants/</div>
<div>drwxr-xr-x&nbsp; 2 martin martin 4096 Mar&nbsp; 9 21:40 tr600-dma@c.se=
rvice.wants/</div>
<div>&nbsp;</div>
<div>which works as expected when flashed.</div>
<div>&nbsp;</div>
<div>On the langdale baseline, the created 'wants' links appear to be missi=
ng the template expansion:</div>
<div>&nbsp;</div>
<div>ll rootfs/etc/systemd/system | grep tr600</div>
<div>drwxr-xr-x&nbsp; 2 martin martin 4096 Mar&nbsp; 9&nbsp; 2018 tr600-dma=
@%i.service.wants/</div>
<div>drwxr-xr-x&nbsp; 2 martin martin 4096 Mar&nbsp; 9&nbsp; 2018 tr600@%i.=
service.wants/</div>
<div><br />and the dependency does not work when flashed.<br /><br /></div>
<div>I have looked into the systemctl script (that has been refactored and =
ported from shell to python in between the baselines) but did not manage to=
 locate the root cause. IMHO, it looks to be a regression but I have not ma=
naged to find the smoking gun. <br /><br />Does anyone have a clue on this?=
</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>Martin</div>

--jcPIQoGPnjhj6UxcxHJl--

