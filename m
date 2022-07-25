Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D402CCA48B
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 11:19:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.26919.1658747939674047955
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 04:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GPtmtEmG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 w8-20020a05600c014800b003a32e89bc4eso6141138wmm.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 04:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=crFVXmL385PcHF301tdYGGK2Oa+02tFhNn8mLM9e7c8=;
        b=GPtmtEmGXfEIRjnc79/bx/BTsn/GCJGkIcM4eVz8jjaZv/ncV/NCdTvabpepelStVU
         vWyT0L210vpjCXrDDVML3JRYPiDmBY+s994T6G0+j2rdmcNzB2EyvI6BIpBdTFxs+C28
         cITTojmZ4hg0Oiz3QOUnNGKW9Rn9ONZI7vNbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=crFVXmL385PcHF301tdYGGK2Oa+02tFhNn8mLM9e7c8=;
        b=b2pEb/VMLtbMjAVE45nGkOC0S0QlibXlt+hPBPoCE4jJgnQVTm8VK7TH+czQL/pXpF
         3XTFtbJEaC2kw99ZVJ3KpgNPMm5UFeqWXeZ7NDPkFnkRuyFyPx6AwoJOQs2j3ll1m9Nt
         Tan7caJszHrmR7EcJhZFcaVTp78KCsbztkyJPzRwJGGqHiN4CTbRFXo2ycN5U/vwZi2u
         zT1CWZxsw3/lDrfq8sez7dVPkOrO0rvYz/0JoNOAKRG53sVZrBm4uFv76dw0QkTO2qdK
         LF7pGLR/P2ikLrFPg3xJEc/EClXo3iL5z3QN8G1Yeza1ZNxosEo5JX4GVqlnHsYC40H2
         8XhA==
X-Gm-Message-State: AJIora9airIyJ0DG7LKezh9tHK0eMylYLhhpFRW6k2FtDSwHSuGoY2jX
	EPZu3k6tJqCiu23B6TJJpFwi+Q==
X-Google-Smtp-Source: 
 AGRyM1sX+8prHFPbfrSCbhSPJikXhbfbrn/qVCDsTQ3TrAgWy7UhTLhBvuW+FOmNPPO/a86m+JAUbQ==
X-Received: by 2002:a05:600c:a08:b0:3a1:9319:ab78 with SMTP id
 z8-20020a05600c0a0800b003a19319ab78mr20583893wmp.158.1658747937825;
        Mon, 25 Jul 2022 04:18:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7074:bed7:25c5:279b?
 ([2001:8b0:aba:5f3c:7074:bed7:25c5:279b])
        by smtp.gmail.com with ESMTPSA id
 i6-20020adff306000000b0021e849bc729sm3919314wro.55.2022.07.25.04.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 04:18:57 -0700 (PDT)
Message-ID: 
 <b3045e57b1a148ab06cfefb58a082d0e08bd3401.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa devtool: Add tests to cover devtool
 handling of various git URL styles
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: throos@amazon.de, openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2022 12:18:56 +0100
In-Reply-To: <20220725105407.79478-1-throos@amazon.de>
References: <20220725105407.79478-1-throos@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 11:19:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168482

On Mon, 2022-07-25 at 12:54 +0200, Thomas Roos via
lists.openembedded.org wrote:
> Add two test cases for git URL styles that trigger reformat_git_url.
>=20
> [YOCTO #11394]
>=20
> Signed-off-by: Thomas Roos <throos@amazon.de>
> ---
>  meta/lib/oeqa/selftest/cases/devtool.py | 55 ++++++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
> index 34fc791f3a..dc3c4fba65 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -379,6 +379,59 @@ class DevtoolAddTests(DevtoolBase):
>          checkvars['SRCREV'] =3D srcrev
>          checkvars['DEPENDS'] =3D set(['dbus'])
>          self._test_recipe_contents(recipefile, checkvars, [])
> +   =20
> +    def test_devtool_add_git_style_1(self):
> +         # this will trigger reformat_git_uri
> +        url =3D "'git://git@github.com/ARMmbed/mbedtls.git;protocol=3Dht=
tps'"
> +        version =3D 'v3.1.0'
> +        pn =3D 'mbedtls'
> +        # Test devtool add
> +        self.track_for_cleanup(self.workspacedir)
> +        self.add_command_to_tearDown('bitbake-layers remove-layer */work=
space')       =20
> +        result =3D runCmd('devtool add --version %s %s %s' % (version, p=
n, url))
> +        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer=
.conf'), 'Workspace directory not created')
> +        # Check the recipe name is correct
> +        recipefile =3D get_bb_var('FILE', pn)
> +        self.assertIn('%s_git.bb' % pn, recipefile, 'Recipe file incorre=
ctly named')
> +        self.assertIn(recipefile, result.output)
> +        # Test devtool status
> +        result =3D runCmd('devtool status')
> +        self.assertIn(pn, result.output)
> +        self.assertIn(recipefile, result.output)
> +        checkvars =3D {}
> +        checkvars['LICENSE'] =3D 'Apache-2.0'
> +        checkvars['LIC_FILES_CHKSUM'] =3D 'file://LICENSE;md5=3D3b83ef96=
387f14655fc854ddc3c6bd57'
> +        checkvars['S'] =3D '${WORKDIR}/git'
> +        checkvars['PV'] =3D 'v3.1.0+git${SRCPV}'
> +        checkvars['SRC_URI'] =3D 'git://git@github.com/ARMmbed/mbedtls.g=
it;protocol=3Dhttps;branch=3Dmaster'
> +        self._test_recipe_contents(recipefile, checkvars, [])
> +
> +    def test_devtool_add_git_style_2(self):
> +         # this will trigger reformat_git_uri with branch parameter in u=
rl
> +        url =3D "'git://git@github.com/ARMmbed/mbedtls.git;branch=3Dmbed=
tls-2.28;protocol=3Dhttps'"
> +        version =3D 'v3.1.0'
> +        pn =3D 'mbedtls'
> +        # Test devtool add
> +        self.track_for_cleanup(self.workspacedir)
> +        self.add_command_to_tearDown('bitbake-layers remove-layer */work=
space')       =20
> +        result =3D runCmd('devtool add --version %s %s %s' % (version, p=
n, url))
> +        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer=
.conf'), 'Workspace directory not created')
> +        # Check the recipe name is correct
> +        recipefile =3D get_bb_var('FILE', pn)
> +        self.assertIn('%s_git.bb' % pn, recipefile, 'Recipe file incorre=
ctly named')
> +        self.assertIn(recipefile, result.output)
> +        # Test devtool status
> +        result =3D runCmd('devtool status')
> +        self.assertIn(pn, result.output)
> +        self.assertIn(recipefile, result.output)
> +        checkvars =3D {}
> +        checkvars['LICENSE'] =3D 'Apache-2.0'
> +        checkvars['LIC_FILES_CHKSUM'] =3D 'file://LICENSE;md5=3D3b83ef96=
387f14655fc854ddc3c6bd57'
> +        checkvars['S'] =3D '${WORKDIR}/git'
> +        checkvars['PV'] =3D 'v3.1.0+git${SRCPV}'
> +        checkvars['SRC_URI'] =3D 'git://git@github.com/ARMmbed/mbedtls.g=
it;branch=3Dmbedtls-2.28;protocol=3Dhttps'
> +        self._test_recipe_contents(recipefile, checkvars, [])
> +


Rather than copy and paste the test, could you parameterise it please?
That should make it clearer what is being tested and why too.

Cheers,

Richard


