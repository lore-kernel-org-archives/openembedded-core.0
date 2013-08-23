Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0EC71608A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 06:33:40 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id q10so290680pdj.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 23:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=aFaGyTNhW8K30AGMyuVSF8Q+4iiizYY9pelBcv/5yhU=;
	b=0EzMBsEpMd4eZWmE3nxNTzImjcMCDuhL7/cWmp3rJD3cZTn6+wiRYvqtFNJ9XsyBCz
	3vBYwKWeZ2kbXoUxZvPrMo16FMxyhVnPx4gTGsE+xpstJCKzjI98Rz/vSiR8BAMLFT5k
	gLaBOdNMqhPUpWK6BrrSRd+m7fsLrLMBgW7bRoeP2EYXydX3vMJAb5QfQMlfpx5l2DyV
	IB9MrAUYKqcQYu0BGhYd+1VO0UKTFTfKpsteF15W07sESpWH/YhHy2pmyCEVhIUc3Rd/
	gFD3kQCdW9gJYtWfMR7wH+FfAY9BTYiLdxk8UdR2cB8ZCqgghcgLcbGNvvaH/UjVEbVm
	ZkXw==
X-Received: by 10.68.106.99 with SMTP id gt3mr9457118pbb.116.1377239620676;
	Thu, 22 Aug 2013 23:33:40 -0700 (PDT)
Received: from sa-nc-finance-109.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	ta10sm21308351pab.5.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 23:33:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CA+AhUGwh+Ck5LYxwL0Lp20czW6m-xQAPnFOckfnjNFFB9aMreA@mail.gmail.com>
Date: Thu, 22 Aug 2013 23:33:36 -0700
Message-Id: <FBAD1345-C987-413A-83C8-67042BEACBAF@gmail.com>
References: <CA+AhUGwh+Ck5LYxwL0Lp20czW6m-xQAPnFOckfnjNFFB9aMreA@mail.gmail.com>
To: =?iso-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Issue with pulseaudio and Qt introduced with eglibc 2.18
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
X-List-Received-Date: Fri, 23 Aug 2013 06:33:41 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_3B31D1C0-D10F-4E15-9F00-7CB879AAE601"

--Apple-Mail=_3B31D1C0-D10F-4E15-9F00-7CB879AAE601
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


On Aug 22, 2013, at 11:14 PM, Erik Bot=F6 <erik.boto@pelagicore.com> =
wrote:

> Hi,=20
>=20
> I'm hitting a bug now when using Qt to play e.g mp3:s to a pulseaudio =
sink. Using gst-launch with playbin2 and pulsesink works well on the =
same system. I have tried a few different versions of Qt (5.0.1, 5.0.2 =
and Qt 5.1) and both pulseaudio 3 and 4 with the same problem. When I =
added this to local.conf:=20
>=20
> PREFERRED_VERSION_eglibc-locale =3D "2.17"
> PREFERRED_VERSION_eglibc-mtrace =3D "2.17"
> PREFERRED_VERSION_eglibc-scripts =3D "2.17"
> PREFERRED_VERSION_eglibc-initial =3D "2.17"
> PREFERRED_VERSION_eglibc =3D "2.17"
>=20
> It works ok again, so it was introduced when moving to eglib 2.18 (not =
saying that the actual error is in eglibc though).
>=20
> The error I'm seeing is this:=20
> Assertion 'pthread_mutex_unlock(&m->mutex) =3D=3D 0' failed at =
pulsecore/mutex-posix.c:108, function pa_mutex_unlock(). Aborting.

can you try

$ export CANBERRA_DRIVER=3D"null"

and run the faulty program in this shell.

Does this fix the problem ?



>=20
> Google tells me that this has been an issue for OMAP4 when certain =
kernel configuration where enabled [1], which makes me believe this =
might be a hard one to track down. I'll see if I can find the time to =
debug it a bit more, but I would really appreciate any input.=20
>=20
> It's quite easy to reproduce, just use the QtMultimedia (built to use =
gstreamer and pulseaudio) mediaplayer example and select an mp3 file. It =
works like one time out of 20 or so, so some kind of race condition is =
probably the case.=20
>=20
> My hardware setup is a nitrogen6x board with a Freescale iMX6 =
processor (so I'm using meta-fsl-arm*), I've tried with both Qt built =
with meta-qt5 and an external Qt build against the Yocto sysroot. If =
anyone can reproduce this on some other hardware that would be nice to =
know.
>=20
> This started on the meta-freescale list [2], but is probably belonging =
here.=20
>=20
> [1]. =
http://lists.linaro.org/pipermail/linaro-dev/2013-April/015794.html
> [2]. =
https://lists.yoctoproject.org/pipermail/meta-freescale/2013-August/004152=
.html
>=20
> Cheers,=20
> Erik Bot=F6
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_3B31D1C0-D10F-4E15-9F00-7CB879AAE601
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><br><div><div>On Aug 22, 2013, at 11:14 PM, Erik Bot=F6 &lt;<a =
href=3D"mailto:erik.boto@pelagicore.com">erik.boto@pelagicore.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><div dir=3D"ltr">Hi,&nbsp;<div><br></div><div><span =
style=3D"font-family:arial,sans-serif;font-size:13px">I'm hitting a bug =
now when using Qt to play e.g mp3:s to a pulseaudio sink. Using =
gst-launch with playbin2 and pulsesink works well on the same system. I =
have tried a few different versions of Qt (5.0.1, 5.0.2 and Qt 5.1) and =
both pulseaudio 3 and 4 with the same problem. When I&nbsp;</span><span =
style=3D"font-family:arial,sans-serif;font-size:13px">added this to =
local.conf:&nbsp;</span></div>
<div><div =
style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div =
style=3D"font-family:arial,sans-serif;font-size:13px"><div>PREFERRED_VERSI=
ON_eglibc-locale =3D "2.17"</div><div>PREFERRED_VERSION_eglibc-mtrace =3D =
"2.17"</div>
<div>PREFERRED_VERSION_eglibc-scripts =3D =
"2.17"</div><div>PREFERRED_VERSION_eglibc-initial =3D =
"2.17"</div><div>PREFERRED_VERSION_eglibc =3D =
"2.17"</div></div></div><div><font face=3D"arial, sans-serif"><br>
</font></div><div><font face=3D"arial, sans-serif">It works ok again, so =
it was introduced when moving to eglib 2.18 (not saying that the actual =
error is in eglibc though).</font></div><div><font face=3D"arial, =
sans-serif"><br>
</font></div><div><div =
style=3D"font-family:arial,sans-serif;font-size:13px">The error I'm =
seeing is this:&nbsp;</div><div =
style=3D"font-family:arial,sans-serif;font-size:13px">Assertion =
'pthread_mutex_unlock(&amp;m-&gt;mutex) =3D=3D 0' failed at =
pulsecore/mutex-posix.c:108, function pa_mutex_unlock(). =
Aborting.</div></div></div></blockquote><div><br></div><div>can you =
try</div><div><br></div><div><div>$ export =
CANBERRA_DRIVER=3D"null"</div><div><br></div><div>and run the faulty =
program in this shell.</div><div><br></div><div>Does this fix the =
problem ?</div><br =
class=3D"Apple-interchange-newline"><br></div><br><blockquote =
type=3D"cite"><div dir=3D"ltr"><div>
<div><br></div><div><span =
style=3D"font-family:arial,sans-serif;font-size:13px">Google tells me =
that this has been an issue for OMAP4 when certain kernel configuration =
where enabled [1], which makes me believe this might be a hard one to =
track down. I'll see if I can find the time to debug it a bit more, but =
I would really appreciate any input.&nbsp;</span></div>
<div><span =
style=3D"font-family:arial,sans-serif;font-size:13px"><br></span></div><di=
v><span style=3D"font-family:arial,sans-serif;font-size:13px">It's quite =
easy to reproduce, just use the QtMultimedia (</span><span =
style=3D"font-family:arial,sans-serif;font-size:13px">built to use =
gstreamer and pulseaudio</span><span =
style=3D"font-family:arial,sans-serif;font-size:13px">) mediaplayer =
example and select an mp3 file. It works like one time out of 20 or so, =
so some kind of race condition is probably the case.&nbsp;</span></div>
<div><span =
style=3D"font-family:arial,sans-serif;font-size:13px"><br></span></div><di=
v><span style=3D"font-family:arial,sans-serif;font-size:13px">My =
hardware setup is a nitrogen6x board with a Freescale iMX6 processor (so =
I'm using meta-fsl-arm*), I've tried with both Qt built with meta-qt5 =
and an external Qt build against the Yocto sysroot. If anyone can =
reproduce this on some other hardware that would be nice to =
know.</span></div>
<div><span =
style=3D"font-family:arial,sans-serif;font-size:13px"><br></span></div><di=
v><span style=3D"font-family:arial,sans-serif;font-size:13px">This =
started on the meta-freescale list [2], but is probably belonging =
here.&nbsp;</span></div>
<div><br></div><div><span =
style=3D"font-family:arial,sans-serif;font-size:13px">[1].&nbsp;</span><a =
href=3D"http://lists.linaro.org/pipermail/linaro-dev/2013-April/015794.htm=
l" target=3D"_blank" =
style=3D"font-family:arial,sans-serif;font-size:13px">http://lists.linaro.=
org/pipermail/linaro-dev/2013-April/015794.html</a><br>
</div><div>[2].&nbsp;<a =
href=3D"https://lists.yoctoproject.org/pipermail/meta-freescale/2013-Augus=
t/004152.html">https://lists.yoctoproject.org/pipermail/meta-freescale/201=
3-August/004152.html</a></div><div><br></div>Cheers,&nbsp;</div>
<div>Erik Bot=F6</div></div>
_______________________________________________<br>Openembedded-core =
mailing list<br><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core=
@lists.openembedded.org</a><br>http://lists.openembedded.org/mailman/listi=
nfo/openembedded-core<br></blockquote></div><br></body></html>=

--Apple-Mail=_3B31D1C0-D10F-4E15-9F00-7CB879AAE601--
