Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web08.1052.1607020277596390998
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 10:31:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vMS0CcrR;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id q10so1781092vsr.13
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 10:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w+PM26qEmclIjXliZlhO9rA+Rd9FfQHGn/cTMyhHXCk=;
        b=vMS0CcrRbZj91J1qowmgLK5Sq1fljgoazs2SeZO+bAM5RMoQzoDfQCeuDiM6n5YANc
         PDM6DXkqdptY4JTNC9VWI70A6FtLF9PXxN1ylP8dVPbYHsusBLgJYK4ae+zffL4JgRr0
         04HG8WfudA7zVwwmAepJLNP8XxISehcE7Lu84rm2lwaqULC0Mfmf4l1xnpfmKRHd/aKr
         FamjTq+DpntL2nLfbvyNut15B+CE98BytWw3OolcGg6VgDyCPY/hZFViAyQdDS9WGJwD
         KQ1ljxFDaEXxag5WcDwfJ3TnXItjlI0LD1E2fIak7s6BR0S9+r7clC5UTRnLxzgJQu3V
         nDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w+PM26qEmclIjXliZlhO9rA+Rd9FfQHGn/cTMyhHXCk=;
        b=NFKTpj8dMlg2yojMAwp4GybFVHrfzAGhcA9fQRBVMnziGh54oSipwSSjPumr3vlaAc
         YWvPAjFfIHvTKL5dBid82l7LvnD2MsV/HEvr+SINfs6p7mpAbtUd9c6a8dqt2737j/EC
         S9ojBeJIp8bkypz4s1DA/RyC++lTFJbV0F1GL7ueiOKTBNCOSuo2PJGLj1DLX4lknNlF
         7eBWJlmGh2smHEwvkFJqRQS8fHcxYk4JHVEU1OLJbIgBpC8YZL0OypQeG4dzVna720zL
         8S3h/CEdLeHGZBpRXiQS+2ZMDF0JBl2b/Wha7pTYIAkb+9lRQ8umB2vHgsP1nPcUXHEm
         KCGA==
X-Gm-Message-State: AOAM530uo2ATIv5b8X+5ZfdGiqVoiiAk/GGJZL8IGiNCmiZ4h8KM258w
	NqWzBRJBFWHhvz5oY8FvM4mT34WeejvHt3yBeLM=
X-Google-Smtp-Source: ABdhPJzKo4vMPZfvfkOOj7vvIrMa5Uqo9aakiW6/rNTA2QiOeQ5MH41YnHFFlRmo7SLu6S5T+ocvSvsHXAb7iseBRG0=
X-Received: by 2002:a67:3354:: with SMTP id z81mr668426vsz.18.1607020276710;
 Thu, 03 Dec 2020 10:31:16 -0800 (PST)
MIME-Version: 1.0
References: <CAAnfSTuCTy4U60iJwtMm=N1PEaWjz6XyL_idgRXJVbzuLHggUw@mail.gmail.com>
In-Reply-To: <CAAnfSTuCTy4U60iJwtMm=N1PEaWjz6XyL_idgRXJVbzuLHggUw@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 3 Dec 2020 10:31:05 -0800
Message-ID: <CAJ86T=X0YxHN3RfFd7ECDDs=Y6nza_EgckTYc_ON+2ikcUeqrg@mail.gmail.com>
Subject: Re: [OE-core] Automatic cap on BB_NUMBER_THREADS and PARALLEL_MAKE
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 3, 2020 at 9:48 AM Ross Burton <ross@burtonini.com> wrote:
>
> Hi,
>
> Currently, BB_NUMBER_THREADS and PARALLEL_MAKE use the number of cores
> available unless told otherwise.  This was a good idea six years
> ago[1] but some modern machines are moving to very large core counts.
>
> For example, 88 core dual Xeons are fairly common. A ThunderX2 has 256
> cores (2 sockets, 4 hyperthreads per physical core). The Ampere Altra
> is dual socket 2*80=160 cores.
>
> At this level of parallelisation the sheer amount of I/O from the
> unpack storm is quite excessive.  As a strawman argument, I propose a
> hard cap to the default BB_NUMBER_THREADS of -- and I'm literally
> making up numbers here -- 32.  Maybe 64.  Comments?

Since the default should be the "safe" default (and users wanting or
needing more are expected to profile and tune manually) a cap of 32
sounds reasonable.



> Cheers,
> Ross
>
> [1] http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=1529ef0504542145f2b81b2dba4bcc81d5dac96e
>
> 
>
