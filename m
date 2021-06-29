Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.6790.1624965970102578814
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 04:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=dmt41jrB;
 spf=pass (domain: burtonini.com, ip: 209.85.221.42, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f42.google.com with SMTP id b3so25354258wrm.6
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 04:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IU4/9aeYl8iV3BplnUR2Ti6++D44pH+v1xAQNAIB3+Y=;
        b=dmt41jrBJBVa3Npa2Lm6nl/qGdJfiQWAITR7LSAW79U4TcuwShrJlETtMIH1uXr3dO
         8c9Wlj1C3JtVlxY0lntmk3mahnvnrXKDAFGu0xkFlUp8xSSJ8tJEPAH0cobZUhIheqem
         bc5q2+grtx4AfEiA1oJBG2sjxZt+0ZbdQGFoFujw1LPxXKNpHpxvyr0ze9wJz+8a+mjf
         tNySpEoSBQpmlhzho2NAyuMnf7m422CtOFig38sxr4PUUPm9HrqYg77CDfg2lwKzr3bW
         M4PLB6/dovgyainEb8Cle6lXXJo7GGcRYHG/t3jJE5XZSTxkZGODt3Qd+L6Zd+HkR2sp
         lx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IU4/9aeYl8iV3BplnUR2Ti6++D44pH+v1xAQNAIB3+Y=;
        b=QnwzeXDEe31Al3JYpPn+gBC5QA0C4inED5eKD7M92Cg3i96ibSrbquyZJ7Mg77YRZ+
         fWDiYHZskv7OXRc7kn8pAPlldg+NkiNP9hwhDlGVcp7U501bcyv1YfLYn+kDkzIM0nb6
         PDyEk/IZodj+gR9c/ABqv74O3pXYYiwl1jdkyrzOFZtW5ofreFcRm1UL761HFidZt5Dx
         3PlYbVFQ4vbB7ig4ckdxb/SYYRtHIffU4LKvWWP6Ft0y0hqjoxNUNiXGmL0ShIjoix42
         9tv2xlxKS9xg1zTH0fc90ccerEn2UdJf3JiLEVtGFjRC50PbP43OUjUeZ+0w/0s57zuh
         8OqQ==
X-Gm-Message-State: AOAM531J1cf2x/uw8jBML+5c8yzAW5FWQ5ZcN6siPz5hX5xrTM7Szo9o
	KRfSbFjaqF7lr0UQNnm9hlyCumKgviwFU6KcsqdCuw==
X-Google-Smtp-Source: ABdhPJwAAR0zEALnxzJDh9tu7y5DpaM+e+E5XzwurbUJjPtZSred0cibmDCLwmsqcLQC3Yzuz3CrU6HE418wLrnU4bk=
X-Received: by 2002:a05:6000:1a8f:: with SMTP id f15mr33472844wry.260.1624965968503;
 Tue, 29 Jun 2021 04:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210628130119.926307-1-ross.burton@arm.com> <9e0cd3d79c36f2b061cf2d751c8b544efffc23b2.camel@linuxfoundation.org>
In-Reply-To: <9e0cd3d79c36f2b061cf2d751c8b544efffc23b2.camel@linuxfoundation.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 29 Jun 2021 12:25:57 +0100
Message-ID: <CAAnfSTvpHY9k9WOsNrY4HmU_BMk+nY-pPyDwSnm2NYy-ejyPyg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] util-linux: use the system binaries when running ptest
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Will this be blocked on fixing those?

Ross

On Mon, 28 Jun 2021 at 23:51, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2021-06-28 at 14:01 +0100, Ross Burton wrote:
> > Unless told otherwise, the util-linux test suite assumes that it is
> > running in a build tree and looks for binaries to run.
> >
> > In ptest we're on the target, so it needs to run the system binaries
> > instead.
> >
> > This reduces ~180 skipped test cases down to tens, and should fix weird
> > behaviour. There are some new failures that were previously skipped
> > which will be investigated shortly.
> >
> > Also pass --parsable to reduce the amount of noise in the log ouput.
> >
> > [ YOCTO #14244 ]
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-core/util-linux/util-linux/run-ptest | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/recipes-core/util-linux/util-linux/run-ptest
> > index e135ee583bd..86f9fef24bd 100644
> > --- a/meta/recipes-core/util-linux/util-linux/run-ptest
> > +++ b/meta/recipes-core/util-linux/util-linux/run-ptest
> > @@ -29,7 +29,7 @@ res=0
> >  count=0
> >  for ts in $comps;
> >  do
> > -   $ts | sed -u '{
> > +   $ts --use-system-commands --parsable | sed -u '{
> >        s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/
> >        s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/
> >        s/^\(.*\):\(.*\) \.\.\. SKIPPED \(.*\)$/SKIP: \1:\2 \3/
>
> This is a good fix, thanks. Makes me worry about regression identification.
> FWIW testing showed this on x86 (arm still going):
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2227
>
> Looks like a build from Alex did have results for arm:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1942/steps/12/logs/stdio
>
> Cheers,
>
> Richard
>
>
>
>
