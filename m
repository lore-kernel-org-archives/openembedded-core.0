Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94462F55114
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:49:06 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18958.1772923744094649492
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:49:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k2lb+Ll3;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7986c7b8076so112771267b3.2
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:49:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772923743; cv=none;
        d=google.com; s=arc-20240605;
        b=XVqBvej7keWUbx9RRVWcmoEWLlUo986F2/0yCiTkHBAGW/kZ1SNZxjcNsw4YZH/ns/
         MCtuQFCvqaXQb3Tsjc9GmewpSsMVO3i6z5uuslm6ixMIjVvxy9CGqaZ4gM6rlycyAVgY
         kqcq+f81RN5WA/zCWz8AOzRkR9SiADWycSel2JiKlnfShBJiq7gcu5tVH6E605YBnWwy
         OPWsPOi+Ik6ZYws/TkI6i6vKTyAC2QKcobAZU6hzHo9jRB2L6hVau5LLv6uJ7DbIaBTf
         2p7lWo7BBWcgT0rdeKT4VhXOgXV7NmCapwNE8IgXfbD/w1g81wpsXC8c7JHtzsaB3lyh
         LmTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gkQSh47/17VVtvEQmHwmBRoDAO+GkNhmR/l+FIs0OSY=;
        fh=aX9SpBcc1D+i0sBLZeYvRNp2cqEQvxp/jAk+Y+9zDH4=;
        b=Va9kRL4kfFfiHin/CnzrnpwIo+JH/jop/VnqW/vopYuNwzCk63h6J8WBrVdvYufQWQ
         KLBR8K5NtoHGS/a6Ww7+yOL+Xv08O0BfeB0PkNb+Cfvihy9T0CUAth2aR3PnXup4wexh
         nvHiWUB5OyXEELh/1NRTnFDcypVI1xTBjW6u+I/DtND94vtis2mQrANqr/qU6bGxqdL4
         DWlwUHSu8xlZkTwo306a6OuUq+b9zw2MhuK3dXtF8ZESrU7o6aXuApuj5CAlaE39ZchP
         3ZgjjmjqizzIqZ3eHcIma+lwpiQInkCzHt8ssx5TgYukcY7BPzd/cWfuDc8IUfbZ3LOE
         NK1A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772923743; x=1773528543; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkQSh47/17VVtvEQmHwmBRoDAO+GkNhmR/l+FIs0OSY=;
        b=k2lb+Ll32kmxAMviHqw+OZ6jal37ksJDbWBw225WwYA8JGEVJ1yBXGBmkgru8i6J7r
         Jv17tN/SKxuaQjSEQPLRXhT3tEmKLKZrTEN+YIJczPSBpeD0C5GlIyWbW/hazr6IzvwY
         qm3azK0UgHWVEhkO37BVwaJ+H3mCKJcbYaAR7xIuJuvrNTbSYxLIRQmk89tFY9Q8NZwI
         CKWyI/SzeXIExRd6Fo/Ula4sFPxdHDvt7qzjiU/U8ELyBIfHeFCUvFYhIukCGZ+NBP5M
         7NqdRwCo15Hzam7Gv9TR/kdD3AUcgTtOT0OkfipTt34gUtbW/wdXJ1QMTcGOwADV8V/I
         Vj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923743; x=1773528543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gkQSh47/17VVtvEQmHwmBRoDAO+GkNhmR/l+FIs0OSY=;
        b=SZkFUSW812cnM0brMPLKCroLZ2x6Q7gLgyFi+VGriDkh78BJdhvrMBOS2L1r2V2IKc
         e2PSPi4E8yVqXnMexps8itOgHCkWj/vQbQ9Cja9yr7Im3KXTMX9b2LSX7xRI7YWeg9BY
         fKWbqjGbSRYIrJLP4zN7GnlCgeITs7wudUJeKrnneIQv/kxcW0BxLhhWqNSaV+7JJUJm
         2ulG8q92Wi16nQ6klErue8LYAumi1IdSevqrZdnLumDB8vgk15Dr8QDzcCMgU8p2tbxZ
         NaP01RJ+B2d96GbqwzsA+2utElWk+SlUwkLXxVJHTjRBYEdXi5rHhgccaFuoxy8AUJfv
         EUuA==
X-Gm-Message-State: AOJu0YySiD9SWjHkhIlK7YzGdbYZDImO5C3vdeUQLw3ye1tMAdD9Ga43
	DeKwaK+xGEEvH9tLwP9C1A3uBKDSc47ECGgP3txqo3bbbOeKGPeGtM2xo35+pRbhzNji0pPaZuS
	Fb/TQAnxPOtLVV7BmUabC8GJZtDp/cjo=
X-Gm-Gg: ATEYQzw8NFgTsmUeQ461Or162seSPaZnB9NcSsgYuENj9qjEA1rlF5EJuQNbw2dIqnC
	IeUn1trlluvlzkOhhvSG5sBw4Yg4Q0yc8zhyRZoSx1YFgi8NfLcXdopSJtZwIb0Ze3KTAp/e1M1
	6wPDp4ehpHl0sF7kkC6OJI0kDQWngYYdOne15FH5Ka/bm66+BWhgI/FVYEUALhZSbSy5W4w7bsG
	MjkroYrcz8/a7efB0x0/Xmh1/Da5RTfhaTp5HOTfzXYWqWCTbxgGhCoQNPn0+xegcWhu09M7Qj5
	hutIJxuiR1j/Wv0sSBt28w==
X-Received: by 2002:a05:690c:3687:b0:794:f3dc:a977 with SMTP id
 00721157ae682-798dd7a5a40mr62152997b3.46.1772923743178; Sat, 07 Mar 2026
 14:49:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com> <4c6578ec4adc1a0fe7eae661c356253822d82a7b.1772805096.git.stefano.tondo.ext@siemens.com>
In-Reply-To: <4c6578ec4adc1a0fe7eae661c356253822d82a7b.1772805096.git.stefano.tondo.ext@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 7 Mar 2026 15:48:52 -0700
X-Gm-Features: AaiRm51RzoiN-BO7EmmeEW9FxJ6NS0lRZYICwJJujVKmPoZCjD9VSaeXjf4yX18
Message-ID: <CAJdd5GagAtzLaQknwo3htZ_t__neg8xaXUmAPCepbnGFi-bYiw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v7 07/10] oeqa/selftest: Add test for
 download_location defensive handling
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, joshua.watt@garmin.com, 
	ross.burton@arm.com, adrian.freihofer@siemens.com, Peter.Marko@siemens.com, 
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232623

On Fri, Mar 6, 2026 at 7:00=E2=80=AFAM Stefano Tondo via
lists.openembedded.org <stondo=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Add test to verify that SPDX generation handles download_location
> failures gracefully and doesn't crash if fetch_data_to_uri() behavior
> changes.
>
> Test verifies:
> 1. SPDX file generation succeeds for recipes with tarball sources
> 2. External references are properly structured when generated
> 3. ExternalRef.locator is a list of strings (SPDX 3.0 spec requirement)
> 4. Defensive try/except and isinstance() checks prevent crashes
>
> The test uses m4 recipe which has tarball sources, allowing verification
> of the download location handling without requiring complex setup.
>
> Test can be run with:
>   oe-selftest -r spdx.SPDX30Check.test_download_location_defensive_handli=
ng
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/lib/oeqa/selftest/cases/spdx.py | 34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
> index 41ef52fce1..9b6fcd335c 100644
> --- a/meta/lib/oeqa/selftest/cases/spdx.py
> +++ b/meta/lib/oeqa/selftest/cases/spdx.py
> @@ -414,3 +414,37 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase=
):
>                  value, ["enabled", "disabled"],
>                  f"Unexpected PACKAGECONFIG value '{value}' for {key}"
>              )
> +
> +    def test_download_location_defensive_handling(self):
> +        """Test that download_location handling is defensive.
> +
> +        Verifies SPDX generation succeeds and external references are
> +        properly structured when download_location retrieval works.
> +        """
> +        objset =3D self.check_recipe_spdx(
> +            "m4",
> +            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-m4.spdx.j=
son",
> +            # Use a unique namespace prefix to ensure do_create_spdx run=
s
> +            # fresh regardless of sstate from prior tests in the same
> +            # oe-selftest worker (see test_extra_opts for rationale)
> +            extraconf=3D"""\
> +                SPDX_NAMESPACE_PREFIX =3D "http://spdx.org/spdxdocs/test=
-download-loc"
> +                """,
> +        )

test_extra_opts has a good reason it doesn't want to pull from the
"normal" sstate; this test doesn't. I'm not sure why this test would
not be able to pull from existing sstate and pass, since you aren't
changing any configuration.

> +
> +        found_external_refs =3D False
> +        for pkg in objset.foreach_type(oe.spdx30.software_Package):
> +            if hasattr(pkg, 'externalRef') and pkg.externalRef:

I'm pretty sure hasattr is redundant here; software_Package has that attrib=
ute.

> +                found_external_refs =3D True
> +                for ref in pkg.externalRef:
> +                    self.assertIsNotNone(ref.externalRefType)
> +                    self.assertIsNotNone(ref.locator)
> +                    self.assertGreater(len(ref.locator), 0, "Locator sho=
uld have at least one entry")
> +                    for loc in ref.locator:
> +                        self.assertIsInstance(loc, str)
> +                break
> +
> +        self.logger.info(
> +            f"External references {'found' if found_external_refs else '=
not found'} "
> +            f"in SPDX output (defensive handling verified)"
> +        )
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232573): https://lists.openembedded.org/g/openembedde=
d-core/message/232573
> Mute This Topic: https://lists.openembedded.org/mt/118170501/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

