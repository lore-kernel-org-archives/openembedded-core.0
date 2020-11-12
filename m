Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web09.7375.1605200386836043085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 08:59:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kAIb/qzF;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id 3so4472572qtx.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 08:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Oi6V2SI++yQmX0oSfgR4vtkqPWaPMOTz6vCIIRMX2U0=;
        b=kAIb/qzF1/HD/sbqT8sS6z2r48O+X3ARMx/GPLPiiqpM9Ptgsxy8PgFU1OTyIyoOw+
         S2CDR3pKRP95fGLc7ocURRmVPzyfRxdGpO5XLTbCLYEjGNLAHCZ174qFKkEvZ5w4RA2p
         V3XC7/VWYUxkRmujJJrFNJC7idhDPBl1xvPBO53sa9+PVHVFP6kYMz7JxVvSS96qXdPM
         qYHR4rc8MoWZ0HvZIUi4+cpJosx49mGhhVfnyW4sLJN7D/KfJmOI7MayjyUWITnXlznX
         zi/14bZXwGWh0xz/TCO5idjGnDKdKnoka0YDu3v4PoRm0ST7ak7Au8PbNgaMTeBsqnHl
         wl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Oi6V2SI++yQmX0oSfgR4vtkqPWaPMOTz6vCIIRMX2U0=;
        b=swka2bC0v585X5oddgevZlhrYk2Ezmm0AXRPUXKjbEi/EuED2Stdo90VvGmEiJffaj
         yqWGK+EzGpM8XwWM2qmR9abx8+5zHtNB6VAu2shMOYo14k2YILdz9U2LPg7W4718Yihu
         XyvfZyMHxAOGaQdcXuov7iWjeTbVp4D6REVwm8ej9i9ZRB/T625++VjHfhxygqRDm2er
         cT+X0N7iZsk8z9t0QJRGJWJ8IqBWwqSrx/+CUJ2Yf3Y5HUQ48M42f5Q6QvneMJa+6nYx
         kYnKDT55pTXv/1vsH0gLiUu3/37trwvegGppqV5vUDaFL+pwIlXMznEq0pHah2OoGlgO
         KqRA==
X-Gm-Message-State: AOAM5332tpuJ7XnpKs6ZeC/tWqlT6pa6yTVFFvGiqdvWgdPnjGTR2bvR
	EBH7Zyct8hahN5hvVZOBVk5l6v4JUuGjeNZYLT44XWjv5XE=
X-Google-Smtp-Source: ABdhPJz2NUZgT9IGzktGOiN2RqPc+hrKPiV9RrIsh0PLqWbg8sCsaGQDU+9UF7l0WIR2wTLWDEb+b/IHN7WelZz0yog=
X-Received: by 2002:ac8:3417:: with SMTP id u23mr100829qtb.80.1605200385654;
 Thu, 12 Nov 2020 08:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20201111221503.2194455-1-peter@berginkonsult.se>
 <CAMKF1sqLteW=fs+A5oQD+L9JT-CyFjV+KRq+dCxX9XxBuLiyVw@mail.gmail.com> <3eb3f28c-bc38-3880-34e3-082acdc0af02@berginkonsult.se>
In-Reply-To: <3eb3f28c-bc38-3880-34e3-082acdc0af02@berginkonsult.se>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 12 Nov 2020 08:59:19 -0800
Message-ID: <CAMKF1srervNfr_6tm2o0mcWdV9sqhc=nv5P27QGd2h3F9NZLAA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] Make rt-tests buildable for all architectures
To: Peter Bergin <peter@berginkonsult.se>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2020 at 11:35 PM Peter Bergin <peter@berginkonsult.se> wrote:
>
> Hi Khem,
>
> On 2020-11-12 02:33, Khem Raj wrote:
> > this seems to improve the situation but its not clear if arches
> > without frc() will now fail miserably at runtime or will it only fail
> > a subset of tests and rt-tests will still be largely useful for such
> > arches. In the latter case, I am fine with this series.
>
> oslat is a newly added (in v1.9) test to rt-tests and is just one of
> many tests in the suite. With this patch the oslat application will fail
> with an error message to stdout.
>
>      #ifdef FRC_MISSING
>          printf("This architecture is not yet supported. "
>                 "Please implement frc() function first for %s.\n", argv[0]);
>          return 0;
>      #endif
>
> I searched rt-tests repo for other usages of frc() but it is isolated
> and only used in src/oslat/oslat.c. With this patch others tests in the
> rt-tests suite can be built and run on other architectures and it would
> be helpful to get it in to oe-core to be able to run, for example,
> cyclictest on arm64.
>

thanks Peter, seems fine to me then

> Best regards,
> /Peter
>
