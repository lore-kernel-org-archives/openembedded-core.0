Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id AF3A365C8A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 19:51:34 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id n127so115447911iof.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 12:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3qsSe64HHeBHeZ8eoslnVriVhL8L1RNY6xu6h4bOmYc=;
	b=L3Vs12kD8AyJ+xA7eXYibwVwfp05NvSwQyojSVAUBrqYTBQKsoNgXS/R5nLR3Gmhbq
	PuyI7wf5fJFkNdSrOh+e+bE5soaffDiDpXx6INr3bmmwJoUbOqEUfA8ksJou6bb3SG0s
	4JNJiSrWXLWJGJmOkkRAjNDjoW8IYPM3EPXHutC/Jsv6BXnmkNgfwsZStggDZdW+14jx
	rGPBIhefORLNdj4B05tb5Gnfl/U+0iqd2JYGygDDzG0cT+rKMLT+iZPdIy/AF03dBWRl
	G7R3PPgr0qAYN2bYCaD/AbsjHVccSRaemdb4/wYZ+te+xR/CLac0nTH1GYH5v/+pzstx
	cWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3qsSe64HHeBHeZ8eoslnVriVhL8L1RNY6xu6h4bOmYc=;
	b=gLQrpARJOndpOzbLCojhICpt29M6Cp7/UTzO64GNxyFf6feUUMMRya+6xHagHCQcF7
	1GECC+GIGGizp0NqgPByPZZw638Qjz97SQUHWlsB30mhP3zgdWUE9SKOXoMRx1Y1oDbP
	ZFfU7ELyxaIdKlw2wOsef8b4GmR6zGT+gukmQtCZwinkx65inbD7YIhFTYdo0ZWeLy9F
	Vi+Oiq9RlyWOkJIDXNCEijtp5XfUUh6foAjOOSg5CGkvPBLUQvAfPV04bR2wxw3ondiG
	J/Ivf5n+7ScZvLuxIHQlZqDpgdC/0UmR9yYzqh+gMBhszXV3foWCgPuY8OKT2YVr1v7x
	gkBQ==
X-Gm-Message-State: ALyK8tLwsEOg10sl8mS2bAqeoPHAWw/+xPR9atFBGc3bkBfrTX/YwwMYui9+m+XgfpWtJYXR9thF3GRELhJIVzsm
X-Received: by 10.107.154.210 with SMTP id c201mr16879582ioe.99.1466365894956; 
	Sun, 19 Jun 2016 12:51:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Sun, 19 Jun 2016 12:51:15 -0700 (PDT)
In-Reply-To: <1466329971.20368.18.camel@gmail.com>
References: <1466329971.20368.18.camel@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 19 Jun 2016 20:51:15 +0100
Message-ID: <CAJTo0LbtjhRL+ugz9sNjszXTePZ=R=R19vA1fQG-A5R1b7uDQg@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: packageconfig, add depends if feature is disabled
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
X-List-Received-Date: Sun, 19 Jun 2016 19:51:37 -0000
Content-Type: multipart/alternative; boundary=001a1140fab647abef0535a6ead4

--001a1140fab647abef0535a6ead4
Content-Type: text/plain; charset=UTF-8

On 19 June 2016 at 10:52, Max Krummenacher <max.oss.09@gmail.com> wrote:

>     PACKAGECONFIG ?= "gtk3"
>     PACKAGECONFIG[gtk2] = ",,gtk+"
>     PACKAGECONFIG[gtk3] = "--enable-gtk3,,gtk+3"
>

PACKAGECONFIGs are meant to be explicit so "thing which is enabled when
something else is disabled" is obvious unless you write log comments
explaining the options.

For example, what if PACKAGECONFIG was set to "" but gtk+ was already in
the sysroot.  By the logic you've described that would result in your
recipe being built with gtk+ despite being told not to, or maybe if gtk3 is
autodetected first and that's also in the sysroot then gtk3 gets used
instead.  You literally can't tell, and if bitbake can't tell then you'll
have binary packages changing when they shouldn't be.

Idiomatically you'd have - or expect - something like

    PACKAGECONFIG ?= "gtk3"
    PACKAGECONFIG[gtk2] = "--enable-gtk2,--disable-gtk2,gtk+"
    PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"

If the upstream doesn't support this then you're hoping that they don't
change the default values, or the configure doesn't attempt to auto-detect,
or various other ways that having options with no enable or disable values
can break.  At that point I'd actually fix upstream's configure and send a
patch instead of attempting to work around it.

Ross

--001a1140fab647abef0535a6ead4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 June 2016 at 10:52, Max Krummenacher <span dir=3D"ltr">&lt;<a href=3D=
"mailto:max.oss.09@gmail.com" target=3D"_blank">max.oss.09@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div id=3D":2zu" class=3D"">=C2=A0 =C2=
=A0 PACKAGECONFIG ?=3D &quot;gtk3&quot;<br>
=C2=A0 =C2=A0 PACKAGECONFIG[gtk2] =3D &quot;,,gtk+&quot;<br>
=C2=A0 =C2=A0 PACKAGECONFIG[gtk3] =3D &quot;--enable-gtk3,,gtk+3&quot;</div=
></blockquote></div><br>PACKAGECONFIGs are meant to be explicit so &quot;th=
ing which is enabled when something else is disabled&quot; is obvious unles=
s you write log comments explaining the options.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">For example, what if PACKAGECONF=
IG was set to &quot;&quot; but gtk+ was already in the sysroot.=C2=A0 By th=
e logic you&#39;ve described that would result in your recipe being built w=
ith gtk+ despite being told not to, or maybe if gtk3 is autodetected first =
and that&#39;s also in the sysroot then gtk3 gets used instead.=C2=A0 You l=
iterally can&#39;t tell, and if bitbake can&#39;t tell then you&#39;ll have=
 binary packages changing when they shouldn&#39;t be.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Idiomatically you&#39;d hav=
e - or expect - something like</div><div class=3D"gmail_extra"><br></div>=
=C2=A0 =C2=A0 PACKAGECONFIG ?=3D &quot;gtk3&quot;<br>=C2=A0 =C2=A0 PACKAGEC=
ONFIG[gtk2] =3D &quot;--enable-gtk2,--disable-gtk2,gtk+&quot;<br>=C2=A0 =C2=
=A0 PACKAGECONFIG[gtk3] =3D &quot;--enable-gtk3,--disable-gtk3,gtk+3&quot;<=
div><br></div><div>If the upstream doesn&#39;t support this then you&#39;re=
 hoping that they don&#39;t change the default values, or the configure doe=
sn&#39;t attempt to auto-detect, or various other ways that having options =
with no enable or disable values can break.=C2=A0 At that point I&#39;d act=
ually fix upstream&#39;s configure and send a patch instead of attempting t=
o work around it.</div><div><br></div><div>Ross</div></div>

--001a1140fab647abef0535a6ead4--
