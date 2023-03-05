Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2939C6FA8E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 21:48:29 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.18981.1678052908422138494
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 13:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PX7GOvvO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id bw19so6967408wrb.13
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 13:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l2qgQQiace369g739RCyAnxjJPSoLCMQZXi8uSPx8ps=;
        b=PX7GOvvOvPRIdx7YF4mwylJ9MjeBYTxojvrzbX206wHo53RP0+W6UQeaXzPUpDjY8m
         38uIscEyFAkTHkT+x85uc/1PV3gnUfgRqoB9GZlgmuL2EtRiveU9EfuyEY2VOnE+bfce
         CDUGpcrSvqw15slEAbGKEZKt37QYB1kVegMko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l2qgQQiace369g739RCyAnxjJPSoLCMQZXi8uSPx8ps=;
        b=Yr1sJ9hRmsNKHnTOK3QzP8fE+xeyJFDNAXxkg0XCjVSPiY0Hyj33EAhPkUGReakB/m
         tGKL3Zy6rPJY1b7+Xp37MEK2Y5+jRpbyhY8VvMWQ/tsMC+3t1mJWguXRtKDXrB6wVX8F
         nGgiQ3nmyWHb6qogNNq+RSMs6USAf/EH4FEMDGtEfibMoUL2E24MMWbzA+AtOhQY7aK0
         YILW43RFTLDE1KFzEYsYrolLjanvPu6ZQNK7/axf+cN0BrJ5qGuUPlrKQm6zdLXvVfmP
         bd2GQjW1USAyumjkn+lBrPBwVg0arq7uYzbOzcrkMlaJNe5JlOHa2jkqVz33zv3WaD0s
         8xag==
X-Gm-Message-State: AO0yUKV//vj+NM4p9gwUDcyMRg2DIFgEfwU+gVoP4CBSPIlOCb+dN7yO
	XqvAXd2bawyU5GjXfem1c9okrg==
X-Google-Smtp-Source: AK7set9YIvUrAndNNdO+Up6soBtBIDVddgagi0n9Ol4hItcGDcvAt1+l02TX3AbxmvhP6LKxB7u79A==
X-Received: by 2002:adf:eec2:0:b0:2c7:4ec:8d79 with SMTP id a2-20020adfeec2000000b002c704ec8d79mr6235432wrp.21.1678052906562;
        Sun, 05 Mar 2023 13:48:26 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd62:bd0e:fe43:db33? ([2001:8b0:aba:5f3c:bd62:bd0e:fe43:db33])
        by smtp.gmail.com with ESMTPSA id v2-20020adfe282000000b002c7066a6f77sm8144536wri.31.2023.03.05.13.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 13:48:26 -0800 (PST)
Message-ID: <7e57f60fc42878b53be76dc5f2f631b469e9a5e1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] qemu: split out qemu-guest-agent, add
 startup scripts
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexandre.belloni@bootlin.com, =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?=
	 <peron.clem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Brenda Streiff
	 <brenda.streiff@ni.com>
Date: Sun, 05 Mar 2023 21:48:25 +0000
In-Reply-To: <ZAUDx+BmqijKzdhQ@mail.local>
References: <20230224153157.20305-1-peron.clem@gmail.com>
	 <ZAUDx+BmqijKzdhQ@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 21:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178054

On Sun, 2023-03-05 at 22:04 +0100, Alexandre Belloni via
lists.openembedded.org wrote:
> Hello,
>=20
> This doesn't apply on master, can you rebase?
>=20
> On 24/02/2023 16:31:56+0100, Cl=C3=A9ment P=C3=A9ron wrote:
> > Split out the QEMU guest agent into a separate package. The agent is
> > intended to be installed within a QEMU VM guest where a user is likely
> > to not want to have the rest of the QEMU installation within it.
> >=20
> > Additionally, an initscript, udev rules file, and systemd unit file are
> > added to the package so that the guest agent can start automatically;
> > the former two come from Debian's packaging for qemu-guest-agent.
> >=20
> > Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >=20
> > This is a resend of the patch from Brenda Streiff where I changed
> > the:
> > SYSTEMD_SERVICE:${PN}-guest-agent =3D "${PN}-guest-agent.service"
> > in
> > SYSTEMD_SERVICE:${PN}-guest-agent =3D "qemu-guest-agent.service"
> >=20
> >  meta/recipes-devtools/qemu/qemu.inc | 35 ++++++++++++++++++++++++++++-
> >  1 file changed, 34 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> > index 92828e8f2d..cb443769f2 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -9,7 +9,7 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
> >  RDEPENDS:${PN}-ptest =3D "bash"
> > =20
> >  require qemu-targets.inc
> > -inherit pkgconfig ptest
> > +inherit pkgconfig ptest update-rc.d systemd
> > =20
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a7=
2fbac \
> >                      file://COPYING.LIB;endline=3D24;md5=3D8c5efda6cf1e=
1b03dcfd0e6c0d271c7f"
> > @@ -30,6 +30,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
> >             file://0001-contrib-vhost-user-blk-Replace-lseek64-with-lse=
ek.patch \
> >             file://0002-linux-user-Replace-use-of-lfs64-related-functio=
ns-an.patch \
> >             file://0001-configure-Fix-check-tcg-not-executing-any-tests=
.patch \
> > +           file://qemu-guest-agent.init \
> > +           file://qemu-guest-agent.udev \


These files are missing too...

I was a little worried about the licensing, we need to ensure that is
handled correctly.

Cheers,

Richard

