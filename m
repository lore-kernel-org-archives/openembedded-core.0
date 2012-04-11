Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1SHwYV-0000sa-7O
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 14:21:47 +0200
Received: by vbbfr13 with SMTP id fr13so602187vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 05:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=NR9VRr90zyBIq3ZYTWsyIR+DyDVwmaAVwo/zVwYkqkU=;
	b=f4Rnn3Ybl0mQ0XJyYq7NqprqwFh9RRirpzxBaVfcijyjUasjRJ5APwPLPzlGsVYV6l
	U6odStVY+krpJOPOtTUxmLtUzot6XzltyuCCNl3tqqrz/rEH2KgfjU64uS0zAvaUmiBS
	VTMPw21eA0zUwh3rPu0EROYWi3mNnrcnMWoqVC96g7xGUiOTPxESPqYQJkLUh4IqF4/G
	gETfWhmC0AVtPlLS01U9H3wwUcild+EkL1ljHccISsu/TgvU/0eT7lqojVoAcyIok2Zs
	OMddUdJpTgzJC3+wIpPgS+YulYVTSmDYekhT6twzcJ3dQUqHgiJ0PHmaw3wi0UaWxrlm
	7jMg==
MIME-Version: 1.0
Received: by 10.220.210.20 with SMTP id gi20mr1401427vcb.42.1334146347140;
	Wed, 11 Apr 2012 05:12:27 -0700 (PDT)
Received: by 10.52.19.193 with HTTP; Wed, 11 Apr 2012 05:12:27 -0700 (PDT)
In-Reply-To: <1334139378.10826.140.camel@ted>
References: <1333402513-26781-1-git-send-email-andrea.adami@gmail.com>
	<CAAQYJAtN+NYBvDCmxKnPkx3zo+ZZNCzJ+fSox-PJMGuB2h6Qrg@mail.gmail.com>
	<1334139378.10826.140.camel@ted>
Date: Wed, 11 Apr 2012 14:12:27 +0200
Message-ID: <CAHod+Gen3zm++Y-LUiqtHYMLO4k403ZdiogiKFcP4rRvfyGeyQ@mail.gmail.com>
From: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: generalize the check in touchscreen rule
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 12:21:47 -0000
Content-Type: multipart/alternative; boundary=00221572766e1986f804bd6627f8

--00221572766e1986f804bd6627f8
Content-Type: text/plain; charset=ISO-8859-1

Current tslib indeed does use ABS_PRESSURE to signal applied pressure.
BTN_TOUCH is only used to indicate pen up events. This happens in the
input_raw module.
Tslib could be modified to check whether the underlying input device
supports ABS_PRESSURE. if not, it shoud use BTN_TOUCH to signal applied
pressure.


On Wed, Apr 11, 2012 at 12:16 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2012-04-11 at 10:59 +0200, Andrea Adami wrote:
> > On Mon, Apr 2, 2012 at 11:35 PM, Andrea Adami <andrea.adami@gmail.com>
> wrote:
> > > * The actual rule only works for devices reporting ts pressure
> > > * and ignores the other touchscreens (happens e.g. on ipaq h1940).
> > > * a0,1,*18   a = absolute axes (ABS_X 0x00 ABS_Y 0x01 ABS_PRESSURE
> 0x18)
> > > * (see include/linux/input.h)
> > > *
> > > * Guidelines for touchscreen seem suggesting only ABS_X and ABS_Y are
> mandatory
> > > * (http://kernel.org/doc/Documentation/input/event-codes.txt)
> > > *
> > > * Bump PR
> > >
> > > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > > ---
> > >  meta/recipes-core/udev/udev/local.rules |    3 +--
> > >  meta/recipes-core/udev/udev_164.bb      |    2 +-
> > >  2 files changed, 2 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/udev/udev/local.rules
> b/meta/recipes-core/udev/udev/local.rules
> > > index 625e49a..49e8d28 100644
> > > --- a/meta/recipes-core/udev/udev/local.rules
> > > +++ b/meta/recipes-core/udev/udev/local.rules
> > > @@ -31,5 +31,4 @@ KERNEL=="rtc0", SYMLINK+="rtc"
> > >  ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*",
> RUN+="/sbin/modprobe $env{MODALIAS}"
> > >
> > >  # Create a symlink to any touchscreen input device
> > > -SUBSYSTEM=="input", KERNEL=="event[0-9]*",
> ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
> > > -
> > > +SUBSYSTEM=="input", KERNEL=="event[0-9]*",
> ATTRS{modalias}=="input:*-e0*,3,*a0,1,*", SYMLINK+="input/touchscreen0"
> > > diff --git a/meta/recipes-core/udev/udev_164.bbb/meta/recipes-core/udev/
> udev_164.bb
> > > index c5813ec..0462ff2 100644
> > > --- a/meta/recipes-core/udev/udev_164.bb
> > > +++ b/meta/recipes-core/udev/udev_164.bb
> > > @@ -1,6 +1,6 @@
> > >  include udev.inc
> > >
> > > -PR = "r13"
> > > +PR = "r14"
> > >
> > >  SRC_URI += "file://udev-166-v4l1-1.patch"
> > >
> > > --
> > > 1.7.3.4
> > >
> >
> > Bump
> >
> > I'm not linux-input specialist but this fix looks rather harmless.
>
> I'm not 100% convinced about that. There needs to be some mechanism to
> signal to the system when there is pressure applied to the screen and
> when pressure was released. I think there are two ways you can do this,
> BTN_TOUCH and ABS_PRESSURE. Regardless of what the input events codes
> say, I'm really more interested in what tslib accepts.
>
> This code has been like this for a long time and I'm surprised that if
> there were issues it wasn't patched long before now. I'm therefore left
> wondering if the touchscreen driver you're using is doing the right
> things.
>
> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--00221572766e1986f804bd6627f8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Current tslib indeed does use ABS_PRESSURE to signal applied pressure. BTN_=
TOUCH is only used to indicate pen up events. This happens in the input_raw=
 module.<div>Tslib could be modified to check whether the underlying input =
device supports ABS_PRESSURE. if not, it shoud use BTN_TOUCH to signal appl=
ied pressure.</div>
<div><br></div><div><br><div class=3D"gmail_quote">On Wed, Apr 11, 2012 at =
12:16 PM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.pu=
rdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;</span>=
 wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On W=
ed, 2012-04-11 at 10:59 +0200, Andrea Adami wrote:<br>
&gt; On Mon, Apr 2, 2012 at 11:35 PM, Andrea Adami &lt;<a href=3D"mailto:an=
drea.adami@gmail.com">andrea.adami@gmail.com</a>&gt; wrote:<br>
&gt; &gt; * The actual rule only works for devices reporting ts pressure<br=
>
&gt; &gt; * and ignores the other touchscreens (happens e.g. on ipaq h1940)=
.<br>
&gt; &gt; * a0,1,*18 =A0 a =3D absolute axes (ABS_X 0x00 ABS_Y 0x01 ABS_PRE=
SSURE 0x18)<br>
&gt; &gt; * (see include/linux/input.h)<br>
&gt; &gt; *<br>
&gt; &gt; * Guidelines for touchscreen seem suggesting only ABS_X and ABS_Y=
 are mandatory<br>
&gt; &gt; * (<a href=3D"http://kernel.org/doc/Documentation/input/event-cod=
es.txt" target=3D"_blank">http://kernel.org/doc/Documentation/input/event-c=
odes.txt</a>)<br>
&gt; &gt; *<br>
&gt; &gt; * Bump PR<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Andrea Adami &lt;<a href=3D"mailto:andrea.adami@gm=
ail.com">andrea.adami@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =A0meta/recipes-core/udev/udev/local.rules | =A0 =A03 +--<br>
&gt; &gt; =A0meta/recipes-core/udev/<a href=3D"http://udev_164.bb" target=
=3D"_blank">udev_164.bb</a> =A0 =A0 =A0| =A0 =A02 +-<br>
&gt; &gt; =A02 files changed, 2 insertions(+), 3 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/udev/udev/local.rules b/meta/recip=
es-core/udev/udev/local.rules<br>
&gt; &gt; index 625e49a..49e8d28 100644<br>
&gt; &gt; --- a/meta/recipes-core/udev/udev/local.rules<br>
&gt; &gt; +++ b/meta/recipes-core/udev/udev/local.rules<br>
&gt; &gt; @@ -31,5 +31,4 @@ KERNEL=3D=3D&quot;rtc0&quot;, SYMLINK+=3D&quot;=
rtc&quot;<br>
&gt; &gt; =A0ACTION=3D=3D&quot;add&quot;, DEVPATH=3D=3D&quot;/devices/*&quo=
t;, ENV{MODALIAS}=3D=3D&quot;?*&quot;, RUN+=3D&quot;/sbin/modprobe $env{MOD=
ALIAS}&quot;<br>
&gt; &gt;<br>
&gt; &gt; =A0# Create a symlink to any touchscreen input device<br>
&gt; &gt; -SUBSYSTEM=3D=3D&quot;input&quot;, KERNEL=3D=3D&quot;event[0-9]*&=
quot;, ATTRS{modalias}=3D=3D&quot;input:*-e0*,3,*a0,1,*18,*&quot;, SYMLINK+=
=3D&quot;input/touchscreen0&quot;<br>
&gt; &gt; -<br>
&gt; &gt; +SUBSYSTEM=3D=3D&quot;input&quot;, KERNEL=3D=3D&quot;event[0-9]*&=
quot;, ATTRS{modalias}=3D=3D&quot;input:*-e0*,3,*a0,1,*&quot;, SYMLINK+=3D&=
quot;input/touchscreen0&quot;<br>
&gt; &gt; diff --git a/meta/recipes-core/udev/<a href=3D"http://udev_164.bb=
" target=3D"_blank">udev_164.bb</a> b/meta/recipes-core/udev/<a href=3D"htt=
p://udev_164.bb" target=3D"_blank">udev_164.bb</a><br>
&gt; &gt; index c5813ec..0462ff2 100644<br>
&gt; &gt; --- a/meta/recipes-core/udev/<a href=3D"http://udev_164.bb" targe=
t=3D"_blank">udev_164.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/udev/<a href=3D"http://udev_164.bb" targe=
t=3D"_blank">udev_164.bb</a><br>
&gt; &gt; @@ -1,6 +1,6 @@<br>
&gt; &gt; =A0include udev.inc<br>
&gt; &gt;<br>
&gt; &gt; -PR =3D &quot;r13&quot;<br>
&gt; &gt; +PR =3D &quot;r14&quot;<br>
&gt; &gt;<br>
&gt; &gt; =A0SRC_URI +=3D &quot;file://udev-166-v4l1-1.patch&quot;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 1.7.3.4<br>
&gt; &gt;<br>
&gt;<br>
&gt; Bump<br>
&gt;<br>
&gt; I&#39;m not linux-input specialist but this fix looks rather harmless.=
<br>
<br>
</div></div>I&#39;m not 100% convinced about that. There needs to be some m=
echanism to<br>
signal to the system when there is pressure applied to the screen and<br>
when pressure was released. I think there are two ways you can do this,<br>
BTN_TOUCH and ABS_PRESSURE. Regardless of what the input events codes<br>
say, I&#39;m really more interested in what tslib accepts.<br>
<br>
This code has been like this for a long time and I&#39;m surprised that if<=
br>
there were issues it wasn&#39;t patched long before now. I&#39;m therefore =
left<br>
wondering if the touchscreen driver you&#39;re using is doing the right<br>
things.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--00221572766e1986f804bd6627f8--
