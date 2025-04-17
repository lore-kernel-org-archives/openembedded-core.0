Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64D5C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 06:37:35 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.2692.1744871846484584957
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 23:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Mw0Qg0qB;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso2979525e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 23:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744871845; x=1745476645; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czXURcUtMdyS2/HHFxerKavRK57uxsNJZ8pxJuj2kKA=;
        b=Mw0Qg0qBXzApayItbk6rNW+IIEHVb5dzhbITDrnBCwB8zQvLlob5xVhqoIcAvSOyW2
         tcHhfqcNKKGGOsmi5pcc4CIhTBBwKr5j1BvA/s2gsxivLW91IQKSAATBxyx2EBe6FsXg
         YZZkqIVPH3mHV+tN+515qfVCNQfV37VX6E+fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744871845; x=1745476645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czXURcUtMdyS2/HHFxerKavRK57uxsNJZ8pxJuj2kKA=;
        b=lw1roaZ+knuzpyj3zDujCtnAFrrUCtfc75YLZVaqkNBMZtt4ADohCKvQZe159471M5
         v21KVSSA0T7ISbgKeqKRHyKXrrGNM7xEt0SsXXQsyyI6KWOPJCY/B7RGAceSok1ib0pN
         EjYVvwkTrMMVbn2TjdIVFiwPAs/s6cS/fVloyVAUd5FgmwQW56hMHi5xMGaWgfSjsQCc
         Lso2HvbOOGLBxbQggZ365zvwyJV+jgHf8I4CtqevINtjTI6TtyU4NuylhPEXXFGwEuAS
         eFSt8dJ3u+YDIWrlyoTJ71+9Yb75767+2CpH+nfjbMMlNDShaZSfha6BZhGBhLLohtxS
         Apyw==
X-Gm-Message-State: AOJu0YyBkNnZuwjFaDdWjGZVV8uDX8gGdLO3cRiSOe3Z0egeLXc/YVtg
	CkiBx+7Up0ZuLTxXHHTXoLGoPqg/n7aCYdPPcH7m060DVdeCNEBdg4YkfIsfYJcBCYSN4Y7rsbe
	dPBVIQD4d8blTZ5SvSf3K1YmngfklUgN1zuRqJQ==
X-Gm-Gg: ASbGncuIxHPUalAyHVBlptQz5DqxViSiNvmHBSEWlgnyCTtNwga/tL7tom+MCcqckur
	WXmh179PTWjKd8d90/eGF/1yTKB+qUcsnbMJQDkZ0XXKkZZ6JITFViheJl7oPu++M36Vxrt4ytc
	Ltvcmvxbw8Bn2u3QABYqZdX5nahuxCmk1T5oBxpPODf/XXWR25XcSra5+R
X-Google-Smtp-Source: AGHT+IFvwMAfV86z5C8H+JboCTAipyVk312ua7yLBEieYXIvYn/gVz2Mf/CL7s7FS5OWTyNebbBJGIIXy2ymjFYZ3I4=
X-Received: by 2002:a05:600c:1c8e:b0:43d:26e3:f2f6 with SMTP id
 5b1f17b1804b1-4406113f310mr23750985e9.5.1744871844780; Wed, 16 Apr 2025
 23:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <183683467BE332EC.10767@lists.openembedded.org> <CAApg2=RZpHZFTu372tKwzsLH6Y7URR5AjW=v2XnT3=YFBuwDiA@mail.gmail.com>
In-Reply-To: <CAApg2=RZpHZFTu372tKwzsLH6Y7URR5AjW=v2XnT3=YFBuwDiA@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 17 Apr 2025 08:36:57 +0200
X-Gm-Features: ATxdqUEkdO4UQEFlPGPiW5m79vx7iiS-pRraSQDyQ7Br4bDgsylmoXQ6lZm22Y0
Message-ID: <CAMSfU+7=ka38pQo1j5DFSVqDBrMk=aL8241fg2_+LvV_j7YUgw@mail.gmail.com>
Subject: Re: [yocto-security] [OE-core] VulnCon take-aways: NVD et al
To: rybczynska@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 06:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215039

Hello,

Le mer. 16 avr. 2025 =C3=A0 06:51, Marta Rybczynska via
lists.yoctoproject.org <rybczynska=3Dgmail.com@lists.yoctoproject.org> a
=C3=A9crit :
>
> Hello,
> And as a follow up, MITRE's funding (so the CVE program) is uncertain aft=
er April 16th : https://www.securityweek.com/mitre-signals-potential-cve-pr=
ogram-deterioration-as-us-gov-funding-expires/

Following up on this, it looks like MITRE is safe (for now) :
In last-minute reversal, US agency extends support for cyber
vulnerability database | Reuters
https://www.reuters.com/world/us/us-agency-extends-support-last-minute-cybe=
r-vulnerability-database-2025-04-16/

On a related note, in the follow-up discussions[0], I learned about
https://euvd.enisa.europa.eu/ (a european NVD equivalent it seems,
still in beta).
It might be early for the Yocto project but maybe it can become a
serious, long-term alternative?

Regards,

[0]: https://www.openwall.com/lists/oss-security/2025/04/16/6
>
> Interesting times ahead.
>
> Regards
> Marta
>
> On Tue, 15 Apr 2025, 16:10 Marta Rybczynska via lists.openembedded.org, <=
rybczynska=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> Hello,
>> VulnCon is a conference on vulnerability management and related subjects=
 and was held last week.
>>
>> My take-aways:
>> - NVD situation is unlikely to change short-term
>> - CVE programme is adding new features to the specification, but they ar=
e unlikely to make machine-readable identification mandatory (in general: a=
nything that puts more work on CNAs)
>> - there were discussion on standardizing end-of-life descriptions
>> - discussed purl identification and confirmed (in a panel question) that=
 it currently doesn't work for patched software or software with no package=
 manager. Some options are possible like the github schema, but not in all =
cases.
>> - next time it would be better to have more important representation fro=
m vulnerability data users, and present more real-world problems, especiall=
y in the embedded space.
>>
>> Videos from most talks will be available in around one month,
>>
>> Cheers
>> Marta
>>
>> PS My blog post https://ygreky.com/2025/04/vulncon-2025-impressions/
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1384): https://lists.yoctoproject.org/g/yocto-securit=
y/message/1384
> Mute This Topic: https://lists.yoctoproject.org/mt/112290369/4316185
> Group Owner: yocto-security+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto-security/unsub [yoann=
.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Yoann Congal
Smile ECS

