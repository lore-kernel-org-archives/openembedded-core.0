Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E75CD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 23:25:00 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.26397.1712186693301689815
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 16:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BWi/K21j;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: danismostlikely@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6152088aa81so4964997b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 16:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712186692; x=1712791492; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0xrMJMJHb4yGaGdw7lE5rslJwWoW+wvUUIvuEc7JrQs=;
        b=BWi/K21ju8qja9A9mlc4aZoAUPchtP087v9LY+Pdx9PrDWwJnRQGqbLJlmm6/O7Vnh
         nsa9vSpm71uuNgoycQQhvwl1egJIpeqSQSfw33S/51UQ4jDm7fS9pHdcEj95YPDaXMxn
         iWYtHBZGyhHlc+fmoMdOmhcMpGkTqtDEd9hxmul8WwgdU/EpT736plLc16rDMD5Fuy/p
         NIVsGCQXBGYNAqk0OgpuQUSTCLtsD1QQvdnuAVIg2a8FMabpMvn7mYxP/ksuxK4RNibb
         UCxfz5feMwpGZFN8AKfFg7breaWcL+CE7412yv3ajUfHS4cU6a6PUujR/VODPXgGdbRZ
         xPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712186692; x=1712791492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xrMJMJHb4yGaGdw7lE5rslJwWoW+wvUUIvuEc7JrQs=;
        b=dW5sdEKXjIv7ESjgCN4XXYwsRolA/9RNqLWEYlSMB8PVLGIR48zE8CJkp/6R/dy7vf
         ijaX0fAPnvQo6G5C+ZNnElpYjA2KVPnnLYUY8X8TZQ1IICED3f8UWMVNQoWg3LbLlU4j
         sgAUcaGeqQzG5YpmiKN67gcaVcjG+UiUhsBoZ5u+5VxY3kixLdJojxD2O0ZKIZFQtZKy
         ehDlPMhUhlzxdu8tkKzckh3cuNiwHIcWFf5D5A8VTURTiKZPvK1wkUZRlvMIv9ytHMm+
         VRoqRjJ/k5mcIlCoWedmDiXtEYmSg9H+UNckal87V0DuSzB563kIpz8XV9q9qLNgQV+m
         NvBQ==
X-Gm-Message-State: AOJu0Yz2RsD/k9MDhZwkQwAlwkpnvOCgjwlqg6+tqwWiHzwQwZt58UTK
	N/1mBMBgJthSmKBDC/ZSFCMYd3WzbqAEug7ekH/ZP2ZlIBerg2tZgQUz+AfECJlIEB1g1qscMJq
	hGiq3AxAeOG/mCEwQ/3/ucGXQRYM=
X-Google-Smtp-Source: AGHT+IERiQVvm0RRMNorMYxlp/lj/w/czbDuOax+ri07DHVK6AW74m4EfbJTdfDsqqCRXwLKG15K3odFXBv+QFsHhHo=
X-Received: by 2002:a81:4ed8:0:b0:615:3858:d14c with SMTP id
 c207-20020a814ed8000000b006153858d14cmr1014241ywb.28.1712186692365; Wed, 03
 Apr 2024 16:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240329012413.892379-1-danismostlikely@gmail.com> <2024033121343383185c87@mail.local>
In-Reply-To: <2024033121343383185c87@mail.local>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 3 Apr 2024 17:24:39 -0600
Message-ID: <CACS+7ZT_b2ocJv3r7wCOSEcUg=C1mHEMhd9ndkKacSijLxJX=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 1/3] nfs-utils: clean up startup
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Daniel McGregor <daniel.mcgregor@vecima.com>
Content-Type: multipart/alternative; boundary="000000000000967701061539878e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 23:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197944

--000000000000967701061539878e
Content-Type: text/plain; charset="UTF-8"

Thanks. All my local testing against the defaults is now working as of v7.
New upstream statuses in patches and fixed packaging errors I had
introduced.

On Sun, Mar 31, 2024, 15:34 Alexandre Belloni <alexandre.belloni@bootlin.com>
wrote:

> This still fails on the AB:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/9115/steps/14/logs/stdio
>
> On 28/03/2024 19:24:10-0600, Dan McGregor wrote:
> > From: Daniel McGregor <daniel.mcgregor@vecima.com>
> >
> > Change the sysvinit script to start at the S runlevel, this matches
> > Debian, and prevents systemd from generating a unit file for it.
> > Also have the nfsd systemd service request the nfsd kernel filesystem
> > mountpoint. This avoids startup failures in unpriviled containers
> > or other setups that don't support the filesystem.
> >
> > Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> > ---
> >  meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon | 4 ++--
> >  meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb  | 9 ++++-----
> >  2 files changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
> b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
> > index 992267d5a16..4c1ad17c3c6 100644
> > --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
> > +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
> > @@ -3,7 +3,7 @@
> >  # Provides:          nfs-common
> >  # Required-Start:    $portmap hwclock
> >  # Required-Stop:     $portmap hwclock
> > -# Default-Start:     2 3 4 5
> > +# Default-Start:     S
> >  # Default-Stop:      0 1 6
> >  # Short-Description: NFS support for both client and server
> >  # Description:       NFS is a popular protocol for file sharing across
> > @@ -20,7 +20,7 @@
> >  . /etc/init.d/functions
> >
> >  test -x "$NFS_STATD" || NFS_STATD=/usr/sbin/rpc.statd
> > -test -z "$STATD_PID" && STATD_PID=/var/run/rpc.statd.pid
> > +test -z "$STATD_PID" && STATD_PID=/run/rpc.statd.pid
> >  #
> >  # The default state directory is /var/lib/nfs
> >  test -n "$NFS_STATEDIR" || NFS_STATEDIR=/var/lib/nfs
> > diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> > index 2f2644f9a83..527fcd609c1 100644
> > --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> > +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> > @@ -132,15 +132,14 @@ do_install:append () {
> >       install -m 0644 ${WORKDIR}/nfs-server.service
> ${D}${systemd_system_unitdir}/
> >       install -m 0644 ${WORKDIR}/nfs-mountd.service
> ${D}${systemd_system_unitdir}/
> >       install -m 0644 ${WORKDIR}/nfs-statd.service
> ${D}${systemd_system_unitdir}/
> > +     install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount
> ${D}${systemd_system_unitdir}/
> >       sed -i -e 's,@SBINDIR@,${sbindir},g' \
> >               -e 's,@SYSCONFDIR@,${sysconfdir},g' \
> >               -e 's,@HIGH_RLIMIT_NOFILE@,${HIGH_RLIMIT_NOFILE},g' \
> >               ${D}${systemd_system_unitdir}/*.service
> > -     if
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> > -             install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount
> ${D}${systemd_system_unitdir}/
> > -             install -d
> ${D}${systemd_system_unitdir}/sysinit.target.wants/
> > -             ln -sf ../proc-fs-nfsd.mount
> ${D}${systemd_system_unitdir}/sysinit.target.wants/proc-fs-nfsd.mount
> > -     fi
> > +     # Add compatibility symlinks for the sysvinit scripts
> > +     ln -s nfs-server.service
> ${D}${systemd_system_unitdir}/nfsserver.service
> > +     ln -s /dev/null ${D}${systemd_system_unitdir}/nfscommon.service
> >
> >       # kernel code as of 3.8 hard-codes this path as a default
> >       install -d ${D}/var/lib/nfs/v4recovery
> > --
> > 2.41.0
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#197616):
> https://lists.openembedded.org/g/openembedded-core/message/197616
> > Mute This Topic: https://lists.openembedded.org/mt/105209254/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000967701061539878e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks. All my local testing against the defaults is now =
working as of v7. New upstream statuses in patches and fixed packaging erro=
rs I had introduced.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Sun, Mar 31, 2024, 15:34 Alexandre Belloni &lt;<a hr=
ef=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This still fails on t=
he AB:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/23/build=
s/9115/steps/14/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/9115/ste=
ps/14/logs/stdio</a><br>
<br>
On 28/03/2024 19:24:10-0600, Dan McGregor wrote:<br>
&gt; From: Daniel McGregor &lt;<a href=3D"mailto:daniel.mcgregor@vecima.com=
" target=3D"_blank" rel=3D"noreferrer">daniel.mcgregor@vecima.com</a>&gt;<b=
r>
&gt; <br>
&gt; Change the sysvinit script to start at the S runlevel, this matches<br=
>
&gt; Debian, and prevents systemd from generating a unit file for it.<br>
&gt; Also have the nfsd systemd service request the nfsd kernel filesystem<=
br>
&gt; mountpoint. This avoids startup failures in unpriviled containers<br>
&gt; or other setups that don&#39;t support the filesystem.<br>
&gt; <br>
&gt; Signed-off-by: Daniel McGregor &lt;<a href=3D"mailto:daniel.mcgregor@v=
ecima.com" target=3D"_blank" rel=3D"noreferrer">daniel.mcgregor@vecima.com<=
/a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon | 4 ++--=
<br>
&gt;=C2=A0 meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-utils_=
2.6.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">nfs-utils_2.6.4.b=
b</a>=C2=A0 | 9 ++++-----<br>
&gt;=C2=A0 2 files changed, 6 insertions(+), 7 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon b=
/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon<br>
&gt; index 992267d5a16..4c1ad17c3c6 100644<br>
&gt; --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon<br>
&gt; +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon<br>
&gt; @@ -3,7 +3,7 @@<br>
&gt;=C2=A0 # Provides:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nfs-common<br>
&gt;=C2=A0 # Required-Start:=C2=A0 =C2=A0 $portmap hwclock<br>
&gt;=C2=A0 # Required-Stop:=C2=A0 =C2=A0 =C2=A0$portmap hwclock<br>
&gt; -# Default-Start:=C2=A0 =C2=A0 =C2=A02 3 4 5<br>
&gt; +# Default-Start:=C2=A0 =C2=A0 =C2=A0S<br>
&gt;=C2=A0 # Default-Stop:=C2=A0 =C2=A0 =C2=A0 0 1 6<br>
&gt;=C2=A0 # Short-Description: NFS support for both client and server<br>
&gt;=C2=A0 # Description:=C2=A0 =C2=A0 =C2=A0 =C2=A0NFS is a popular protoc=
ol for file sharing across<br>
&gt; @@ -20,7 +20,7 @@<br>
&gt;=C2=A0 . /etc/init.d/functions<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 test -x &quot;$NFS_STATD&quot; || NFS_STATD=3D/usr/sbin/rpc.stat=
d<br>
&gt; -test -z &quot;$STATD_PID&quot; &amp;&amp; STATD_PID=3D/var/run/rpc.st=
atd.pid<br>
&gt; +test -z &quot;$STATD_PID&quot; &amp;&amp; STATD_PID=3D/run/rpc.statd.=
pid<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # The default state directory is /var/lib/nfs<br>
&gt;=C2=A0 test -n &quot;$NFS_STATEDIR&quot; || NFS_STATEDIR=3D/var/lib/nfs=
<br>
&gt; diff --git a/meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs=
-utils_2.6.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">nfs-utils_=
2.6.4.bb</a> b/meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-ut=
ils_2.6.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">nfs-utils_2.6=
.4.bb</a><br>
&gt; index 2f2644f9a83..527fcd609c1 100644<br>
&gt; --- a/meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-utils_=
2.6.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">nfs-utils_2.6.4.b=
b</a><br>
&gt; +++ b/meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-utils_=
2.6.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">nfs-utils_2.6.4.b=
b</a><br>
&gt; @@ -132,15 +132,14 @@ do_install:append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/nfs-server.servic=
e ${D}${systemd_system_unitdir}/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/nfs-mountd.servic=
e ${D}${systemd_system_unitdir}/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/nfs-statd.service=
 ${D}${systemd_system_unitdir}/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D=
}${systemd_system_unitdir}/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,@SBINDIR@,${sbindir},g&#39;=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,@SYSCO=
NFDIR@,${sysconfdir},g&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,@HIGH_=
RLIMIT_NOFILE@,${HIGH_RLIMIT_NOFILE},g&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${systemd_sy=
stem_unitdir}/*.service<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;=
,&#39;systemd&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WOR=
KDIR}/proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${syst=
emd_system_unitdir}/sysinit.target.wants/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../proc-fs-nfs=
d.mount ${D}${systemd_system_unitdir}/sysinit.target.wants/proc-fs-nfsd.mou=
nt<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Add compatibility symlinks for the sysvinit scr=
ipts<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ln -s nfs-server.service ${D}${systemd_system_uni=
tdir}/nfsserver.service<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ln -s /dev/null ${D}${systemd_system_unitdir}/nfs=
common.service<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# kernel code as of 3.8 hard-codes this path=
 as a default<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/var/lib/nfs/v4recovery<br>
&gt; -- <br>
&gt; 2.41.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#197616): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/197616" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1976=
16</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10520925=
4/3617179" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/105209254/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.=
belloni@bootlin.com" target=3D"_blank" rel=3D"noreferrer">alexandre.belloni=
@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div>

--000000000000967701061539878e--

