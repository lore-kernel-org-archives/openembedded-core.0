Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE44CC624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 16:35:03 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2490.1788539699687858705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 09:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZTFQG2lu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495590dde14so17101085e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788539698; x=1789144498; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cCSixYuCfOJIjJtyWJ0PdM9LtQ/dLkAiH/AgLJB7XO8=;
        b=ZTFQG2luMXY4WIodbj4iiuJwjXtttFactsSpx5YvLVFgy1HHOghZ9KoyH62ZjpTCgu
         fKkFwb8vF67NYXH1tCNXfQph23m6IZ/FcN3Aa+w/zuEhEal6/39WZRnEptEckq/CkqLt
         RHI187iZSMH9JNeURJgO7WCoGYPAzTNkpqwtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539698; x=1789144498;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cCSixYuCfOJIjJtyWJ0PdM9LtQ/dLkAiH/AgLJB7XO8=;
        b=SA69PiLlWcptExMYbIfhn69RQdFOrYM0VROmlqJxpmNzrIb3sPayv0JqJBKCLQ0AF6
         euj2E8ObrWIwxn6sdJrQuSTJmOGRYt2RHHgmAOIxSZoVxd+oJX9HrosXTJpRsY+EzLDv
         ELfS4iVQezrVhgvSvCr4A+CLvaoS9bZl3kO1fyzPVE/+bdEBO8ixIeAkbVyZN2brjLdm
         S7pAqN4bMyEcnT+yvLE/llZbLiv1CIWfOCeFErEOeiEzuOw1GoJyRX6HCdTEFAIhOpFb
         0pEITcgomBhXHU254593UZSGSyglrUMhMEjpxFjPcmbYc32DCQswBkDSQisyIizh7uK4
         ctoA==
X-Forwarded-Encrypted: i=1; AKwUvBxQ8/YwovnBOmDsWESu2zySHspgeQkQqcNPUNECMdpE9StXCD4fkVPrll0ELmq956qQgY0cWL+guFesyCixUNt/fw==@lists.openembedded.org
X-Gm-Message-State: AFuF++nqp3tTrYAJkGnM3+oMupHh+6Xpi8wAgSX9U9e0L9TOYeBRM5oO
	GSWthmD+H8uJjW+LqRf0ItS/16nwppWrGq4lASX7a4IQK8gz5/XLOvp0EPIYLIcojvc=
X-Gm-Gg: AYBFou0def/3Wb6/09KAgLUqPz+46w8CYJsz18Au5Qw3IN0c1B2l3emquNhogGykyLe
	F58VHr/IkJivKlIQPaEtlX/dpyFmlHnsx6L9DrETndNDPVPyRRtutfHSFrXJu3vKy113TjDDCGH
	YPv2TkwdR5fWHPFL6qM70+bG6D8PxVtFoEYVuIN53Eo3Dp8VZdGbHNvmNUKGJdo3Hx8G3WxxJ2P
	7Qi99dDGYGb7vPUFIhTA8daHjGUPALUVCZW1k63iAuDtwtw9O4MYKcY6sK6JErZ2Oh+HknW5dsK
	MtbXm6SWj1J1ezv1ernLVmiTDPRdxtMrc6glMHo1XRa3iS6GP7OUM07oMNtAZg7X5JEk10mf/By
	EnVFxM/6yf4VWA/Y0qGFJ+FwUU1ahBgUuI3bA7tSy4VQioStqiKMdttcTt8pnS89fGCLUl9AHHj
	MJWj8JgNtkuOBZg7ZGLqg4yu6cGHX14vX03goOmfBWgVIEgmPdRdtnZ0HLqQgQROi1aF4OX/Zgl
	JRqMcwXpAPGPAlOK3HDHTh7SFpGpXD5l+ZSjzKCOWFlhtMK5lctFX3wIa7OcvIPxw==
X-Received: by 2002:a05:600c:a0a:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49cf81e6cebmr111370805e9.4.1788539697843;
        Fri, 04 Sep 2026 09:34:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:23f6:3417:15e4:9ee4? ([2001:8b0:aba:5f3c:23f6:3417:15e4:9ee4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm424829185e9.0.2026.09.04.09.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:34:56 -0700 (PDT)
Message-ID: <459ee648f0e733958f7e0d21074d3fa41e77248a.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] systemd: re-enable ptest support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: HimaniRamesh.Barde@windriver.com, 
	openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, ross.burton@arm.com
Date: Fri, 04 Sep 2026 17:34:56 +0100
In-Reply-To: <20260904080004.2501262-1-HimaniRamesh.Barde@windriver.com>
References: <20260904080004.2501262-1-HimaniRamesh.Barde@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 16:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245124

On Fri, 2026-09-04 at 08:00 +0000, Himani Ramesh Barde via lists.openembedd=
ed.org wrote:
> ptest support for systemd was dropped in 2018 (commit 906230a73b3c)
> when the recipe switched to meson, as there was no easy way to
> install and run the test suite. Current systemd and meson resolve
> this: the meson 'install-tests' option installs the unit-test
> binaries and a run-unit-tests.py runner under
> ${prefix}/lib/systemd/tests, and run-unit-tests.py already emits
> PASS:/SKIP: results per test.
>=20
> Enable install-tests, package the installed tree into systemd-ptest,
> and add a run-ptest wrapper that drives run-unit-tests.py. This
> provides ptest coverage for the systemd:test and libsystemd meson
> unit-test suites.
>=20
> The test/units integration tests, which require a booted system, are
> out of scope here and can be addressed separately.
>=20
> Verified on systemd 257.6: -Dinstall-tests=3Dtrue installs 313 test-*
> unit-test binaries plus run-unit-tests.py; systemd-ptest packages
> cleanly. The recipe change parses without error against oe-core
> master (261.2).
>=20
> [YOCTO #16386]
>=20
> Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
> ---
> =C2=A0meta/recipes-core/systemd/systemd/run-ptest | 11 +++++++++++
> =C2=A0meta/recipes-core/systemd/systemd_261.2.bb=C2=A0 | 18 +++++++++++++=
++++-
> =C2=A02 files changed, 28 insertions(+), 1 deletion(-)
> =C2=A0create mode 100755 meta/recipes-core/systemd/systemd/run-ptest

First issue found in test:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/4554

Cheers,

Richard

