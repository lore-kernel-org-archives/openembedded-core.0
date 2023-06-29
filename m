Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A6CEB64DC
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 14:04:46 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.9220.1688047477812449125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 07:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=EYHSxDfl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fbc0dc4629so3196425e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 07:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1688047476; x=1690639476;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7lx4/jvxpT85CqBt1J49fkfAIB69sTKBPJzx8MJNI1Y=;
        b=EYHSxDflzhU4Jx9FacJIh+pQ06+5PXM6JmH/TN7wcp0J5PDuj85RVcTL6rRE1TsvPe
         EyR57sI29Zy/EcLPGIsy/WbX6xq/JqawdtVlQlv/r8p65eSINh7sbnLj8D3LNmH8/7ke
         cbC4sDY8tYUa7UTMywv3jAmd6/djzgCiRp950=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688047476; x=1690639476;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lx4/jvxpT85CqBt1J49fkfAIB69sTKBPJzx8MJNI1Y=;
        b=cvOLLklnIkxCAjn42bqfe5mraO7nrVTzaQUCbECBWM0XSX/bieD9g5QGrlDljzCIR+
         /DzFub4T1UQ3fphOAkn1AiudD6UnPDBAlnjaJfQSl29vnYmn4FitOOqsB0lRsXdekDXq
         Z9CwokUcQzxZXZLCoV+dydfux9LgmFiT5tAW6PbN7W4ohP2jepXrH3AoYgQ6CI7VBWyt
         J6cGw1J1GJGFBxhCJcL15RGkZGdJiWztUsDQyVc9RvtURLBAD3v0NLbA6OERFyX2vm4p
         9WRUSZ9i8P/raFEN2Ta+6fCuAQ9EeX8CASm2U6legyjXJP6XgPCcCmk/uLlprU+uz6wY
         R/zg==
X-Gm-Message-State: AC+VfDwPr7pakZSIL+3dHIsn+ihkkCVMoIERdGx4nFi1nYrur7I/qMk1
	nPvhMK6K+UiXTfXn92RPzPaGbA==
X-Google-Smtp-Source: ACHHUZ6yR49cSveg+xEcKvvRYluxuXwcwqsVfPMhy/Qv0QsSZjAfV2VujXykVg+qMCSrDgrP9tFndg==
X-Received: by 2002:a1c:750a:0:b0:3f5:878:c0c2 with SMTP id o10-20020a1c750a000000b003f50878c0c2mr27151840wmc.3.1688047475731;
        Thu, 29 Jun 2023 07:04:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717? ([2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717])
        by smtp.gmail.com with ESMTPSA id f10-20020a7bcd0a000000b003fa99969e61sm10917783wmj.45.2023.06.29.07.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 07:04:35 -0700 (PDT)
Message-ID: <c60fb36b244f721f2b2e9e47a18482724cc8a233.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] util-linux: fix the pylibmount installation
 path
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Louis Rannou <lrannou@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com, tgamblin@baylibre.com
Date: Thu, 29 Jun 2023 15:04:34 +0100
In-Reply-To: <e46ffe6a-662e-4559-b0f2-73e7d4679616@baylibre.com>
References: <20230629-pylibmount-v1-1-342da6733d5d@baylibre.com>
	 <496effdc79d480db0c0b3067c9d75b34b32acd8d.camel@linuxfoundation.org>
	 <e46ffe6a-662e-4559-b0f2-73e7d4679616@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 14:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183629

On Thu, 2023-06-29 at 15:50 +0200, Louis Rannou wrote:
> On 29/06/2023 14:59, Richard Purdie wrote:
> > On Thu, 2023-06-29 at 12:37 +0000, Louis Rannou wrote:
> > > Append the install task to move the python library from ${base_libdir=
}
> > > to ${PYTHON_SITEPACKAGES_DIR}.
> > >=20
> > > Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> > > ---
> > > As we install libraries of util-linux in ${base_libdir} (/lib), the
> > > python library pylibmount is also installed there. An issue was raise=
d
> > > when pylibmount was added to PACKAGECONFIG.
> > > ---
> > >   meta/recipes-core/util-linux/util-linux_2.38.1.bb | 11 ++++++++++-
> > >   1 file changed, 10 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta=
/recipes-core/util-linux/util-linux_2.38.1.bb
> > > index 9ea7a04e8a..f9a9fdcfaf 100644
> > > --- a/meta/recipes-core/util-linux/util-linux_2.38.1.bb
> > > +++ b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
> > > @@ -1,7 +1,7 @@
> > >   require util-linux.inc
> > >  =20
> > >   #gtk-doc is not enabled as it requires xmlto which requires util-li=
nux
> > > -inherit autotools gettext manpages pkgconfig systemd update-alternat=
ives python3-dir bash-completion ptest
> > > +inherit autotools gettext manpages pkgconfig systemd update-alternat=
ives python3-dir python3targetconfig bash-completion ptest
> > >   DEPENDS =3D "libcap-ng ncurses virtual/crypt zlib util-linux-libuui=
d"
> > >  =20
> > >   PACKAGES =3D+ "${PN}-swaponoff"
> > > @@ -320,3 +320,12 @@ do_install_ptest() {
> > >           rm -rf ${D}${PTEST_PATH}/tests/ts/chfn
> > >       fi
> > >   }
> > > +
> > > +do_install:append() {
> > > +    if [ -d ${D}${base_libdir}/${PYTHON_DIR}/site-packages/libmount =
]
> > > +    then
> > > +        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> > > +        mv ${D}${base_libdir}/${PYTHON_DIR}/site-packages/libmount $=
{D}${PYTHON_SITEPACKAGES_DIR}/
> > > +        rm -rf ${D}${base_libdir}/${PYTHON_DIR}
> > > +    fi
> > > +}
> >=20
> > When it is being installed, can we not pass the right path into the
> > build system so it ends up in the right place?
> I would love that. But the build system installs the libraries and the=
=20
> python package using the same prefix which we specify to ${base_libdir}.=
=20
> I have asked a quick question on IRC. I'll send a mail to the util-linux=
=20
> mailing list if I get no answer.

Perhaps we should just let util-linux install to libdir instead of
base_libdir. The reasons for using base_libdir are effectively
historical now anyway...

Cheers,

Richard

