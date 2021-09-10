Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.8280.1631276477648462429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 05:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=NoML5Jkm;
 spf=pass (domain: burtonini.com, ip: 209.85.221.51, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f51.google.com with SMTP id x6so2330219wrv.13
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 05:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=RY/lpf8UF7wLHjVAtgIni2ARcg7GImD6Jxl60RvhLb0=;
        b=NoML5Jkm5QXXCfNt1EBNKcJ5HS8uYfsFdUlwC+gEPAad/LsDzvVlwOLJLv314ev3Uk
         FDkMt1tN3iM6Jjw1GYqyYyd1YO9EUho65RTvp7PHTseIc0YpFzaPYLoKdjyFxzn7z2Ou
         BzC6ggQef4GCV7QVuWkqnwnTlszto9DuvoOHKfRA9LoVO8GMCcVbmSBwevdaWfdQbc2y
         FQn/7RgxjcrpEwUOgA9oAc1E8VHFI1Wn++ZhkF9maqujLPMytjGMUQm4agvcVnxuPwVF
         m1qpXNGjc7x5VGd2H9nRBumK5Q05HJwoQXc4raLcymWT2LM2rjajr4aaS94XiDo1Fswv
         IZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=RY/lpf8UF7wLHjVAtgIni2ARcg7GImD6Jxl60RvhLb0=;
        b=CCppxtsc+wzAyKAL3oEPrzUPAJ5dsaBwmBC05VSgxccbsf2SPaLGeQAhz5m9UZseCT
         DaYL+ZmcybLkn0vvEy8IUB8gZCmByROQcpW1dywO72YrfG7Yn/E0AS+JGxNeh3P8x/2y
         8/4uA4GEZyxM3AJW4NhDW3TQ6tt4DSMmlgDY5wdhtHczQt7aZiukdeGZvvQ7zbLmWwDW
         7/+BXzT+MnuQARET9ou9oQ2V34Gfq5m1gR61mt2r3Kdna8z6vPZ0W/Ic1//tWtWkKXfn
         qsPOD9ZVlYJptXrgY2v1KI1ij8HhHFQvwL4DtTl1Ad+hv/SrNZaO6PuuIejK7KPmQjmh
         bkFg==
X-Gm-Message-State: AOAM530smmOHsb+wljMu/YevVw3UOcFSk0U+4w+B2hHL5YF58S12+n69
	gqC6Y1w8lU6xlZeu1aXsbYxIZr0UF7pBG9ubhzvq5VfH3JPFQA==
X-Google-Smtp-Source: ABdhPJx9fZAmkRGRdryI8jL7QidduK34VVXQP1BoBM8A7Py11HL9rZav5OoeC0tW4w2Ei3VQGWp2CkALqqfZEs+a7xE=
X-Received: by 2002:adf:efc2:: with SMTP id i2mr9483881wrp.94.1631276475314;
 Fri, 10 Sep 2021 05:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210910102050.1266413-1-ross.burton@arm.com>
In-Reply-To: <20210910102050.1266413-1-ross.burton@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 10 Sep 2021 13:21:04 +0100
Message-ID: <CAAnfSTuhR_OBzQrHWdt_CYf25v7x0sZaNaZ3g5yf_z9nX_movw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] testimage: TEST_SERVER_IP isn't mandatory
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hold off on this, it breaks some potential use-cases.

Ross

On Fri, 10 Sept 2021 at 11:20, Ross Burton via lists.openembedded.org
<ross=burtonini.com@lists.openembedded.org> wrote:
>
> When using the simpleremote test target, TEST_SERVER_IP doesn't have to
> be configured as the code will detect the host's IP if it isn't set.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/testimage.bbclass | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> index 3c689aec913..8bf6b17af8a 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -143,11 +143,8 @@ do_testimage[depends] += "${TESTIMAGEDEPENDS}"
>  do_testimage[lockfiles] += "${TESTIMAGELOCK}"
>
>  def testimage_sanity(d):
> -    if (d.getVar('TEST_TARGET') == 'simpleremote'
> -        and (not d.getVar('TEST_TARGET_IP')
> -             or not d.getVar('TEST_SERVER_IP'))):
> -        bb.fatal('When TEST_TARGET is set to "simpleremote" '
> -                 'TEST_TARGET_IP and TEST_SERVER_IP are needed too.')
> +    if d.getVar('TEST_TARGET') == 'simpleremote' and not d.getVar('TEST_TARGET_IP'):
> +        bb.fatal('When TEST_TARGET is set to "simpleremote" TEST_TARGET_IP must be set.')
>
>  def get_testimage_configuration(d, test_type, machine):
>      import platform
> --
> 2.25.1
>
>
> 
>
