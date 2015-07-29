Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1AEC976419
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 18:36:18 +0000 (UTC)
Received: by qkfc129 with SMTP id c129so8989064qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 11:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qF+dKjaWS0KxbW8bC3YSx8WtS1GVjcFsQsjJUbiP2qs=;
	b=DIDMdYRDr0tbqB0oR0k7NMoBZNIlp4G11LIu0VhO1dI+nOVnNP/D6c/Kwo/aQPNRiq
	glL5ihGGU0VVYKcH/7V5oMnVCLiKpIaWcAnMb5Dt8lnITrLZyTAjK9qUAu+VZ6OIYwc6
	2mWs8G4fuPTQ1SBxG32wtJ8ORLIzTT/B085EB3XP7ifY7duC8eIWoA4TnusaSlBW8ygS
	piyr88kKwNJ6H8J8/3DJtCu+U0jp5CPuJTxsWlPm++dk11Ps/NQLYH1UW+5lVYCJMifa
	hxDEZQyihy7AXa8rcHd3MIaRvGpRtwQomOsjmunylax5dP7fkJb2n4BfmSr2NDnaRH+D
	u9/A==
X-Gm-Message-State: ALoCoQmZEBax8UMuRIjueC2/y+hGtChpSKBG+LsnGNZgHwPVpXfJEWIPxGmuMoliPGiAaVlDw8hf
X-Received: by 10.55.25.35 with SMTP id k35mr63399471qkh.76.1438194978478;
	Wed, 29 Jul 2015 11:36:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Wed, 29 Jul 2015 11:35:59 -0700 (PDT)
In-Reply-To: <8663FA6B07BCC94795FAD21C9CC5ACF73783C098@EU-MBX-01.mgc.mentorg.com>
References: <1438103507-63604-1-git-send-email-abdur_rehman@mentor.com>
	<CAJTo0LZiEWScYqCJBfzrMQ=02vkb9jd5a-6+VvSZBqePZgr7yg@mail.gmail.com>
	<8663FA6B07BCC94795FAD21C9CC5ACF73783C098@EU-MBX-01.mgc.mentorg.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Jul 2015 19:35:59 +0100
Message-ID: <CAJTo0LZ8qasC_Out4=1KHyskj5KovxDL6+BPGoKTS8=FquBYcA@mail.gmail.com>
To: "Rehman, Abdur" <Abdur_Rehman@mentor.com>
Cc: "Larson, Chris" <Chris_Larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 29 Jul 2015 18:36:19 -0000
Content-Type: multipart/alternative; boundary=001a1147e69acf78d2051c07dc08

--001a1147e69acf78d2051c07dc08
Content-Type: text/plain; charset=UTF-8

On 29 July 2015 at 19:05, Rehman, Abdur <Abdur_Rehman@mentor.com> wrote:

> watchdog_5.14.bb does not inherit systemd, and so
> INHIBIT_UPDATERCD_BBCLASS does
> not get set.
>
> While trying to build watchdog with systemd in DISTRO_FEATURES but not
> sysvinit,
> following warning is observed:
>     WARNING: QA Issue: watchdog rdepends on initscripts-functions, but it
> isn't
>     a build dependency? [build-deps]
>
> Since sysvinit is not in DISTRO_FEATURES and INHIBIT_UPDATERCD_BBCLASS is
> not
> set, the logic in update-rc.d.bbclass goes on to add an rdep for watchdog
> on
> initscripts-functions, inside update_rcd_package(). And this results in the
> QA warning.
>

When a class inherits update-rcd but not systemd, and the distro is systemd
only, update-rcd still runs (and has still run) as otherwise you don't get
any init scripts.  Setting inhibit will remove the init scripts, and the
watchdog daemon won't start.  I'm pretty sure this isn't what you intended.

Are you overriding VIRTUAL-RUNTIME_initscripts in your distro?  update-rcd
adds a dependency on that when it is inherited, which by default is
initscripts, so you get your build dependency there.  I suspect your distro
is overriding that variable when perhaps it shouldn't be.

Ross

--001a1147e69acf78d2051c07dc08
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 July 2015 at 19:05, Rehman, Abdur <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:Abdur_Rehman@mentor.com" target=3D"_blank">Abdur_Rehman@mentor.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><a href=3D"http://watc=
hdog_5.14.bb" target=3D"_blank">watchdog_5.14.bb</a> does not inherit syste=
md, and so INHIBIT_UPDATERCD_BBCLASS does<br>
not get set.<br>
<br>
While trying to build watchdog with systemd in DISTRO_FEATURES but not sysv=
init,<br>
following warning is observed:<br>
=C2=A0=C2=A0=C2=A0 WARNING: QA Issue: watchdog rdepends on initscripts-func=
tions, but it isn&#39;t<br>
=C2=A0=C2=A0=C2=A0 a build dependency? [build-deps]<br>
<br>
Since sysvinit is not in DISTRO_FEATURES and INHIBIT_UPDATERCD_BBCLASS is n=
ot<br>
set, the logic in update-rc.d.bbclass goes on to add an rdep for watchdog o=
n<br>
initscripts-functions, inside update_rcd_package(). And this results in the=
<br>
QA warning.<br></blockquote><div><br></div><div>When a class inherits updat=
e-rcd but not systemd, and the distro is systemd only, update-rcd still run=
s (and has still run) as otherwise you don&#39;t get any init scripts.=C2=
=A0 Setting inhibit will remove the init scripts, and the watchdog daemon w=
on&#39;t start.=C2=A0 I&#39;m pretty sure this isn&#39;t what you intended.=
</div><div><br></div><div>Are you overriding VIRTUAL-RUNTIME_initscripts in=
 your distro? =C2=A0update-rcd adds a dependency on that when it is inherit=
ed, which by default is initscripts, so you get your build dependency there=
.=C2=A0 I suspect your distro is overriding that variable when perhaps it s=
houldn&#39;t be.</div><div><br></div><div>Ross</div></div></div></div>

--001a1147e69acf78d2051c07dc08--
