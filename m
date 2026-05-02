Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA57CD3423
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 15:54:05 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8733.1777737228760420841
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 08:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IiXKbOv6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d73422431so2356216f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 08:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777737227; x=1778342027; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8sJiermHVRx/nZENKF6UIfY3252TyUtlADduJgGi+EI=;
        b=IiXKbOv6Mrul+Bh3wZHx+J220zLRwQq+PPLnkaO7sjZVcfQp9dI/+9kMSonZlTXdV7
         3AJA25PUnHmaN9rAuV9tQW+O8h22FnkUetBaByzvy6GfzD7Cw1HMudXemm9VsErQImpf
         BL51J9Bbu3QOyIoyF0znOeZe/DNvcjMBjciQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777737227; x=1778342027;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8sJiermHVRx/nZENKF6UIfY3252TyUtlADduJgGi+EI=;
        b=PledB2KU1q0ObcYlUDCCIUWZ/VTASKV5VaHycL9eLe2CeO3Dppo879IzZ+ZOb41CLZ
         3D4ngABRsHa/D4RyegP99Saa7mfdnT9SMfGPT97ponK4qM77V5wp43WPADuny+SHkZ+5
         xerHMzg68BZE1V+rFpIm7tmsk79fzds/kuWkUA6YOeoNt3pjz25lLmUM9Oh5+Nhi4ba2
         xXdeiglyc0XsCu+VQ0bRHLt59Q0uB6AYRVcOWoXqgDIo/CZFYXCOFN5hyMj076vPesvn
         bBAbRMMGgKS2gZ2pqH6YWgH9TPCqMZzSL4LmCV2cj3g/vCUe84uYtY/tmLPlLbyub5w7
         Qbfw==
X-Gm-Message-State: AOJu0YzMjy2nZpHmQuK9E3bgfR9HPn4FjX5D8FJLtsRfYp8DkQVR5gzN
	mB4nePy4OX9OulMmqHBjn2xP/JNxt+5aPtP6sI9pg2Vh3Ub4ZY2cOziQUvoSkYOShmBawBTBUmI
	u6lIYIPJRbAK9/yqAouxgkB6vA50sNTXqdLU1dsK9txpdJusy+rmRx50DeBWPZQCfoJvYOZ2k2C
	4=
X-Gm-Gg: AeBDievQO81FcKRXH16E+srd71b9i66kLU9IdGk1rdE7fdvU4gs+8C8julDCrK1RlK1
	na/AdHxgN6v87d1Of/4h0G7Aap9Jd5L6wiPZQuFex6BuHkQS/SXRIw3P3qJ6Z6jZhZvsqBQQFOE
	UgE9h9wegfK1/fmE7b9BTocD3GYEx+EVKWKfs6PjchpD50d28xKbRZqfXLgv9hRSboGG98ndidK
	CgauQckFH8n75cjXYLxedkUTF8mICqDFD1BbJpqqIN84Ockap8xb+a3v2Cm9kgjcuaN78OUtH5B
	A+GhpO9xAkAmXS7SzZmEasp9xpaMnxcM9mR9yuBAbMITxZKjxaliS3JoZjOOHvKrQ5g1ToJzWBD
	NZiIxN1ViDFMZW2TCXQGTrfXz+69g4g6T8Psgu23sGxnBaZVTHWfW5I111eOVBmxSgLKLd7iAJE
	uiVv/1Z/afC7V4nrQKwxR0/0H15P9tzMG6oU0wmCQ5uVufGe7fuYzIkYxLPohSQkhx5djZX9ADz
	YG3giUxagaAF4GDZ7R/XEOqPi4=
X-Received: by 2002:a05:6000:25c3:b0:437:711c:8754 with SMTP id ffacd0b85a97d-44bb36d192emr5396975f8f.7.1777737226907;
        Sat, 02 May 2026 08:53:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8635:4fc6:d16e:90be? ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44acad8f974sm10808536f8f.23.2026.05.02.08.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 08:53:45 -0700 (PDT)
Message-ID: <cd7bb82ad82d6e341662dd346b4a8d5a03a0dafe.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] python3-packaging: upgrading to 26.2 SUCCEEDED
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: auh@yoctoproject.org, Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 02 May 2026 16:53:45 +0100
In-Reply-To: <0101019de3ee57c3-589c9dd5-ea2a-4508-8462-a02599db30fd-000000@us-west-2.amazonses.com>
References: 
	<0101019de3ee57c3-589c9dd5-ea2a-4508-8462-a02599db30fd-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 15:54:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236309

On Fri, 2026-05-01 at 14:25 +0000, Auto Upgrade Helper via lists.openembedd=
ed.org wrote:
> Hello,
>=20
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *python3-packaging* t=
o *26.2* has Succeeded.
>=20
> Next steps:
> =C2=A0=C2=A0=C2=A0 - apply the patch: git am 0001-python3-packaging-upgra=
de-26.0-26.2.patch
> =C2=A0=C2=A0=C2=A0 - check the changes to upstream patches and summarize =
them in the commit message,
> =C2=A0=C2=A0=C2=A0 - compile an image that contains the package
> =C2=A0=C2=A0=C2=A0 - perform some basic sanity tests
> =C2=A0=C2=A0=C2=A0 - amend the patch and sign it off: git commit -s --res=
et-author --amend
> =C2=A0=C2=A0=C2=A0 - send it to the appropriate mailing list
>=20
> Alternatively, if you believe the recipe should not be upgraded at this t=
ime,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>=20
> Please review the attached files for further information and build/update=
 failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_=
bug.cgi?product=3DAutomated%20Update%20Handler
>=20
> Regards,
> The Upgrade Helper
>=20
> -- >8 --
> From 59193a7e4a05b0bca422b8b94d2558ad8d67a039 Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Fri, 1 May 2026 08:53:35 +0000
> Subject: [PATCH] python3-packaging: upgrade 26.0 -> 26.2
>=20
> ---
> =C2=A0.../{python3-packaging_26.0.bb =3D> python3-packaging_26.2.bb}=C2=
=A0=C2=A0=C2=A0 | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> =C2=A0rename meta/recipes-devtools/python/{python3-packaging_26.0.bb =3D>=
 python3-packaging_26.2.bb} (94%)
>=20
> diff --git a/meta/recipes-devtools/python/python3-packaging_26.0.bb b/met=
a/recipes-devtools/python/python3-packaging_26.2.bb
> similarity index 94%
> rename from meta/recipes-devtools/python/python3-packaging_26.0.bb
> rename to meta/recipes-devtools/python/python3-packaging_26.2.bb
> index ff45cb5133..1e4c0a6bd3 100644
> --- a/meta/recipes-devtools/python/python3-packaging_26.0.bb
> +++ b/meta/recipes-devtools/python/python3-packaging_26.2.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/pypa/packaging"
> =C2=A0LICENSE =3D "Apache-2.0 | BSD-2-Clause"
> =C2=A0LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfaadaedca9251a90b205c916=
7578ce91"
> =C2=A0
> -SRC_URI[sha256sum] =3D "00243ae351a257117b6a241061796684b084ed1c516a08c4=
8a3f7e147a9d80b4"
> +SRC_URI[sha256sum] =3D "ff452ff5a3e828ce110190feff1178bb1f2ea2281fa2075a=
adb987c2fb221661"
> =C2=A0
> =C2=A0SRC_URI +=3D "file://run-ptest.in"
> =C2=A0

This has ptest failures triggering warnings:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/353

Cheers,

Richard

