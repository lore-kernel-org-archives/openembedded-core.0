Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.1874.1616784546866679031
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 11:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TKMkFLca;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id by2so3421034qvb.11
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Mar 2021 11:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tPlrdGTQfMHP3qRYlnHrSDQuCd8AtjmOgLV+MH0caO8=;
        b=TKMkFLcaIY2BxuRRn25AKTeQIopOrLcZFBU/5jb1IjFDM8aj0Gk8g5ndhVwL9QC/TN
         dFNIZNjhY9hca0PEl69ofCIKU4kras3xrm+4yTTKJm+5sWWaG56Rk97XjQsRPqdbapqf
         UCdPlBXw9QCPaNEbqSwlrAvrdVpq9eAk3eOY5auwj9ELT0ej420Tlk5OfCX/Zqj5/SVX
         xLFcG037jKp2wFCIzeYibLzjJCVQI6Xpd0IA1zCUrnJVuCXQKMbEN5cJxyBbF9XXojQR
         zXoqVIEcJ0csLA41Csx37K7YrgVToCNOgAZVqC5SJ7bfViJNQjebz4CQVoKZs2EKTsT3
         Nclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tPlrdGTQfMHP3qRYlnHrSDQuCd8AtjmOgLV+MH0caO8=;
        b=iFZ7Ob1lsCBDgA76AqSpBiV7nCct7ZiTKGqEVqVBdjWNVU3ciISaFq/TdzmLUGJqMv
         JuiowCTIyaTPRoZwm1j67DGM/ojKkDIx4WQqwwOs7A1bmwuyowsl+0FXD0fS/X8MOSmd
         BYw/LZsu+xi0pA22hVpxz2Mx0LoMpx4SjQw+lzvsuR8vNl0dvya+y0x0DJqcfaymGY5R
         TmQFnXBoeKyRp7EE6yMBhTguJFnQNLqIMwXAb/YERPKqDtgVPO1gCWDo9NmRZhwB+nZ4
         8gdpeQEq4B7EK4t8UGz2MinbNzW4XnU9nDQwihU2i5Y3/M43BswVyj0eB2yN29WK2wyF
         92Vw==
X-Gm-Message-State: AOAM5309gk+6CtTJqZaOHjFuaGapsps4/9Zi6bVcfHyehyIQvOGwRNbS
	l7Pi4RVUha6kXFXKiYPBLYwqzHsYTEI+dab1YN8=
X-Google-Smtp-Source: ABdhPJzp6Edgi43xYhsUUMvaUMQZATD4BuCAoTFwSemO/i9vNRc7zZRU750gzym/+MVzI3SFAwDpGIcK5hGAb9B0lqk=
X-Received: by 2002:a0c:f44d:: with SMTP id h13mr14726745qvm.31.1616784545973;
 Fri, 26 Mar 2021 11:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210325173901.3057180-1-ross.burton@arm.com> <CANNYZj_mMCVjamiimbWki=r4GFAOXkRPjH6xm3rcSbYkmpewWw@mail.gmail.com>
 <CAAnfSTvXHyX_MvHbtpcUso92K=DQT1_7hMwAGCDPJ9RMW0zVPg@mail.gmail.com>
In-Reply-To: <CAAnfSTvXHyX_MvHbtpcUso92K=DQT1_7hMwAGCDPJ9RMW0zVPg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 26 Mar 2021 11:48:39 -0700
Message-ID: <CAMKF1sqMj-d-Dj-Kq3N5gAJBZtFDzGY=Rcc2J9uKD_gA-i9e8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/3] meson: fix native/host confusion in gobject-introspection
To: Ross Burton <ross@burtonini.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I am seeing some failures

https://errors.yoctoproject.org/Errors/Details/574541/

On Thu, Mar 25, 2021 at 12:08 PM Ross Burton <ross@burtonini.com> wrote:
>
> On Thu, 25 Mar 2021 at 18:15, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > I don't think I fully understand this. Is g-i in meson projects already broken for a while (there was a bit of refactor in the latest meson version, which I tested, but perhaps not well enough), or is this necessary for the other patches in your set?
>
> I just sent a mail which sort-of answers this question without seeing it.
>
> Basically, the change is that Meson now knows that it should call
> pkg-config-native for native pkgconfig lookups.  Before, it was using
> pkg-config.
>
> As far as I can tell there is very little code which hits that
> codepath, so we didn't notice.  When setting pkgconfig-native
> correctly, this broke.
>
> Ross
>
> 
>
