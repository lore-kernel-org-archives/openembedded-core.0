Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDBFFC5937
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:03:20 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68558.1772107396522961384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:03:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X+WYrowm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4807068eacbso6593755e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 04:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772107395; x=1772712195; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbLkdJreMuPM4zgPr4ai0Jd6AkS+um+aHxVwAZj3fRY=;
        b=X+WYrowmc32IDzMzYqxVKXj+HjWc4q//Gba5UEwc6P9U0ii9JUwfMVV3PwA3A5ydbj
         x4kYIM7sGzsNt8hsYVYkND7JrXyI6VfpPLKIvHpn9Kz79hs2CvI0aAOWTVe9y4QxkBWN
         ZTXKal3GCmoTHDTYCh4PfikIvdQE6t+38yN1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772107395; x=1772712195;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VbLkdJreMuPM4zgPr4ai0Jd6AkS+um+aHxVwAZj3fRY=;
        b=u7pRN1aJY2snFRkqcaG4RbwyQf74GgcTAduwHQRAWMGKO/Qk/0JFM8XGqQ6/KTeERp
         /sR/hKgrshML/zhFRUAv5Qcl693+p/gv+kwNy0n1WNm3BEnUk4TQrqjFysVEOy6WGKQX
         EmMtKDo7aebQnTYwQC0+P2EDzXJvJsUNl1D7R6BhfPQ6OS6DkTRa7z0OFBzpMsTcw7XM
         lS7SKMeoKkB0zx+9u/6F+ItRi8ba0r3vEB51/GIKHRJ8w+ma3x8j0L245fiP2B3okvFa
         Pl6RYcxjShp7nLbGD1QlvWQkcs7gqJ9NxC3UcL5XOcAJabGHqbmGydBtq+ptYg8URZmi
         nFMA==
X-Forwarded-Encrypted: i=1; AJvYcCWk5QlDmrLl5QmYKu1nZ/Q/UpeNIigShFfmJMEPT36jF6vXFPmeMyK5A61kKHNRa63bg4ZVWrMEPRaYHHQsfH/JPA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxz6vfwlWRidm7ZaPkqNP2xMcTcaOXw5gRSiQxNwr2YrfOU9gBD
	+8DZSCNaJRFhlPEQbsSM9CMf6dlWFkOgcmENSW/MOW+UT3ixvwyeXdVXgyLEJnVJ1jQ=
X-Gm-Gg: ATEYQzxljwubAaUApPf4V1dcLpCBMZ4YbUEMjlI2C5IuuqzLzuOHmaIBDJNbG9vUUQj
	MMnAA6mdqR8JrOwHnPvOqVxGsuatV9v6S+yBxvL9FZtf3G1FN5wBZex0bJaMFHmcUL0EMQ2n3nz
	c1BJ2jAslui7DSFDp+slcVtYi3DX6Snr8k2YhyhO9SGA3qn8NLEuMtVYsN4669SFTSKyqp01WNM
	nuJOYt8PT5bGxIxThrHdAzsHO8LiKF/uRFWnpK47e6hMunaeqV1KX94ANAskO/8ABy5Jj49u0tV
	8huEfsHuqrlU9smCsvtugjOZk+XrMHH3eOdV9KHjrsbN6urWos4f5iiodg+PFU4y2wwE6hgne4I
	t9ZxVGdL1aBOXkkhkQVc2bRsvIL9yrxvMnfr8aMa741SX795djkEbi0lKX2rATKNfSQ4hyqBNn6
	HBhgMC/X5ap8FYs5EmdQm2QRcLlZwDWCLkMmA2tG03McukkICK4EwHOOImjYQZakWVKtHPl8TUU
	1K2y32cRH7/F2BKCgxMMukQwA==
X-Received: by 2002:a05:600c:350c:b0:483:6d4e:9811 with SMTP id 5b1f17b1804b1-483c3df5d30mr34113935e9.31.1772107394599;
        Thu, 26 Feb 2026 04:03:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:caa1:9aad:9b9e:38c6? ([2001:8b0:aba:5f3c:caa1:9aad:9b9e:38c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd702e7bsm157766145e9.5.2026.02.26.04.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:03:13 -0800 (PST)
Message-ID: <089b277ea34cd0d9246e9eef717ae5d9d9ad9527.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] Improving DISTRO_FEATURES backfill
 & opt-out
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: paul@pbarker.dev, "openembedded-architecture@lists.openembedded.org"
	 <openembedded-architecture@lists.openembedded.org>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Feb 2026 12:03:13 +0000
In-Reply-To: <ba0a57bc87f3563f43f46f663e1733fd552a7a03.camel@pbarker.dev>
References: <ba0a57bc87f3563f43f46f663e1733fd552a7a03.camel@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232004

On Thu, 2026-02-26 at 09:59 +0000, Paul Barker via lists.openembedded.org w=
rote:
> 3) Merge the current contents of `DISTRO_FEATURES_BACKFILL` into
> =C2=A0=C2=A0 `DISTRO_FEATURES_DEFAULT`. This variable will be filtered to=
 disable
> =C2=A0=C2=A0 any items listed in `DISTRO_FEATURES_OPTOUT` before use, eff=
iciently
> =C2=A0=C2=A0 and without the use of `:remove`. Deprecate
> =C2=A0=C2=A0 `DISTRO_FEATURES_BACKFILL` and `DISTRO_FEATURES_BACKFILL_CON=
SIDERED`,
> =C2=A0=C2=A0 issuing warnings if either is used.
>=20
> What does that look like practically? Something like this I think:
>=20
> =C2=A0=C2=A0=C2=A0 DISTRO_FEATURES_BASELINE =3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acl alsa bluetooth debuginfod =
ext2 ipv4 ipv6 pcmcia usbgadget \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usbhost wifi xattr nfs zerocon=
f pci 3g nfc x11 vfat seccomp \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pulseaudio gobject-introspecti=
on-data ldconfig \
> =C2=A0=C2=A0=C2=A0 "
>=20
> =C2=A0=C2=A0=C2=A0 DISTRO_FEATURES_DEFAULT =3D "${@filter_default_feature=
s('DISTRO_FEATURES', d)}"
> =C2=A0=C2=A0=C2=A0 DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}"
>=20
> =C2=A0=C2=A0=C2=A0 DISTRO_FEATURES_OPTOUT ?=3D "${DISTRO_FEATURES_BACKFIL=
L_CONSIDERED}"
>=20
> =C2=A0=C2=A0=C2=A0 def filter_default_features(varname, d):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 baseline_features =3D (d.getVa=
r(varname + "_BASELINE") or "").split()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 optout_features =3D (d.getVar(=
varname + "_OPTOUT") or "").split()
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return [feature for feature in=
 baseline_features \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if feature not in optout_features]
>=20
> (un-tested, may also need some tweaks for performance)
>=20
> Applying the filtering as part of the definition of
> `DISTRO_FEATURES_DEFAULT` makes it easy to use. If you're already using
> `DISTRO_FEATURES_DEFAULT:remove` or `DISTRO_FEATURES:remove`, these will
> still work, though we'd encourage you to adopt the new
> `DISTRO_FEATURES_OPTOUT` variable. If you're using
> `DISTRO_FEATURES_BACKFILL_CONSIDERED`, this would still work but our
> encouragement would be louder - we can issue a warning if this is set
> saying that it is deprecated and will be removed in a future release.
>=20
> There is one group adversely impacted by this change - anyone who
> defines `DISTRO_FEATURES` fully themselves without including
> `DISTRO_FEATURES_DEFAULT` will need to manually add the backfilled
> features (pulseaudio, gobject-introspection-data & ldconfig) or adapt
> how they set `DISTRO_FEATURES`. Personally I think that having to adapt
> to this will not be difficult and it can be well documented as part of
> the release notes and migration guide.
>=20
> A patch to implement the change should be straightforward, it may need a
> little effort to address any fall out before release. There are no tests
> for the `DISTRO_FEATURES_BACKFILL` logic right now, tests for the
> filtering and opt-out variable can be added along with this change.
> Impact on the autobuilder should be minimal, I think this is something
> we can take in with little risk to the core project so it is unlike the
> proposal to change the default init system for poky. The impact is
> mostly on users who define their own distro, and we can make migration
> as easy as possible as outlined above. I should be able to get this in
> before the M3 build if we want to go ahead with this change before the
> LTS.
>=20
> We can extend this to `MACHINE_FEATURES_DEFAULT` as well, deprecating
> `MACHINE_FEATURES_BACKFILL` and `MACHINE_FEATURES_BACKFILL_CONSIDERED`.
>=20
> Thoughts and opinions?

Keeping DISTRO_FEATURES_DEFAULT around but changing it's meaning does
make me worry about the transition a lot. I also worry a bit about
"default" meaning different things to different people.

After we previously discussed it, I'd had a slightly different take on
what we might do. I was thinking that we might:

Rename:
  DISTRO_FEATURES_BACKFILL -> DISTRO_FEATURES_OPTOUT
  DISTRO_FEATURES_BACKFILL_CONSIDERED -> DISTRO_FEATURES_OPTOUT_CONSIDERED

and then move the contents of DISTRO_FEATURES_DEFAULT into
DISTRO_FEATURES_OPTOUT.

This would make features in "optout" the default, unless you set them
as 'considered'.

You could perhaps have a DISTRO_FEATURES_OPTEDOUT?

Is is probably a question of finding the right naming for them. We need
a core way to say "these are the defaults" and then a "remove these
from the defaults as we explicitly don't want them".

So having said all that, perhaps we can cheat and use:

DISTRO_FEATURES_DEFAULTS and DISTRO_FEATURES_OPTOUT

which would remove the namespace clash issue?

Cheers,

Richard









