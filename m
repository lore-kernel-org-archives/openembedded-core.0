Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.2434.1607025163496213281
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 11:52:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nxj6nghc;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id z3so2270052qtw.9
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 11:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+gP5UyFolQsf365oR+qb2v5FENYXCtk3jwvYxkrQFlk=;
        b=Nxj6nghclKlL7VNqxKGD5w43CH98EYu9z4TwNlOSE0SnDO69l/gKFdya4hFGy6R2D4
         J/IegYzqRDA3DaBYSuVNNPQedRHr0XN4kD68VF2RYnkUmNZ8yJDjINELOpTVV9HZDiYM
         9dW/B6lCHXODq2yB/oRXtIv+DS1eykmkfiHCbrGWXBbC3QCABUpWZcTXmxMtQq0wO+0B
         R3mPbA7nZySuOMtP4XfP+T/FvGq1eJNFp/V15UWzaaLyQW3BgLt04vKtzWvGQr0aPeg5
         q+lGnBcW9YtdeEdAxJXvI6WyhU8lxXCcXthWHPkV7CgMuuRE5YHQ6ZNyX0kSaIbaphkP
         8x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+gP5UyFolQsf365oR+qb2v5FENYXCtk3jwvYxkrQFlk=;
        b=U3W/GpAC1xIvM+lgWSvPv+9dCaD06YraSmvMiImWatAGo88gYPfw+rwbv9mrnKg7d5
         XNZkzRHA75YxkPFksj8ElszqHq1AHd+ftZwfh6Mvw9vOpGunNaqDp02GQr/vVv7tq1tS
         mWqoNKAriTjL4psJPmXFJ6oBdLRvXxtl4p2a+Ka9qlXvAXmkA9OGTRgk0LoqkPyOKQ0O
         LrIYhzr32TVhXe2g4pMQYVu164K5VDnSQPgR3dZf0u2nVAaTM7CPp0TQ8zJDw2IynDnW
         t8SyU65xkMfA+1aRA4lX9grytxYJpYppNI9EXaZMLAaeqeUE82dlo/vZu11e+GsHBjh3
         M3wA==
X-Gm-Message-State: AOAM531V4XbbbZxo96cP4f+3wFeJ3TdhkTvzhr8iZl9MHPd9dS8hUzgG
	JybpPzWhvZSM3a/FpeRyNlU5+NZU64DwBcXmOOo=
X-Google-Smtp-Source: ABdhPJzibnMtFqwQo56ml8IAsUS46hYjv2HMbZPDJNWFr2dqGajHDOic7EQ5gnVS6h30MBmg8JHhpQNVGHNC05UTpE4=
X-Received: by 2002:ac8:5a0f:: with SMTP id n15mr5060347qta.88.1607025162594;
 Thu, 03 Dec 2020 11:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
 <20201203133727.12936-4-alex.kanavin@gmail.com> <CAMKF1sqM-xmu-L-nhRKsf-A1Loiv0U72zV6jcNXyEy9QOLXdNw@mail.gmail.com>
 <CANNYZj-fDQdkXVN=hjqb7u=bqPZhXfidO_cT+Buv6gB4gAN_ew@mail.gmail.com>
In-Reply-To: <CANNYZj-fDQdkXVN=hjqb7u=bqPZhXfidO_cT+Buv6gB4gAN_ew@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Dec 2020 11:52:16 -0800
Message-ID: <CAMKF1soyXa8g9WyGL357BYkS+JK4PwYxz3wjqgZ9vFxGQUwGyw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/11] ruby: fix reproducibility
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 3, 2020 at 11:20 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 3 Dec 2020 at 20:16, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> where is this template used ? is it used on target ? is it possible to
>> just all bare compiler name then since it will still work on target
>> although not as important as if it was needed during cross builds.
>
>
> I don't think it is used on target, as harcoded host items would surely n=
ot have worked. Again, the goal here is not to ensure that target toolchain=
 and target tests work (a large and not necessarily useful task), but merel=
y to avoid host paths leaking into target packages.
>

I see that, I just want to ensure that deferring the problems does not
make them harder to detect in the future at the same time. It's easy
to fix them in the context than to revisit later.
> Alex
