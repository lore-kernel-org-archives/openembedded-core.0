Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CA5C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 13:51:03 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21517.1782827459134390176
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 06:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ktYt2NjY;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-475417f010dso673619f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 06:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782827457; x=1783432257; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/jexmkBlgAlPZsOzqYzb5DmGlUuuI419n2rAj7/sIU=;
        b=ktYt2NjYKaK/QE7FgI+iQl9eJ6tyXbFQXdsZm56ZR3bCbUvBp2nVJk+2swG4ITEtw1
         J7D6PWrEl3wx7n+n1iAkTEDwxYeA/RZ88RAHAQkctqYJGip52jiCrIEkegmWOxdzF4Aj
         7hMn/ibvT3ALI6NgDVQySqn8ImuwosNIzo7zE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827457; x=1783432257;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7/jexmkBlgAlPZsOzqYzb5DmGlUuuI419n2rAj7/sIU=;
        b=ddMoDlRyg1E7/xmNgTmPwdxEuazBDumKmJjvRfPzqpDaTYs3DeF5nwrfeUVJ3l9yXH
         0RmFUk9YGkimtmL7r2o2zDPKGr1jOp8IvS2rltO3gI5UCxfFTi4mLttp0WNEDKst4Amf
         hSTRso24vueQhWB3IjkCb/z1DNYr1KE7rc2X7HjOm9NAepxSLLNHgCJ8b9v0/Qc+1dlt
         7IA9oc7d+62c3tbttZJCeHI+NSffB3K/hXk29Fu+ld3iB6UR5SwHI1CUBWwvgAfdtnx+
         Q2sYAi5BCp3wrDlhNT7+Gsxct/8nDbo00G2MM0JsRbxyzSz7nN9zShzf7wLzj7jOi33c
         T9Mw==
X-Gm-Message-State: AOJu0YwPTi4LZUaGWemXKsb7p0mNPYMW8smv96L4eRaHfinATGwGXKjn
	RZlBThbxxwc94dUyRws7gfHCgzXUnBzKVHKnxlCOIxGKCP/ZIIRSdfTkOt6v4SZGQcg=
X-Gm-Gg: AfdE7cljdJxPq/ybOTG1sxF7wVvDF9yoNqVYpg7zX2K2+XY8K7KhrNqZoshIn4U9j80
	e8M/r9GIr5f2O/g7DN5BJWEBLbNdShU0tJpeqTptI0VJ4lx4o93ikIWW0lsSY4sUC7HK4fKtUG0
	ZKlc7VUP67EN0UTy/lGfE2MO8VDuacldbIY/ZClIzTaZvbx7Jtp0k+F+7PY3ktun4UtNB4AO0+u
	zDdWP6aTsGKYVg5Kgfg00MeVjc5+/CUKezrdFldODFIPEYMWZuyv7Hl1nIdfbNh/qW2uJD0WcM4
	egdP3OfK0jUyVUVYfLldPKaL8GbsfpmU1tOd88Qs2VIGg52qlfYj9zUTahfRYZ97Yiuvbf2v9xZ
	VDH98gNHKeYRRKmri8xRbd/U1HUD4WgW4+f7Q7K8dEpWJtkMmC2BkIkRSCBhvynxjRFOSpHqibH
	wJUHJpard9VHEYQDFXDg2MFWD0CQGUCrIqZ56KtFvifJ//iESrTqRW02yVBzsJ7vdfR3pz2QOIJ
	1lW9Q==
X-Received: by 2002:a5d:6e56:0:b0:46f:e796:c3fc with SMTP id ffacd0b85a97d-47658f7fb06mr781848f8f.25.1782827457222;
        Tue, 30 Jun 2026 06:50:57 -0700 (PDT)
Received: from localhost (2a01cb001331aa0041d7d5fc68d4e77b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:41d7:d5fc:68d4:e77b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778fac3sm7386394f8f.32.2026.06.30.06.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:50:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 15:50:56 +0200
Message-Id: <DJMFL6TE8JWX.2O3VSPN2AKF1J@smile.fr>
Subject: Re: [OE-core] [PATCH] dropbear: Clarify LICENSE and drop PD
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Yoann Congal" <yoann.congal@smile.fr>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260602150018.189097-1-richard.purdie@linuxfoundation.org>
 <DJLWBE1WSDSN.G0FEJAKOMOUI@smile.fr>
 <82485f53d8cdfc2fded0f3786cbe97fb105e9902.camel@linuxfoundation.org>
 <CAMSfU+4hVA5oHERs8D0_pR2eWVeFeKdhogvvQLqGTD6XOgciXQ@mail.gmail.com>
In-Reply-To: <CAMSfU+4hVA5oHERs8D0_pR2eWVeFeKdhogvvQLqGTD6XOgciXQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 13:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239897

On Tue Jun 30, 2026 at 9:34 AM CEST, Yoann Congal wrote:
> Le mar. 30 juin 2026 =C3=A0 08:42, Richard Purdie <
> richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
>> On Tue, 2026-06-30 at 00:44 +0200, Yoann Congal wrote:
>> > On Tue Jun 2, 2026 at 5:00 PM CEST, Richard Purdie via
>> lists.openembedded.org wrote:
>> > > The "public-domain" code has a MIT license header so we can remove
>> > > that from LICENSE (MIT is already listed).
>> > >
>> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > > ---
>> > >  meta/recipes-core/dropbear/dropbear_2025.89.bb | 3 ++-
>> > >  1 file changed, 2 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/meta/recipes-core/dropbear/dropbear_2025.89.bb
>> b/meta/recipes-core/dropbear/dropbear_2025.89.bb
>> > > index 957a0901fb0..ece065265ff 100644
>> > > --- a/meta/recipes-core/dropbear/dropbear_2025.89.bb
>> > > +++ b/meta/recipes-core/dropbear/dropbear_2025.89.bb
>> > > @@ -5,7 +5,8 @@ SECTION =3D "console/network"
>> > >
>> > >  # some files are from other projects and have others license terms:
>> > >  #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
>> > > -LICENSE =3D "MIT & BSD-3-Clause & BSD-2-Clause & PD"
>> > > +# The 'public-domain' file is headered as MIT
>> > > +LICENSE =3D "MIT & BSD-3-Clause & BSD-2-Clause"
>> > >  LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D25cf44512b7bc8966a48b6b1a9b7605f"
>> >
>> > While reviewing backporting this patch for scarthgap, I've look at the
>> > licences of dropbear:
>> > The "'public-domain' file headered as MIT" is (I think):
>> > https://github.com/mkj/dropbear/blob/DROPBEAR_2026.91/src/curve25519.c
>> > (indeed MIT header)
>> >
>> > But:
>> > * vendored libtommcrypt is "PD OR WTFPL"
>> >
>> https://github.com/mkj/dropbear/blob/DROPBEAR_2026.91/libtomcrypt/LICENS=
E
>> > * vendored libtommath is "Unlicense"
>> >
>> https://github.com/mkj/dropbear/blob/DROPBEAR_2026.91/libtommath/LICENSE
>> > ... is that OK that those don't appear in LICENSE?
>> >
>> > If yes, then the argument is still valid for scarthgap and I'll will
>> > backport.
>>
>> Well spotted, I think you're right that I didn't get this quite right.
>> It should be:
>>
>> "MIT & BSD-3-Clause & BSD-2-Clause & (PD | WTFPL) & Unlicense"
>>
>> assuming those libs are always used in the build.
>>
>> We should probably just make it:
>>
>> "MIT & BSD-3-Clause & BSD-2-Clause & WTFPL & Unlicense"
>>
>> since PD just causes us pain and WTFPL is effectively the alternative.
>>
>
> Ok, I'll drop that for scarthgap for now, send a fix for master and then,
> look backporting this.

master fix: https://lore.kernel.org/openembedded-core/20260630134853.537737=
-2-yoann.congal@smile.fr/T/#u

>
> Thanks!
>
>
>>
>> Cheers,
>>
>> Richard
>>
>>


--=20
Yoann Congal
Smile ECS


