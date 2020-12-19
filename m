Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.3380.1608343029400343581
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 17:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rYuDzMal;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id d11so1877643qvo.11
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 17:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0sIPV4sAT2y/31vb5Hy3oVIT1jaBnkOAgTXYSHtLfLY=;
        b=rYuDzMal5dL3GF/WZQgrC3qh+VRwWjHwY0EDkZA/F27PhEmnYx8JnQ63vcxan926LD
         RMwEMCfv5SqQyCXqyhMG6gmVmpXnolFzNs/Wf9SiS6t0k/SYMv/rqpR2M7H7Di3R3+F7
         PPEiuiMyYR1rxv0oNehCXjI510r6JznZaZx9s1biyEuo/SOOpSc+GnTxPB1bzbfDhyWM
         3USzLXrgLvIGsEwBcne2qsqXq6tq7+EoeTHhnAQWVmpBrxf87cmpN+mkwVyGED2QXGPe
         IxMyeFsB6L+rFWr0+05BcQICZ+osXWVbKUobLCBRpWXEMlQNmucs9PEr7+71Jy7vF4E0
         9hbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0sIPV4sAT2y/31vb5Hy3oVIT1jaBnkOAgTXYSHtLfLY=;
        b=rTGrynQ2gH6ycYt+tg7IwikuEHAnoWfiYflPz5AXuMDQmsX3KKio8f9ut4m1gWXduo
         0MQ0xxoxgTnvjafiDVCM9HBgwZPkfzZ5OZ8V2zvmyGKGO5usYks/TwqYRacsbZ6HbZ/Q
         8IwF2+AKqwjnldgzFL+3MOwvqL3Y06hhixDO8NvY5v793Ml1uYG1dTHyC6B1cRee13jq
         anW5J6Fhoj8EsaI6pk6kSpG9FqwIzMxiPiO1pVduWtYwsGj0aAkJXt/kYNXEWO7Yifzd
         OMUIwIj4FJTDYBDtNwOkQdt8LLwwaIA9/EhS8m6J8LlZKddsaM3gWqnt4vd2cgLWBsla
         Doyg==
X-Gm-Message-State: AOAM53172hDf809HyTFIL1VnInfe/C8iA4EKR6cHSaJyLdVSUid4LSYX
	SaPMPZil9fC5a9IkP01+bdJyLLVvgBJH57O3g8k=
X-Google-Smtp-Source: ABdhPJwkpzH0axpfVKFUTMCR8ToY5TwjLSpsklXSASaqff9ySQoG0/JvgunQ0JsUPGHHCD8uY5+8CA+9ESmovTVuhvQ=
X-Received: by 2002:ad4:4431:: with SMTP id e17mr7383367qvt.21.1608343028433;
 Fri, 18 Dec 2020 17:57:08 -0800 (PST)
MIME-Version: 1.0
References: <20201217225440.2633474-1-raj.khem@gmail.com> <20201217225440.2633474-4-raj.khem@gmail.com>
 <f888a821-9dd9-fd5c-5372-2e7e777adcb7@kernel.org> <CAMKF1sqyB+ow5uNd5LDLZt=rNZc_PqdkCkYASHxZyPkHJ0qZgw@mail.gmail.com>
 <f11cda3f-80c0-ecab-3efe-aaff5fe4c36c@kernel.org>
In-Reply-To: <f11cda3f-80c0-ecab-3efe-aaff5fe4c36c@kernel.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 18 Dec 2020 17:56:42 -0800
Message-ID: <CAMKF1sqnHMcySkTzssqhe4XywVyheKtxcr=t78VGSpQatZwA1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] initscripts: Use initctl on sysvinit only
To: Sinan Kaya <okaya@kernel.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 18, 2020 at 11:18 AM Sinan Kaya <okaya@kernel.org> wrote:
>
> On 12/18/2020 1:46 PM, Khem Raj wrote:
> > On Fri, Dec 18, 2020 at 10:29 AM Sinan Kaya <okaya@kernel.org
> > <mailto:okaya@kernel.org>> wrote:
> >
> >     On 12/17/2020 5:54 PM, Khem Raj wrote:
> >     > +if [ ! -p "$INITCTL" ] && [ "$(readlink -- "/sbin/init")" =
> >     "/sbin/init.sysvinit" ]; then
> >
> >     Can this be done at build time for targets using sysvinit only?
> >
> >
> > Yes however It will be lot more obscure
> > Hard to read and harder to maintain
>
> I see your point. I think having a flag in the /etc/default/rcS file and
> using that for comparison seems more plausible here as opposed to
> init.sysvinit check. (this looked very fragile to me for some reason)

that sounds reasonable I will send a revised patch for this
