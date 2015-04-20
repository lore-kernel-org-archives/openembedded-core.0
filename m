Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id AE3B06AC24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 11:20:34 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so178753704qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 04:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4ycrGaEWA0djxWd/8DB6le+rKWRYZiknugmLZxIaJLQ=;
	b=VldPbPMjan2OYlRMdv2CHPPcW9b44wmB5ZnSwcILZWw0rRQjomKIpnV5gTJnR54O0N
	7/Khw6QyVt8sQB+1/njcq7GzdQSjH9uy5suSvcHaU6mqPm+z+VfgOn2ZLCJR12Ov1TPc
	WvnV5t8wb1SuGrxUnLU8gjgFm8k5bdtpFrKwJ9J6wfPfErC0H+QSIs8Pr+o08iZMFXsH
	0Gcp/KyBy8R4mOiFAGlYEJQjzKZ7vcank8uE9SVizBBFE9c4pAeXrzhkXWI/sDpPAKrC
	0A7IPgYkfk8q85hRdi0EZuKLqmu3ZM1704eK7Vikq62MoUXFBAPebO8NzDmm7i3fANZT
	FS9A==
X-Gm-Message-State: ALoCoQmBJkYbWfk4FimR8DpFbsSqalFDTtjruiJAoMHqAnezZECw4nbiaqE4suo1Z7Cpb8OjkYcP
X-Received: by 10.140.216.5 with SMTP id m5mr17217034qhb.52.1429528835556;
	Mon, 20 Apr 2015 04:20:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 20 Apr 2015 04:20:15 -0700 (PDT)
In-Reply-To: <7e7a1d75a00f13cab25edc1dc794baad4f940ef8.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
	<7e7a1d75a00f13cab25edc1dc794baad4f940ef8.1428714999.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Apr 2015 12:20:15 +0100
Message-ID: <CAJTo0LZ8AsB-pQ2Aa6HXi+-bYybOXO9=2u_6cy9rwC6XQy=UgA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/17] xserver-xf86-config: Preload graphics driver modules for musl
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
X-List-Received-Date: Mon, 20 Apr 2015 11:20:35 -0000
Content-Type: multipart/alternative; boundary=001a11354e68709d020514261e68

--001a11354e68709d020514261e68
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 11 April 2015 at 02:20, Khem Raj <raj.khem@gmail.com> wrote:

> musl does not support BIND_LAZY intentionally, which means
> dlopen will always complain about missing symbols which is what
> X does when loading graphics drivers, here we preload the needed
> drivers for all emulator machines if libc is musl
>

musl also doesn't support dlclose() so if you're after reduced memory
footprint using musl and X together isn't what you want, as X opens many
drivers to auto-probe the hardware and then dlcloses() anything that isn't
useful.  On musl() dlclose() is no-op so you've just wasted a pile of
memory.

> +do_install_append_libc-musl () {

This override should also be machine-specific as the list of modules you'll
need to open varies per machine.  ie you haven't included EXA or GLX, and
some of the drivers you have included are probably not required for qemu
images.

Ross

--001a11354e68709d020514261e68
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Khem,</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote">O=
n 11 April 2015 at 02:20, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:=
solid;padding-left:1ex"><span class=3D"">musl</span> does not support BIND_=
LAZY intentionally, which means<br>
dlopen will always complain about missing symbols which is what<br>
X does when loading graphics drivers, here we preload the needed<br>
drivers for all emulator machines if libc is <span class=3D"">musl</span><b=
r></blockquote></div><br>musl also doesn&#39;t support dlclose() so if you&=
#39;re after reduced memory footprint using musl and X together isn&#39;t w=
hat you want, as X opens many drivers to auto-probe the hardware and then d=
lcloses() anything that isn&#39;t useful.=C2=A0 On musl() dlclose() is no-o=
p so you&#39;ve just wasted a pile of memory.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra"><span style=3D"font-size:12.8000001=
907349px">&gt; +do_install_append_libc-</span><span class=3D"" style=3D"fon=
t-size:12.8000001907349px;background-color:rgb(255,255,255)">musl</span><sp=
an style=3D"font-size:12.8000001907349px">=C2=A0() {</span><br style=3D"fon=
t-size:12.8000001907349px"></div><div class=3D"gmail_extra"><span style=3D"=
font-size:12.8000001907349px"><br></span></div><div class=3D"gmail_extra"><=
span style=3D"font-size:12.8000001907349px">This override should also be ma=
chine-specific as the list of modules you&#39;ll need to open varies per ma=
chine. =C2=A0ie you haven&#39;t included EXA or GLX, and some of the driver=
s you have included are probably not required for qemu images.</span></div>=
<div class=3D"gmail_extra"><span style=3D"font-size:12.8000001907349px"><br=
></span></div><div class=3D"gmail_extra"><span style=3D"font-size:12.800000=
1907349px">Ross</span></div></div>

--001a11354e68709d020514261e68--
