Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.16532.1604949314404953799
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 11:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pq8J8sEy;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id z17so931185qvy.11
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 11:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=twK3DgR4kRFPfDOW892AlnfCRwMXFgSBaUlaOg51r1c=;
        b=pq8J8sEyHYySyGetCnovFHZfNmCepXPgwxebynD2P3huEls07R8q1xGxa8oFbQcmX7
         s/26PhTy68MB5WFw+iI0tcTGqRQ4SMBVHipDhh0sb0lvioB5EmORV1PCI/PzvBT4L+oo
         8XLYOSSLFQP+I/3yvgKN1GswqKCycTj5pATvyZV6K5JqRiqkAiQunTtg89n3gJtVVAhm
         Pj1guSIhztQ83W12yGvgZhlu8C0XVK4zdew1l1t/WRaQkckUJ4wc/EcV3XDmHbiMShFF
         XoZP7UQheq/60sslLWLut+T9LdLyxZLTAVoESFS8byFfWZjg56i7DhQHKO5VT9GD4XLQ
         6pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=twK3DgR4kRFPfDOW892AlnfCRwMXFgSBaUlaOg51r1c=;
        b=BF4vBxHKnB9xVmjSG7VJUUi+uMD6AQ1X2uArkcjkbJdsP75H3v5meN+4BDFlAZVKwj
         dOvGbiFlej28c5AT+BYpmLcCPJfQ6XXB0yNXn0qear8AUhy48E3mmhuhrDOCzmANTXvY
         mrYGuZxVkl7yX/8i+13fqULnUqAYOWKwfKbWh6iHxTDkyI8B0DWSgbb1usm3pjgB20v8
         S056lQAZTya2pJcstyfWO9LUczIGUDqm6NXbMeVwFS6WEvFUAw9sV+6VY3ZJL1SPifTo
         eV6io0bQyYGjoB7Zor0180azKDTgXdwmqfyk/jORXfqO1QDhdgyem/DPDveJg8kxs6WX
         fMxA==
X-Gm-Message-State: AOAM531uZqapc3T5S3PVJIxi2UNjUrOJnjFLcG/Kgj0+Q2hfeWcGpuN7
	kOWzK8nX9wLtVnfVKuWtbtJ8+AR7v4TfHve5hVE=
X-Google-Smtp-Source: ABdhPJxh9mlNvROfx62NIoe8Z6XulrZt4SA3j47Iv/LJC98B6KbfcXHphGRMmObx5j7vLHTY2IMiiPtIS0xPuYGgpcM=
X-Received: by 2002:ad4:4512:: with SMTP id k18mr15944234qvu.5.1604949313524;
 Mon, 09 Nov 2020 11:15:13 -0800 (PST)
MIME-Version: 1.0
References: <20201109000217.3008448-1-raj.khem@gmail.com> <CALbNGRRuWJb5OXhh6vbM+BoBw1zk2THMJYju8_GWCbGpu+UWxg@mail.gmail.com>
In-Reply-To: <CALbNGRRuWJb5OXhh6vbM+BoBw1zk2THMJYju8_GWCbGpu+UWxg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 9 Nov 2020 11:14:47 -0800
Message-ID: <CAMKF1so5=BQx8-e+oiGN87DOt5T03aadwYAFtzxJXNGDSsehFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 01/11] lto: Add global LTO distro policy file
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2020 at 12:30 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Mon, Nov 9, 2020 at 1:02 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Distros which want to enable LTO can utilize this file, it only covers
> > packages from OE-Core, other layers should include there own exclusion
> > list for recipe which dont work with LTO
> >
> > Document the needed changes in local.conf.extended
> >
> Maybe I missed something but I haven't seen a word why I should want
> link time optimization. And from the patches I see here it seems we
> are about to create another contributor's burden.
>

Thanks for your feedback. LTO is quite beneficial for the kind of
images OE is targeting,
It results in smaller binaries and better optimizations as well. LTO
has been around for a while
in GCC but it is becoming useful with gcc10+ and more distros e.g.
Fedora/SuSE are also starting
to use LTO distro wide which means we will be able to reuse the
upstream work that's ongoing in
different packages. You can see there are patches already floating to
enable it for poky-tiny already
so OE userbase is already starting to use it. Moreover, its already
default for many packages themselves
so you might already be using it at package level e.g. systemd

 This is similar to what we did for enabling security flags. As you
can see, these changes are currently optional. This means they won't
go into effect for
distros without them choosing to use it via DISTRO_FEATURES. Since it
takes a bit to get
such changes stable, we might keep it disabled by default for the next
release depending upon
how it pans out. Eventually, the plan is to enable it for poky/yocto distro=
.

As far as the contribution burden, I think it won't be a blocker until
it becomes one of the tested configurations
on yocto auto-builder.

Feel free to express if you have more concerns.

> Andreas
