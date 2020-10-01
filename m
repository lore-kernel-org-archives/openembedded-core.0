Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.794.1601564012939603840
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 07:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rE+7PJ5G;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id i1so5963441edv.2
        for <Openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2020 07:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3RoONT52N7Nrb+wlku45xdX0y0nHcPCNozqxKrZh/6I=;
        b=rE+7PJ5GfOFhvyPP8ZUo/dSMpgGq5fMvYSX76ke4MpLtegyRLgnw81sg2WFGmEJW9l
         32Lp48nAE4aal7y9Lxv7CTv8cD2y56iIWlfD/sJvWdCkBdz7vPa/7hB91CI1BG7e5xkl
         QRtX5k86bwwdGGzeLhC2bXJJqJn/IZ9OWJtZZwHxqOvEN3n8I+vTChl3OhRnN1DmzcXX
         xWMddxlAs75Fl2ASJ6qp5UekXJvXRlDoKrOZPnNIr4ZFHGcp6HFgRgIztblEbLEcJIX/
         qZKyG9VxG1zmBXZkxDoXdfTkLxWhPSgLzG/9yEWxeSVhD2uJ+8MaPJcNLmRn3p3nlmzL
         vWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3RoONT52N7Nrb+wlku45xdX0y0nHcPCNozqxKrZh/6I=;
        b=q/sAMDyNyurYPFv4zPJeIOAWYlqJXDhx7magvQ064t2PrDZqiycEo1HKo2CBSm6b20
         01RTKU1VvzL4mUf8dVK/ZCdBAj1wqS0Kpad7afCBARVtLkNWB/d4yiwchlmF+Oy3X/nu
         E9K9qBHWyPIYw2YRnvRQNCoEdI3A4dgCC72RMl8+rcsRXMBQC0A/4/lbvsHq6Z3w0+x5
         +4clKe25hPfkeCUO++10TxgINjMr9xAUpFmysy2iHvshd7bYRBBqcs1LAQuL2PH1Ywgm
         reM/yCcC77KJi+/VCRUJIExGkkhij2ikAz/nIPytpI47EUGP+6s98bKdojWIYZn9hx9Q
         ruLg==
X-Gm-Message-State: AOAM530HAhnC+vbqCQuc8eUR8cGxJJ6MkomuI5UZ+GvEQcptb3rKyUTM
	cmpHw7P8hQzJjxSIzgtr5JlMTolpUSSQeU0VdAo=
X-Google-Smtp-Source: ABdhPJyb9woKbrXcduaVL4P+xQO9SGpxtG9paiVbS1stTOCdAeynBN+vq9Te0EFqKk+znDBGRLn5pKXQC+uSvwShyiA=
X-Received: by 2002:a50:abc3:: with SMTP id u61mr8386462edc.129.1601564011292;
 Thu, 01 Oct 2020 07:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201001135927.721794-1-uvv.mail@gmail.com> <CADkTA4OZNhbMaykKi_pU_Af49D-wAjeqQ=3L-y241Lcj7TUd2A@mail.gmail.com>
 <c71e99aa-5669-a75c-1e72-81c176ee71fa@gmail.com>
In-Reply-To: <c71e99aa-5669-a75c-1e72-81c176ee71fa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 1 Oct 2020 10:53:20 -0400
Message-ID: <CADkTA4O_M+Wb5bXdiSTzKJDnB0GJVKoNUhD_t3x5qZsG0EvfLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] module.bbclass: add HOSTCC for out-of-tree modules
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, 
	Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 1, 2020 at 10:47 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> On 01.10.2020 16:36, Bruce Ashfield wrote:
> > We already ran into this with the main kernel flags, and we don't want
> > to duplicate them here.
> >
> > Why aren't what we have in kernel.bbclass working in your scenario ?
> >
> > Bruce
> >
> Because kernel.bbclass is not pulled in into the environment of
> out-of-tree module recipe. Should it be?
> This can easily be checked when you do 'bitbake hello-mod -c devshell'
> and examine $EXTRA_OEMAKE variable.

Yes, it should be.

We build out of tree modules in each autobuilder test run, so it is
functional for the most part. I'd be interested to see the reproducing
kernel module and build steps, so they can be built into the tests to
catch this.

But we absolutely do not want to duplicate those flags into this class.

So with a reproducer, we can perhaps shuffle things around and make
sure that both this new case and the old ones continue to work.

Bruce

>
> Vyacheslav



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
