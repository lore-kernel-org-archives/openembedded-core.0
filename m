Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90923D609CE
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 10:24:39 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.68893.1732703067018998507
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 02:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BSEcOtSB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3823eb7ba72so4502007f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 02:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732703065; x=1733307865; darn=lists.openembedded.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7bU+7GmbxhYERp3S3v4CQxwZ4qZpfEQCNHN5FauWGyU=;
        b=BSEcOtSB36n4ib6h7bsUvOPAD5LimlwbJACcuPGeakUrSs8/iQE7UZPr3QjpZMjzmO
         N1R1uiYHcxa6jVtn3qFdNV0AiIgEdmdNFX4LD5n5ozHxfSjEhSXI2XOQaDI7G+F7cFYQ
         jnLtUxeKjmpHV7Tyy5OKLOnXFgBywfwi791nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732703065; x=1733307865;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bU+7GmbxhYERp3S3v4CQxwZ4qZpfEQCNHN5FauWGyU=;
        b=PsqbG6YmZKNCYqpm71JX3anzWsKyPexzXew8fT99b5aUq8ZIbMOY+iUusfsz13hd7E
         m1Ot09ht5wHEiXjr2dp097HSudCQl7Lhp8xYAtwEZK6AARLmNNyF5pYmcqbWWo7+6cSy
         OghsMDbWn6YtRv/9MB14YwzRYsbNM1EotPfZ5PNh9CPKQqh52wJMamqdQ5pdzb5rStGh
         NpDGsrKSy66jGQBzYEgUtLiNMBPfyLzPAhXoBEIpo0rujTLKV8L/dcq0TJ9+Eb5XWvYW
         ZfnNHUxI6iEsW9Lhu2xTaFJdpcR68WdNTctCJMrkKLg3t1qV3CFQkizr/1/M7+tT+vhM
         T0Vg==
X-Gm-Message-State: AOJu0YzoxaWWOB6HUOOF5JUOjAGLC26LrU7SxxoRwtJYLqP88B01xh0n
	fyaZY9Gq6jUNbuxX6fqGooLzZu4IsoSA8IiLclV4+R+vQ9m0dn52PAgMSVQbNHY=
X-Gm-Gg: ASbGncsrLdZIwHPOoXI13CDGw1+qxk+4iwhn7w3EVU70dMmHY/W8InhApJkjfHfHnxA
	vOKUS5xVCfAd5aS4G/TpPKIAIzTwRBSDKu4HYtSV3XZSd9hHsjBQZhonJ0uyVy12O6uSub/o+UX
	XcGrNhtCUHjI6WqmxIT5o4NP9LAdMQhTWeQfzj8qmYaXYIbvyXu0DgbwlWgWFUt4OT/QOPyB9RJ
	HgwY+rBkdkfJfxOkOdgzj6Bq/7Xv7sA65/AojfDeBknf3CL1umIydZlM3+ihRgsveNYFKUGhSGR
	7rcVKxvvoJfTt7ew3MUmcFwTHYbE0HaQHNkz
X-Google-Smtp-Source: AGHT+IFxMC7usFS7PruBwb03Y1Ng0LPhXNzsFx0JYuloyn0Va+7USPxgB7EuwkCrXURy8rA557SVKA==
X-Received: by 2002:a05:6000:2b12:b0:382:1831:f7db with SMTP id ffacd0b85a97d-385c6ebce43mr1264568f8f.19.1732703065331;
        Wed, 27 Nov 2024 02:24:25 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d8f2:574:7ade:5a68? ([2001:8b0:aba:5f3c:d8f2:574:7ade:5a68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fb2679dsm16150493f8f.45.2024.11.27.02.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:24:24 -0800 (PST)
Message-ID: <e785628f8b9892f18fe889301fab6801b94fab72.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] seatd: Create seat user and package
 systemd service
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yoann.congal@smile.fr, raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2024 10:24:23 +0000
In-Reply-To: <CAMSfU+42DViLBPptm29kVLHiyAYGmubiexek1YgTmg+4CScrTw@mail.gmail.com>
References: <20241127005121.683644-1-raj.khem@gmail.com>
	 <CAMSfU+42DViLBPptm29kVLHiyAYGmubiexek1YgTmg+4CScrTw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="=-KlvrGcIk7+3Zp0INs4QG"
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207924

--=-KlvrGcIk7+3Zp0INs4QG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2024-11-27 at 08:45 +0100, Yoann Congal via
lists.openembedded.org wrote:
> Hello,
>=20
> Le=C2=A0mer. 27 nov. 2024 =C3=A0=C2=A001:51, Khem Raj via lists.openembed=
ded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> a =C3=A9crit=C2=A0:
> > With latest version seatd does not work properly if
> > user access permissions are not correctly set, therefore
> > create 'seat' group and package the seatd.service file
> > and enable it by default with systemd distro feature
> >=20
> > set logind to systemd when using systemd as default init system
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > =C2=A0meta/recipes-core/seatd/seatd_0.9.1.bb | 11 +++++++++--
> > =C2=A01 file changed, 9 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb b/meta/recipes-
> > core/seatd/seatd_0.9.1.bb
> > index 8da57acc567..8ee43a3dc8f 100644
> > --- a/meta/recipes-core/seatd/seatd_0.9.1.bb
> > +++ b/meta/recipes-core/seatd/seatd_0.9.1.bb
> > @@ -11,7 +11,7 @@ SRC_URI =3D
> > "git://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branch=3Dmaster
> > \
> > =C2=A0SRCREV =3D "566ffeb032af42865dc1210e48cec08368059bb9"
> > =C2=A0S =3D "${WORKDIR}/git"
> >=20
> > -inherit meson pkgconfig update-rc.d
> > +inherit meson pkgconfig systemd update-rc.d useradd
> >=20
> > =C2=A0# https://www.openwall.com/lists/musl/2020/01/20/3
> > =C2=A0CFLAGS:append:libc-musl:powerpc64le =3D " -Wno-error=3Doverflow"
> > @@ -22,14 +22,21 @@ PACKAGECONFIG ?=3D " \
> > =C2=A0"
> >=20
> > =C2=A0PACKAGECONFIG[libseat-builtin] =3D "-Dlibseat-builtin=3Denabled,-
> > Dlibseat-builtin=3Ddisabled"
> > -PACKAGECONFIG[systemd] =3D ",,systemd"
> > +PACKAGECONFIG[systemd] =3D "-Dlibseat-logind=3Dsystemd,,systemd"
> >=20
> > =C2=A0do_install:append() {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "${VIRTUAL-RUNTIME_init_manager}=
" !=3D "systemd" ];
> > then
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -=
Dm755 ${UNPACKDIR}/init
> > ${D}/${sysconfdir}/init.d/seatd
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -Dm644=
 ${S}/contrib/systemd/seatd.service
> > ${D}${systemd_unitdir}/system/seatd.service
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> > =C2=A0}
> >=20
> > +USERADD_PACKAGES =3D "${PN}"
> > +GROUPADD_PARAM:${PN} =3D "-r seat"
> >=20
>=20
>=20
> This new group needs to be added to the static id list (meta-
> selftest/files/static-group ?) or will break the reproducibility
> tests.
> The reproducibility test builds with:
> =C2=A0 USERADDEXTENSION =3D "useradd-staticids"
> =C2=A0 USERADD_ERROR_DYNAMIC =3D "skip"
>=20
> Then, with this patch, I get this error:
> =C2=A0 ERROR: Nothing PROVIDES 'seatd'
> =C2=A0 seatd was skipped: Recipe seatd, package seatd: system groupname
> "seat" does not have a static ID defined. USERADD_GID_TABLES file(s)
> not found in BBPATH: files/group

Thanks, I was in the process of reviewing things so I've added a change
to try and cover this.

Cheers,

Richard



--=-KlvrGcIk7+3Zp0INs4QG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>On Wed, 2024-11-27 at 08:45 +0100, Yoann Congal v=
ia lists.openembedded.org wrote:</div><blockquote type=3D"cite" style=3D"ma=
rgin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div>Hello=
,</div><div><br></div><div>Le&nbsp;mer. 27 nov. 2024 =C3=A0&nbsp;01:51, Khe=
m Raj via lists.openembedded.org &lt;<a href=3D"mailto:raj.khem=3Dgmail.com=
@lists.openembedded.org">raj.khem=3Dgmail.com@lists.openembedded.org</a>&gt=
; a =C3=A9crit&nbsp;:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 =
.8ex; border-left:2px #729fcf solid;padding-left:1ex"><div>With latest vers=
ion seatd does not work properly if</div><div>user access permissions are n=
ot correctly set, therefore</div><div>create 'seat' group and package the s=
eatd.service file</div><div>and enable it by default with systemd distro fe=
ature</div><div><br></div><div>set logind to systemd when using systemd as =
default init system</div><div><br></div><div>Signed-off-by: Khem Raj &lt;<a=
 href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;</div><div>--=
-</div><div>&nbsp;meta/recipes-core/seatd/seatd_0.9.1.bb | 11 +++++++++--</=
div><div>&nbsp;1 file changed, 9 insertions(+), 2 deletions(-)</div><div><b=
r></div><div>diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb b/meta/rec=
ipes-core/seatd/seatd_0.9.1.bb</div><div>index 8da57acc567..8ee43a3dc8f 100=
644</div><div>--- a/meta/recipes-core/seatd/seatd_0.9.1.bb</div><div>+++ b/=
meta/recipes-core/seatd/seatd_0.9.1.bb</div><div>@@ -11,7 +11,7 @@ SRC_URI =
=3D "git://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branch=3Dmaster =
\</div><div>&nbsp;SRCREV =3D "566ffeb032af42865dc1210e48cec08368059bb9"</di=
v><div>&nbsp;S =3D "${WORKDIR}/git"</div><div><br></div><div>-inherit meson=
 pkgconfig update-rc.d</div><div>+inherit meson pkgconfig systemd update-rc=
.d useradd</div><div><br></div><div>&nbsp;# <a href=3D"https://www.openwall=
.com/lists/musl/2020/01/20/3">https://www.openwall.com/lists/musl/2020/01/2=
0/3</a></div><div>&nbsp;CFLAGS:append:libc-musl:powerpc64le =3D " -Wno-erro=
r=3Doverflow"</div><div>@@ -22,14 +22,21 @@ PACKAGECONFIG ?=3D " \</div><di=
v>&nbsp;"</div><div><br></div><div>&nbsp;PACKAGECONFIG[libseat-builtin] =3D=
 "-Dlibseat-builtin=3Denabled,-Dlibseat-builtin=3Ddisabled"</div><div>-PACK=
AGECONFIG[systemd] =3D ",,systemd"</div><div>+PACKAGECONFIG[systemd] =3D "-=
Dlibseat-logind=3Dsystemd,,systemd"</div><div><br></div><div>&nbsp;do_insta=
ll:append() {</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if [ "${VIRTUAL-R=
UNTIME_init_manager}" !=3D "systemd" ]; then</div><div>&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -Dm755 ${UNPACKDIR}/init =
${D}/${sysconfdir}/init.d/seatd</div><div>+&nbsp; &nbsp; &nbsp; &nbsp; else=
</div><div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; install=
 -Dm644 ${S}/contrib/systemd/seatd.service ${D}${systemd_unitdir}/system/se=
atd.service</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fi</div><div>&nbsp;=
}</div><div><br></div><div>+USERADD_PACKAGES =3D "${PN}"</div><div>+GROUPAD=
D_PARAM:${PN} =3D "-r seat"</div><div><br></div></blockquote><div><br></div=
><div><br></div><div>This new group needs to be added to the static id list=
 (meta-selftest/files/static-group ?) or will break the reproducibility tes=
ts.</div><div>The reproducibility test builds with:</div><div>&nbsp; USERAD=
DEXTENSION =3D "useradd-staticids"</div><div>&nbsp; USERADD_ERROR_DYNAMIC =
=3D "skip"</div><div><br></div><div>Then, with this patch, I get this error=
:</div><div>&nbsp; ERROR: Nothing PROVIDES 'seatd'</div><div>&nbsp; seatd w=
as skipped: Recipe seatd, package seatd: system groupname "seat" does not h=
ave a static ID defined. USERADD_GID_TABLES file(s) not found in BBPATH: fi=
les/group</div></blockquote><div><br></div><div>Thanks, I was in the proces=
s of reviewing things so I've added a change to try and cover this.</div><d=
iv><br></div><div>Cheers,</div><div><br></div><div>Richard</div><div><br></=
div><div><br></div><div><span></span></div></body></html>

--=-KlvrGcIk7+3Zp0INs4QG--

