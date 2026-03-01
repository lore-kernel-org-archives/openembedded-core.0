Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4B6FD006C
	for <webhook@archiver.kernel.org>; Sun,  1 Mar 2026 14:21:07 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.138665.1772374858341832258
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 06:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FQTOwf33;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4375d4fb4d4so2497266f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 06:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772374857; x=1772979657; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/nlM2TfDD718KoiaPEesfW8f9geWkkhlz6cxFaqZ+PM=;
        b=FQTOwf33n7sLnZJmO6xEWj/PKFySSseZnueeP3v9kL/Pu+dXR18IZ67Hou0/2TA5ug
         nmbcldU8myoFfE8xu35IZdFGlrxLulroYvcdTewcMrI9UcnpNT3vBc6hBuM2SDuWiQDL
         X6eYLm4epitpd+C9qGHk73OECWUho0eaj2zYmzQk54c0CGu2MLzjcWYgTKzEGcxa/3nq
         puQuslQoeII8n8j/xeTZPvS+dk+CrfAlhStVL+9RaXmd1Cglo+jsdIGs+V79m2oUiPBb
         kOpU+N9wpLseoTUys+zXmW2+a1HXHHCx/ppE4ldntSvelkA3SQRl36nolD4vio0P+P2L
         pmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772374857; x=1772979657;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/nlM2TfDD718KoiaPEesfW8f9geWkkhlz6cxFaqZ+PM=;
        b=br9k2alKOmh8+hc8WusU6JIn+merpyWgbQDNMqNL3DV3qrbUNPGmTZPOFG2DES96VY
         tgT3pBh4ID3q0twTOgCpLzhaxlLRk6udeGkZJ3wt631/X2YKIYvFT5pBdwPWG+DLYBYi
         +xhbeIwALS+eWN5Nmkos97Heiguwc0h4HuJopfcPG+CoGsh4hG5Guip8MWCLW7EeFa2f
         ttdLQBzqF1qoXuE4rbmB07eaElphnybLh+RSsXuCjQcpBk4g3RMd+/GcUgk5Z/Teuo4k
         xN6nj2tIINMyrjHhkIrb85zJzwsUgp41XUL0lNcdJytlr3yxO2AW1jX9gd79MCZbnbqJ
         Pyhw==
X-Forwarded-Encrypted: i=1; AJvYcCU3GtA6+oMX2YyzX2LjYg9gSLnLXEFKEJrPIvf+dz2jsWL73KEOWhDPIQdG3ACNBlR4o/GpNTxBbvniqGVlUIqNvw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxtXwVWXuVLPgJHVO/R5b6red9tSjj7kjVABg/OsqHyYxVWEFRb
	tn60x2fPdvtSHhL52qZd7vwxrmVPvldMj+30Kpv93X7MJ0TlnfpKFucZ
X-Gm-Gg: ATEYQzy+GqtMc/VluDjFx7R+4DiysTjSNpyx8h91YsqAc5UqIgXR0pUOQ1eAhYgFZtM
	xpFEN3ZsEP+UTROfEEALQTfBIJJZa6GkzIVWeq4E6GCB8R9oGgdQencTTi2z1OklKAHgMDnGjS6
	Z6yhlhve2yLQxwGGhSqAlTt8PNJvwX07vwT2svVKckii70CCCKD23+ZRf9M9ib6v0BaoY03so3f
	IdxuHkRNIe2FSFz0XrUA3dZhaSzbu3+EbBdbrTksvqVW+J/naaJ+BvXrXZyfJ4PC09rL0suNgzm
	2AnDpbdH4q+kVTszfbpOTcbr3/BWt/seSsOM1F0uKfJlU69tTQ9vlD8k2kSWWMo2wmgS9JV4Qmt
	cfYIm5z0wayrPiWKE6610PQ0K0nr4FnGTlocNn+EkBC54YOj0tRo9J8qXhKqsC/+Vcu2b16hlkO
	rrj+s2RufLVx+zcBCOt7qM0HW6RIDCx21+i4CcZyLmPcVfLswkgZrpK7IZS9MVKnLrkDhCJ/bK
X-Received: by 2002:a05:6000:400d:b0:42f:b9c6:c894 with SMTP id ffacd0b85a97d-4399de37813mr15005273f8f.52.1772374856543;
        Sun, 01 Mar 2026 06:20:56 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439af926c53sm7703595f8f.8.2026.03.01.06.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 06:20:56 -0800 (PST)
Message-ID: <b2014f3b751aebe76d976352a9aab371564c5a9a.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] oe-selftest: fitimage: allow relaxed node
 checks
From: adrian.freihofer@gmail.com
To: francesco@valla.it, openembedded-core@lists.openembedded.org, Adrian
 Freihofer <adrian.freihofer@siemens.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, Michael Opdenacker
	 <michael.opdenacker@rootcommit.com>
Date: Sun, 01 Mar 2026 15:20:55 +0100
In-Reply-To: <20260228-fit_loadables-v1-1-3027ec37930d@valla.it>
References: <20260228-fit_loadables-v1-0-3027ec37930d@valla.it>
	 <20260228-fit_loadables-v1-1-3027ec37930d@valla.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 14:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232142

Hi Francesco

Thank you for the nice patches. Also thank you for separating this
change into a separate patch to make it more obvious that this is
potentially a bit controversial.

This looks like a risky change to me. Having a variable set to None by
accident is a common error which the test should catch. Just allowing
that is probably not the right approach.

Is it really not possible to make the tests providing the correct
reference values in the dict which compared against the output?

Regards,
Adrian

On Sat, 2026-02-28 at 00:37 +0100, Francesco Valla via
lists.openembedded.org wrote:
> Add the ability to test for the existence of a property in a FIT
> image
> node without enforcing a specific value. This allows to ensure that
> properties for which a value cannot be determined (e.g.: because they
> are arch- or machine-dependent) are anyhow present.
>=20
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> =C2=A0meta/lib/oeqa/selftest/cases/fitimage.py | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py
> b/meta/lib/oeqa/selftest/cases/fitimage.py
> index
> 0f2d9d17dbe6a452261566a1421cc41d10809399..2aff5c84c8fa10c43ccf008859f
> db7c4958bfbe7 100644
> --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> @@ -209,6 +209,7 @@ class FitImageTestCase(OESelftestTestCase):
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This function recursivel=
y checks if the required dictionary
> (`req_dict`) is a subset of the found dictionary (`found_dict`).
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 It supports nested dicti=
onaries, strings, lists, and sets as
> values.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If the value of one element i=
n the required dictionary is
> None, only the presence of the key is checked.
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Args:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
found_dict (dict): The dictionary to search within.
> @@ -224,7 +225,7 @@ class FitImageTestCase(OESelftestTestCase):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 self.assertLessEqual(set(value),
> set(found_dict[key]))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
elif isinstance(value, set):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 self.assertLessEqual(value, found_dict[key])
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif =
value is not None:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 self.assertEqual(value, found_dict[key])
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 def _check_its_file(self, bb_vars, its_file_path=
):
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232120):
> https://lists.openembedded.org/g/openembedded-core/message/232120
> Mute This Topic: https://lists.openembedded.org/mt/118051540/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

