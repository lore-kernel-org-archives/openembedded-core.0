Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7D1C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 12:12:35 +0000 (UTC)
Subject: Issues enabling systemd template service using WantedBy construct (Styhead -> Walnascar)
To: openembedded-core@lists.openembedded.org
From: "Martin Siegumfeldt" <mns@gomspace.com>
X-Originating-Location: Copenhagen, Capital Region, DK (62.107.18.156)
X-Originating-Platform: Linux Chrome 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 12 May 2025 05:12:27 -0700
Message-ID: <Z2ch.1747051947055246176.oktf@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="6gKuFqh77eQ70IpA819K"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 12:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216364

--6gKuFqh77eQ70IpA819K
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

We have encountered what appears to be a regression when moving from styhea=
d to walnascar baseline, regarding a systemd service that is no longer enab=
led. It is a templated service that relates to another through the "WantedB=
y" relation - sample layer/recipes/service is available here: https://githu=
b.com/mnsgs/meta-systemd-test.

Recipe:

DESCRIPTION =3D "Wanted-by service"
LICENSE =3D "CLOSED"

inherit systemd

SRC_URI =3D "file://${BPN}@.service"

SYSTEMD_SERVICE:${BPN} =3D "\
${BPN}@a.service \
${BPN}@b.service \
"

do_install:append() {
install -d ${D}${systemd_system_unitdir}
install -m 0644 ${UNPACKDIR}/${BPN}@.service ${D}${systemd_system_unitdir}
}

FILES:${PN} +=3D "${systemd_system_unitdir}"

Systemd service file:

[Unit]
Description=3D"Test WantedBy service %i"

[Service]
Type=3Doneshot
RemainAfterExit=3Dyes
ExecStart=3D/bin/echo "Hello from WantedBy service (instance %i)"
ExecStop=3D/bin/echo "Hello from Wantedby service (instance %i)"

[Install]
WantedBy=3Dsvc-wants@%i.service

On styhead baseline, this yields the =C2=A0following behavior:

root@qemux86-64:~# cat /etc/buildinfo
-----------------------
Build Configuration: =C2=A0|
-----------------------
DISTRO =3D poky
DISTRO_VERSION =3D 5.1.4
-----------------------
Layer Revisions: =C2=A0 =C2=A0 =C2=A0|
-----------------------
meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D styhead:70dc28ac28=
7bf35541270cae1d99130a0f6b7b5f
meta-poky =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D styhead:70dc28ac287bf35541270cae1=
d99130a0f6b7b5f
meta-yocto-bsp =C2=A0 =C2=A0=3D styhead:70dc28ac287bf35541270cae1d99130a0f6=
b7b5f
meta-systemd-test =3D main:b0b53555ffb7f43a7e9651bde2e9b710e5ded25f -- modi=
fied
root@qemux86-64:~#
root@qemux86-64:~# systemctl is-enabled svc-wanted-by@
indirect
root@qemux86-64:~#
root@qemux86-64:~# systemctl is-enabled svc-wanted-by@a
enabled
root@qemux86-64:~#
root@qemux86-64:~# journalctl -f&
root@qemux86-64:~# May 12 11:40:14 qemux86-64 systemd-timesyncd[200]: Netwo=
rk configuration changed, trying to establish connection.
May 12 11:40:14 qemux86-64 systemd-timesyncd[200]: Network configuration ch=
anged, trying to establish connection.
May 12 11:40:14 qemux86-64 systemd-logind[217]: New seat seat0.
May 12 11:40:14 qemux86-64 systemd-logind[217]: Watching system buttons on =
/dev/input/event0 (Power Button)
May 12 11:40:14 qemux86-64 systemd-logind[217]: Watching system buttons on =
/dev/input/event2 (QEMU QEMU USB Keyboard)
May 12 11:40:14 qemux86-64 systemd[1]: Started User Login Management.
May 12 11:40:14 qemux86-64 systemd[1]: Reached target Multi-User System.
May 12 11:40:14 qemux86-64 systemd[1]: Finished Virtual Console Setup.
May 12 11:40:14 qemux86-64 systemd[1]: Startup finished in 1.488s (kernel) =
+ 3.613s (userspace) =3D 5.102s.
May 12 11:40:16 qemux86-64 systemd-timesyncd[200]: Network configuration ch=
anged, trying to establish connection.
May 12 11:40:46 qemux86-64 systemd-resolved[196]: Clock change detected. Fl=
ushing caches.
May 12 11:40:46 qemux86-64 systemd-journald[130]: Forwarding to syslog miss=
ed 126 messages.
May 12 11:40:46 qemux86-64 systemd-timesyncd[200]: Contacted time server 21=
6.239.35.8:123 (time3.google.com).
May 12 11:40:46 qemux86-64 systemd-timesyncd[200]: Initial clock synchroniz=
ation to Mon 2025-05-12 11:40:46.809039 UTC.
root@qemux86-64:~#
root@qemux86-64:~# systemctl start svc-wants@a
root@qemux86-64:~# May 12 11:40:54 qemux86-64 systemd[1]: Created slice Sli=
ce /system/svc-wanted-by.
May 12 11:40:54 qemux86-64 systemd[1]: Created slice Slice /system/svc-want=
s.
May 12 11:40:54 qemux86-64 systemd[1]: Starting "Test WantedBy service a"..=
.
May 12 11:40:54 qemux86-64 systemd[1]: Starting "Test Wants service a"...
May 12 11:40:54 qemux86-64 echo[240]: Hello from WantedBy service (instance=
 a)
May 12 11:40:54 qemux86-64 echo[241]: Hello from Wants service (instance a)
May 12 11:40:54 qemux86-64 systemd[1]: Finished "Test WantedBy service a".
May 12 11:40:55 qemux86-64 systemd[1]: Finished "Test Wants service a".

As expected, the "WantedBy" service is started along.

The equivalent on walnascar:

root@qemux86-64:~# cat /etc/buildinfo
-----------------------
Build Configuration: =C2=A0|
-----------------------
DISTRO =3D poky
DISTRO_VERSION =3D 5.2
-----------------------
Layer Revisions: =C2=A0 =C2=A0 =C2=A0|
-----------------------
meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D walnascar:9b96fdbb=
0cab02f4a6180e812b02bc9d4c41b1a5
meta-poky =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D walnascar:9b96fdbb0cab02f4a6180e8=
12b02bc9d4c41b1a5
meta-yocto-bsp =C2=A0 =C2=A0=3D walnascar:9b96fdbb0cab02f4a6180e812b02bc9d4=
c41b1a5
meta-systemd-test =3D main:b0b53555ffb7f43a7e9651bde2e9b710e5ded25f -- modi=
fied
root@qemux86-64:~#
root@qemux86-64:~# systemctl is-enabled svc-wanted-by@
disabled
root@qemux86-64:~#
root@qemux86-64:~# systemctl is-enabled svc-wanted-by@a
disabled
root@qemux86-64:~#
root@qemux86-64:~# journalctl -f&
root@qemux86-64:~# May 12 11:42:14 qemux86-64 kernel[210]: [ =C2=A0 =C2=A03=
.173784] systemd-journald[133]: Received client request to flush runtime jo=
urnal.
May 12 11:42:14 qemux86-64 systemd-logind[216]: New seat seat0.
May 12 11:42:14 qemux86-64 systemd[1]: Listening on Load/Save RF Kill Switc=
h Status /dev/rfkill Watch.
May 12 11:42:14 qemux86-64 systemd-logind[216]: Watching system buttons on =
/dev/input/event0 (Power Button)
May 12 11:42:14 qemux86-64 systemd-logind[216]: Watching system buttons on =
/dev/input/event2 (QEMU QEMU USB Keyboard)
May 12 11:42:14 qemux86-64 systemd[1]: Started User Login Management.
May 12 11:42:14 qemux86-64 systemd[1]: Reached target Multi-User System.
May 12 11:42:14 qemux86-64 systemd[1]: Starting Virtual Console Setup...
May 12 11:42:14 qemux86-64 systemd[1]: Finished Virtual Console Setup.
May 12 11:42:14 qemux86-64 systemd[1]: Startup finished in 1.495s (kernel) =
+ 3.622s (userspace) =3D 5.118s.
root@qemux86-64:~#
root@qemux86-64:~# systemctl start svc-wants@a
root@qemux86-64:~# May 12 11:42:51 qemux86-64 systemd[1]: Created slice Sli=
ce /system/svc-wants.
May 12 11:42:51 qemux86-64 systemd-journald[133]: Forwarding to syslog miss=
ed 120 messages.
May 12 11:42:51 qemux86-64 systemd[1]: Starting "Test Wants service a"...
May 12 11:42:51 qemux86-64 echo[250]: Hello from Wants service (instance a)
May 12 11:42:51 qemux86-64 systemd[1]: Finished "Test Wants service a".

where the "WantedBy" service is not started (as it is not enabled)

As mentioned, it appears to be a regression during the styhead -> walnascar=
 development. I notice that the systemctl-native is now built from the syst=
emd sources - is this correct? Should I consequently report this through sy=
stemd?

Thanks,
Martin

--6gKuFqh77eQ70IpA819K
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi all,</div>
<div>&nbsp;</div>
<div>We have encountered what appears to be a regression when moving from s=
tyhead to walnascar baseline, regarding a systemd service that is no longer=
 enabled. It is a templated service that relates to another through the "Wa=
ntedBy" relation - sample layer/recipes/service is available here:&nbsp; <a=
 href=3D"https://github.com/mnsgs/meta-systemd-test" target=3D"_blank" rel=
=3D"noopener">https://github.com/mnsgs/meta-systemd-test</a>.</div>
<div>&nbsp;</div>
<div>Recipe:</div>
<div>&nbsp;</div>
<div>
<div>DESCRIPTION =3D "Wanted-by service"<br />LICENSE =3D "CLOSED"</div>
<div>&nbsp;</div>
<div>inherit systemd</div>
<div>&nbsp;</div>
<div>SRC_URI =3D "file://${BPN}@.service"</div>
<div>&nbsp;</div>
<div>SYSTEMD_SERVICE:${BPN} =3D "\<br />&nbsp; &nbsp; ${BPN}@a.service \<br=
 />&nbsp; &nbsp; ${BPN}@b.service \<br />&nbsp; &nbsp; "</div>
<div>&nbsp;</div>
<div>do_install:append() {<br />&nbsp; &nbsp; install -d ${D}${systemd_syst=
em_unitdir}<br />&nbsp; &nbsp; install -m 0644 ${UNPACKDIR}/${BPN}@.service=
 ${D}${systemd_system_unitdir}<br />}</div>
<div>&nbsp;</div>
<div>FILES:${PN} +=3D "${systemd_system_unitdir}"</div>
<div>&nbsp;</div>
</div>
<div>Systemd service file:</div>
<div>&nbsp;</div>
<div>
<div>[Unit]<br />Description=3D"Test WantedBy service %i"</div>
<div>&nbsp;</div>
<div>[Service]<br />Type=3Doneshot<br />RemainAfterExit=3Dyes<br />ExecStar=
t=3D/bin/echo "Hello from WantedBy service (instance %i)"<br />ExecStop=3D/=
bin/echo "Hello from Wantedby service (instance %i)"</div>
<div>&nbsp;</div>
<div>[Install]<br />WantedBy=3Dsvc-wants@%i.service</div>
</div>
<div>&nbsp;</div>
<div>On styhead baseline, this yields the &nbsp;following behavior:</div>
<div>&nbsp;</div>
<div>root@qemux86-64:~# cat /etc/buildinfo&nbsp;<br />---------------------=
--<br />Build Configuration: &nbsp;|<br />-----------------------<br />DIST=
RO =3D poky<br />DISTRO_VERSION =3D 5.1.4<br />-----------------------<br /=
>Layer Revisions: &nbsp; &nbsp; &nbsp;|<br />-----------------------<br />m=
eta &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D styhead:70dc28ac287=
bf35541270cae1d99130a0f6b7b5f<br />meta-poky &nbsp; &nbsp; &nbsp; &nbsp; =
=3D styhead:70dc28ac287bf35541270cae1d99130a0f6b7b5f<br />meta-yocto-bsp &n=
bsp; &nbsp;=3D styhead:70dc28ac287bf35541270cae1d99130a0f6b7b5f<br />meta-s=
ystemd-test =3D main:b0b53555ffb7f43a7e9651bde2e9b710e5ded25f -- modified<b=
r />root@qemux86-64:~#&nbsp;<br />root@qemux86-64:~# systemctl is-enabled s=
vc-wanted-by@<br />indirect<br />root@qemux86-64:~#&nbsp;<br />root@qemux86=
-64:~# systemctl is-enabled svc-wanted-by@a<br />enabled<br />root@qemux86-=
64:~#&nbsp;<br />root@qemux86-64:~# journalctl -f&amp;<br />root@qemux86-64=
:~# May 12 11:40:14 qemux86-64 systemd-timesyncd[200]: Network configuratio=
n changed, trying to establish connection.<br />May 12 11:40:14 qemux86-64 =
systemd-timesyncd[200]: Network configuration changed, trying to establish =
connection.<br />May 12 11:40:14 qemux86-64 systemd-logind[217]: New seat s=
eat0.<br />May 12 11:40:14 qemux86-64 systemd-logind[217]: Watching system =
buttons on /dev/input/event0 (Power Button)<br />May 12 11:40:14 qemux86-64=
 systemd-logind[217]: Watching system buttons on /dev/input/event2 (QEMU QE=
MU USB Keyboard)<br />May 12 11:40:14 qemux86-64 systemd[1]: Started User L=
ogin Management.<br />May 12 11:40:14 qemux86-64 systemd[1]: Reached target=
 Multi-User System.<br />May 12 11:40:14 qemux86-64 systemd[1]: Finished Vi=
rtual Console Setup.<br />May 12 11:40:14 qemux86-64 systemd[1]: Startup fi=
nished in 1.488s (kernel) + 3.613s (userspace) =3D 5.102s.<br />May 12 11:4=
0:16 qemux86-64 systemd-timesyncd[200]: Network configuration changed, tryi=
ng to establish connection.<br />May 12 11:40:46 qemux86-64 systemd-resolve=
d[196]: Clock change detected. Flushing caches.<br />May 12 11:40:46 qemux8=
6-64 systemd-journald[130]: Forwarding to syslog missed 126 messages.<br />=
May 12 11:40:46 qemux86-64 systemd-timesyncd[200]: Contacted time server 21=
6.239.35.8:123 (time3.google.com).<br />May 12 11:40:46 qemux86-64 systemd-=
timesyncd[200]: Initial clock synchronization to Mon 2025-05-12 11:40:46.80=
9039 UTC.</div>
<div>root@qemux86-64:~#&nbsp;</div>
<div>root@qemux86-64:~# systemctl start svc-wants@a<br />root@qemux86-64:~#=
 May 12 11:40:54 qemux86-64 systemd[1]: Created slice Slice /system/svc-wan=
ted-by.<br />May 12 11:40:54 qemux86-64 systemd[1]: Created slice Slice /sy=
stem/svc-wants.<br />May 12 11:40:54 qemux86-64 systemd[1]: Starting "Test =
WantedBy service a"...<br />May 12 11:40:54 qemux86-64 systemd[1]: Starting=
 "Test Wants service a"...<br />May 12 11:40:54 qemux86-64 echo[240]: Hello=
 from WantedBy service (instance a)<br />May 12 11:40:54 qemux86-64 echo[24=
1]: Hello from Wants service (instance a)<br />May 12 11:40:54 qemux86-64 s=
ystemd[1]: Finished "Test WantedBy service a".<br />May 12 11:40:55 qemux86=
-64 systemd[1]: Finished "Test Wants service a".</div>
<div>&nbsp;</div>
<div>As expected, the "WantedBy" service is started along.</div>
<div>&nbsp;</div>
<div>The equivalent on walnascar:</div>
<div>&nbsp;</div>
<div>root@qemux86-64:~# cat /etc/buildinfo&nbsp;</div>
<div>-----------------------<br />Build Configuration: &nbsp;|<br />-------=
----------------<br />DISTRO =3D poky<br />DISTRO_VERSION =3D 5.2<br />----=
-------------------<br />Layer Revisions: &nbsp; &nbsp; &nbsp;|<br />------=
-----------------<br />meta &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;=3D walnascar:9b96fdbb0cab02f4a6180e812b02bc9d4c41b1a5<br />meta-poky &nbs=
p; &nbsp; &nbsp; &nbsp; =3D walnascar:9b96fdbb0cab02f4a6180e812b02bc9d4c41b=
1a5<br />meta-yocto-bsp &nbsp; &nbsp;=3D walnascar:9b96fdbb0cab02f4a6180e81=
2b02bc9d4c41b1a5<br />meta-systemd-test =3D main:b0b53555ffb7f43a7e9651bde2=
e9b710e5ded25f -- modified<br />root@qemux86-64:~#&nbsp;<br />root@qemux86-=
64:~# systemctl is-enabled svc-wanted-by@<br />disabled<br />root@qemux86-6=
4:~#&nbsp;<br />root@qemux86-64:~# systemctl is-enabled svc-wanted-by@a<br =
/>disabled<br />root@qemux86-64:~#&nbsp;<br />root@qemux86-64:~# journalctl=
 -f&amp;<br />root@qemux86-64:~# May 12 11:42:14 qemux86-64 kernel[210]: [ =
&nbsp; &nbsp;3.173784] systemd-journald[133]: Received client request to fl=
ush runtime journal.<br />May 12 11:42:14 qemux86-64 systemd-logind[216]: N=
ew seat seat0.<br />May 12 11:42:14 qemux86-64 systemd[1]: Listening on Loa=
d/Save RF Kill Switch Status /dev/rfkill Watch.<br />May 12 11:42:14 qemux8=
6-64 systemd-logind[216]: Watching system buttons on /dev/input/event0 (Pow=
er Button)<br />May 12 11:42:14 qemux86-64 systemd-logind[216]: Watching sy=
stem buttons on /dev/input/event2 (QEMU QEMU USB Keyboard)<br />May 12 11:4=
2:14 qemux86-64 systemd[1]: Started User Login Management.<br />May 12 11:4=
2:14 qemux86-64 systemd[1]: Reached target Multi-User System.<br />May 12 1=
1:42:14 qemux86-64 systemd[1]: Starting Virtual Console Setup...<br />May 1=
2 11:42:14 qemux86-64 systemd[1]: Finished Virtual Console Setup.<br />May =
12 11:42:14 qemux86-64 systemd[1]: Startup finished in 1.495s (kernel) + 3.=
622s (userspace) =3D 5.118s.</div>
<div>root@qemux86-64:~#&nbsp;</div>
<div>root@qemux86-64:~# systemctl start svc-wants@a<br />root@qemux86-64:~#=
 May 12 11:42:51 qemux86-64 systemd[1]: Created slice Slice /system/svc-wan=
ts.<br />May 12 11:42:51 qemux86-64 systemd-journald[133]: Forwarding to sy=
slog missed 120 messages.<br />May 12 11:42:51 qemux86-64 systemd[1]: Start=
ing "Test Wants service a"...<br />May 12 11:42:51 qemux86-64 echo[250]: He=
llo from Wants service (instance a)<br />May 12 11:42:51 qemux86-64 systemd=
[1]: Finished "Test Wants service a".</div>
<div>&nbsp;</div>
<div>where the "WantedBy" service is not started (as it is not enabled)</di=
v>
<div>&nbsp;</div>
<div>As mentioned, it appears to be a regression during the styhead -&gt; w=
alnascar development. I notice that the systemctl-native is now built from =
the systemd sources - is this correct? Should I consequently report this th=
rough systemd?</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>Martin</div>
<div>&nbsp;</div>

--6gKuFqh77eQ70IpA819K--

