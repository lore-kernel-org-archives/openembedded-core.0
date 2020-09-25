Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.4360.1601027918768098029
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 02:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=kpZRBmAD;
 spf=pass (domain: burtonini.com, ip: 209.85.208.196, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f196.google.com with SMTP id c2so1925212ljj.12
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 02:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZoLIsguCzOYbUO1FLHqXh7sijBbSgm6yWAdoMTXA5wg=;
        b=kpZRBmADn0wHE/nYQk8XTmvr4DGzNDM4nyVh3O9TXP/IotjqdjEuej12McjgLyGM2P
         CSAghwOUWi3JQkQUNvIVsp8OxVW04tdOlV+PXySHor1BP/AKNbli1c16XAzyIaTmxnuw
         8k3oe3x2/cDsIcPs7DU3iWFPyqfCTRLKFFDVhCnBS+dXva5etL78t6JRWad6QUkTY/Bp
         RGPPbXMM0ncQRZoji65/yLCWP97wn4D2yio2ABs+qpoAIwTvHYO03/zcOGJDwGzCc5/h
         7o7d7trM+L0rYGGHbvXIYnQbFRjn5Uur2WJ1v3Du+pxJPfdoMYktizX4hTJ/fPoTfp3x
         ysmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZoLIsguCzOYbUO1FLHqXh7sijBbSgm6yWAdoMTXA5wg=;
        b=d7TJxj60w4P+OWejn4HfbeBroEuFVaU7z/JjZTtVlswvd+VFFowEcn9I+aJSFva02y
         0aYOD0UHP6nmVEaNtw1//bEVvbIjMN93LVfk7e8oIsBOs0GEIIkCcRWDT2oXJGYEBxBn
         wUGC+vwugxfJU2kvn+NHf+znoe6BwzfNAxF7BnzdKx5vpTKX+xCk4bxHjEAoerGfF5cT
         H8mqdMfV8TMaagPwUHQ626tQ7QT3uVlAEUPqKvQ9McZ9cA/bChNpiMBXmI6Y29k5b/v9
         68Lp0LOKrUFXH/9AT/sBm8bCzQVdsGZGCUb3cmvMv9B9KlWZ4yxsGrz1oH6siP/YpJQM
         EQFw==
X-Gm-Message-State: AOAM530iZ4554g1blphmO6rGXxsHJ5JBgr/pNMoL66mJxut/E7BEd7rb
	PWtGPPuJK+fUOz/xHicjC6lpOZKWI6W6qXgUMcneDQ==
X-Google-Smtp-Source: ABdhPJwvklfeujT24ByjTgFawkYaj0DK0cR5fl5gBBFlwHE+3vIAX/kVkAkWH8Cj9MR4FkfTvXOIVk/qgThqfiiE4AU=
X-Received: by 2002:a2e:83d7:: with SMTP id s23mr1184839ljh.340.1601027916516;
 Fri, 25 Sep 2020 02:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200924195800.4164634-1-otavio@ossystems.com.br>
In-Reply-To: <20200924195800.4164634-1-otavio@ossystems.com.br>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 25 Sep 2020 10:58:25 +0100
Message-ID: <CAAnfSTvrT7_40JPPpeNM7eJouLK7e0VELGRMHgd-VjKSfa+y5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Allow enable/disable of rng-tools recommendation on sshd
To: Otavio Salvador <otavio.salvador@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Sep 2020 at 20:58, Otavio Salvador <otavio.salvador@gmail.com> wrote:
> We are adding a new PACKAGECONFIG option ('rng-tools') to control if we
> wish the openssh-sshd to RRECOMMENDS the 'rng-tools' package. We are
> enabling it by default so there is no behavior change.

Is this fundamentally because many targets now have hardware RNGs that
the kernel is using, and so rng-tools serves no purpose?

This was originally added with data from iMX6 (oe-core
9b01375236e19e3366c58877c4154d7c71632984) and I'm curious if this
followup is related to other improvements that have been made to iMX6
since. Is there a better user space tool, or is the kernel using the
hardware RNG out of the box?

I ask because I'm strongly tempted to argue that we should be assuming
that a RNG is available and let BSPs turn this on if required.

Ross
