Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.7157.1601184238441351692
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2020 22:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LRVx59BH;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id w16so7234287qkj.7
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2020 22:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IQzC1XBlFgEN8FwNcAV6YyP9ALFA5jNGM6TqgozRNFE=;
        b=LRVx59BHw3JRAvne8jf3XJ+YJuLhC9mydmk4RiFcdcMhQ8xQwN96GrbnqFkFXa07LV
         kmWZ4OtnLA7Ml1FQ0HVMMN+1colWiUxnVk6gTfDVGjWWoel+RcUEaJxmCJnRY8oNNxwP
         +TNS7z2JbqUNYN5tG6qtROByqqfdaVONyba1so1YnDwnguHSSYgi6MwLxF+l4q2RHSqO
         UN3MB5foMLMryzdMJoZRIl1wvxEcJMiB1AGnBNeOAOw/qP+hcaEJ5Y1rJLZkcQOJ95GW
         P/IdIfaQ7VnoQKA5RPZ6diyycXoVfg50OdrrJ+LJs01qYMje3akfvtMHiq4CsTLnBkvA
         ciIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IQzC1XBlFgEN8FwNcAV6YyP9ALFA5jNGM6TqgozRNFE=;
        b=jX0J4ChP9BRuc7VXniZAdRWOzHw76HAKdXUMXV8s/wctwbhcYOEYmNfmfpTOZAFIw6
         HOSFgKlvtKqXlYMMrh5+dLtSiV1x9qDR9QOgGkq6SzMrMCEX6htqBYeWiMLV1cQjSjN9
         4Lc8DudHtRro2tdrt1IVMLN0x0j9bCe9FGflkgI7xwSALiVcKMj5+xCuddI1zgPjgHM5
         X31nEJfTOrXPhfu/tFQA/j5Fb+Q4tsS/4Fn5giiIlM9HkpF51IoFpAnBUlGiBJuyfgNM
         acd/xV9LtD+pTMmU8torNCveykUHRqb77mgQK0jF6VVqdTiI6Dcroer2tRZbwidi/Qdp
         W+iQ==
X-Gm-Message-State: AOAM531aM/BKwy7h0U8SqXCdRrL+WtBLC50LZwmfMxetEgaFYswzr2eP
	WxEvouJriQkgadzqee7ic6A6GvLeFdfK39h8q48=
X-Google-Smtp-Source: ABdhPJxOO/k4GQ4uy6B3afKq0PMAH2AZb8vX7YZV1T24uIU6bj2IOBcCBbmq5Xi2HZhB9lyyO8N2oKVtpKdVSzxaxkU=
X-Received: by 2002:a05:620a:13f6:: with SMTP id h22mr7171328qkl.9.1601184237547;
 Sat, 26 Sep 2020 22:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200924195800.4164634-1-otavio@ossystems.com.br> <CAAnfSTvrT7_40JPPpeNM7eJouLK7e0VELGRMHgd-VjKSfa+y5Q@mail.gmail.com>
In-Reply-To: <CAAnfSTvrT7_40JPPpeNM7eJouLK7e0VELGRMHgd-VjKSfa+y5Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 26 Sep 2020 22:23:31 -0700
Message-ID: <CAMKF1sqedjE7NbVH_Bqt9Zw7vgjVopULnAz4u_-3u4vsWrYtUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Allow enable/disable of rng-tools recommendation on sshd
To: Ross Burton <ross@burtonini.com>
Cc: Otavio Salvador <otavio.salvador@gmail.com>, 
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 25, 2020 at 2:58 AM Ross Burton <ross@burtonini.com> wrote:
>
> On Thu, 24 Sep 2020 at 20:58, Otavio Salvador <otavio.salvador@gmail.com> wrote:
> > We are adding a new PACKAGECONFIG option ('rng-tools') to control if we
> > wish the openssh-sshd to RRECOMMENDS the 'rng-tools' package. We are
> > enabling it by default so there is no behavior change.
>
> Is this fundamentally because many targets now have hardware RNGs that
> the kernel is using, and so rng-tools serves no purpose?
>
> This was originally added with data from iMX6 (oe-core
> 9b01375236e19e3366c58877c4154d7c71632984) and I'm curious if this
> followup is related to other improvements that have been made to iMX6
> since. Is there a better user space tool, or is the kernel using the
> hardware RNG out of the box?
>

perhaps haveged is an option to consider.

> I ask because I'm strongly tempted to argue that we should be assuming
> that a RNG is available and let BSPs turn this on if required.
>
> Ross
>
> 
>
