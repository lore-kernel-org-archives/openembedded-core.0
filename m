Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07920C54EE9
	for <webhook@archiver.kernel.org>; Sat,  3 Sep 2022 12:12:19 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.2452.1662207134458864104
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 05:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O2sIXbEM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id az27so5368205wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 05:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=J/UNtfMAK5/9OfFIr1OxfQTAjCs1i8u/IfL5yW5/qV0=;
        b=O2sIXbEMk1skawyVpPz1rE0EEsVgcPaWsRxemt9RN9o7NNLHjEkYcwO7j0T5iSGpI8
         oUd5A2kwHvt1lnLHuoPNt/shyrSxloqnHnUwfViaAeOiEiuIu2A5Xi3L/jZmJGZGipna
         70pfyLRFJtOvhusZ+meSL+nZEFEa+SlfunNtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=J/UNtfMAK5/9OfFIr1OxfQTAjCs1i8u/IfL5yW5/qV0=;
        b=49cpuZKD3ay9txf0r/uIZtxOpWVvhw45fiSv81/3SQc72YCOSxe3e7YcucyBVvFG3E
         pxI0DmPbRXwOFh72bwsqzJru1NAsF+IhB0cPoRrwmTHyAf4R+udM9heDsqApLBguxHbR
         3DGRJH5DIASnqn+M2iebfL0ZUtdjiagONnDDzKmP3a75p+ZPHUbmhiCw3IU9QDAWbtsT
         nHxxh5n4YM7T8iOlmheqI3elri/FjA6m4ZAaG9izb9iZ+xGeUfquo7eJtbGdVJh31TNV
         /K87lDqQYr/4DmeRfwFSOgCGXMRZupf2lT/5FasBr/VUuZKTvravai6eq4i5QJS664uu
         oarg==
X-Gm-Message-State: ACgBeo2v+G5oJXMoYafsbkK+Rh5bfCX7/4UtP7Zxow/3PLUZTZtvDD+K
	StHr8lKGYd06m4lU35WqK0ZT3Q==
X-Google-Smtp-Source: 
 AA6agR42rdTYxmMyIAn8IPUj2d5j3UaUXXLw/lgySuh8VqIztZIOls920eheVuvgLXuQyLuq2Di55w==
X-Received: by 2002:a5d:5a82:0:b0:224:f744:1799 with SMTP id
 bp2-20020a5d5a82000000b00224f7441799mr19730072wrb.582.1662207132830;
        Sat, 03 Sep 2022 05:12:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b434:62b3:32b4:c2b0?
 ([2001:8b0:aba:5f3c:b434:62b3:32b4:c2b0])
        by smtp.gmail.com with ESMTPSA id
 v64-20020a1cac43000000b003a844885f88sm5129774wme.22.2022.09.03.05.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Sep 2022 05:12:11 -0700 (PDT)
Message-ID: 
 <7e97fd1400dce9ce5bce3ba7273d0b35a326a171.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libxml2: wrap xmllint to use the correct XML
 catalogues
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, Ross Burton
	 <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com, Steve Sakoman
	 <steve@sakoman.com>, cordlandwehr@kde.org
Date: Sat, 03 Sep 2022 13:12:09 +0100
In-Reply-To: 
 <CALbNGRSb4WGO5Dwb-kz6Xeoc5My5a6n0q=n2hm+sid2ZuwrZmA@mail.gmail.com>
References: <20220823153730.172962-1-ross.burton@arm.com>
	 <CALbNGRSb4WGO5Dwb-kz6Xeoc5My5a6n0q=n2hm+sid2ZuwrZmA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Sep 2022 12:12:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170269

On Sat, 2022-09-03 at 12:11 +0200, Andreas M=C3=BCller wrote:
> Hi,
>=20
> this is a major change on behaviour and causing trouble at least for
> KDE's kdoctools. Am no expert but I guess kdoctools uses custom
> catalogs. Worked around trouble in meta-qt5-extra (assume meta-kf5
> will face same) by preferring bare xmllint [1].
> Just a heads up - it is about to land in kirkstone - have no idea what
> this patch fixes.
>=20
> [1] https://github.com/schnitzeltony/meta-qt5-extra/blob/master/recipes-k=
de/kf5/tier2/kdoctools/files/0002-Prefer-bare-xmllint.patch
>=20

Thanks for the warning, I dropped it from the kirkstone pull request.

Does anyone know if that env var takes multiple paths?

If not, we probably need to adjust the wrapper to only set the envvar
if one isn't already set.

Cheers,

Richard

