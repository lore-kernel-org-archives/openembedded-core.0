Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.20957.1598540481136553354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 08:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=xbLuIR0X;
 spf=pass (domain: burtonini.com, ip: 209.85.208.194, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f194.google.com with SMTP id w14so6809965ljj.4
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 08:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2wnRqfLVsOspsQnOGMgBIzbte2gkIoZib9DPlykxCkM=;
        b=xbLuIR0X5pX4xlzojriOq1u2+B9qVcBTr2v5+VumrM0rC6ifaX+WinP8OTzg9fV0dP
         Ao0W065EUGk5C8fMXGhXjzKQ0JFaVWB13mlbas769OO723QbUbFbB9wXCqtmBHSLc7ke
         YsLUC7+mwjEzZdFU975KFmTZiPf3/lTVYw8mJCc7q2usVB04aLUbJBT07PZkeejz//hG
         BJOMxcNC/700ifMuzgfe2Z/WLkgQAt481NNTv/if5PmIC705+Owm4pJiwfc+WtWdyq2Y
         Lst3Jfq63xCarAq237cMMhM9FanfypNhXzHpcLNADDW0OUulnWqjOKJjZdJeZ//nQEVQ
         yKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2wnRqfLVsOspsQnOGMgBIzbte2gkIoZib9DPlykxCkM=;
        b=ra2YsrjHgq7D3yCTPZqc4ZujBCSvuPk4ZnHOe2f7IXzrAaSdj5Ig6ThO/u3Av4GQB3
         uuovrSCpNER6RfT3OL9m1zdiL3I5QrLrndi8iAlNDyuyR8uSm3nKfz237HuoMNjIDtnI
         ZC5wQgSuL0j4QbrE+aeZXfJwLKoZS2034QDVjpBwyIajT1NCX75qLOZh0MtIayfTumcL
         /VPx0q32PO7SZ6nUiHYCrMDpItgdavykdaNltQ4FXmnXbprXNMCO0I/VmwgoTsIjfk44
         2GjqZAS4+4B0wcdLuvrDbJt+vFK/1rjJDGhzKFTbmQjVYgw1AVjohzwWGo8rEMNvs4nL
         Z52Q==
X-Gm-Message-State: AOAM530Eci18y3Jeu3vkVWinyYBCWOVcvp5jxpLn+L5N7mVdmnXbSFbY
	2+Z/vMRJwsHF6543x09GyfYod9mPWjqHUwceoUAx5g==
X-Google-Smtp-Source: ABdhPJyTM0Wgbz+L1iawzQzJGarl0QC5AaIWaJOpaGz+C47+llB06ttp8u5FQDqX0FBL0eg9W/o3jGEGuFpcCuMQIqg=
X-Received: by 2002:a05:651c:1122:: with SMTP id e2mr9774494ljo.36.1598540479066;
 Thu, 27 Aug 2020 08:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200827021251.14310-1-hongxu.jia@windriver.com>
In-Reply-To: <20200827021251.14310-1-hongxu.jia@windriver.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 27 Aug 2020 16:01:08 +0100
Message-ID: <CAAnfSTv6VvF9nZPojVWNHw5RfZgZj4aL=PWZ5zdbMGMfxJhKZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sysstat: fix installed-vs-shipped QA Issue in systemd
To: hongxu <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2020 at 03:12, hongxu <hongxu.jia@windriver.com> wrote:
>
> While enabling systemd, there is QA issue:
> ...
> |ERROR: sysstat-12.4.0-r0 do_package: QA Issue: sysstat: Files/directories
> were installed but not shipped in any package:
> |  /lib/systemd/system-sleep
> |  /lib/systemd/system-sleep/sysstat.sleep
> ...
>
> Set --with-systemdsleepdir to fix

Is this actually right though?

https://www.freedesktop.org/software/systemd/man/systemd-sleep.html
says the files should be dropped into /usr/lib/systemd/system-sleep
(that would be /lib/systemd/system-sleep in our configuration).  By
moving the files to another directory they'll be packaged but not
loaded by systemd.

Ross
