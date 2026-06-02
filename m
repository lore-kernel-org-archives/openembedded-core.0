Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58108CD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 22:55:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8036.1780440922070094124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 15:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eroxCHlz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4908b92904fso67119525e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 15:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780440920; x=1781045720; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bh2IEltrc/bthTdCgQoHnVH5puBTLTTHBbRSq1jyAQ8=;
        b=eroxCHlzUdBXZ3FuHoJVGoCgInAntBNZsfeXsk1gxfdGqYTag/VDQnRoNzr0PLukkq
         rwnB2HK014185ONvLBMHaLaksLJdk6ggxxYvNbjzA96F62BV8q168PPDgrk490kamFRR
         4lXrWgBh+K+uK4YEpy7O+JkFJKANWlqLaw7dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780440920; x=1781045720;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bh2IEltrc/bthTdCgQoHnVH5puBTLTTHBbRSq1jyAQ8=;
        b=FaoLcscUiKEsdIZW0k83GYSGuKX6DCCMbwd3iOTE0AUSmYOcj21uKiC91kTQulS3gF
         cmrCNZywWMQbyR7Y7pJkBLWNynr0VOLv7NSMmgDuYZAv5HwVItHdHdU/n6j3qUT2qv25
         KAZ+rJKbxMGjNi4ujSEevnG6HO/U2rOTZKFI5OXe+VwueKV/4jP7erSmuNGF0GkdaveI
         NKUHSpSymXlqC3/GO4FfnXFWEr9aTT//b750ayMV8e1zLh1xbUZsGCg4pv7FqKwbfTWf
         xoZgWxszhxCAeHAbbW49mJuSNk+z4NDaVACac6vbl5znVP37oswyywq2zI+68nrd2e8s
         bgVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nq8SmwtuVcqKPs5j6dlxfiPiKtU0zm0G+CCm4z6oDbnHVoBnV9tH2iuSTBC0LSnfSoio4TA9lYDZgkHiriNX9Og==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz9khmT8xvLmJy7SCNBU7mwRASlgjbssMeaHufzuwEkNcXsu4VB
	nfzqDVLYiC9VLOUapuhpEv4yI3boaH5C4rX0Om4ux+iMSxYpVTtA7a87YC1GE4UhuQU=
X-Gm-Gg: Acq92OEYM0g5dF7ElvcVDPpiqnOdCh1Z8otmcqHkFNjLY3xh7GEOhnP1ukeQnU4wB6p
	Q2JS5G2UgHzV9zA3v18cFuV+NRYYbJUW+92CyJw6cAqk4qpWlIqKv3Q3pQh8yS0IPGvrF5BUAKV
	Cic5K68GWnTyTD1dfwAOX+Nm+Q2bjhRk8viU0IO0u9OodNfWx7QqISvsVzPO5nwk89TYgB7NWB9
	Uj4bQPYa55zcJXrPzI8+n2CGlVgmGmbS5MwizWYnDnZO0qx/jhkQ91bP/C4fQ4TgIhMhePPzRf7
	Zt0JH9OXmX9QvPm4XuvDxDXjecElTzaluq0R9UkXE+jZOuRQtgPic2calgCRUnCIoRm6lqrLucC
	cZgFrW/Vo7F1ZbMdeHYLrCccMqX1U8fLrr2oDte6dBG+w1PdzZiZkGr5BOXaU9Mx6ow5E/lpGWp
	QauIQb4zu98RjUofRw4yRH66biyY4pU/VXTZ0uM0KSs90JQInhDGLIaZX6pfPfpIMn3YsSIeLBy
	Y+D6ThMMiAJfWY0Q9/azmnIQoU=
X-Received: by 2002:a05:600c:4748:b0:490:6e11:c303 with SMTP id 5b1f17b1804b1-490b5ed6ad0mr12195985e9.13.1780440920362;
        Tue, 02 Jun 2026 15:55:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6526:f98e:192f:9cd4? ([2001:8b0:aba:5f3c:6526:f98e:192f:9cd4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b613f167sm3562095e9.22.2026.06.02.15.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:55:19 -0700 (PDT)
Message-ID: <6c4c263e51757e48d86880a74b2fa568d59e7639.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 0/4] Add missing SRCREV check for SCM URIs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: saisneha196@gmail.com, openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, corentin.guillevic@smile.fr, martin@geanix.com, 
	paul@pbarker.dev, mathieu.dubois-briand@bootlin.com
Date: Tue, 02 Jun 2026 23:55:18 +0100
In-Reply-To: <20260602062940.3107241-1-saisneha196@gmail.com>
References: <20260602062940.3107241-1-saisneha196@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 22:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238074

On Tue, 2026-06-02 at 11:59 +0530, Sai Sneha via lists.openembedded.org wro=
te:
> This patch series adds a check for git:// (and other SCM) URIs in
> SRC_URI that are missing a corresponding SRCREV, addressing
> Bugzilla #16051 [1] and referencing Corentin Guillevic's RFC series [2].
>=20
> =3D=3D Changes since v4 =3D=3D
>=20
> - Add tag=3D to skip condition in oe.qa.check_uri_srcrev() alongside
> =C2=A0 the existing rev=3D handling. This fixes a selftest breakage
> =C2=A0 (test_git_unpack_nonetwork) reported by Mathieu Dubois-Briand wher=
e
> =C2=A0 recipes using tag=3D in SRC_URI intentionally leave SRCREV empty.
> - Update docstring to mention tag=3D parameter
> - Verified by running full bbtests.BitbakeTests selftest suite:
> =C2=A0 32/33 passed, 1 failure (test_image_manifest) is unrelated as it
> =C2=A0 requires building a full image and fails due to network constraint=
s
>=20
> =3D=3D Note on CHECKLAYER_REQUIRED_TESTS =3D=3D
>=20
> Paul suggested using CHECKLAYER_REQUIRED_TESTS instead of Patch 4.
> We tested this but found it promotes missing-srcrev to ERROR_QA for
> ALL layers globally during normal builds, because CHECKLAYER_REQUIRED_TES=
TS
> feeds directly into ERROR_QA. This contradicts Bug 16051 Comment 3
> which requests keeping it as a warning for external layers by default.
> The direct implementation in yocto-check-layer.bbclass enforces it
> strictly only during checklayer validation without affecting normal build=
s.
>=20
> =3D=3D Note on candidates list order =3D=3D
>=20
> Martin suggested reversing the candidates list so plain SRCREV is
> tested first. We kept most-specific-first order because it mirrors
> BitBake internal srcrev_internal_helper() resolution order exactly,
> as confirmed by BitBake own error messages:
> =C2=A0 SRCREV_default:pn-X, SRCREV_default, SRCREV:pn-X, SRCREV
>=20
> =3D=3D Problem =3D=3D
>=20
> A recipe with a git:// URI and no SRCREV causes two problems:
>=20
> 1. Under BB_NO_NETWORK=3D1, parsing fails with a FetchError that halts
> =C2=A0=C2=A0 parsing of ALL recipes. This breaks CI pipelines that use
> =C2=A0=C2=A0 bitbake --parse-only as a sanity check.
>=20
> 2. Without BB_NO_NETWORK, BitBake silently queries the remote
> =C2=A0=C2=A0 repository on every parse, breaking reproducibility.
>=20
> =3D=3D Why the trivial fix does not work =3D=3D
>=20
> The obvious fix of checking SRCREV in insane.bbclass do_recipe_qa
> was attempted by Corentin Guillevic [2] but fails because
> fetcher_hashes_dummyfunc[vardepvalue] expands SRCREV at parse time
> BEFORE QA checks run. Corentin patches 1 and 2 add the QA check,
> while patches 3 and 4 ensure devtool and recipetool only use
> AUTOREV when appropriate.
>=20
> =3D=3D This series approach =3D=3D
>=20
> We intercept at the vardepvalue expansion point in base.bbclass
> using a shared helper oe.qa.check_uri_srcrev() that uses
> d.getVar(candidate, False) preventing expansion entirely.
>=20
> =3D=3D Design decisions =3D=3D
>=20
> 1. Why not use srcrev_internal_helper()
>=20
> =C2=A0=C2=A0 It expands SRCREV internally, triggering get_autorev() and l=
ive
> =C2=A0=C2=A0 network fetches. Our fallback chain mirrors BitBake resoluti=
on
> =C2=A0=C2=A0 order exactly without expansion.
>=20
> 2. Why duplicate warnings at parse time AND QA time
>=20
> =C2=A0=C2=A0 Parse-time catches CI parse-only pipelines. QA-time gives pr=
oper
> =C2=A0=C2=A0 layer control. This pattern is established - src-uri-bad doe=
s same.
>=20
> 3. Why hardcode git/gitsm/hg/svn schemes
>=20
> =C2=A0=C2=A0 Known limitation, noted as follow-on improvement.

Why don't we do something in the bitbake fetchers which would check if
they would need a srcrev lookup and fail if that were the case?

We could set something with a layer override which would then trigger
any recipe in core to fail to parse if they weren't set
deterministically.

Looking at the patches, I'm worried we're duplicating fetcher logic in
OE-Core and we definitely don't want to be doing that!

Cheers,

Richard

