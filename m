Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46A9C71155
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 13:00:05 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.29919.1750078803744141078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 06:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SEdgYyHV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so2740414f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 06:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750078802; x=1750683602; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0V+DXjbM4IpqX22gABJMV4xTqkP1acpvY50oDSW4hAc=;
        b=SEdgYyHVk8NXIdJyMOyP9oR7/xxL+5wijh1j8HZ+u6CaFzFo76FNk1FLXBdB2uPLiY
         aXB2bEBoXfHAMwwD68cAvp/PkWnw4iZVMhxctS9ih4lLl8Mn5wbbw4GVpEBmEDTM2A0W
         Uxio/2lgdmCMGH9pYG3L815xKNfezwWrt1WYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078802; x=1750683602;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0V+DXjbM4IpqX22gABJMV4xTqkP1acpvY50oDSW4hAc=;
        b=C567N3FNXL1Urplw796z2S17Wk/THkUu9VHGJNvF7raBxiMniRY9VehfTdGTQmp2Aq
         R0bhWl/n4Ok+Eb8gxqJ3FGLFWHeXYKiV2dfTU1OY6ke7sARm66dYt/8umA+KRtgSSzHU
         ilODNv4gID4ZO8IXE+hGTfb1tefVdTw47ceeEP1U2116ffITACXwrIU24kua8P5v6Fft
         dWPMcKN6w0ctWIEhng1oUx0jVuOEyr1If9RH1Sqk5UbAS+wxa660ojKxSSQ7vRCBH/qQ
         v86F3oMcyS2ZEAF5+ES5B4PPyfmzacsZZEzMYhWjN+fnVYZnWcEptOY3GH4S9XGscvbd
         mwfw==
X-Forwarded-Encrypted: i=1; AJvYcCXD3ScvnAnni/jX4bb7Prb0aHr6tRSQKjqhAaWpqOS3apvuKNSVVfgvc5s3uepk2sAiwR+/pZmoi6DM8fbsJK1goA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxXlsjzm6N+Ka2umpzh7h7bGTiYKOhPXabXeiRNStD+VzmdRwr6
	3msUbMT+3ZqlisKS5l2g1A8h4f2Vh1MaZgi+HYJ6iPICJtvcoHjI18apTYemAY+dDk8=
X-Gm-Gg: ASbGncvV7Cgtu8nCgU/C5gf1EU3qd7NoL6gbj60YLBn3hNif6NXsGN7w3mzvIoIurAe
	/F1z66sBFjxxhNcm9z8SOmn7ksA2l2T05ySdxHlEIbL55FCW9mMGp6rVdttCrAAXU8ejE11U533
	U76kP8nSs4MkFsUWkrQIoJR5ptdb/dqOnK+S4NIqChPo+9X8JA1VDc2uoPZ+kjoWN5TwHRDxoNn
	vBP+aQ5TNyDfryaRC+kSzuRUJEmaEADJK6T8+CSWNeYq7RCJxhKo2VC8RtHeyfgdks9JL7IkNrL
	V3KmkXxk4kMYZ0T7PpPLfZOLI7UHAzMeyW+QEabh9CPgQulVMW+o+tqXhwIqpUsnWsLEuc0pKob
	QnnuHrUhA3CZ9d8TBA8913wQXrHNRIu2GT/P+vfoQonvunEKb
X-Google-Smtp-Source: AGHT+IHFb+yx0xJAD3jiqMPB4Xfm8QngDvrCm/Zp42c438DaYDCrSYhfVgtOnzvQMcrrr/yMZNZ9aA==
X-Received: by 2002:a05:6000:24c8:b0:3a5:39d7:5d5d with SMTP id ffacd0b85a97d-3a572e79ee5mr7953423f8f.36.1750078802073;
        Mon, 16 Jun 2025 06:00:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a03:fc99:2a4c:41a2? ([2001:8b0:aba:5f3c:a03:fc99:2a4c:41a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5689e5f3dsm11048870f8f.0.2025.06.16.06.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:00:01 -0700 (PDT)
Message-ID: <8a3a2653cba5c9394c72eaf292331224b76f2351.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 22/24] python3-typing-extensions: upgrade
 4.13.2 -> 4.14.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Mon, 16 Jun 2025 14:00:00 +0100
In-Reply-To: <18498734D88F1AF0.22186@lists.openembedded.org>
References: <20250616091643.918-1-wangmy@fujitsu.com>
		 <20250616091643.918-22-wangmy@fujitsu.com>
	 <18498734D88F1AF0.22186@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 13:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218822

On Mon, 2025-06-16 at 13:56 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2025-06-16 at 17:16 +0800, wangmy via lists.openembedded.org
> wrote:
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >=20
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> > =C2=A0...extensions_4.13.2.bb =3D> python3-typing-extensions_4.14.0.bb}=
 |
> > 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > =C2=A0rename meta/recipes-devtools/python/{python3-typing-
> > extensions_4.13.2.bb =3D> python3-typing-extensions_4.14.0.bb} (91%)
> >=20
> > diff --git a/meta/recipes-devtools/python/python3-typing-
> > extensions_4.13.2.bb b/meta/recipes-devtools/python/python3-typing-
> > extensions_4.14.0.bb
> > similarity index 91%
> > rename from meta/recipes-devtools/python/python3-typing-
> > extensions_4.13.2.bb
> > rename to meta/recipes-devtools/python/python3-typing-
> > extensions_4.14.0.bb
> > index 9c83ae6c61..1c03aacc10 100644
> > --- a/meta/recipes-devtools/python/python3-typing-
> > extensions_4.13.2.bb
> > +++ b/meta/recipes-devtools/python/python3-typing-
> > extensions_4.14.0.bb
> > @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3Dfcf6b249c2641540219a727f35d8d2c2"
> > =C2=A0PYPI_PACKAGE =3D "typing_extensions"
> > =C2=A0UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> > =C2=A0
> > -SRC_URI[sha256sum] =3D
> > "e6c81219bd689f51865d9e372991c540bda33a0379d5573cddb9a3a23f7caaef"
> > +SRC_URI[sha256sum] =3D
> > "8676b788e32f02ab42d9e7c61324048ae4c6d844a399eebace3d4979d75ceef4"
> > =C2=A0
> > =C2=A0inherit pypi python_flit_core
> > =C2=A0
>=20
> Something in this series is breaking ptests in large numbers:
>=20
>=20
> stdio: WARNING: core-image-ptest-python3-xmltodict-1.0-r0
> do_testimage: There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-cryptography-1.0-r0
> do_testimage: There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-click-1.0-r0 do_testimage:
> There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-webcolors-1.0-r0
> do_testimage: There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-wcwidth-1.0-r0 do_testimage:
> There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-uritools-1.0-r0
> do_testimage: There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-trove-classifiers-1.0-r0
> do_testimage: There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-rpds-py-1.0-r0 do_testimage:
> There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-pyyaml-1.0-r0 do_testimage:
> There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-pytz-1.0-r0 do_testimage:
> There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-pyasn1-1.0-r0 do_testimage:
> There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-pefile-1.0-r0 do_testimage:
> There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-pluggy-1.0-r0 do_testimage:
> There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-packaging-1.0-r0
> do_testimage: There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-more-itertools-1.0-r0
> do_testimage: There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-markupsafe-1.0-r0
> do_testimage: There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-license-expression-1.0-r0
> do_testimage: There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-libarchive-c-1.0-r0
> do_testimage: There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-jinja2-1.0-r0 do_testimage:
> There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-idna-1.0-r0 do_testimage:
> There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-hypothesis-1.0-r0
> do_testimage: There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-calver-1.0-r0 do_testimage:
> There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-bcrypt-1.0-r0 do_testimage:
> There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-attrs-1.0-r0 do_testimage:
> There were failing ptests.
> stdio: WARNING: core-image-ptest-python3-atomicwrites-1.0-r0
> do_testimage: There were failing ptests.
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/115
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1712
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1712

Example failure logs:

https://valkyrie.yocto.io/pub/non-release/20250616-61/testresults/qemux86-6=
4-ptest/python3-click.log
https://valkyrie.yocto.io/pub/non-release/20250616-61/testresults/qemux86-6=
4-ptest/python3-hypothesis.log
https://valkyrie.yocto.io/pub/non-release/20250616-61/testresults/qemux86-6=
4-ptest/python3-jinja2.log

Most showing:

ModuleNotFoundError: No module named 'pygments'

Cheers,

Richard





