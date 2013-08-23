Return-Path: <erik.boto@pelagicore.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 10749608A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 06:14:41 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id ef5so280798obb.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 23:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=8BowAb47tQuq6fdWX3UA7hN57iRlR07yj0knqUpJdLk=;
	b=mEej0388rq8r2q40RSB6FQ6lgfGtJqrZ1iw0s6ZfnYBo/AliE6uF95trUA/oSb+F+0
	8Fmn5Ft8dCdU91fx8zuztQPquQBC2dlL7AIUVLXyawtnziKnBabJkjbbaaRWnCUc0JmF
	tlTvDjF7Uo7nXpUlw7u4dOVDTOeuKyCli7TK9L+mr58Dk2pOHkEkQVjLHy+JCI1dGqRf
	XTZf4wi9M0qzL0lbJC6N11bip9MOuPkrQPK4PaRbqwurpXOI5u0uyyDLBFkk+DgvDIdc
	eFpzdOFfYv0JxLdZpoRbElZibBWudjeN7Ke8cyCCOHTjZk4K8f4q4x2N4vBdSMZCVG8I
	U/3g==
X-Gm-Message-State: ALoCoQnFdiAE8zUioXiZlCkJliO3yN/zTEDAbrBpF+TypRVriMtpIEfnEZby2XonwpbqjAZcuO7h
MIME-Version: 1.0
X-Received: by 10.182.142.106 with SMTP id rv10mr18561708obb.51.1377238482278; 
	Thu, 22 Aug 2013 23:14:42 -0700 (PDT)
Received: by 10.76.174.6 with HTTP; Thu, 22 Aug 2013 23:14:42 -0700 (PDT)
Date: Fri, 23 Aug 2013 08:14:42 +0200
Message-ID: <CA+AhUGwh+Ck5LYxwL0Lp20czW6m-xQAPnFOckfnjNFFB9aMreA@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Subject: Issue with pulseaudio and Qt introduced with eglibc 2.18
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
X-List-Received-Date: Fri, 23 Aug 2013 06:14:45 -0000
Content-Type: multipart/alternative; boundary=001a11c2e2be81ee5f04e4975274

--001a11c2e2be81ee5f04e4975274
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

I'm hitting a bug now when using Qt to play e.g mp3:s to a pulseaudio sink.
Using gst-launch with playbin2 and pulsesink works well on the same system.
I have tried a few different versions of Qt (5.0.1, 5.0.2 and Qt 5.1) and
both pulseaudio 3 and 4 with the same problem. When I added this to
local.conf:

PREFERRED_VERSION_eglibc-locale =3D "2.17"
PREFERRED_VERSION_eglibc-mtrace =3D "2.17"
PREFERRED_VERSION_eglibc-scripts =3D "2.17"
PREFERRED_VERSION_eglibc-initial =3D "2.17"
PREFERRED_VERSION_eglibc =3D "2.17"

It works ok again, so it was introduced when moving to eglib 2.18 (not
saying that the actual error is in eglibc though).

The error I'm seeing is this:
Assertion 'pthread_mutex_unlock(&m->mutex) =3D=3D 0' failed at
pulsecore/mutex-posix.c:108, function pa_mutex_unlock(). Aborting.

Google tells me that this has been an issue for OMAP4 when certain kernel
configuration where enabled [1], which makes me believe this might be a
hard one to track down. I'll see if I can find the time to debug it a bit
more, but I would really appreciate any input.

It's quite easy to reproduce, just use the QtMultimedia (built to use
gstreamer and pulseaudio) mediaplayer example and select an mp3 file. It
works like one time out of 20 or so, so some kind of race condition is
probably the case.

My hardware setup is a nitrogen6x board with a Freescale iMX6 processor (so
I'm using meta-fsl-arm*), I've tried with both Qt built with meta-qt5 and
an external Qt build against the Yocto sysroot. If anyone can reproduce
this on some other hardware that would be nice to know.

This started on the meta-freescale list [2], but is probably belonging
here.

[1]. http://lists.linaro.org/pipermail/linaro-dev/2013-April/015794.html
[2].
https://lists.yoctoproject.org/pipermail/meta-freescale/2013-August/004152.=
html

Cheers,
Erik Bot=F6

--001a11c2e2be81ee5f04e4975274
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=A0<div><br></div><div><span style=3D"font-family:arial=
,sans-serif;font-size:13px">I&#39;m hitting a bug now when using Qt to play=
 e.g mp3:s to a pulseaudio sink. Using gst-launch with playbin2 and pulsesi=
nk works well on the same system. I have tried a few different versions of =
Qt (5.0.1, 5.0.2 and Qt 5.1) and both pulseaudio 3 and 4 with the same prob=
lem. When I=A0</span><span style=3D"font-family:arial,sans-serif;font-size:=
13px">added this to local.conf:=A0</span></div>
<div><div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><=
div style=3D"font-family:arial,sans-serif;font-size:13px"><div>PREFERRED_VE=
RSION_eglibc-locale =3D &quot;2.17&quot;</div><div>PREFERRED_VERSION_eglibc=
-mtrace =3D &quot;2.17&quot;</div>
<div>PREFERRED_VERSION_eglibc-scripts =3D &quot;2.17&quot;</div><div>PREFER=
RED_VERSION_eglibc-initial =3D &quot;2.17&quot;</div><div>PREFERRED_VERSION=
_eglibc =3D &quot;2.17&quot;</div></div></div><div><font face=3D"arial, san=
s-serif"><br>
</font></div><div><font face=3D"arial, sans-serif">It works ok again, so it=
 was introduced when moving to eglib 2.18 (not saying that the actual error=
 is in eglibc though).</font></div><div><font face=3D"arial, sans-serif"><b=
r>
</font></div><div><div style=3D"font-family:arial,sans-serif;font-size:13px=
">The error I&#39;m seeing is this:=A0</div><div style=3D"font-family:arial=
,sans-serif;font-size:13px">Assertion &#39;pthread_mutex_unlock(&amp;m-&gt;=
mutex) =3D=3D 0&#39; failed at pulsecore/mutex-posix.c:108, function pa_mut=
ex_unlock(). Aborting.</div>
<div><br></div><div><span style=3D"font-family:arial,sans-serif;font-size:1=
3px">Google tells me that this has been an issue for OMAP4 when certain ker=
nel configuration where enabled [1], which makes me believe this might be a=
 hard one to track down. I&#39;ll see if I can find the time to debug it a =
bit more, but I would really appreciate any input.=A0</span></div>
<div><span style=3D"font-family:arial,sans-serif;font-size:13px"><br></span=
></div><div><span style=3D"font-family:arial,sans-serif;font-size:13px">It&=
#39;s quite easy to reproduce, just use the QtMultimedia (</span><span styl=
e=3D"font-family:arial,sans-serif;font-size:13px">built to use gstreamer an=
d pulseaudio</span><span style=3D"font-family:arial,sans-serif;font-size:13=
px">) mediaplayer example and select an mp3 file. It works like one time ou=
t of 20 or so, so some kind of race condition is probably the case.=A0</spa=
n></div>
<div><span style=3D"font-family:arial,sans-serif;font-size:13px"><br></span=
></div><div><span style=3D"font-family:arial,sans-serif;font-size:13px">My =
hardware setup is a nitrogen6x board with a Freescale iMX6 processor (so I&=
#39;m using meta-fsl-arm*), I&#39;ve tried with both Qt built with meta-qt5=
 and an external Qt build against the Yocto sysroot. If anyone can reproduc=
e this on some other hardware that would be nice to know.</span></div>
<div><span style=3D"font-family:arial,sans-serif;font-size:13px"><br></span=
></div><div><span style=3D"font-family:arial,sans-serif;font-size:13px">Thi=
s started on the meta-freescale list [2], but is probably belonging here.=
=A0</span></div>
<div><br></div><div><span style=3D"font-family:arial,sans-serif;font-size:1=
3px">[1].=A0</span><a href=3D"http://lists.linaro.org/pipermail/linaro-dev/=
2013-April/015794.html" target=3D"_blank" style=3D"font-family:arial,sans-s=
erif;font-size:13px">http://lists.linaro.org/pipermail/linaro-dev/2013-Apri=
l/015794.html</a><br>
</div><div>[2].=A0<a href=3D"https://lists.yoctoproject.org/pipermail/meta-=
freescale/2013-August/004152.html">https://lists.yoctoproject.org/pipermail=
/meta-freescale/2013-August/004152.html</a></div><div><br></div>Cheers,=A0<=
/div>
<div>Erik Bot=F6</div></div>

--001a11c2e2be81ee5f04e4975274--
