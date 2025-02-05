Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD53C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 11:05:07 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.9551.1738753503153374420
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 03:05:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jAmLDJac;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46fa734a0b8so58275011cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 03:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738753502; x=1739358302; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bS57VTst2hnn0oTYjT3EiHrACQxo5bqlg9GyNM4cTms=;
        b=jAmLDJacRFqp9rjiu+5QCRjOCVWXXJ1ZzKz5Ir7Wfc85sAaOXYCp1UlbYTFozUGJ08
         fGh5MDb3HmCntCS0o171DlzTb6CLMbjNRJ+d5kWXNcG3Ag72lNKDk10Z/I1iQ+leS65n
         vmjYpE/shuJ0C3+QzOIm/qJ4+duLQsJVy4qaWFIQhq0DN9bXWtOwor/E1P5sV6Cip1I5
         XRZZKaxdraDawLmvqZfJ4vtONTCqn3og1xR0CcecXcpZPA9aPfB6+TvYMYthar5FhQn0
         e4FcLOd1OZelZaoocohlHkot66fCaJ1pW99RTctGzQ2ZViGZ37GiIPnGnEf4xbjYUSJk
         G5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738753502; x=1739358302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bS57VTst2hnn0oTYjT3EiHrACQxo5bqlg9GyNM4cTms=;
        b=n+4JGSohdZBLg6FLpHvLgwRGpKfq8Pm25Q/hT9ZMGefMFFy1eaILW2qvkrfvwoFUYi
         cgMFrc6Sn9pnSP9crPBBFISWNKzIcjlOnJjWKByt0dopSdblwEY2TooN0BZAJpGcXs7P
         mRAyfbv8RC8OzZa87j3h0zdaY0PI1FydhyOvuFU6Q5Xd8a+wyVh2rGX8aJJO0PqH7Ird
         6Q7gTid5RVb+FSCWgFp0xuimYr0eWIdmAxpwsHNRu79ye3kdEbjfWXduXVFNrZKXwbuz
         Yj9Oko/5FxEXIVHVQggzUkypn/nXHQwKej32xZA46CnxaRBSfcu2twBd/axiNSqs2z+o
         eimw==
X-Gm-Message-State: AOJu0YzdoQBefY0jSZpFTwTZgAm0B0wAqNHRFS9qy4djgW7iarYAoQ42
	6Eq+R/UHQlVZeH1ULpGFwTcxyiQEHSdBuX3wGp3VOd0D3LuIARE7jlamOAlr7hB5uJhMcdl88ns
	ZYprkzCfmJcLsWy7/awne4gEsc1k=
X-Gm-Gg: ASbGncvafNUtgUBn21ug9cA0u36a61373SgBS7+uzA1T5pUGfjeaIsmhTlpmEnTHD1j
	kR1yrTSdmIRxvP5MP119HF6i6S+pAs+v7mKAZe44u+Td+Xt0IEeoT+HpVEj59GlgO5/tzGDQ86s
	cDuPdQLiSs49HWgoLHFgtQkqu36Xy9U6U=
X-Google-Smtp-Source: AGHT+IF7s+ROjjyp91VIv06DVPmw+BMTr/vLD1nY4PTbDbg/wjiPvmlop5FQsatc+rmFd5nmFvSY6zZ5vTnKZ/crv+c=
X-Received: by 2002:a05:6214:1bc5:b0:6e1:700e:487a with SMTP id
 6a1803df08f44-6e42fc52a8fmr29780516d6.40.1738753502169; Wed, 05 Feb 2025
 03:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20250205043637.2649428-1-zboszor@gmail.com> <20250205043637.2649428-3-zboszor@gmail.com>
In-Reply-To: <20250205043637.2649428-3-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Feb 2025 12:04:51 +0100
X-Gm-Features: AWEUYZk5w-LZ5_j9tyrxSgOqjOZMf8eJHoPSeh2E67TmpiZdP0x5a8jlclgvM34
Message-ID: <CANNYZj-u4w9c44hp2hiFLFEQFpFdGG2JBCRRpHGbHQQOSJZd3g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 3/3] oeqa/selftest/cases/signing.py: Re-enable self-test
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 11:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210842

On Wed, 5 Feb 2025 at 05:36, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszo=
r@gmail.com> wrote:
> Add a crypto policy file (identical to the one shipped by
> rpm-sequoia) and use its path in SEQUOIA_CRYPTO_POLICY envvar
> for runCmd('rpmkeys') commands.

This complicated maintaining the policy file even further. Rather, you
should set the location of the policy in the rpm recipe where the
wrappers are defined:

do_install:append:class-native() {
        for tool in ${WRAPPER_TOOLS}; do
                test -x ${D}$tool && create_wrapper ${D}$tool \
                        RPM_CONFIGDIR=3D${STAGING_LIBDIR_NATIVE}/rpm \
                        RPM_ETCCONFIGDIR=3D${STAGING_DIR_NATIVE} \

MAGIC=3D${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
                        RPM_NO_CHROOT_FOR_SCRIPTS=3D1
        done
}

This should allow dropping patch 2/3 (the tweak to sign_rpm class) as well.

Alex

