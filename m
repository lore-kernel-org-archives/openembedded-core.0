Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web11.5114.1593168780335850569
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 03:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Ik4SQWOO;
 spf=pass (domain: burtonini.com, ip: 209.85.167.65, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f65.google.com with SMTP id g139so4890419lfd.10
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 03:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vrBXSTgvce0ugW6RTtdDbnP84a/DMgC8r008/axDXd0=;
        b=Ik4SQWOO4V0oC223JmWJag76fkjq1gWPsOuZTzRk9ED9oXcAzQ0471g43GCAULCwpT
         9JgPhuO04Hml/Y5vMxL+oc/HTpqyR72klkdAleXe1s+64HKlIT1kOTldKDnRoPpGmL5p
         v5ZOx/vQCyAv0hmdJNB2kDS9A+JWdIP+Dt2/Dzi0HOkx9N1hdd2blRmOwKa3pQIA6kUs
         eX2hzuZW9EBCjL0TU7+cbwR8sKpHP+sJT85avbNaxzwyeZj9gITupHtzyiS2ctk7f9ha
         wWNRGJrruvq2jgItw6JJtKLlCrGqj2XlSYixty3m2aiUC97GJ4E/1hP84XcMAkcrOZdC
         st8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vrBXSTgvce0ugW6RTtdDbnP84a/DMgC8r008/axDXd0=;
        b=E/MRRiE22/NugWxuxol3ZKQYU8qYkd+TvJoeiTwqzlkOMCoYi28677oUmxIrurJmMx
         tkPQwKjL9tPiut2l+yH57FlnxmWbwohToeVPJvLnmoP7UKS/ib71kF00D6K3F5ywQaCF
         boc3FwkT+cd2xqdpMkNbbTV6Y27FG7x1mk9A8burggNj7iwRo5qZd+1vMwBHgh4mbx0B
         fuKYlCdRx1k2LvQaGYuRxJI2DgV9NouD5B6if5A5xu3ht6DgR2dnah8PJRID0O0/f7v7
         AlR9DT5DKAAaEb07xs21bqEv8QUJtCPw7/ZVaCh/Qc0oFEkylCu0yPGVt2P7dMZnudDJ
         pxbQ==
X-Gm-Message-State: AOAM531x47S+8HOZ4x0uKoNReWJkPADb2s240LERlyYA8V9iCRymrlpn
	vGV4EXLZF3IfVgF4uzIL7jeB/7SKN1AEY/gd7rmNhg==
X-Google-Smtp-Source: ABdhPJy+cKZss+vxHdIWDoiOf0qQWn/BTMbq28PZLsHhTWeir5tBMPA17Tv094IBcSG5FP2p5FIciQpPWmB6kvnQZ64=
X-Received: by 2002:ac2:5296:: with SMTP id q22mr1514608lfm.106.1593168778337;
 Fri, 26 Jun 2020 03:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200625101413.2783-1-fredrigu@axis.com>
In-Reply-To: <20200625101413.2783-1-fredrigu@axis.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 26 Jun 2020 11:52:47 +0100
Message-ID: <CAAnfSTuK-ucvmFTK9+oexvPyaXgTg4Tn3nhKSMwjhRxe=NUXrw@mail.gmail.com>
Subject: Re: [OE-core] Add package managers as a plugin
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal@axis.com, hugo.cedervall@axis.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jun 2020 at 11:14, Fredrik Gustafsson
<fredrik.gustafsson@axis.com> wrote:
> Poky today has three different package managers, the well-known formats deb
> and rpm is supported as well as ipkg that is good for embedded devices.
>
> When building and having a good cache hit, a significant amount of time is
> spent in the phase of generating a rootfs, which is really about the
> performance of the package manager. ipkg is way slower than deb or rpm. To
> save build time and also get a package manager that is suitanle for use on
> targets where flash memory is a concern, support for apk is suggested.
>
> However, it might or might not be what's wanted for Poky since it increases
> the test matrix. Therefore this patch series refactors the package
> management code so that it's possible to add more package managers in other
> own layer. I will send another patch serie that will add apk.

As to the code review I mostly second what Paul said.

However, obviously you actually have strong feelings on this as the
series represents a fair amount of work.  What are the compelling
reasons to use apk?  Five seconds on core-image-minimal doesn't really
sell it to me, I don't think anyone ever claimed that opkg has been
performance optimised, dpkg isn't really used that much: maybe we
should re-evaluate what package managers are supported if apk has
feature parity but is significantly faster or has other advantages.

Ross
