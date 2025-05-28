Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DE4C5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 19:47:31 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.web10.4579.1748461648248226670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 12:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=PwkhhXny;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=hao8Wux7;
 spf=pass (domain: stwcx.xyz, ip: 103.168.172.144, mailfrom: patrick@stwcx.xyz)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 651EC1383109;
	Wed, 28 May 2025 15:47:27 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 28 May 2025 15:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1748461647; x=1748548047; bh=NIBPWh8khV
	KLqH+nW57xePOepWJg/dETtzLsOChsfCA=; b=PwkhhXnyql4DvQMPnxaHlrbPi9
	48Lp5rP+GlJeKxjyONwLX3L57SboQh3arw+KUxvp0kg3/rxZJkJk91ni/MOLjRDq
	43NOvXXZhGJGbpKPooY32yGCKj1bw76dj1l+J243cIvca/3xdOc3fNbYy22Zhbrc
	bEicaZCIgSnsZQjhWTg6iam2wPBHBBbu8WuVb9xr7ncILsUfQgFVbODENISuK7fC
	fS/p518Hu+4P6tkdc6hm2MXsMy2LUmUvmyUJX8hHueOn/QBLJ1wt8QA9c/eoJm3e
	ouWSmKrNbWwgGuedyw7vw02AtBjOXYQChtMKUvOvFpsR9cmkLEau/uGRWZew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748461647; x=1748548047; bh=NIBPWh8khVKLqH+nW57xePOepWJg/dETtzL
	sOChsfCA=; b=hao8Wux7dMvZ64m/pRUpNJVQ5YpRTPChC4U4YeVDF/YB4sfSmXj
	gMKjK6QlVBDExR/krZEElKZ6iLFGpMOIgUcJ+ZKU0za0qh8PbS5hGp4In4EpQ91X
	PgDhIvPxV7r8Kj5qga6wg3Vk0TtYO+rS27F6ir2anwwXgGLGFEWa8RLjkuImvEs6
	LeIh5Cj03jWqKaathBJOuDxS56nX2aNzgqZiuK7G23D3KrVpR2u12rTwVxYT9PVT
	a4LdprMPbx2NSp8oqGzUjKMkoiFHnYMZxoL7TLOeU3owhOtt5C6KIF3DaFYFiCI8
	ist2ySIzFgA2Pa10HEMqIvB35r1DFBJ1Rjw==
X-ME-Sender: <xms:Tmg3aP1vTXZwT7EFGxsmFDNUeRWaJC6zxkAIZllWXA7gfKlfwe83Hg>
    <xme:Tmg3aOEYyNxzQrkmSdKbDdarsixYRnwBcdc6C_y7PK_VAoe2g9lHRT5JDx5J6q601
    _Ofjo-06LWoNYZz4sE>
X-ME-Received: <xmr:Tmg3aP4VWcwVoGIe3t6li5cNo5csH9e6nU-KVm-wJLIJVQX4-bwD9YU_vtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvgedugeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculdefhedm
    necujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomheprfgrth
    hrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecu
    ggftrfgrthhtvghrnhepfeeluedvhffgfeetveejtdfhfeeugeduleduffetjeevheelfe
    fffeejvdehhfdunecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpkhgv
    rhhnvghlrdhorhhgpdhfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidr
    giihiidpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghn
    vghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorh
    hgpdhrtghpthhtohepmhhnshesghhomhhsphgrtggvrdgtohhmpdhrtghpthhtohepmhgr
    thhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomh
X-ME-Proxy: <xmx:Tmg3aE39u9qysaeVhom1jay6cTI3z_t63bLoCL2_5KZS8YcVmkFtyA>
    <xmx:Tmg3aCHM3Yw-dYp39Z2jSOQQsQ35b5IUxQyZOCblFLiGVQMVy_MRUA>
    <xmx:Tmg3aF8sKI2zg377mEg87XgsrInsIRCrwLYmSzemu5m7hQ64y0jMPA>
    <xmx:Tmg3aPnPKe4XQM1Lzx9S3o77TgSK57wbZvWGru0kHdecBcMjAMtXrw>
    <xmx:T2g3aK9jSgdCifWzQdVMzikp52S6w1sCcsik_o0zMyqOVDmznw6d31SZ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 May 2025 15:47:26 -0400 (EDT)
Date: Wed, 28 May 2025 15:47:25 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Martin Siegumfeldt <mns@gomspace.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] [PATCH] systemd.bbclass: fix postinst for real
 systemd-systemctl-native
Message-ID: <aDdoTVtCmElpURYD@heinlein>
References: <20250528035625.1262266-1-patrick@stwcx.xyz>
 <CANNYZj_5Wbvx0p54pqvnpHuOAX+nhpQenZKzn1YEduDs=tf2ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iYnTkwB5TEHhMGvu"
Content-Disposition: inline
In-Reply-To: <CANNYZj_5Wbvx0p54pqvnpHuOAX+nhpQenZKzn1YEduDs=tf2ag@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 19:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217396


--iYnTkwB5TEHhMGvu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Wed, May 28, 2025 at 11:07:54AM +0200, Alexander Kanavin wrote:
> On Wed, 28 May 2025 at 05:56, Patrick Williams via
> lists.openembedded.org <patrick=3Dstwcx.xyz@lists.openembedded.org>
> wrote:
> > The commit 7a580800db39 switched from a small Python implementation
> > of `systemctl` to using the real systemctl executable from the
> > systemd package.  In the systemd.bbclass, systemd-systemctl-native
> > is used to default-enable services, based on the SYSTEMD_SERVICES
> > variable, but this was only done if `systemctl` can be executed
> > without error.  The problem is that the real systemctl executable
> > treats a zero argument call as if `systemctl list-units` were ran.
> > This cannot be done when cross-compiling and yields:
> >
> > ```
> >     Failed to connect to system scope bus via local transport: Operation
> >     not permitted (consider using --machine=3D<user>@.host --user to
> >     connect to bus of other user)
> > ```
> >
> > The end result is that the `systemd_postinst` effectively turns into
> > a silent no-op and services are not correctly enabled.
> >
> > Switch the systemd.bbclass to use `systemctl --help` instead, which
> > does not require any dbus access to be functional.
> >
> > Fixes: 7a580800db39 ("systemd: Build the systemctl executable")
>=20
> I don't disagree with the patch, but I have to ask, why isn't this
> causing failures in our testing? There are images built using native
> systemctl, they contain services, and they do not produce fails on
> boot. There has to be a gap in testing somewhere, or systemctl somehow
> manages to do what it's supposed to.
>=20
> Can you set up poky-altcfg qemux86-64 on master, build
> core-image-weston and core-image-sato-sdk, and check what is
> happening? (e.g. by booting them in with runqemu).

I did fire this up in poky-altcfg, and you are correct that we do have
services enabled correctly there.  As an example, looking at the rootfs
we have symlinks out there as expected:

```
$ find tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/rootfs/etc/system=
d/ -type l
=2E..
tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/rootfs/etc/systemd/syste=
m/multi-user.target.wants/avahi-daemon.service
```

I then dug into the `log.do_rootfs` to figure out where this is coming
=66rom and this is what is going on:

```
DEBUG: Executing shell function systemd_handle_machine_id
=2E..

Created symlink '/home/apwillia/local/sync/openbmc-sources/poky/build/tmp/w=
ork/qemux86_64-poky-linux/core-image-sato/1.0/rootfs/etc/systemd/system/dbu=
s-org.freedesktop.Avahi.service' =E2=86=92 '/usr/lib/systemd/system/avahi-d=
aemon.service'.
=2E..
DEBUG: Shell function systemd_handle_machine_id finished
```

The symlinks we are currently getting are a side-effect of a `systemctl
--preset-mode=3Denable-only preset-all` call in
`systemd_handle_machine_id`.  This is different from the
`systemd_postinst` hook which is what I was changing here.  The preset
files are also being generated by `systemd_create_presets` in
systemd.bbclass:

```
$ cat usr/lib/systemd/system-preset/98-avahi-daemon.preset
enable avahi-daemon.service
```

Both me and Martin[1] are experiencing the issue not with
typical services but with template services though.  There are no
template services in poky-altcfg except for the `serial-getty@.service`
files which have symlinks manually created in systemd-serialgetty.bb.

I've dug into that a big and what I've found is that the
systemctl.preset manpage[2] has a different format for template services
than what `systemd_create_presets` is currently generating.  What I see
generated is:

```
$ cat ./usr/lib/systemd/system-preset/98-phosphor-ipmi-net.preset          =
   =20
enable phosphor-ipmi-net@eth0.service
enable phosphor-ipmi-net@eth0.socket
```

What the systemd manpage gives as an example is:

```
# /usr/lib/systemd/system-preset/80-dirsrv.preset
enable dirsrv@.service foo bar baz
```

The old Python fake-systemctl `enable` use to  handle initializing the temp=
late
instances and calling the systemd-systemctl-native one does as well.
The problem is that systemd-systemctl-native is also much more picky
about service files that we call `systemctl enable` against and as
Mathieu[3] points out, a number of packages currently fail using it.
So, this patch that I have here doesn't actually work for _those_
packages.

Walnascar is currently broken for template services and so is master.
My suggestion would be:

   - Revert 7a580800db39 in walnascar.
   - Improve systemd_create_presets to handle template services in master.
   - [Maybe] fix all the services failing per Mathieu on master.
   - [Maybe] apply this change so that `systemd_postinst` runs
             as it use to.

[1]: https://lore.kernel.org/openembedded-core/Z2ch.1747051947055246176.okt=
f@lists.openembedded.org/
[2]: https://www.freedesktop.org/software/systemd/man/latest/systemd.preset=
=2Ehtml
[3]: https://lore.kernel.org/openembedded-core/DA7SP4NN2WXR.1NUSV0GI05ZO5@b=
ootlin.com/

--=20
Patrick Williams

--iYnTkwB5TEHhMGvu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmg3aEwACgkQqwNHzC0A
wRli5A//SQD7qaf8BVE/n13RrKfIIuhrtK2V73oPDI5zkEFPgnHeDIr4GgdA04Yw
Dxc+u5bXpanGecTZg5BDnoiKHPlIYLWdHcoYUGUGhS7/j+CXEp9zvnkjqB1cOLC6
zuVHN0hfZarYI9xBiihXtO/GqxiWV+CqBU8xlgEaCQ4i/g8prKvjynEtUUqFooAs
77gHoXERyPJhjFp3G934aUN5wd4YKoMblSTkFZ8zsiN0/x8HAumVM86rISnvlf/A
crcP28efjQfXChiwEUdYZU7ozRtnWRFO/IorXNYNDecIisHz3QIKa8NjT8nGnfAT
Sb4ZpzBrFNIanltLi7DkaGAd9YT045S9vAgWC3XX7elMyOfcUPqURPt3NgvZ7WYL
4INPjCvMGV1OyrAW4v05MnbbEytF7Ed/kkN3811hJTheLBesIJEjEjdZR124OwZI
ptJjbmsKh9+u6K7sgNzfhvB5C8WU6CKFHpsmyHIW/ifjMbKyLIbgpjHxpq+MLJ4A
drM5koRkZSeb5rkHNAgx3WmF1tGjcIrS9fIPG8F3veXcOX/TAz8dxQBE98nFgKcI
OdgjvxCd/d4hmhZ/z2urLHmFx5vpEXgwCmaB6VNazQKa/D1rlNefvxgakHrP9mdo
EFbPwq+HaPvXiy7vi79W3QmN4YEUHf+xPLQ4sJYAz/n84nLmpj8=
=6klK
-----END PGP SIGNATURE-----

--iYnTkwB5TEHhMGvu--

