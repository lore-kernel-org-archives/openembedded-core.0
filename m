Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 748DA60191
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 16:11:05 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id o19so30963932ito.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UJpg6NiK0bjd0ko+54KStrtl6OiyVDz5ZnkW1grbPoE=;
	b=b8qDuxV6CBEZWeNYBaNRJtc3Ljm8cO5Gss6KHorpo2+pdaYB4l1ziMNHx6Vcl2mVLf
	1DVjEXCyaMupijfOajKfmVyTvUHJOKotfByXtfy5SX0487M5gPrb37V9L5bb91AjuEI+
	dLHTGEdygDTKhzk1yK2/I369kwsG2zYsuNRMy/51QMWERBuKGFankghhnA0RNrHiHUms
	eX4CAbxwNpqrS11gc29HZFAH6wGW1mlmJ+rxxaLvp1tVaBUOpsaS3ZThGKCw/sVbdraf
	pgujiJaYvlqKgOIG2jJzv+1MQz+NXWjV/ckd19TtBiV2iDOsD5jvx+QxRaRUZDzTirDd
	Xi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UJpg6NiK0bjd0ko+54KStrtl6OiyVDz5ZnkW1grbPoE=;
	b=Pbu6oHIpVa0SIj/xE3pfuaQBdfTAGBT9xl9xRrDt8ZPnNgfrhlBFOBlpon+zBqvyUu
	YpdxKEEpv9Pab7+lLXCADs2y38gI9T2psWH3iW3I70pLr0b4/yyosN+aXuBBiv+NKXCb
	k4WSexsnl6jPWjtXupekZzRGgSAkJXpx4niuMgqf6r3to36jAxuVle8lqFfyPkL7Dn50
	DZK86Kh4XjeIY0AwQ8i8JXrTIVa2p9TJqLybWjuWT90Taa1DbMnwaHUk3rq6LZgb4Vho
	j2UxzDHWV8bANoBQIXnJBKPLhIYh0Cjb8USKInHcETc212UyYTtW+/YQtIXsarQ2KEbx
	hmvg==
X-Gm-Message-State: AA6/9RlobCICHXvpPH4Mkqj5L+j38sF//EbuMU5/UcuaQSRydNHkN+0FlrOk6C3swMo2HnLM3vBc7cvpota11NrC
X-Received: by 10.36.153.194 with SMTP id a185mr3066115ite.70.1475251867279;
	Fri, 30 Sep 2016 09:11:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Fri, 30 Sep 2016 09:10:46 -0700 (PDT)
In-Reply-To: <20160929213405.27018-2-stephano.cetola@linux.intel.com>
References: <20160929213405.27018-1-stephano.cetola@linux.intel.com>
	<20160929213405.27018-2-stephano.cetola@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 30 Sep 2016 17:10:46 +0100
Message-ID: <CAJTo0LY1H2PmjEPAi+un0WYYEkXPvUzVkQ6HBic_L++TceuUyg@mail.gmail.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] subprocess: remove strings and migrate to direct arrays
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
X-List-Received-Date: Fri, 30 Sep 2016 16:11:06 -0000
Content-Type: multipart/alternative; boundary=94eb2c08e518811c0d053dbbd74c

--94eb2c08e518811c0d053dbbd74c
Content-Type: text/plain; charset=UTF-8

On 29 September 2016 at 22:34, Stephano Cetola <
stephano.cetola@linux.intel.com> wrote:

> -        cmd = "%s %s query --output %s" %  \
> -              (self.smart_cmd, self.smart_opt, available_manifest)
> +        cmd = [self.smart_cmd, self.smart_opt, 'query', '--output',
> available_manifest]
>

self.smart_opt is a string containing many options, so this needs to be
transformed to a list of options and embedded correctly.

Ross

--94eb2c08e518811c0d053dbbd74c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 September 2016 at 22:34, Stephano Cetola <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:stephano.cetola@linux.intel.com" target=3D"_blank">stephano.cet=
ola@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-col=
or:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gm=
ail-:ph" class=3D"gmail-a3s gmail-aXjCH gmail-m15777e152b9da4e7"><span styl=
e=3D"font-size:12.800000190734863px">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &=
quot;%s %s query --output %s&quot; %=C2=A0 \</span><br style=3D"font-size:1=
2.800000190734863px"><span style=3D"font-size:12.800000190734863px">-=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (self.smart_cmd, self.smart_opt,=
 available_manifest)</span><br style=3D"font-size:12.800000190734863px"><sp=
an style=3D"font-size:12.800000190734863px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cm=
d =3D [self.smart_cmd, self.smart_opt, &#39;query&#39;, &#39;--output&#39;,=
 available_manifest]</span></div></blockquote><div><br></div><div>self.smar=
t_opt is a string containing many options, so this needs to be transformed =
to a list of options and embedded correctly.</div><div><br></div><div>Ross=
=C2=A0</div></div></div></div>

--94eb2c08e518811c0d053dbbd74c--
