Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EA9EB64DA
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 19:47:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.3745.1687981628794680373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 12:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=RL4y51hw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso4296765e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 12:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687981627; x=1690573627;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jD5v8wKCSxa8JFlH0jiiJOAxxSHDSuUVvGcAOikVcUk=;
        b=RL4y51hwp271nKVreUXVNQFthKcrRpMFliLMTYghvtznM8wkMNxyndAr5oi5R45v5a
         3KnwpS4aJ87VCSqQ3um5mCozl5tbiDQ3MJcDApBpB7XfpgHJ2bwmtBoCPKadiUnMibc9
         GlieiUPGvseuDf8RXntHlwvVu9Az9yw0MYil0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687981627; x=1690573627;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jD5v8wKCSxa8JFlH0jiiJOAxxSHDSuUVvGcAOikVcUk=;
        b=MmeHgV8Ki6MbBvTtwvpV0bLmULZgaJWdJ9QIXziKgQG2rFBsQ69CmqpJ9+FYZkd8Pj
         0nqiNs9n2TiS7ijnA/sgqPrrUe8ewdAmxYx/daMWorDqqKyfPAfsKdcIK5toC23I7Ekf
         /2Agxkomr7Hd0MjNYF1lX+eVnPkyljJPYGfFX4MWfzk99RoqrbybqQrQheFSZ/o078/c
         w4ydzitnP3S9DetvgIyuWYAzBmpzGs6QakajwTeJSUgRvLWyz9uiuaIK25yl1Jz3RJPC
         dD8T+9XAhoWtZy4Z0gs0pwM65VfuWj/2fPPbHqdPsHJUsxblXxQetQXWDtqQLQIaDEfJ
         I1Xw==
X-Gm-Message-State: AC+VfDyvErbBUUr0SmX507hDO0zuCvXk43rUJLTygzBh9AK2Kdu2VbS4
	ESH4oBuU2O38droc5v6LXbW3kg==
X-Google-Smtp-Source: ACHHUZ42tL7XhjjRfXFQLVTw0BopNJPjunpIVuF9HmeIzgPxZqAU5qdPIl81seIaqELPakC5gxULXg==
X-Received: by 2002:a1c:f70d:0:b0:3f8:b6c:84aa with SMTP id v13-20020a1cf70d000000b003f80b6c84aamr26991152wmh.24.1687981627100;
        Wed, 28 Jun 2023 12:47:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717? ([2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717])
        by smtp.gmail.com with ESMTPSA id t24-20020a7bc3d8000000b003fba94c9e18sm4805708wmj.4.2023.06.28.12.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 12:47:06 -0700 (PDT)
Message-ID: <213c079050886cbd2e74fa048b83b0d36e5c82f4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/devtool: add unit test for
 "devtool add -b"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Cc: Fawzi KHABER <fawzi.khaber@smile.fr>
Date: Wed, 28 Jun 2023 20:47:05 +0100
In-Reply-To: <20230628070939.1298739-1-yoann.congal@smile.fr>
References: <20230628070939.1298739-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 19:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183598

On Wed, 2023-06-28 at 09:09 +0200, Yoann Congal wrote:
> From: Fawzi KHABER <fawzi.khaber@smile.fr>
>=20
> Fix [Yocto #15085]
>=20
> Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/lib/oeqa/selftest/cases/devtool.py | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
> index 4c8e375d00..c5ed8f5720 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -366,6 +366,29 @@ class DevtoolAddTests(DevtoolBase):
>              bindir =3D bindir[1:]
>          self.assertTrue(os.path.isfile(os.path.join(installdir, bindir, =
'pv')), 'pv binary not found in D')
> =20
> +    def test_devtool_add_binary(self):
> +        # Test "devtool add -b" with an arbitrary binary package from Yo=
cto mirrors
> +        pn =3D 'pvr-bin-cdv-devel'
> +        pv =3D '1.0.3-1.1'
> +        url =3D 'http://downloads.yoctoproject.org/mirror/sources/pvr-bi=
n-cdv-devel-1.0.3-1.1.i586.rpm'
> +
> +        self.track_for_cleanup(self.workspacedir)
> +        self.add_command_to_tearDown('bitbake -c cleansstate %s' % pn)
> +        self.add_command_to_tearDown('bitbake-layers remove-layer */work=
space')
> +
> +        # Test devtool add -b
> +        result =3D runCmd('devtool add  -b %s %s' % (pn, url))
> +        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer=
.conf'), 'Workspace directory not created')
> +
> +        # Test devtool build
> +        result =3D runCmd('devtool build %s' % pn)
> +        bb_vars =3D get_bb_vars(['D', 'bindir'], pn)
> +        installdir =3D bb_vars['D']
> +        self.assertTrue(installdir, 'Could not query installdir variable=
')
> +
> +        # Check that a known file from the binary package has indeed bee=
n installed
> +        self.assertTrue(os.path.isfile(os.path.join(installdir, 'usr', '=
include', 'EGL', 'egl.h')), 'egl.h not found in D')
> +
>      def test_devtool_add_git_local(self):
>          # We need dbus built so that DEPENDS recognition works
>          bitbake('dbus')


https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5437/step=
s/14/logs/stdio

There are systems where rpm doesn't exist so the test can fail?

Cheers,

Richard


