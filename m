Return-Path: <pespin.shar@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 515DA73D26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 08:28:49 +0000 (UTC)
Received: by lbbqi7 with SMTP id qi7so48310426lbb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 01:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wtEUIx/AmmmyCPx/G4vsPOQJy7Bb9irX6VEKjtXbWw4=;
	b=cFoof2E5B8c6ZkXQw5h0b/LK6bFognuBT2cM2mw9nXPO5PkAaK3azrifZAIGg04oM+
	A3Uzno8oFRBnKfA0hg31R4MTNEhnqW6Cpy2ZbpiPm2ORr0ufSWmbga041Vss2jWoAKhc
	YjQTKAOCDOHxIZuHkLCxgrzAkhPmneum3Fz7OOmwbMmNnUkOBfmf/f5qaU7cAoMl5HOD
	Y55urYGKi8vQAj/6WLCgIktskbojlucxhh07Tq6AVQNTW9SudCtrr6dWz4N0rZmN7ReI
	JN4xDu3VdeG6C6MOGnMDAV3MrFYL06wwznYULSi19l3tQw4Eew7r3A7IOlXzpVy3Saui
	22Vw==
MIME-Version: 1.0
X-Received: by 10.112.52.2 with SMTP id p2mr25679380lbo.8.1437985728628; Mon,
	27 Jul 2015 01:28:48 -0700 (PDT)
Received: by 10.25.3.10 with HTTP; Mon, 27 Jul 2015 01:28:48 -0700 (PDT)
In-Reply-To: <1437809373.11632.22.camel@tkkaskin-mobl3.ger.corp.intel.com>
References: <1437746580-31696-1-git-send-email-pau.espin@aweurope.be>
	<1437746580-31696-2-git-send-email-pau.espin@aweurope.be>
	<CAEGpDubFdWgrcje9hzz9CQ56MDB2kfQ5GKOG0Y9qEzsqz63=8A@mail.gmail.com>
	<1437809373.11632.22.camel@tkkaskin-mobl3.ger.corp.intel.com>
Date: Mon, 27 Jul 2015 10:28:48 +0200
Message-ID: <CAEGpDuZdgYiaRW-vWT5uk3sOQaGR+7=cJvpmdFiS-LQ4pgSGiw@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] systemd.bbclass: Use systemd_system_unitdir
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
X-List-Received-Date: Mon, 27 Jul 2015 08:28:55 -0000
Content-Type: multipart/alternative; boundary=001a11c3bb3e8c0c8a051bd72496

--001a11c3bb3e8c0c8a051bd72496
Content-Type: text/plain; charset=UTF-8

OK Tanu,

I will try to do some tests and prepare new patches during the following
days.

Thanks for reviewing,

Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

2015-07-25 9:29 GMT+02:00 Tanu Kaskinen <tanu.kaskinen@linux.intel.com>:

> On Fri, 2015-07-24 at 17:10 +0200, Pau Espin Pedrol wrote:
> > Hi,
> >
> > actually this breaks build of systemd.bb itself, because it installs
> > its system recipes using paths from Makefile.am:
> >         userunitdir=$(prefix)/lib/systemd/user
> >         systemunitdir=$(rootprefix)/lib/systemd/system
> >
> > And in the recipe for systemd_219.bb we have:
> >         # Helper variables to clarify locations.  This mirrors the
> >         logic in systemd's
> >         # build system.
> >         rootprefix ?= "${base_prefix}"
> >         rootlibdir ?= "${base_libdir}"
> >         rootlibexecdir = "${rootprefix}/lib"
> >
> >
> > So, that means it installs its own services into /lib, not /usr/lib.
> > The changes done in systemd.bbclass in this patch remove the search
> > path of /lib, allowing only ${system_system_unitdir} which is
> > "/usr/lib/systemd/system".
> >
> >
> > I tried changing rootprefix to use "${prefix}" but then I get other
> > problems:
> >         ERROR: QA Issue: systemd: Files/directories were installed but
> >         not shipped
> >           /usr/bin/udevadm
> >           /usr/bin/journalctl
> >           /usr/bin/loginctl
> >           /usr/bin/machinectl
> >           /usr/bin/systemctl
> >           /usr/lib/udev/.debug
> >           /usr/lib/udev/.debug/cdrom_id
> >           /usr/lib/udev/.debug/collect
> >           /usr/lib/udev/.debug/ata_id
> >           /usr/lib/udev/.debug/v4l_id
> >           /usr/lib/udev/.debug/mtd_probe
> >           /usr/lib/udev/.debug/scsi_id
> >           /usr/lib/udev/.debug/accelerometer
> >           /usr/lib/udev/rules.d/70-uaccess.rules
> >           /usr/lib/udev/rules.d/73-seat-late.rules
> >           /usr/lib/udev/rules.d/71-seat.rules
> >           /usr/lib/udev/rules.d/99-systemd.rules
> >
> >
> > Which at the end makes me think... is it really a good idea to set
> > systemd_unitdir and system_system_unitdir to use "${nonarch_libdir}"?
> > I think we should be better using ${nonarch_base_libdir} for those, as
> > systemd guys themselves make distinction between both (prefix vs
> > rootprefix).
>
> I agree. ${nonarch_base_libdir} seems to be definitely the right place
> to put system service files. This may change if some day nobody will
> have a separate /usr partition any more (which is what the systemd
> developers are pushing for, AFAIK), but as long as we have to deal with
> systems with a separate /usr partition, I think using /lib is the only
> safe choice.
>
> --
> Tanu
>
>
>

--001a11c3bb3e8c0c8a051bd72496
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>OK Tanu,<br><br></div>I will try to do some test=
s and prepare new patches during the following days.<br><br></div>Thanks fo=
r reviewing,<br></div><div class=3D"gmail_extra"><br clear=3D"all"><div><di=
v class=3D"gmail_signature">Pau Espin Pedrol<br>mail/jabber: <a href=3D"mai=
lto:pespin.shar@gmail.com" target=3D"_blank">pespin.shar@gmail.com</a><br><=
a href=3D"http://blog.espeweb.net" target=3D"_blank">http://blog.espeweb.ne=
t</a><br></div></div>
<br><div class=3D"gmail_quote">2015-07-25 9:29 GMT+02:00 Tanu Kaskinen <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:tanu.kaskinen@linux.intel.com" target=
=3D"_blank">tanu.kaskinen@linux.intel.com</a>&gt;</span>:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><span class=3D"">On Fri, 2015-07-24 at 17:10 +0200, Pau Es=
pin Pedrol wrote:<br>
&gt; Hi,<br>
&gt;<br>
</span>&gt; actually this breaks build of <a href=3D"http://systemd.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd.bb</a> itself, because it install=
s<br>
<span class=3D"">&gt; its system recipes using paths from Makefile.am:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0userunitdir=3D$(prefix)/lib/systemd/u=
ser<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemunitdir=3D$(rootprefix)/lib/sys=
temd/system<br>
&gt;<br>
</span>&gt; And in the recipe for <a href=3D"http://systemd_219.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_219.bb</a> we have:<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Helper varia=
bles to clarify locations.=C2=A0 This mirrors the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logic in systemd&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# build system.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootprefix ?=3D &quot;${base_prefix}&=
quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootlibdir ?=3D &quot;${base_libdir}&=
quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootlibexecdir =3D &quot;${rootprefix=
}/lib&quot;<br>
&gt;<br>
&gt;<br>
&gt; So, that means it installs its own services into /lib, not /usr/lib.<b=
r>
&gt; The changes done in systemd.bbclass in this patch remove the search<br=
>
&gt; path of /lib, allowing only ${system_system_unitdir} which is<br>
&gt; &quot;/usr/lib/systemd/system&quot;.<br>
&gt;<br>
&gt;<br>
&gt; I tried changing rootprefix to use &quot;${prefix}&quot; but then I ge=
t other<br>
&gt; problems:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR: QA Issue: systemd: Files/direc=
tories were installed but<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0not shipped<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/bin/udevadm<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/bin/journalctl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/bin/loginctl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/bin/machinectl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/bin/systemctl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/udev/.debug<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/udev/.debug/cdrom_id<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/udev/.debug/collect<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/udev/.debug/ata_id<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/udev/.debug/v4l_id<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/udev/.debug/mtd_probe=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/udev/.debug/scsi_id<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/udev/.debug/accelerom=
eter<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/udev/rules.d/70-uacce=
ss.rules<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/udev/rules.d/73-seat-=
late.rules<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/udev/rules.d/71-seat.=
rules<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/udev/rules.d/99-syste=
md.rules<br>
&gt;<br>
&gt;<br>
&gt; Which at the end makes me think... is it really a good idea to set<br>
&gt; systemd_unitdir and system_system_unitdir to use &quot;${nonarch_libdi=
r}&quot;?<br>
&gt; I think we should be better using ${nonarch_base_libdir} for those, as=
<br>
&gt; systemd guys themselves make distinction between both (prefix vs<br>
&gt; rootprefix).<br>
<br>
</div></div>I agree. ${nonarch_base_libdir} seems to be definitely the righ=
t place<br>
to put system service files. This may change if some day nobody will<br>
have a separate /usr partition any more (which is what the systemd<br>
developers are pushing for, AFAIK), but as long as we have to deal with<br>
systems with a separate /usr partition, I think using /lib is the only<br>
safe choice.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Tanu<br>
<br>
<br>
</font></span></blockquote></div><br></div>

--001a11c3bb3e8c0c8a051bd72496--
