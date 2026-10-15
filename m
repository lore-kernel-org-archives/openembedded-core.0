Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775F7CC6B33
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 10:16:28 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36090.1792059381091880159
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 03:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PJXAXCvk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b0584ad71so3045369f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 03:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792059379; x=1792664179; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s+687pokjmT/S8bMnokHRrpUdrKc7tc+ZiWFnCjXi/Y=;
        b=PJXAXCvkeVT87bbx0zSF5X8Xeqk4G8LqQ+7rWAzlYswPeOLMuACEFur6GQ9lHep7Ho
         oxyF4OFixdyUSu2VfjMsgFiezIzhG6YxxnozWqrGrZpRGOuyWKIYqjoS5NOknOrlamXh
         PLro8HZH8jsndG9u9XjYux/a6Agskl2Zoe+Uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059379; x=1792664179;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+687pokjmT/S8bMnokHRrpUdrKc7tc+ZiWFnCjXi/Y=;
        b=eaGfI8TgBXHv+rGhkWLvD3O8davFHjr4iVFhchTXEMnmLb0mU7+KOo7TLMYXFR++AF
         oV5pup7kPh+C451mlnk7h3qoxEIfpqS8jdQW27JJiGqAFPqAnUcgW6oGDJPAGlm/J8os
         /GvELp57oJQqlNVSesKRGHIQwhcDnGW6YY0/r6Ft/mVkZ2CFKmQK1HQNrp7zNy9nvkQH
         2eksPuu2mpbyKw2LyOdbmDvYSudFDMug2Pm/VuR3+p7zDKlt1kJLsAumjjrPWBIheWwc
         2GLNxSmcDd5AMzCD2LhIRTIVWdBqIbVYUhr0gvbIScm9XGjRQhTFrFXZ/ETZTpCceK2p
         9rdg==
X-Forwarded-Encrypted: i=1; AKwUvBxghR+VGoXv1gBqaPQR+9TISYqoWN3oTwYiHfTx9LAJ0wJh/52Sy3O7BAX1kna+0pJFoY9xNcmFEABfm4qWW0Q0yQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLQxcbo/pLyr5L8jSuF5Yi5y99KFnf2CPlSLE2UHDr1lHI+OoTd
	MLJ5eCBHSs5Ul+sQnlvZJFgpqyFFu4OMZOFv59R9Fe2dIQZaU+vJ6ZMDhtyxnjQ7Okc=
X-Gm-Gg: AYBFou119wbeeqI6QyVtUrU4DqlmbWqliVjOViWFazYwvfXgU+8HgXuZJV7Sc1zwlyI
	0SeEuTNPPhYkvEE5cVptOWSMlalBLKXkfdc6mfTXaOCBPF43r56AR7D/UJeSzYnVvNr3mReed87
	J1qdMhUvYm51Yy+TwvGPm1mQoZrSzJ6750jnmKlnlRv7NC9dg/Lsh5DKvjQMtPhhL+bnyD6PGiP
	8rlOHtdUkHWgjm/n8MDyL7LnmZ/4IJQgD1JuyWH7QhgzCLUM1chQYfrX2+hjy7Sh+zuuqE9vIt5
	27q+gIGbU/P9u1gGGqdSzIiiS1Fwum3IOuVEHzoYT4JcdryxGqce8Hbkjw2IjIQr1Q5Hj+a/GuS
	B1FxM5WFotaqlz0ynLOG9w5sikAvulth7EgL69+UHFMyUa8lXtfXIicV2tzcFBQUMCLYFDg/H7k
	gt6MxDoSJ29npCcuEEDjs0WP1Y4QJhz/bHXlCU3J77UP26+wT2nd0O6UGAG8q92sgqgMAmGhBrK
	I/b6a4VHN5TePYGyCZxqgNmeJjCEO7v0001FKbYP3VnZzsliT1xRqEf27DTnNw=
X-Received: by 2002:a05:600c:4ecb:b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a18e43a29fmr374847955e9.2.1792059379054;
        Thu, 15 Oct 2026 03:16:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8627:1727:8a8a:57f5? ([2001:8b0:aba:5f3c:8627:1727:8a8a:57f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd66ab3dsm55743005e9.2.2026.10.15.03.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:16:17 -0700 (PDT)
Message-ID: <f864589a2efc32e1b80429eb59016badac9ba25b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 1/3] classes/base: exclude
 __CACHED_SOURCE_DATE_EPOCH from task hash
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: daniel.turull@ericsson.com, openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com, mathieu.dubois-briand@bootlin.com
Date: Thu, 15 Oct 2026 11:16:16 +0100
In-Reply-To: <20261012115319.1704048-2-daniel.turull@ericsson.com>
References: <20261012115319.1704048-1-daniel.turull@ericsson.com>
	 <20261012115319.1704048-2-daniel.turull@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 10:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247871

On Mon, 2026-10-12 at 13:53 +0200, Daniel Turull via lists.openembedded.org=
 wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>=20
> epochfile_read() memoizes its result into __CACHED_SOURCE_DATE_EPOCH
> via d.setVar(), so its runtime value leaks into the basehash of any
> task that calls it, causing a "metadata is not deterministic" error
> once SDE_FILE is populated.
>=20
> Exclude it, since it is not meaningful build metadata.
>=20
> AI-Generated: Uses Kiro with Claude Sonnet 5
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
> This should fix the selftest errors reported by Mathieu
> ---
> =C2=A0meta/classes-global/base.bbclass | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
> index 9553f00432..01a030399e 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -249,6 +249,10 @@ do_unpack[postfuncs] +=3D "create_source_date_epoch_=
stamp"
> =C2=A0def get_source_date_epoch_value(d):
> =C2=A0=C2=A0=C2=A0=C2=A0 return oe.reproducible.epochfile_read(d.getVar('=
SDE_FILE'), d)
> =C2=A0
> +# epochfile_read() memoizes into this variable via d.setVar(), so its
> +# runtime value must not leak into any task's hash.
> +oe.reproducible.epochfile_read[vardepsexclude] =3D "__CACHED_SOURCE_DATE=
_EPOCH"
> +
> =C2=A0def get_layers_branch_rev(d):
> =C2=A0=C2=A0=C2=A0=C2=A0 revisions =3D oe.buildcfg.get_layer_revisions(d)
> =C2=A0=C2=A0=C2=A0=C2=A0 layers_branch_rev =3D ["%-20s =3D \"%s:%s\"" % (=
r[1], r[2], r[3]) for r in revisions]

This is the old syntax and is less maintainable. It can be done
alongside the actual function now, for example:

meta/lib/oe/packagedata.py:@bb.parse.vardepsexclude("BB_NUMBER_THREADS")

Could you tweak and resend please?

Cheers,

Richard

