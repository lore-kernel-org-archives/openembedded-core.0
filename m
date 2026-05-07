Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291E8CD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 12:03:00 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10106.1778155373651856913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 05:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T++v84W9;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-62dfe7edd84so219804137.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 05:02:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778155373; cv=none;
        d=google.com; s=arc-20240605;
        b=HldKq1T2xo1GmtvpXpLKvPABiMUp+Y1yKNpyZ6j6Jf+Y047jdp9hwYLiMTQOhPPcFB
         JOdtZxN/sn2CUM+YncEHIHi0aSqXo7TQp0voTaDKLsNEfvnVIGWhqeO09M7lu2C0Qs+u
         jZcJjI4aDjF5p46CtrhEZDxODAExG7EPFdT4TgVJLfqahCk7Sh/mJGfYSYQKtKvCTKcT
         oeaxLBp1PwpgVcid60UQUJ05FLAgjGye1utV+EohZPsFEBSL4eWUeTtnHIvDMm7PAtcw
         X6vfLI7voGV6I1JF0RH8Cy6SXHtjBFsfMCr3pxGo0yjg49LnRSi1Y7d7JBFzB1Pfd0rM
         Uvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4WCnFz0fzbUZkvzOkZL+DPm1ftNYLFbrlELE/9f+p1U=;
        fh=B9fonOSg3jRTWE/i1EDs6PKwXHuoJfB1he1fHK8JdwQ=;
        b=YUJV7MPRlCPn4s4dN83a+ivoSt04j2tVro/jm82EsDYKLBMggkPCF1xF2HtGZ4bt0/
         Z9TBIC/o9yNcMycKSfVA3wwaHYKd4Ll9kHoLr/JO/lEO8H0rDMBILjcNlijslwLedYZl
         YvHhcQ7RfSarUwbgqD2gkDmHFzTYsQ8uRKMd8yD4up49ofktwyDXSY6W8mpw1yNZiakZ
         re+PCbiWgXskQdGkedF1CXt5gIVUy6dF2UEpw0f/pGyoIQF+FyQxgtKt3Q2OodjsqSoU
         wTsGLLcYvjsQnn7vvgewzdm569X9qAbsvn/kUYYUzBH2Plqa+5aN35txcwe0fKbtlJGB
         uwaA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778155373; x=1778760173; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WCnFz0fzbUZkvzOkZL+DPm1ftNYLFbrlELE/9f+p1U=;
        b=T++v84W9PQQnmQ93B2ul1HsHIydvuz1ZBM1xqGiYEc7C/J6qLvULI9gKSepRDwgG79
         l+Al0stlR1f8+UF9CtkKjMOdJL0NS09b22n2G1rCeHOnubcGtvIspj5DmXR/aZKG3kyL
         6GCHx2NXxPzkrznNxFKCevi31rUa0VOfTkZoQzZ+eSvBZCuuvuM45XosYkVf37z9pOQi
         eMrbr6LW+f53YcmRdUCNaYtpkkyAZy4SszbK+fkeDibeEhKrnzaPG/SjML8XSA9JKd6C
         RZPoOW6pj4OB2/HncxGHPJZDSmaipEeAtScXSg2DeklkexlNx7hKPLsW25oDRRB6W2kR
         IUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778155373; x=1778760173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4WCnFz0fzbUZkvzOkZL+DPm1ftNYLFbrlELE/9f+p1U=;
        b=DnwwVkWoBs5IasHocWwvhQ2eLnKdnSmKFzTZzypvQVlKMiL3DDyUMUhaYNZDcPrhNk
         3srx0NGem4j6ZNXt7FistTm6Qo9t1Vk5e8N69Nsghgu/Pr8sZQ4KTHZRUNqZ4pJ7iBrk
         lMwlG2n12EJ/wgbJ5+S0A1F+4+sf7JTxJwZ95Z5iYEUyxviaay9p2xVMkOtQEqrABl6d
         qk1npWpfUoA7k7sINvvKKNbuCT9g2jjoVsGwy3uHHsEVus4FSE/Pbk4uRj66juyqO4lE
         aJbMUCRy3uYSrSe2+Mco3UQB2w8oExjRfoXPgPbE+ysdDS/jYCw9Y6VK8Uk0cXIUTg1f
         onVA==
X-Gm-Message-State: AOJu0YxkL7D4R/1ZHGwhFYKMn7p9z8dpfjz6PPi4KerSfOhKsKRbD3S1
	7vxdyO3h5VyHEvRUsUEpOuVOr3rqEHkq4bK1qlLNF8VPfzY1yEspFtm5DY4iEiJdC80bBQZOWxY
	p1Pj5hP2TgMhCHfDos6/3Ob/4vLTiBkg=
X-Gm-Gg: AeBDietWgIZJ5rJtI1s3HxQ6RVOLBs9EZFtfGaSs9xtRRg1fC5TPy5j5KvAkTHKC+ax
	Ihmqp5pT2xj/j6+hMwBE1zLc22M8hx3eRAyoEvmwF1dVdMaiS1apUfkPcfvlIIj1/uirNSfiYOw
	BITCWUWf0KrZ8hauxsQlcCpNNCDxgY9O+SVQEG4ub2rUzEmiRBCRLDF/7hxn51dsz+csv5HFq6i
	USb9wVbX5jnW8Ef/NX8wsBCqOcbTlTTHjgfh405Zh0fKGfbpTzcg5oJ+pRpU5jUQ/Rt2H6Fia5N
	vc7DjRVipFOAEi64gO8XnEYEz/EOa/MnKa87QQQm1GPYVUM0tS5q
X-Received: by 2002:a05:6102:4425:b0:608:6c7b:4554 with SMTP id
 ada2fe7eead31-630f8fcfb93mr3489997137.16.1778155372321; Thu, 07 May 2026
 05:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260507102353.43585-1-frezidok1@gmail.com> <CANNYZj_49KqbtAbzWvZ=2Y=qQGroFftdjp1wbAzD0bq14aOOnA@mail.gmail.com>
 <CAP4GjN67agViKaMrxbrzxtbmGCSM5hXAvNzNC9tqUEa0HsQtBw@mail.gmail.com>
In-Reply-To: <CAP4GjN67agViKaMrxbrzxtbmGCSM5hXAvNzNC9tqUEa0HsQtBw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 May 2026 14:02:41 +0200
X-Gm-Features: AVHnY4JhuVdMSbK_KKwaU23aeAPnaiojnUZNYQhE3YjMmof9jnTAWnBhGezxETc
Message-ID: <CANNYZj8vv5262O-F2=e4kRYr-0ZPS3u8T2R8FjowEa_66Tno-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] shadow-native: Change upstream status of disable_syslog.patch
To: Dmitry Sakhonchik <frezidok1@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 12:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236585

On Thu, 7 May 2026 at 13:47, Dmitry Sakhonchik <frezidok1@gmail.com> wrote:
> No, I can't do that because the current shadow's master and v4.19.4 (last=
 release) are quite different. I cannot simply cherry-pick my commit and ap=
ply it as a patch, the only way to backport is to manually completely recre=
ate these changes for v4.19.4. I have already discussed this topic with Ran=
dy (randy.macleod@windriver.com), and he advised me that waiting for a stab=
le release (they are promising late June 2026) is better than doing this co=
mplex backport.

This is fine too. Then you just need to update the upstream status of
the existing patch as suggested.

Alex

