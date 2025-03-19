Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C1BC35FFC
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 16:07:32 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.11963.1742400447457049237
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 09:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y754/IVn;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3feaedb39e9so221051b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 09:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742400447; x=1743005247; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwdLHQgdn1kpYDCBETdkUbOJdc4/nrYuF+SpIgG0nqU=;
        b=Y754/IVnF+Z4zcO2OE4xVXdqcF+toBoH3UExbLi9JytDU43gJKKm6KqERpMxsinRBt
         Qn5HGl3z1l/+mSJoWJoIjIb1EVpGfakvbAxyNiAK0d6tZ3CMN2FId3CiLPtWZIw18Sy8
         2SyNTO55FqBWmid6rfF+y8NHdcQxlHhA8LZuG6Wdro1rm6f25ehtIPojHXULR1DbedmW
         /ozEj6+1RU25NTQSbumxQZ2SHXXH22K7xxwVdksxOcNWSTwcLUuRRhjOAEMyeuM/FPBi
         1rgZS96QQtsPhJ/0e3w1O3QnbPkWAAnGJ6JLdGTNxDKLa6lKVBRkw0S6rqinam884vOB
         p4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742400447; x=1743005247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OwdLHQgdn1kpYDCBETdkUbOJdc4/nrYuF+SpIgG0nqU=;
        b=jGrx1KPxle4kSNaCG6ASjW8a4OQdQHUsaZd4mTDJQo1o1vgaqbImk5shz2W4mm99Md
         P8neyL93L1bAInWvi0Zaoxs6fNN0ZCkt+9XL1WaugocVT8mTFVQek9XHqFmsjKJKw0XR
         xazJXkWUwSnldzOJ1Yu5H1Am6CfzHyyu0jPUywiLV/AVE+U8kwz9n6rWz+mQEyi7QftP
         r8SaFF87IzvWqYCBgvxN8Z6RvzgzkDXx3UNvWPI4FkK+Kcc7PFM5Txf32c7NBMenYWP8
         xPBdVXwxISjFihQHoNDgTDyy5WRt18bUY4S8BDObUNQ80N7dIDUtc4bA9Sb73sek+y5R
         Jk/w==
X-Gm-Message-State: AOJu0YwOEADIdud97D9waNIPZxVHworVI3MmryASLo4E6ArgGFPIJkF9
	1zITgOitxmaXw+V5p6Z645XoiL3Kx0mGX3L+2mahYPT+0KJUMSPALb5WKbV/3QGOcTTUOlYaFbw
	k0HdpnbmHzao2FDNSmSpS/WKBmbE=
X-Gm-Gg: ASbGncu+1La2kqdczbUaNH/RrF61kirXugpRvxBK9855KgEAcCQL1OSy0qcBnI3D9av
	rHPY9TF2aGcENij9Ky/8GDgbnAgWIZx93N44RNBT9lrZJZdfyalfGVWGIqxUoxW32yuERSsTdBK
	NbScW854uE8UGUrksppU3a+toh+g==
X-Google-Smtp-Source: AGHT+IHWsuiEzuW4c+LNEwtXyhjJ0vSr+7BlNJ8c2aSk+jcpfI0/RcyiQ9PAVrHMucjln/CN00OP890e3XcOkthVjbk=
X-Received: by 2002:a05:6808:13c7:b0:3fc:1f7b:c3c7 with SMTP id
 5614622812f47-3fead581975mr2307319b6e.15.1742400446484; Wed, 19 Mar 2025
 09:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250319081610.3536475-1-raj.khem@gmail.com> <9f97a4f6c9b8a5bc55f862f69012bb9e8d11a1b9.camel@linuxfoundation.org>
In-Reply-To: <9f97a4f6c9b8a5bc55f862f69012bb9e8d11a1b9.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Mar 2025 09:07:00 -0700
X-Gm-Features: AQ5f1JqTqD8gkyOrUlVZ06iKaPgSifrnuAkwPDtubxFTa5qpgoOmd5sJskf8A2Q
Message-ID: <CAMKF1sq-BajTxiE+BwkyyZbo07JiN3OxrcrprMvZubjVcGguKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/27] webkitgtk: 2.46.6 -> 2.48.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 16:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213341

On Wed, Mar 19, 2025 at 2:40=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Khem,
>
> I appreciate this patch series is a work in progress and evolving but
> it is creating a headache for those trying to help merge patches.
>
> The problem is that we have bits of this series already going through
> testing/review. We now have a v3 and no idea which bits of it have
> changed. The logical thing for us to do is throw away what we've done
> and start again. If you could give an idea of what has changed that
> would help.
>

Yeah, I was trying to hurry a bit and pulling many strings together,
sending patches upstream, addressing that feedback where needed and
also ensuring
test combinations are working, probably a cover letter would have been bett=
er

v2 - Address feedback from Mathieu and Alex except ncurses and man-db
patch, fix webkit to work with clang-20
v3 - man-db fix is enhanced to address root cause which is musl
specific and had to do more sadly, address ncurses issue

The good thing is the changes are done now. I do see some parts of
these changes are already merged so I will send the remaining in v4
after rebase.

> Cheers,
>
> Richard
>
>

