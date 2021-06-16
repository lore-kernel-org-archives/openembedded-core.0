Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.558.1623867497274671664
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 11:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HA8aSQ/2;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id s22so5142385ljg.5
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 11:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uFVuWV9lY5ugFalNk3Nb+2JQ7fbiGUSFKgFvhztZXNs=;
        b=HA8aSQ/2lG3RPbTQqmEmABCg9dGOZOWWYyzLb8F9OzkseDghotWSL0oWWWT/H8yFLK
         OluKS5UeTJbYDIKnbftnis0mmM0MpOZXgP/ZTFAL/cACPHRVqWPSsGRoh9Jmb03kLfJn
         WuHTfXRTFhf63f7wxj6m7nRaNtI4lxwqXpFl/ryLUaBPX1CTmKoUHFOj0vay7h5LQesZ
         OpbAGRFscIs89rG6XBgE1TgyyTacouMEXzkJWO8w11mo526b+qrqBV/whhHFpuvbK/K6
         L57YI5Wd0hLTlybxHCgMt9I/j+OGZD2gLDPDZcr3r6kUDc74+OyBJlaIuDNaWInEaBQK
         +odA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uFVuWV9lY5ugFalNk3Nb+2JQ7fbiGUSFKgFvhztZXNs=;
        b=KccAFQCE8b88oT5NIJr5iRn9Y1X8Jmb9x3bZn6AZxqNVx1vEDKRAXT/YXliGQkU+FX
         9HfAbGB4zXwI1Wl0lWWsDJzgACf6YdiiqMpHIDRv7sGo/6RiC/PWXxvZ/DMEq0estr1V
         TPO9Ob0rndWS0QlcXx9FegvTMQYPsUdvZGrxypCLIcsHsWb5ALOJkHAVQFKYIsbIZ11Z
         fVhQzv7cLIPfSeQGdE0fCwjnDbbTHvaWK/TVbW2wCxJNfaB6ATdfiwHDqJhim18l6gd2
         fuofZOUE0rhnYN962qb33b/2EbshYoG/4Q+8UGCwgbczbB81+cJCNM42hqkVojsqcqRU
         jELg==
X-Gm-Message-State: AOAM530cqe+OOYqMRHh5hAGK3iY+aBShUIBbROJyh1oRRy3+G3VT0pkI
	vhEYTMH2R/QJczgxXvT1Ph6aeiqn+DZwl86Alj4=
X-Google-Smtp-Source: ABdhPJy0zHsd41u4LubwISFSrd6D7+l6nPLvdfVGPtsjAxAj+ZGMXz4eAOsBYB8M0yLUY4KOBTxI9cUvmn9py/N20FM=
X-Received: by 2002:a05:651c:204b:: with SMTP id t11mr1032381ljo.378.1623867494931;
 Wed, 16 Jun 2021 11:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <f82ec87-8fbe-49d0-e147-a9c8dd6c711@crashcourse.ca>
In-Reply-To: <f82ec87-8fbe-49d0-e147-a9c8dd6c711@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 16 Jun 2021 11:18:03 -0700
Message-ID: <CAJ86T=XMjjrt4mE3gvjOYOxqG45Ab2GkN9kB5Uqxa6twYz7cUw@mail.gmail.com>
Subject: Re: [OE-core] should the same recipe have two different WORKDIRs?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 16, 2021 at 9:30 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   perhaps i've just never noticed before, but a colleague asked me to
> debug some strangeness with his WRLinux build, and what i noticed was
> that the recipe that generated a package with a single (aarch64)
> executable created WORKDIRs under both directories:
>
>   * cortexa53...
>   * acme-coyote         [actual target board]
>
> this surprises me ... i thought that, based on the attributes of any
> recipe, it would have only one WORKDIR in the appropriate place. what
> does the above mean? i'm not sure what to make of it.

Have you built the recipe for two different machines in the same build
directory?

If you completely remove tmp and then build again for a single machine
you should see only one WORKDIR created (which could be under either
the generic cortexa53 or the machine specific acme-coyote depending on
whether the recipe sets PACKAGE_ARCH or applies any patches or sets
config option etc using a machine specific override).
