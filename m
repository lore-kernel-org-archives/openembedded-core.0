Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69857E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 16:33:13 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.106049.1733761991369838336
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 08:33:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Yb2Z93yP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso50705645e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 08:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733761990; x=1734366790; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pYQFZd8hTm5aygxnOs/dfhxZ4GFH/ucaON6tBagrY70=;
        b=Yb2Z93yPtXI1RISQihLYZI+B2iSIH0WJELffhsrd8tnhcQk4mcAk9+IGvuZrkB8Hr1
         m1ZBVU9sd/hdixD2q5PlxJKSNv3HoAW0IDfICZSR44YJFNbH+MKIxaTsMEldzQAfUGDB
         g0UNVphIiRm7K85TVy/5ItXaINnNTv5uTSdkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733761990; x=1734366790;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pYQFZd8hTm5aygxnOs/dfhxZ4GFH/ucaON6tBagrY70=;
        b=uge50WGzqSJn6c1nz2WkAPk34jzxGo1S9ct4gqrc1ZoYZzP9S2TEUy1N1PqxJFQr0h
         jDS2HW03qjJYny/GE0AzB2G/V5+dTD0eqketzBpFWN/jw4D2sSSbalIVrcOuuurxA190
         /EmR9vi/ZfIDJyYZYemtFSpBiPJ8eyw+2sEWpKzOLmzPWerJGdeiOkjvOGv0oeRSguMJ
         gthbam8qobR6UL0iE6ZUCjmSk3+kbz/6WFXpAWzNtGP0/gaw2S6YCTTHNUFArtHHLx1S
         w6iIfZdexSegaKIvXxdLWAjC0t+8O6EeKMc8IEkZdqrHXpd5GaFdVd+zf4MXgEibkHqK
         Vdlg==
X-Forwarded-Encrypted: i=1; AJvYcCVgNEZNgAObFtc0rrkRYComBZ/mFsLiMT/GWUssQEfM6LFydQmqgfao2tj+AZb5MK3Xz2OMbNHCAY8x8d0fhPbC2A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzzaurRceZmUJQ/k+sNqOC0y3eSFa76RcVdsfSyELwbVqtxJbkr
	57XZVu/N1ycGB8k0QNq5Csdlnn6u4/HWTQcYpfMEF+QJviIWmnUZ7PW8iUZaubE=
X-Gm-Gg: ASbGncs5+4H60gvNmQpQxw4HThZO1xK3a79ArB46vm3zDCmBlazIvUHdl4bjhDaj2H4
	WT2anoYR4xMKsxFiUO/rfx2rfknJ370YvgsH5tbHX9Sv9QayfRZbbebTCCjhzkYEnuLOkXbbuqe
	bLdCBAa65dsVlkGZcemm5Ygo5s4K99H8WjWmTgqYGISD//CujASPGhUhNcuzQUbsx4p4tDr3y6q
	2OE4oRJjAnY7kH7KgEokZf8eQSQRfjX7xSNR31P1glrvJRFX4JOJ6g6pAOJfNKPu9mdCbff5klv
	RROjpXQ9r11WyYPRwT35zH+/KDxLv1GWEHqBFcY=
X-Google-Smtp-Source: AGHT+IH9nxYq/qdUG6hVAiKpxnZM9VafrSmD36aK4IUuk87M9lq/cSQkEO9h3F+dt7kEnt8eb+dFIA==
X-Received: by 2002:a05:600c:4587:b0:434:f396:525e with SMTP id 5b1f17b1804b1-434f39653f2mr48737625e9.9.1733761989676;
        Mon, 09 Dec 2024 08:33:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b41:c06d:2eaf:52ed? ([2001:8b0:aba:5f3c:2b41:c06d:2eaf:52ed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f4dfdcdfsm56963205e9.39.2024.12.09.08.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 08:33:09 -0800 (PST)
Message-ID: <679f5a4e181f40228fedfd45fb1770c01b00256a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 3/3] bitbake-config-build: add a plugin for
 config fragments
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Mon, 09 Dec 2024 16:33:08 +0000
In-Reply-To: <20241118162643.1423409-3-alex.kanavin@gmail.com>
References: <20241118162643.1423409-1-alex.kanavin@gmail.com>
	 <20241118162643.1423409-3-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 16:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208487

On Mon, 2024-11-18 at 17:26 +0100, Alexander Kanavin via lists.openembedded=
.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> This allows fine-tuning local configurations with pre-frabricated
> configuration snippets in a structured, controlled way. It's also
> an important building block for bitbake-setup.
>=20
> There are three (and a half) operations (list/enable/disable/disable all)=
, and here's the 'list' output:
>=20
> alex@Zen2:/srv/storage/alex/yocto/build-64$ bitbake-config-build list-fra=
gments
> NOTE: Starting bitbake server...
> Available fragments in selftest layer located in /srv/work/alex/poky/meta=
-selftest:
>=20
> selftest/test-fragment	(disabled)	This is a configuration fragment intend=
ed for testing in oe-selftest context
> selftest/more-fragments-here/test-another-fragment	(disabled)	This is a s=
econd configuration fragment intended for testing in oe-selftest context
>=20
> The tool requires that each fragment contains a one-line summary, and one=
 or more
> lines of description, as BB_CONF_FRAGMENT_SUMMARY[layerid/fragmentname] s=
tyle metadata.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
> =C2=A0.../test-another-fragment.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../conf/fragments/test-fragment.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0meta/lib/bbconfigbuild/configfragments.py=C2=A0=C2=A0=C2=A0=C2=A0 |=
 147 ++++++++++++++++++
> =C2=A0meta/lib/oeqa/selftest/cases/bblayers.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 31 ++++
> =C2=A04 files changed, 184 insertions(+)
> =C2=A0create mode 100644 meta-selftest/conf/fragments/more-fragments-here=
/test-another-fragment.conf
> =C2=A0create mode 100644 meta-selftest/conf/fragments/test-fragment.conf
> =C2=A0create mode 100644 meta/lib/bbconfigbuild/configfragments.py
>=20
> diff --git a/meta-selftest/conf/fragments/more-fragments-here/test-anothe=
r-fragment.conf b/meta-selftest/conf/fragments/more-fragments-here/test-ano=
ther-fragment.conf
> new file mode 100644
> index 00000000000..cf9ba6a6132
> --- /dev/null
> +++ b/meta-selftest/conf/fragments/more-fragments-here/test-another-fragm=
ent.conf
> @@ -0,0 +1,3 @@
> +BB_CONF_FRAGMENT_SUMMARY[selftest/more-fragments-here/test-another-fragm=
ent] =3D "This is a second configuration fragment intended for testing in o=
e-selftest context"
> +BB_CONF_FRAGMENT_DESCRIPTION[selftest/more-fragments-here/test-another-f=
ragment] =3D "It defines another variable that can be checked inside the te=
st."
> +SELFTEST_FRAGMENT_ANOTHER_VARIABLE =3D "someothervalue"

One thing which is still bugging me about this and causing some of my
hesitation to merge things is the repeat of the name in the file path
and in the flag name itself. This is going to be a pain to keep in sync
over time.

I've been wondering if:

a) We should have some of variable that gets expanded. Similar examples
are THIDDIR, LAYERDIR, FILE_DIRNAME and FILE but all those have
problems.

-or-

b) Whether the fragment inclusion code should do a rename of any=20
BB_CONF_FRAGMENT_SUMMARY -> BB_CONF_FRAGMENT_SUMMARY[<name>] during
parsing. We could list the variables that need processing as parameters
to the addfragments directive or in a variable.

Of the two, I can see b) possibly working. We've never had a) work in a
way that I've liked.

Does anyone have any thoughts on this?

Cheers,

Richard







