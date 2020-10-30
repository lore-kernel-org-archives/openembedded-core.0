Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web08.14540.1604068924389005186
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 07:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ldlr7kRu;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: raj.khem@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id o9so6878447ejg.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 07:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4CCNJLGC6f/7cWVEneTsiPZZ1oi9b6JWU8Ysr1jEBYQ=;
        b=Ldlr7kRuIsoxORf+k5Llv0OYjNhRpCtQRezhqr6uKuPCtUm72+xsppqL343O02QlVn
         gFRSTeNuRmr4E6HRZxN6YaH1t05EXkBO1sBwc3Mcbovp+mzQeQ4uLgWjftQZ0Jm3WZRf
         lIxcK6jSSODgBOK9tc6aHrEDlFK9Kden/84JA2Ld4fM9OcB6vJ26AbBun58YragkrzQZ
         O1SxbpmpH8yRRFgAeMzKa9YKB61R2pZpo5MioEnWZnkE/NVolGs3qet6Hmymy74+t5jN
         tRbTOpKM4XUfBMal3kNfrfV0aQGsY0fi4O9tIDPtLHLBwWll5LA9bNQ/cxmoGDcPxiRt
         GMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4CCNJLGC6f/7cWVEneTsiPZZ1oi9b6JWU8Ysr1jEBYQ=;
        b=qSqpCmAsmKDbwLET/Wp6zciifsg93NT+fM7iwRv8iZxSw/AOl0m4CX93myG7jQnl/m
         VUfm5xVN0mfecLTdFLVbBZmGJjdZ1RTtUM6NAh5Rd2B3K4RsRHCSaOTga9JUp7MvtBgR
         EBHoqD0D2tEllYDN6mSzLFAEqgg8rLpaEblAldnfSmtX5fOaTXs72Zkyg5x+f4kE7P7K
         e362RuEzHPcXUFGujELxspWn0B6wqd+pUGzuzc7sMJvWA4OcziaK/VNHrNl9ANz5cJx+
         K7xdcy646vmFFU8d0J4k97FbWiiQexNwRQX0GyJcUoXMGF++zvfR19xCcfpVHwh+r26p
         p3VQ==
X-Gm-Message-State: AOAM531kcxs6htbilElCW8oiQEnZKo+5DWcR6daKPs6psN59hkHM2+Da
	6/yN+FDgnYL7y+PxPUGprlgXEdkk1np/vOFuvd7wkwB9gRI=
X-Google-Smtp-Source: ABdhPJxw5nTK71W3Ve6oSiyVchwSr1hbMstCvHZIgy1f8ly7H04MabEoQuTe0AnE03GDgYyjs/4+ui4yFHBNzOn8wHg=
X-Received: by 2002:a17:906:7e0b:: with SMTP id e11mr2936636ejr.217.1604068922919;
 Fri, 30 Oct 2020 07:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201030054703.422319-1-raj.khem@gmail.com> <CAK18fxHc0AObD7MFbvrY6teGr5VqoFkTck=NBfCbj2V47dZYxg@mail.gmail.com>
In-Reply-To: <CAK18fxHc0AObD7MFbvrY6teGr5VqoFkTck=NBfCbj2V47dZYxg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 30 Oct 2020 07:41:36 -0700
Message-ID: <CAMKF1so-90wzS36YHJhzhdCBVtf=Uz3m9BxzmRghi_6EV0sksw@mail.gmail.com>
Subject: Re: [PATCH] musl: Add .file directive in crt assembly files
To: Andrei Gherzan <andrei@gherzan.ro>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 30, 2020 at 5:07 AM Andrei Gherzan <andrei@gherzan.ro> wrote:
>
>
> On Fri, Oct 30, 2020 at 5:47 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> This helps linker to noot emit absolute paths into .debug_line sections
>> of liked binaries and libraries and therefore make them reproducible
>>
>> Reported-by: Andrei Gherzan <andrei@gherzan.ro>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../musl/0001-crt-Add-.file-directive.patch   | 300 ++++++++++++++++++
>>  meta/recipes-core/musl/musl_git.bb            |   1 +
>>  2 files changed, 301 insertions(+)
>>  create mode 100644 meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch
>
>
> Tested - works as expected. One small NIT to maintain consistency with the Glibc fix: ".S" vs ".s".
>

.file directive is to specify the name of the file so it should match
it. In glibc the files are called .S because they are preprocessed
through gcc
where as the musl files are pure asm files.

> --
> Andrei Gherzan
