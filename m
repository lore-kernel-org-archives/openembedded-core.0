Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.3129.1589831793470135895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 12:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fUypIP/c;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: andrey.z@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id m185so862610wme.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 12:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=owqw2dRp0n4G9PYqXiyReEttWX+DQVAuA6Zkirtcmjw=;
        b=fUypIP/cVJMa8UOGHMg+LGtR6sKUqlPl9Og8W5IRELH/9JMCLnCXiIPs0vpeehP7kO
         +JQVCVnp+ofyCi2CC4aoWeE5bgngfh+YEIvFIRqbwF0Kqgzmm9110AaXPurJ8ZUOqXuB
         6hxGURpIOBHeAcl0tAGsyVqZ1rp7JHu15D4MZoQVfwRlReCLiLurzdF30SbFlDX1LPtY
         sdtodEE2iVuaHOI7qcpKOFXUqs6M3yU+7IJFgMGQLGbNOXaHL0olYCwQemeXCJ5DmimZ
         9Xk7WVVSqhWHfLC2VP3eQvF3Msz3typTeqxcwBAjqFwB14IpIdzBCcWFACLTYeAhGylx
         ZYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=owqw2dRp0n4G9PYqXiyReEttWX+DQVAuA6Zkirtcmjw=;
        b=rIOy65h9QHDid0y06Mt2b+tNz1Z93olcXqDtWbVbnePH/i0+wuxviWh6TTG93ehLvp
         Tjuh1eLbaA/oy7tnnL/qlayUb7kUfBAvIHPYTtcmtkk1QAaVwLmkPp1OCU2sZb6xLu4o
         n0MYuMbZS5os6+v74jUlQvppqDFxX2m5s4KGQxOU+AUKKRisGcyk7/LH4VAlJJP6w1os
         SSdIeEHC8skqwmvd8UqftcWtfAopqtnhEFavP32jUMgMb48wKEagrDrW8C2SdtIofWi1
         Jja5kwvXmGNwIFK8NngCbwUzJtj6zlSQpcI/iHZA7M3vmjZxkHaxCW5+EH3axAFN9PSa
         nwzQ==
X-Gm-Message-State: AOAM532KJ3e+eoCv7lI5hjd0SEWEzdAAXCBzoSyV9iXtJWGCQrcDfquE
	mgb+CLdlHLGQ5b0sHnrTifOn10IJKKdiCrlczMc=
X-Google-Smtp-Source: ABdhPJyzwjNZH9Sa7s8t5bHslIJ8xFb+XXj2E57jd79X7/ud0dE6ljPHpgod35JtEitYMxBl1w7riIEZAkG0/n0gNMg=
X-Received: by 2002:a1c:6287:: with SMTP id w129mr1071843wmb.151.1589831791926;
 Mon, 18 May 2020 12:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200511182812.441561-1-raj.khem@gmail.com> <20200511182812.441561-3-raj.khem@gmail.com>
 <20200514152934.GC21399@localhost> <7111a5b8-12b5-d683-eb39-6661223697ad@gmail.com>
 <20200514181917.GA28774@localhost> <5f87e63e-d827-c615-44b7-0071b1e80694@gmail.com>
In-Reply-To: <5f87e63e-d827-c615-44b7-0071b1e80694@gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Mon, 18 May 2020 21:56:21 +0200
Message-ID: <CAHtQpK7bXQ9HwB=9qEzfTjKfDw2jRBeaAT704kVkLyNm1HQuNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3 3/3] gcc10: Revert using __getauxval in libgcc
To: Khem Raj <raj.khem@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 14, 2020 at 8:22 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 5/14/20 11:19 AM, Adrian Bunk wrote:
> > On Thu, May 14, 2020 at 10:18:53AM -0700, Khem Raj wrote:
> >> On 5/14/20 8:29 AM, Adrian Bunk wrote:
> >>> Disabling -moutline-atomics would also workaround this issue.
> >>
> >> I think this is a good suggestion and I do not like to revert gcc patches if
> >> we can avoid doing that. I will propose a fix to disable outline-atomics for
> >> valgrind on aarch64
> >> ...
> >
> > Not just for valgrind, globally.
> >
>
> so far just doing for valgrind is enough. I am not averse to enabling it
> globally but perhaps we need to do some pre-work to decide that, maybe
> some benchmark numbers.

FYI: I've just seen this issue on the [optee-os] as well, build fails
with the same "undefined reference to `__getauxval'". Looks like it is
not only about valgrind...

Any chance anyone had the same problem and proposed fix?

>
> > The main effect in Yocto distributions is (slightly) slower and larger code.
> >
> > cu
> > Adrian
> >
> 



-- 
Regards,
Andrey.
