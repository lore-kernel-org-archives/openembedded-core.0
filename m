Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id D156573237
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 19:27:35 +0000 (UTC)
Received: by igr7 with SMTP id 7so152985123igr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 12:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=eJ/F/Uf3qHsgwP3riS9CwquznzrGRqRviyiWNVgLMeE=;
	b=eMcAS0dkiifCboQajKmdNALURXx5LvVEr7aoAvk0ouuJA7+/52kb5/dvi4BUEUmy1Z
	xqFE7E7Q2YGn581amDU957atAg+G2Ulgj72DjqO5ATLbEctLflGo5P/B8QKcLG7wN8Zz
	dnFdNKaz6nmemywRhdHDNfjWKlwwRBCyiAfIWb/7oPMPZCoUsHCcO10FPSGMbrfJyjod
	TCOhAp6L+QQ/wSdkYMJ1q/UzPBV3PrNLEvRxRhakl+/rmvhHu6HtRFnBH9mWNNOxCrcQ
	mgFc7IzmIJzW2WasNFVGzLe9xDv4pfoNmdi7bcRPMGLa5ld5fVFf6TKKgeriIuBzHIrd
	wmpA==
X-Received: by 10.50.134.42 with SMTP id ph10mr4446020igb.79.1438198054828;
	Wed, 29 Jul 2015 12:27:34 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.199 with HTTP; Wed, 29 Jul 2015 12:27:15 -0700 (PDT)
In-Reply-To: <CAJTo0LZ8qasC_Out4=1KHyskj5KovxDL6+BPGoKTS8=FquBYcA@mail.gmail.com>
References: <1438103507-63604-1-git-send-email-abdur_rehman@mentor.com>
	<CAJTo0LZiEWScYqCJBfzrMQ=02vkb9jd5a-6+VvSZBqePZgr7yg@mail.gmail.com>
	<8663FA6B07BCC94795FAD21C9CC5ACF73783C098@EU-MBX-01.mgc.mentorg.com>
	<CAJTo0LZ8qasC_Out4=1KHyskj5KovxDL6+BPGoKTS8=FquBYcA@mail.gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Wed, 29 Jul 2015 12:27:15 -0700
X-Google-Sender-Auth: 95rVg-TbipSjZADRV5sW0X-5HOg
Message-ID: <CABcZAN=W1_aW1YXAkR25TO0DM=iHoCzPrrBCNGhpw+pq3aJauA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] watchdog: kill update-rc.d when not using sysvinit
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
X-List-Received-Date: Wed, 29 Jul 2015 19:27:38 -0000
Content-Type: multipart/alternative; boundary=047d7b41471a2cc371051c0894e7

--047d7b41471a2cc371051c0894e7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2015 at 11:35 AM, Burton, Ross <ross.burton@intel.com>
wrote:

> On 29 July 2015 at 19:05, Rehman, Abdur <Abdur_Rehman@mentor.com> wrote:
>
>> watchdog_5.14.bb does not inherit systemd, and so
>> INHIBIT_UPDATERCD_BBCLASS does
>> not get set.
>>
>> While trying to build watchdog with systemd in DISTRO_FEATURES but not
>> sysvinit,
>> following warning is observed:
>>     WARNING: QA Issue: watchdog rdepends on initscripts-functions, but
>> it isn't
>>     a build dependency? [build-deps]
>>
>> Since sysvinit is not in DISTRO_FEATURES and INHIBIT_UPDATERCD_BBCLASS i=
s
>> not
>> set, the logic in update-rc.d.bbclass goes on to add an rdep for watchdo=
g
>> on
>> initscripts-functions, inside update_rcd_package(). And this results in
>> the
>> QA warning.
>>
>
> When a class inherits update-rcd but not systemd, and the distro is
> systemd only, update-rcd still runs (and has still run) as otherwise you
> don't get any init scripts.  Setting inhibit will remove the init scripts=
,
> and the watchdog daemon won't start.  I'm pretty sure this isn't what you
> intended.
>
> Are you overriding VIRTUAL-RUNTIME_initscripts in your distro?  update-rc=
d
> adds a dependency on that when it is inherited, which by default is
> initscripts, so you get your build dependency there.  I suspect your dist=
ro
> is overriding that variable when perhaps it shouldn't be.
>

I don=E2=80=99t think we really want initscripts installed in a systemd-onl=
y
distro, particularly if systemd is built with sysvcompat enabled, as we
don=E2=80=99t want to run the sysvinit scripts for services which are alrea=
dy
covered by systemd proper, unless I=E2=80=99m missing something?
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b41471a2cc371051c0894e7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 29, 2015 at 11:35 AM, Burton, Ross <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On=
 29 July 2015 at 19:05, Rehman, Abdur <span dir=3D"ltr">&lt;<a href=3D"mail=
to:Abdur_Rehman@mentor.com" target=3D"_blank">Abdur_Rehman@mentor.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><a href=3D"http://watchd=
og_5.14.bb" target=3D"_blank">watchdog_5.14.bb</a> does not inherit systemd=
, and so INHIBIT_UPDATERCD_BBCLASS does<br>
not get set.<br>
<br>
While trying to build <span class=3D"il">watchdog</span> with systemd in DI=
STRO_FEATURES but not sysvinit,<br>
following warning is observed:<br>
=C2=A0=C2=A0=C2=A0 WARNING: QA Issue: <span class=3D"il">watchdog</span> rd=
epends on initscripts-functions, but it isn&#39;t<br>
=C2=A0=C2=A0=C2=A0 a build dependency? [build-deps]<br>
<br>
Since sysvinit is not in DISTRO_FEATURES and INHIBIT_UPDATERCD_BBCLASS is n=
ot<br>
set, the logic in update-rc.d.bbclass goes on to add an rdep for <span clas=
s=3D"il">watchdog</span> on<br>
initscripts-functions, inside update_rcd_package(). And this results in the=
<br>
QA warning.<br></blockquote><div><br></div></span><div>When a class inherit=
s update-rcd but not systemd, and the distro is systemd only, update-rcd st=
ill runs (and has still run) as otherwise you don&#39;t get any init script=
s.=C2=A0 Setting inhibit will remove the init scripts, and the <span class=
=3D"il">watchdog</span> daemon won&#39;t start.=C2=A0 I&#39;m pretty sure t=
his isn&#39;t what you intended.</div><div><br></div><div>Are you overridin=
g VIRTUAL-RUNTIME_initscripts in your distro? =C2=A0update-rcd adds a depen=
dency on that when it is inherited, which by default is initscripts, so you=
 get your build dependency there.=C2=A0 I suspect your distro is overriding=
 that variable when perhaps it shouldn&#39;t be.</div></blockquote></div><b=
r><span style=3D"color:rgb(0,0,0);font-family:Tahoma;font-size:13px">I don=
=E2=80=99t think we really want initscripts installed in a systemd-only dis=
tro, particularly if systemd is built with sysvcompat enabled, as we don=E2=
=80=99t want to run the sysvinit scripts for services which are already cov=
ered by systemd proper, unless I=E2=80=99m missing something?<br></span>-- =
<br><div class=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<br>k=
ergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>M=
aintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--047d7b41471a2cc371051c0894e7--
