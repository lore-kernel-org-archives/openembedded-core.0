Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB45CD6E79
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 09:00:35 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75071.1780995629435170375
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 02:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S1KKpfXQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68cec9f4c6cso7342299a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 02:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780995628; x=1781600428; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NvFdoAxoC8nHbB5WnSQfUTSqvt4NMKMVQfd/mHGLVLE=;
        b=S1KKpfXQAJe9DRhJENjAOySL6QfnDX8dPHxHIF81WfvL4foiuNhfDdp6TsH7kZBwy4
         AwneLiapqllJbfJ6aFg9/XDqetW7nJIAUXCxeY/R0/Q+5LaN/kjdL3rhfpnHpQaTI4L7
         h1hIFd2h+Tjo6W0nL9gBif3oHEK2KgBfeu7m4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995628; x=1781600428;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvFdoAxoC8nHbB5WnSQfUTSqvt4NMKMVQfd/mHGLVLE=;
        b=hBJLN+IOBEdwHJto/WlKhkDLs811Axhx7aLLEVNL04Q1AQiMO5SMYtJSDJkrnlC6K7
         ndwK+LVMeXwOHDk/yyV+N1kU4HO1ms314MUCJAijA64l+hH9XA7d3IDgbxE8PuX+pOf+
         MIoa2yUEpyN05FvOSTxuQhB8vsZ2lAHNlGDdiO71crGlKY1lrSObpZ2MvAWnc80quwxi
         BS6dJPlwsqOLqcrBcFbNgs/a7YNV7r/s7uqgiCcnHJsky39epGGzqx6iBvWRFQWWPnuc
         sHRmLv3yxiJsndED9N+sEEu2sgJIawG64BcbfCGfM4HqMbzQp9bxx/8+dtGo5LU1l6Cw
         v5Zw==
X-Gm-Message-State: AOJu0YzaKedhuPuY/Y3UFlTyXiEHMC6gJID+QVK9q/9xN0XtpxJ7Ud81
	hHo2JVoWnLt+bxtQrkjTCQAh4hm3WFo0j9lb9RG1ykjviRJFEqNFY0WiGTb5C7/DeLJZ9muCtQl
	tj51a
X-Gm-Gg: Acq92OHchhDGEHQEGJZWV8/27yzqre2bHmBZUxPZHbVJLXG1Aiir6UELbByk32waa2s
	rqAi1Qvsx2ppMhi9/G40/qdOGuTAmXGBq4QPaufzE0tKkRpLiW3pakG9YLDZ6YS1pC0eHepuqWQ
	EiNt07SWJocDPona3d7P0VUEV1XFiSCdILNpiJQKsUTekGLMy9sdU1hzDPYanG3COyU0XnXTiQX
	ClXuxzyJwNcu1LapeA70fvX2A9lFc2u0oJk3jjdoQXi5+8vci+F6PwjqsJSJ1zCBZLecKDgQcMT
	ykzgiW0ZpyUtvyL1jxMus2BwwX1QN+zy5ysiDirSs18i3G11YJ0xz1gwPzPQID0Qy/DZfnCC88X
	7P3dhLIPNqKoS9Dt9xjhXlTemG+7zAihrLSRBpkHjEZk0NbhgXvQaNN076W9zUEJtufVJV3F5qk
	4SVh0QJ9j3612jv9P6vSh9Zu+8haEObDGucHNqeSuScgJaOGa1UxtlgCiMafjDYzOSZKsYkqNah
	q67xmJFv/ebBzgfW0uCK1r5Zas=
X-Received: by 2002:a05:6402:a518:10b0:68f:cc95:ba5b with SMTP id 4fb4d7f45d1cf-68fcc95bb11mr6053740a12.27.1780995627653;
        Tue, 09 Jun 2026 02:00:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1? ([2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6595c722sm8253608a12.22.2026.06.09.02.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:00:27 -0700 (PDT)
Message-ID: <770939b3cc7758631da916f838738abf9bff16b2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rpcbind: Modify socket file only, if systemd
 is used
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?J=F6rg?= Sommer <joerg.sommer@navimatix.de>
Cc: openembedded-core@lists.openembedded.org, AHoemig@datus.com
Date: Tue, 09 Jun 2026 10:00:26 +0100
In-Reply-To: <aifPPlfnz4e3I50C@navimatix.de>
References: 
	<921b2852784f105d6ca5c8a754f87a68f2ecb4f3.1780937668.git.joerg.sommer@navimatix.de>
	 <da28e9e53e21ce0d9dee82a049fb0b6d55907bfb.camel@linuxfoundation.org>
	 <aifPPlfnz4e3I50C@navimatix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 09:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238278

On Tue, 2026-06-09 at 10:40 +0200, J=C3=B6rg Sommer wrote:
> Richard Purdie schrieb am Di 09. Jun, 08:41 (+0100):
> > On Mon, 2026-06-08 at 18:54 +0200, J=C3=B6rg Sommer via lists.openembed=
ded.org wrote:
> > > From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > >=20
> > > Fixes: bee29dc822c611 ("rpcbind: Remove IPv6 listener, if ipv6 not in=
 DISTRO_FEATURES")
> > > Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > > ---
> > > =C2=A0meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb | 3 ++-
> > > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb b/meta/re=
cipes-extended/rpcbind/rpcbind_1.2.8.bb
> > > index bd8ba1e88a..6604774c1f 100644
> > > --- a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
> > > +++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
> > > @@ -55,7 +55,8 @@ do_install:append () {
> > > =C2=A0	install -d ${D}${systemd_system_unitdir}/rpcbind.service.d
> > > =C2=A0	install -m 0644 ${UNPACKDIR}/rpcbind.systemd ${D}${systemd_sys=
tem_unitdir}/rpcbind.service.d/rpcbind.conf
> > > =C2=A0
> > > -	if ! ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'false=
', d)}
> > > +	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fals=
e', d)} \
> > > +		&& ! ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'fals=
e', d)}
> > > =C2=A0	then
> > > =C2=A0		sed -i '/^Listen.*=3D\[.*\]/s/^/# /' ${D}${systemd_system_uni=
tdir}/*.socket
> > > =C2=A0	fi
> >=20
> > That can be simplified to:
> >=20
> > bb.utils.contains('DISTRO_FEATURES', 'systemd ipv6', 'true', 'false', d=
)
>=20
> Actually, it is 'systemd ! ipv6'. I do not think this syntax is supported=
.
>=20
> This pattern with true/false is used pretty often:
>=20
> % for i in oe-core meta-openembedded; git -C $i grep "'true', 'false'" |w=
c -l
> 83
> 131
>=20
> Is it worth to create a helper? Something like contains_tf?

Sorry, I missed the ! hidden in there!

I'm torn on the function. "contains" does have special optimisation
within bitbake and even if you wrap it, we'd lose that unless we add
more specialist code to bitbake to handle the new function.

I started wondering if a "to_shell()" type converter might be better if
we could then have truevalue default to True.=C2=A0The function could
convert True to "true" for shell usage.

Having d as a positional parameter in the arguments for contains makes
that hard to transition to though :(

Cheers,

Richard

