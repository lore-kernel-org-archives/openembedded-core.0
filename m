Return-Path: <rewitt@declaratino.com>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Nov 2015 07:40:34 UTC
Received: from p3plsmtpa07-02.prod.phx3.secureserver.net
	(p3plsmtpa07-02.prod.phx3.secureserver.net [173.201.192.231])
	by mail.openembedded.org (Postfix) with ESMTP id 1610B6018D;
	Tue, 24 Nov 2015 07:40:34 +0000 (UTC)
Received: from mail-lf0-f43.google.com ([209.85.215.43])
	by p3plsmtpa07-02.prod.phx3.secureserver.net with 
	id lKZQ1r0090wlEax01KZRsR; Tue, 24 Nov 2015 00:33:25 -0700
Received: by lfs39 with SMTP id 39so9564732lfs.3;
	Mon, 23 Nov 2015 23:33:24 -0800 (PST)
X-Received: by 10.25.19.168 with SMTP id 40mr12977434lft.68.1448350404053;
	Mon, 23 Nov 2015 23:33:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.20.145 with HTTP; Mon, 23 Nov 2015 23:32:54 -0800 (PST)
In-Reply-To: <56538808.5050606@linux.intel.com>
References: <56538808.5050606@linux.intel.com>
From: Randy Witt <rewitt@declaratino.com>
Date: Mon, 23 Nov 2015 23:32:54 -0800
X-Gmail-Original-Message-ID: <CAP5N7XH-wVfyyCeBK7gdYXtoDLQuXPKkXV=CRNowmbPUGvxb8Q@mail.gmail.com>
Message-ID: <CAP5N7XH-wVfyyCeBK7gdYXtoDLQuXPKkXV=CRNowmbPUGvxb8Q@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Reference updater filesystem
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
X-List-Received-Date: Tue, 24 Nov 2015 07:40:34 -0000
Content-Type: multipart/alternative; boundary=001a11401d705815be0525445b2b

--001a11401d705815be0525445b2b
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 23, 2015 at 1:41 PM, Mariano Lopez <
mariano.lopez@linux.intel.com> wrote:

> There has been interest in an image based software updater in Yocto
> Project. The proposed solution for a image based updater is to use Stefano
> Babic's software updater (http://sbabic.github.io/swupdate). This
> software do a binary copy, so it is needed to have at least two partitions,
> these partitions would be the rootfs and the maintenance partition. The
> rootfs it's the main partition used to boot during the normal device
> operation, on the other hand, the maintenance will be used to update the
> main partition.
>
> To update the system, the user has to connect to device and boot in the
> maintenance partition; once in the maintenance partition the software
> updater will copy the new image in the rootfs partition. A final reboot
> into the rootfs it is necessary to complete the upgrade.
>
> As mentioned before the the software will copy an image to the partition,
> so everything in that partition will be wiped out, including custom
> configurations. To avoid the loss of configuration I explore three
> different solutions:
> 1. Use a separate partition for the configuration.
>   a. The pro of this method is the partition is not touched during the
> update.
>   b. The con of this method is the configuration is not directly in rootfs
> (example: /etc).
>
> Configuration files can be anywhere a package decides to install them. So
having a single partition would be difficult. If you could, you would most
likely be forced to have an initramfs to make sure /etc was mounted before
init runs.


> 2. Do the backup during the update.
>   a. The pro is the configuration is directly in rootfs.
>   b. The con is If the update fail most likely the configuration would be
> lost.
>
> Why would the configuration be lost if the update fails? Couldn't it just
be stored on the thumbdrive?


> 3. Have an OverlayFS for the rootfs or the partition that have the
> configuration.
>   a. The pro is the configuration is  "directly" in rootfs.
>   b. The con is there is need to provide a custom init to guarantee the
> Overlay is mounted before the boot process.
>
> With the above information I'm proposing to use a separate partition for
> the configuration; this is because is more reliable and doesn't require big
> changes in the current architecture.
>
> So, the idea is to have 4 partitions in the media:
> 1. boot. This is the usual boot partition
> 2. data. This will hold the configuration files. Not modified by updates.
> 3. maintenance. This partition will be used to update rootfs.
> 4. rootfs. Partition used for normal operation.
>
> Mariano
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11401d705815be0525445b2b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Nov 23, 2015 at 1:41 PM, Mariano Lopez <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:mariano.lopez@linux.intel.com" target=3D"_blank">mariano.lo=
pez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>There has been interest in an image based software updater in Yocto Projec=
t. The proposed solution for a image based updater is to use Stefano Babic&=
#39;s software updater (<a href=3D"http://sbabic.github.io/swupdate" rel=3D=
"noreferrer" target=3D"_blank">http://sbabic.github.io/swupdate</a>). This =
software do a binary copy, so it is needed to have at least two partitions,=
 these partitions would be the rootfs and the maintenance partition. The ro=
otfs it&#39;s the main partition used to boot during the normal device oper=
ation, on the other hand, the maintenance will be used to update the main p=
artition.<br>
<br>
To update the system, the user has to connect to device and boot in the mai=
ntenance partition; once in the maintenance partition the software updater =
will copy the new image in the rootfs partition. A final reboot into the ro=
otfs it is necessary to complete the upgrade.<br>
<br>
As mentioned before the the software will copy an image to the partition, s=
o everything in that partition will be wiped out, including custom configur=
ations. To avoid the loss of configuration I explore three different soluti=
ons:<br>
1. Use a separate partition for the configuration.<br>
=C2=A0 a. The pro of this method is the partition is not touched during the=
 update.<br>
=C2=A0 b. The con of this method is the configuration is not directly in ro=
otfs (example: /etc).<br>
<br></blockquote><div>Configuration files can be anywhere a package decides=
 to install them. So having a single partition would be difficult. If you c=
ould, you would most likely be forced to have an initramfs to make sure /et=
c was mounted before init runs.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
2. Do the backup during the update.<br>
=C2=A0 a. The pro is the configuration is directly in rootfs.<br>
=C2=A0 b. The con is If the update fail most likely the configuration would=
 be lost.<br>
<br></blockquote><div>Why would the configuration be lost if the update fai=
ls? Couldn&#39;t it just be stored on the thumbdrive?</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
3. Have an OverlayFS for the rootfs or the partition that have the configur=
ation.<br>
=C2=A0 a. The pro is the configuration is=C2=A0 &quot;directly&quot; in roo=
tfs.<br>
=C2=A0 b. The con is there is need to provide a custom init to guarantee th=
e Overlay is mounted before the boot process.<br>
<br>
With the above information I&#39;m proposing to use a separate partition fo=
r the configuration; this is because is more reliable and doesn&#39;t requi=
re big changes in the current architecture.<br>
<br>
So, the idea is to have 4 partitions in the media:<br>
1. boot. This is the usual boot partition<br>
2. data. This will hold the configuration files. Not modified by updates.<b=
r>
3. maintenance. This partition will be used to update rootfs.<br>
4. rootfs. Partition used for normal operation.<span class=3D"HOEnZb"><font=
 color=3D"#888888"><br>
<br>
Mariano<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--001a11401d705815be0525445b2b--
