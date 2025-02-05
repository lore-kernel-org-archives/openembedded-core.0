Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3C1C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 15:34:48 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.14907.1738769677157972425
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 07:34:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R0IMsfC4;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b8618be68bso656694485a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 07:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738769676; x=1739374476; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVJaVCakFZ5Q6hueXkOUD0Xp8hB4IsFxKeY2wXtiFbw=;
        b=R0IMsfC4DKFGW8UT1Fy039J+axMsdXgSgctNApT6EWWaBh2ESBr/ExrtFeBwhw0ZhZ
         /mWEPrDf+6vZYFJKxEwk6TZik/4INJbY9yWgkZmJ1B9ODieQb85t236T+N6MbVxfO5GS
         UHOD9P+86AzYxIH4wGYqjqUe1whgmqDKRvcGuPeYqEltosyz/aXvtwtSn16V81wdisOt
         j0tEAjpqUGHltKAzXuB1e1OIXRFw5sS/lp4kj2DSVBWw/s+bd9b/q2E5rqcChJ4jr8C6
         dI7HnW3JSu/rsgj4RvMYo6sGTokPSWbjDe1CVnHeOMHdTi4TShDFrqfGiBJ7AFj3bmtN
         0zEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738769676; x=1739374476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVJaVCakFZ5Q6hueXkOUD0Xp8hB4IsFxKeY2wXtiFbw=;
        b=Zx9DYiqvuMLuXXw1T07XmX4GAcHBUtGmx5kSVA4WqF1b6QFrZhMJMS9o6zMq7Mpesi
         mnAjUxtIa3MkSxQGubqQaBWh7AJ8STz1iiOZOt2X9HWgV/gCgiZckL6ulgP4TL8Uv4Mm
         a1Vn7sBSsuuJCekGrnF/ZAoEHXgZns2Iq3BU7Cjunq9ftIrJ39WE4u0OlSTAneAdtK4G
         8Z4GFTKYpbQfu38IFqPe3jGl5YM5WNtUC9WSfhDMk+KQNeqETEzVR+d1zNkUcem0TJcw
         kcWyo9P+WPmkcYdIm5I72GQo1QQl4DWTplcnmLT0RTvc5PVa55PJQ8PwFvAK+SyR0P37
         Jgkw==
X-Gm-Message-State: AOJu0YxfbSFS7rxllaWCZs6FYk0hKXthmBc+hWixUykPh88HHuT2+e+i
	PmLH9a/Ts9fcfMobY6ymWKnRR05KGCbGMBrxB2Eamt5HczuXQYnztX/VmKdMK7/ygfBVVA1pErd
	MjY7LtFOzFlVEFaNEPgn2dD+PASU=
X-Gm-Gg: ASbGnctm4EBKr/waTwRUK7IYMpUzKepe4tG5bRhOQCJNZRIDPraY3C2iq6fHSYOJ1zJ
	IDgK+sonvg1gXyodAOA90EIaCxpPEHktSdkWZNPNncmLH3hEMAGRucR/FQHyiBl411tQtQbFqPL
	YZGLdqFWOtYFk4UrWnEMa4o7BPoWWrA74=
X-Google-Smtp-Source: AGHT+IEaN5I5W6rbUFqZacD0NWaqPNVkhrQWLWJuhT3cVdl2L2drTosU1q+Zwq7X7ONbGSPxbZdLvepDPGWGk5UaLEk=
X-Received: by 2002:a05:620a:24ce:b0:7b6:d6cb:8b99 with SMTP id
 af79cd13be357-7c039e9fa70mr375638385a.0.1738769676201; Wed, 05 Feb 2025
 07:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20250205043637.2649428-1-zboszor@gmail.com> <CANNYZj-t=1kCNq4UNLEnqG65n7dFBZBbNVPQYsrAXGoeb=4VMg@mail.gmail.com>
 <2cf08e42-f322-4d29-9867-85d1723480c4@gmail.com>
In-Reply-To: <2cf08e42-f322-4d29-9867-85d1723480c4@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Feb 2025 16:34:25 +0100
X-Gm-Features: AWEUYZm0ALXIKOtQitEQSP1p8Nqs4WACFzZgLP0Ku7uqb2-T2mvY0xO3reBFcJw
Message-ID: <CANNYZj_XJzXiBD22C8iTaE2XX4bNVbZ-ScyKSUvW_Qw0r1iSGA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 1/3] rpm-sequoia: New recipe for version 1.7.0
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 15:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210861

On Wed, 5 Feb 2025 at 16:21, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszo=
r@gmail.com> wrote:
> Okay, how about using a git:// SRC_URI entry for fedora-crypto-policies?
> That should be self explanatory and no "magic file".
>
> However, I had to do this abomination of a workaround to
> exclude the directory from being manhandled by "cargo build":

I'd be ok with a separate recipe for it.

Alex

