Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.1205.1615432156800263952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 19:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=SJpV/O0v;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id l132so19272724qke.7
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 19:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tol7sYAMkRRo3AmCPTm/8QDYxsl+gUQQ1t3Wgz2H0L0=;
        b=SJpV/O0v3tKCXoxyTEu195AMhVnW9Ab4VMLrORzBga2WqSMh2FcEkrONNxlVrIpxq4
         ColOWcJGk+NAUzwEuSY7RurNvji2Vf6ySEpTBDcyO5M3uFtVvTzJOA31x/gmYO6WFqBP
         qWsqEwf4Fl0FYWeEeUtx9qgtEKGfuLg4WKzEo2w9zbyVrKBXu47uzXHlwamVOVL+qyF6
         igcKR7xfJkJ8u0HaGKJCUI3IkZGz99q7pFCAg6UeI7czhXAGIqQn+7UMnrrbx6+GOJw3
         wNTUvLV6pscZXewvCIp3LXKmX55jsdPRQOpCjOJu986eb4VlqcCKqTt/ewuMI2xVakaz
         MfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tol7sYAMkRRo3AmCPTm/8QDYxsl+gUQQ1t3Wgz2H0L0=;
        b=P1ZMYvvh1cGFkcxC1YHbde7ew1IzDhE4wNH5jGOOlKoWnBa6x2M0NyhwqXJj3oaUKP
         YVmqyUpExLuneFHhYoOqz+78hwapFqKYz5x5yQs5oRps2QsEJio+v7lt0kpkULQ9MSY6
         T4XP81520Nwg75bwEfI3qNiMcdpqBDeFu+peAVMIFzD1f1rDp6YY8mrA6EVPbvOKjRdS
         VXVWaZVbhLQFh2C5wRTgWmR/UMAeJf+NlJSaOSZyWYl4XjAMqTQUEbNm9P20/RC1/Zci
         dUz9Khk1J87O904JuGUOZC1lPTfdzH/Mm3DXIlBYaVhLQ6GLa7qzHTuAyIm78mcPMZY8
         k51w==
X-Gm-Message-State: AOAM5303rJY/PWX+H7ajHi/cT1z4/0LIqBE/vYJQsjTdAPHiYw02MY0j
	T+g9yiubzbZ0/p9HzGFLvrJPBeiIyxwaYpdLTRavhQ==
X-Google-Smtp-Source: ABdhPJxkM+DVeL/i0+TRepFTkR7uT3dYsWYzs+Y8sux8yynhjzWK4JSnCVMbssc3fIp/QaCqUHtbNb1kc7znq1PqfbE=
X-Received: by 2002:a37:a192:: with SMTP id k140mr5782262qke.278.1615432155909;
 Wed, 10 Mar 2021 19:09:15 -0800 (PST)
MIME-Version: 1.0
References: <20210310230433.29983-1-jdmason@kudzu.us> <CAJ86T=XDpdxFY_dLtpOf7b=gZ8N_jHe0Yp1Frhw+h4uqzWpRhw@mail.gmail.com>
In-Reply-To: <CAJ86T=XDpdxFY_dLtpOf7b=gZ8N_jHe0Yp1Frhw+h4uqzWpRhw@mail.gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Wed, 10 Mar 2021 22:09:05 -0500
Message-ID: <CAPoiz9zB51u-E5Jf8ASoMkt-m2PcwTpwGku3cps8poHM4sVzKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] qemuarmv5: add softfp
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, Jon Mason <jon.mason@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 10, 2021 at 6:25 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Wed, Mar 10, 2021 at 3:04 PM Jon Mason <jdmason@kudzu.us> wrote:
> >
> > pulseaudio-14.2 is throwing the following error when compiling for
> > machine qemuarmv5
> > "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
> >
> > Using softfp to resolve this issue.
>
> Wouldn't "sidestep" be a more accurate description then "resolve" ?
>
> Either way I'm not sure that changing qemuarmv5 just to workaround one
> broken package is the right approach. Doesn't it mean OE will no
> longer have any test coverage for ARM soft float?

With these obvious issues, no one is even compiling these, let alone
testing qemuarmv5.  And these issues have probably been around for
months.  Even after getting all of these issues addressed, qemuarmv5
is still failing testimage.  Honestly, it should be dropped since it's
not really being used.  If you are only worried about compiling, there
are other machines in other layers that can be used for this.

> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > Change-Id: I513ed523f03ed091507a099e3f80fa95a6fc7ca9
>
> Not sure if there's an official policy for this, but personally I'd
> say your own private gerrit IDs should be stripped before pushing
> changes upstream.

These can be dropped if they are problematic.  I haven't heard they
are forbidden.

>
> > ---
> >  meta/conf/machine/qemuarmv5.conf | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
> > index dfe2a89573b2..29bcc1199ea1 100644
> > --- a/meta/conf/machine/qemuarmv5.conf
> > +++ b/meta/conf/machine/qemuarmv5.conf
> > @@ -18,3 +18,4 @@ PREFERRED_VERSION_linux-yocto ??= "5.10%"
> >  QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
> >
> >  KMACHINE_qemuarmv5 = "qemuarm"
> > +TUNE_CCARGS_MFLOAT = "softfp"
> > --
> > 2.20.1
> >
> >
> > 
> >
