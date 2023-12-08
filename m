Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AD6C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 12:24:23 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.31094.1702038260037071116
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 04:24:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZG3mrjjs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-334af3b3ddfso2000207f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 04:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702038258; x=1702643058; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dygCMQgeFdn843jdyBwIQUXAOPYm3ks5HyBO4PO7Urc=;
        b=ZG3mrjjsIduULSKh7pH4r83RHanJZ1SifS0h6dZDCW8YfexBXlnhYw5kEwWR8AWgSI
         tzv0H6+0GmGqLuDCRjourww/uz6MthH39/4O+AGElWeaXb8nc+rYPDVjyLxdbVdklCyW
         X3+voUXKyFFrOoB+cHQq3nUKVUAAXwepmkuhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702038258; x=1702643058;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dygCMQgeFdn843jdyBwIQUXAOPYm3ks5HyBO4PO7Urc=;
        b=WLW+pFmI0HfkldIEUTm3CzRXtV4KpKR8JQ80G2t82wMVGL47cyK7v/z4fFyTEOemuu
         PVyN23e733U+/4gmhVaEvBqZIhzVusbyGaTb7Xxl2nxiD20Tx3LOxesTKcq88s0N8iJr
         LIBRpu8wg5FLCgcoVgu+2Vuv9KoRD9lt9s8t8VjUQPiIQWKZujeFigjQDeGhSJVV0WxQ
         ICdB1HOELJiECrkmLSruTx/UyZ+n+9VM6SUHBSJOjhUYCCTb1f42R8mxXQCMOjGWmoae
         adaRWQS1f2VQgfid7eHq9xeqSjWUHdHF5CuC0yoqML+Y+E6Uuy0yM6PZX9pk5ripk8AU
         tKUg==
X-Gm-Message-State: AOJu0YxiYlEM4sPnUKk6khq3LFD2VYnBwgIZPxp/3HiEUe6061hUrOhx
	943CUn0Z688FLbXPhTLgtPcOc1xi1VguiZkvvoQ=
X-Google-Smtp-Source: AGHT+IEdc8XB8yR1RQyDQPcB1g6M3Y/qRxO3mFBO9YV/poBnd4UzUlOwgNQQ3uU/4WuSeJsE6kFvIw==
X-Received: by 2002:a5d:4e05:0:b0:333:83e:c179 with SMTP id p5-20020a5d4e05000000b00333083ec179mr2458830wrt.55.1702038258509;
        Fri, 08 Dec 2023 04:24:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b? ([2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b])
        by smtp.gmail.com with ESMTPSA id k3-20020adfe8c3000000b003334460e256sm1918978wrn.92.2023.12.08.04.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 04:24:18 -0800 (PST)
Message-ID: <1ec395bb734d86d16e27da5f4dc9427ce86e04f4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bbtests.py: Add test for unexpanded variables
 in the dirname
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pavel Zhukov <pavel@zhukoff.net>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 08 Dec 2023 12:24:17 +0000
In-Reply-To: <20231208113813.766894-1-pavel@zhukoff.net>
References: <20231208113813.766894-1-pavel@zhukoff.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 12:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192052

On Fri, 2023-12-08 at 12:38 +0100, Pavel Zhukov wrote:
> Regression test for [Yocto #15255]
>=20
> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
> ---
>  meta/lib/oeqa/selftest/cases/bbtests.py | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/self=
test/cases/bbtests.py
> index d242352ea2..03faf1a881 100644
> --- a/meta/lib/oeqa/selftest/cases/bbtests.py
> +++ b/meta/lib/oeqa/selftest/cases/bbtests.py
> @@ -362,3 +362,12 @@ INHERIT:remove =3D \"report-error\"
> =20
>          result =3D bitbake('gitunpackoffline-fail -c fetch', ignore_stat=
us=3DTrue)
>          self.assertTrue(re.search("Recipe uses a floating tag/branch .* =
for repo .* without a fixed SRCREV yet doesn't call bb.fetch2.get_srcrev()"=
, result.output), msg =3D "Recipe without PV set to SRCPV should have faile=
d: %s" % result.output)
> +
> +    def test_unexpanded_variable_in_path(self):
> +        """
> +            Test if typo SRC_URI =3D> SRC_URL causes bitbake to explode

This is a little confusing since this isn't what the test actually
does!

> +        """
> +        recipe_name =3D "gitunpackoffline"
> +        self.write_config('PV:pn-gitunpackoffline:append =3D "+${UNDEFVA=
L}"')
> +        result =3D bitbake('{}'.format(recipe_name), ignore_status=3DTru=
e)
> +        self.assertTrue(re.search("ERROR: Directory name /.* contains un=
expanded bitbake variable. This may cause build failures and WORKDIR poluti=
on", result.output), msg =3D "mkdirhier with unexpanded variable should hav=
e failed: %s" % result.output)

We also want to check the result was an error (failed) build?

Cheers,

Richard

