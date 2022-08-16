Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810DEC25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 20:30:00 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.20646.1660681797932882863
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GmQmbRbx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id e27so9225948wra.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=LLfn1QMeP+pvFO5n4i0z6JhFwWYR3Ty3G2m0SmU1pDQ=;
        b=GmQmbRbxByNrBELscEIL8dxwzYw9LLDEjfIq6gmghZg1xAgXrCpyWMUPg4bo73I3AX
         r6u+3mEh+U7Jf2glsfBRcmRkOkKyGVRdlfc9V916nTLvDViTUcPuDBKOYzV5+rxoPmfn
         cJbMnGVzzdI08xuXFABrlcA+FRqxKF7Ooflkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=LLfn1QMeP+pvFO5n4i0z6JhFwWYR3Ty3G2m0SmU1pDQ=;
        b=4o0eNhS65XSmr7RnCdqyiAGZi0ZsZyPjpfwM1v79CTT0jMkZSBJYWQKxEnxPqI+GtM
         rlgiIlXtHLoPbMdnR/D5G1FX80FFtWCSfJaH/rEDhwbA8xSViBAgxpu0qGbbHu0gEyQy
         LQl+Sx6YqRDwyY+htvYNhHSTE3Gix6cCcE/58mkjHBHRueLkw3Phe89OtFzC6JFl1Q/1
         KAj/eRBFUUVbljyW22qdrwQwVer/bQ6R6Bt8hJtIsMch1cOOnkqdzjvdQqYEmqQIf733
         s/KiNC9nkmyYB5bNpen3MAPVsQxgWDPby/ELnn3TpV8Ak9E4LsyzWIsoRe3BTjo5cE+D
         5rNw==
X-Gm-Message-State: ACgBeo18HkeravkYijk/0m+/3Awth1PCHy9pg1UXRlXlufc5ociWBdgG
	cYdb46afUZX2kKDthMKofxIU/w==
X-Google-Smtp-Source: 
 AA6agR7q60k2AojosizFbI/hBfIfS6DedPbSZbAV7lGK9ncJde8w5ODvz3Tp/avviAzf6o9KIFxaTw==
X-Received: by 2002:a5d:64ab:0:b0:220:7e05:ada0 with SMTP id
 m11-20020a5d64ab000000b002207e05ada0mr12611182wrp.167.1660681796274;
        Tue, 16 Aug 2022 13:29:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3694:2ef4:2932:37d5?
 ([2001:8b0:aba:5f3c:3694:2ef4:2932:37d5])
        by smtp.gmail.com with ESMTPSA id
 j17-20020adfe511000000b00225239d9265sm212216wrm.74.2022.08.16.13.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:29:55 -0700 (PDT)
Message-ID: 
 <e8df5fddbd7eec4d13f111da863e71b75a0dbabd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/6] selftest/bblayers: add a test for
 creating a layer setup and using it to restore the layers
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Tue, 16 Aug 2022 21:29:54 +0100
In-Reply-To: <20220729141049.835733-6-alex@linutronix.de>
References: <20220729141049.835733-1-alex@linutronix.de>
	 <20220729141049.835733-6-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 20:30:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169453

On Fri, 2022-07-29 at 16:10 +0200, Alexander Kanavin wrote:
> This does a basic run-through of the bitbake-layers plugin, and the resul=
ting json layer config
> and the layer setup script that uses it. Only poky is actually fetched by=
 the script.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/lib/oeqa/selftest/cases/bblayers.py | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/sel=
ftest/cases/bblayers.py
> index 4f4952f3eb..1f5c576356 100644
> --- a/meta/lib/oeqa/selftest/cases/bblayers.py
> +++ b/meta/lib/oeqa/selftest/cases/bblayers.py
> @@ -140,3 +140,15 @@ class BitbakeLayers(OESelftestTestCase):
>      def test_validate_examplelayersjson(self):
>          json =3D os.path.join(get_bb_var('COREBASE'), "meta/files/layers=
.example.json")
>          self.validate_layersjson(json)
> +
> +    def test_bitbakelayers_setup(self):
> +        result =3D runCmd('bitbake-layers create-layers-setup {}'.format=
(self.testlayer_path))
> +        jsonfile =3D os.path.join(self.testlayer_path, "setup-layers.jso=
n")
> +        self.validate_layersjson(jsonfile)
> +
> +        testcheckoutdir =3D os.path.join(self.builddir, 'test-layer-chec=
kout')
> +        result =3D runCmd('{}/setup-layers --destdir {}'.format(self.tes=
tlayer_path, testcheckoutdir))
> +        # May not necessarily be named 'poky'
> +        pokydir =3D os.listdir(testcheckoutdir)[0]
> +        testcheckoutfile =3D os.path.join(testcheckoutdir, pokydir, "oe-=
init-build-env")
> +        self.assertTrue(os.path.exists(testcheckoutfile), "File {} not f=
ound in test layer checkout".format(testcheckoutfile))

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4001/step=
s/14/logs/stdio

(and other similar selftest failures)

I suspect this was due to master-next being force pushed whilst the
build was running.

Cheers,

Richard

