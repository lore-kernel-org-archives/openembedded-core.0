Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web09.1037.1618450163824186108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 18:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CG0zARhH;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id x8so19166129ybx.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 18:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZEId5wg9Oof7UkxqNmAmw4mmG3yYDBdvylT29CHRuFU=;
        b=CG0zARhHa8KoZpQLx63PK7PddVNJc3b7py/XSN4FARl7/fbmPGPYrBgeSvuFpC8Nuz
         p3pxyepJ8PxB9djHffyjKuilUjWx3ATa75Y0MUOm++Ol9Z3rQfkQnQdSULVeNCVk7wLm
         CGQvqPFQ6eVrnN43pizxjR/1OZRGI04a+W7uT9AZY6c1gy4EVLkc2jw6KUq25/ase8FS
         nBQVcyz6VVq+t2V4qWbPmsTp5zMZl8XRVjUqL1UXkm5EhnUkM+TZMT5OrSezZE1KD2m6
         +Pj5Sirn46R6iJhR+GxXVsMMV17Oijnq1rUtUYXQZ8VB0Wo7B68jG7PubC0C2L1Uh0PB
         BMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZEId5wg9Oof7UkxqNmAmw4mmG3yYDBdvylT29CHRuFU=;
        b=Ou+gX4r6+ud0z/+u3ZW8ccWr4oo9NjcgsaQ6akoeMOsn/U3IXsBUBX0iLZ7Cwke1o8
         mEEpf5tPllmVLNpupAoeQt34sL/ojakBVjdNjn+l2Clc9NC4+oTIZONF7JCGQZkgYa/g
         GCLg1CeUOHOLMKB/64HyAK5ptCLO8an041/XIsd7N4UHn/gzZ8Yfh60W7UATgt6bhQlQ
         T6W4jelissTBuFoy6H9knbDRc4lrMTKZ2LlLeuFWxsXIo7GC6yRQcJHDcpqP5TGHQryg
         SfXzAMSzPdz9pweBoXXDrrcKJCW5YlKb80cmbDeg+J1L6uZPCjEpWW1c/U3TUrqAa5E7
         hF9A==
X-Gm-Message-State: AOAM532yNfizrFsRhvPZxF1+vIlZJ6fIR864ZN1JZ36tzCkQfxh+Hbe1
	SKK0jm8sYX9dljtF+HE3VYAsX7mTv46lDlNCiGLld40hN8s=
X-Google-Smtp-Source: ABdhPJz7gVUYtT7oHCH5/AFje5VU1f6wS4Kd5WkhJetkVoGfUV+zW2nClVM2h8gdZV9hsZm0eHdqWnzbraRyJVjzUYA=
X-Received: by 2002:a25:99c1:: with SMTP id q1mr1050880ybo.517.1618450163019;
 Wed, 14 Apr 2021 18:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210414164018.2027379-1-raj.khem@gmail.com> <20210414164018.2027379-3-raj.khem@gmail.com>
 <0ee405c8-6482-7d0c-67b3-6b80a8a17d23@windriver.com>
In-Reply-To: <0ee405c8-6482-7d0c-67b3-6b80a8a17d23@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Apr 2021 18:28:57 -0700
Message-ID: <CAMKF1srUb2nxOnYYF6XT63Jk4xyjn-f5Wfgt61uHE9VKSag7cQ@mail.gmail.com>
Subject: Re: [OE-core] [v2 3/3] valgrind: Add libstdc++ debug symbols for ptest
To: Yi Fan Yu <yifan.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 14, 2021 at 1:46 PM Yi Fan Yu <yifan.yu@windriver.com> wrote:
>
>
> On 4/14/21 12:40 PM, Khem Raj wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > new/delete symbols are needed by overloaded-new.post test
> this test is passing on master-next on qemux86-64.
> Is this failure caused by gcc uprev?
>

yes. gcc 11 uses dwarf-5 and its looking for filenames in debug info
for libstdc++ which when not found are flagged.

> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   meta/recipes-devtools/valgrind/valgrind_3.17.0.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
> > index d8324f1dc6..4eb948f2db 100644
> > --- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
> > +++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
> > @@ -136,7 +136,7 @@ RDEPENDS_${PN}-ptest += " bash coreutils file \
> >      perl-module-file-basename perl-module-file-glob perl-module-getopt-long \
> >      perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
> >      perl-module-carp perl-module-symbol \
> > -   procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src"
> > +   procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src gcc-runtime-dbg"
> >   RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
> >
> >   # One of the tests contains a bogus interpreter path on purpose.
> > --
> > 2.31.1
> >
> >
> >
> > 
> >
