Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8A7731BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 13:03:22 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id o67so465042337iof.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 05:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zGf8zAy8lTQVH+AqWIp4mssREG8dV2idbpiEpK3yE1E=;
	b=YFaCJpGncjuZfc9DVpKQS5VGNsIMHVL8HEmqz9Ms1cgRoinoy/8vODKJsBP6zhYhXy
	fuHGg/YTOJPfI8x+nhukQSnN6ED/ZuFDjS4GYowcscnMgkPGxsHbdhXnw7GeRSbLp2eo
	xUqci5TAoql9vuV7wEK+J8wtlag2sVPnXq/Ucp4VwHs8c+Q5gWpf1lz+LLQr5jiGyiSS
	5liRZEU9vTKu49FrIokjJ8vT6rEc2zveZa72w13fmDbVo1aPuPinrbdlHDBsxxWztApW
	zcwneEeskAWgxaOkrwY3gY9QvrXEfDJXRl17JqyflwdZeFyy4wo7ZLp/DRCrB1yzUkt3
	SrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zGf8zAy8lTQVH+AqWIp4mssREG8dV2idbpiEpK3yE1E=;
	b=jRl80McQoZWGug5TMFPUtEIsRHELlobnjSUW1b3WUdkJ38tvLfZAldhAE2Mf2P9WzT
	Qu+j+XieGXn5y7s6+holMw0hykH1imMuqQlcKCaMEfPvom7TpDx2ga+VPN0iQDecoc3Q
	HTp1J5S3nGAk29pSSsM00VMNIny3XldTpz49rhFbJCUkUzrQC85cZro8X+UyvheIpoEK
	Tre1t/FUsvExqizfMG31bQwSdZYxStS5AE6o/xyIZJQE0pV2E3U2Byx2dTx4bZIjDudB
	9Kzej7pLKm0dTZAEds3qY0Ail2DxkFr4Ff1hgFQUPgFQI3P60S4pswjitvs3iX56C4qi
	xlyg==
X-Gm-Message-State: ALoCoQn+gm5Du5bebhGViUQavJ+X8DryE4PzHID1Bb1Wj30HW+bk0bi62edT/33M0Z9Zzq6+V+VI9wxPcmI8aYAH9MY5OQNUrDe7zRsZuJRXTpFVshJ6lKw=
X-Received: by 10.107.164.161 with SMTP id d33mr77285831ioj.148.1451999002631; 
	Tue, 05 Jan 2016 05:03:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 5 Jan 2016 05:03:03 -0800 (PST)
In-Reply-To: <1450914695-19604-1-git-send-email-haris.okanovic@ni.com>
References: <1450914695-19604-1-git-send-email-haris.okanovic@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Jan 2016 13:03:03 +0000
Message-ID: <CAJTo0LaHTkODDiLfOYDQoFC-VBDD5h4XctAidjzRfyYGgdAfKA@mail.gmail.com>
To: Haris Okanovic <haris.okanovic@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: Make /etc/timezone optional
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
X-List-Received-Date: Tue, 05 Jan 2016 13:03:23 -0000
Content-Type: multipart/alternative; boundary=001a1141c976c4750a052895dc87

--001a1141c976c4750a052895dc87
Content-Type: text/plain; charset=UTF-8

On 23 December 2015 at 23:51, Haris Okanovic <haris.okanovic@ni.com> wrote:

> +CONFFILES_${PN} +=
> "${@['','${sysconfdir}/timezone'][d.getVar('INSTALL_TIMEZONE_FILE', True)
> == '1']}"
>

This idiom (indexing an array by a coerced boolean) is pretty difficult to
read and bitbake has a helper function to turn a string into a bool, so I
find something like this a lot easier to read:

${@"${sysconfdir}/timezone" if
bb.utils.to_boolean(d.getVar("INSTALL_TIMEZONE_FILE", True)) else ""}

(untested!)

Ross

--001a1141c976c4750a052895dc87
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 December 2015 at 23:51, Haris Okanovic <span dir=3D"ltr">&lt;<a href=
=3D"mailto:haris.okanovic@ni.com" target=3D"_blank">haris.okanovic@ni.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2c7" cla=
ss=3D"a3s" style=3D"overflow:hidden">+CONFFILES_${PN} +=3D &quot;${@[&#39;&=
#39;,&#39;${sysconfdir}/timezone&#39;][d.getVar(&#39;INSTALL_TIMEZONE_FILE&=
#39;, True) =3D=3D &#39;1&#39;]}&quot;<br></div></blockquote></div><br>This=
 idiom (indexing an array by a coerced boolean) is pretty difficult to read=
 and bitbake has a helper function to turn a string into a bool, so I find =
something like this a lot easier to read:</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">${@&quot;${sysconfdir}/timezone&quot; i=
f bb.utils.to_boolean(d.getVar(&quot;INSTALL_TIMEZONE_FILE&quot;, True)) el=
se &quot;&quot;}</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">(untested!)</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a1141c976c4750a052895dc87--
