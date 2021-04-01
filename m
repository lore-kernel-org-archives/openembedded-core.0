Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web08.2162.1617243980186560661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 19:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IBwQSx9N;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id y5so848445qkl.9
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 19:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VGJPvEHdetF1+KlH6NGqaQK+NhcnbCOT5HHvp4cTHsc=;
        b=IBwQSx9N8UxTHgjKNKrTmD0SbmTuPevVi0N6SH2422ih6J3DYPxXsVnNXMkk1Zqtll
         9zvbtasUX7YQQR55czBHMfWryGrYPQqiWMp+vU3RF75hs5vd9j4m1tHmklivEg9Dm+uG
         S3ce5i8Qy9MwBSmye3YGM4pOr0J6H5lUx2b+3Eg/EOvWasBO2jDGmFBGrWON5KBrpJZw
         Zf4Qmq3vDjx5EEi5oLQbUZ3xk1ulhx4mReODjVqQfUAMTIb7GJKUP14qVlXq593ZW9Zn
         dsnb3G5wlVgwSZ8WSSLnSD5xhnKq8SepSfCn2P1e4czywe8PPKzzlCdat501Zdrff//m
         c1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VGJPvEHdetF1+KlH6NGqaQK+NhcnbCOT5HHvp4cTHsc=;
        b=qELkIWSRRSyU8E56If2hDW+k38YCJUWLs63gMt6W5oBWuUklTTu6hju68/Tct7xT/j
         paGciUuqEZVeH6e0KGa4us+1cy9EmmE2jyRETXeHti0JQjfsDhM44xfqn3BW2lTdhSyl
         PPdOUJGGlz9G8CgyQRI5QI2ky/zcPNUuWVQ+Whsao84gvsmzRAgJRJi7Q/FCC5RHsOjp
         XmgMxTmqp9poqEGQWJgYMF16dq50dLH1vkDVCmgzjZU6C9h/LUtXBrqY3UBdakJONlvM
         udEw6jt790sqEYiY0opLdf0p2ilTaecHsSybyOJ0qgSe8SMCzPzmTVEnp43vSflJ/54L
         MXAA==
X-Gm-Message-State: AOAM5323HBTrLch19co/1mg93Y0wNsEIqIibek/kgn1foFw0fqUuXfBA
	pPQS4fdBxlbXO35MYWLbTH8cpZ98YWHTMWccaiI=
X-Google-Smtp-Source: ABdhPJwyisTlS3up7WExStfjUgZQ2dTYW2tjVH5Yw6UB983qGL/Xh284vrvIFgPsM63tYgU5h8v4qL6boVj7sEedq0o=
X-Received: by 2002:a05:620a:12ae:: with SMTP id x14mr6306979qki.25.1617243979273;
 Wed, 31 Mar 2021 19:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210331104608.7047-1-Qi.Chen@windriver.com> <cecb5490-9149-5663-32d1-a1d1ae65507d@gmail.com>
 <9471558d-7ade-f108-4475-773539b11097@windriver.com>
In-Reply-To: <9471558d-7ade-f108-4475-773539b11097@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 31 Mar 2021 19:25:52 -0700
Message-ID: <CAMKF1spRggzoA2aeA_66saqkHCQHw5rQO-jh4VyAhNvyi8YNBg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] apt: Fix do_compile error when enable ccache
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 31, 2021 at 6:38 PM ChenQi <Qi.Chen@windriver.com> wrote:
>
> On 04/01/2021 12:00 AM, Khem Raj wrote:
> >
> >
> > On 3/31/21 3:46 AM, Chen Qi wrote:
> >> When apt was upgraded, the '-DCMAKE_DISABLE_FIND_PACKAGE_Zstd=True'
> >> was dropped. However, it was there to fix do_compile error when
> >> ccache is
> >> enabled. See details in the following commit.
> >>
> >> """
> >> commit 0aa7d612b8b7e5f14b4ed38f2a32b3f7eefca31c
> >> Author: Robert Yang <liezhi.yang@windriver.com>
> >> Date:   Tue Jan 19 01:23:45 2021 -0800
> >>
> >>      apt: Fix do_compile error when enable ccache
> >>
> >>      Fixed:
> >>          apt-pkg/libapt-pkg.so.5.0.2: undefined reference to
> >> `ZSTD_endStream'
> >>         collect2: error: ld returned 1 exit status
> >>
> >>      This is because ccache-native depends on zstd-native which makes
> >> apt wronly
> >>          find it. Disable zstd for apt to fix the problem.
> >> """
> >
> > should this only be disabled for apt-native then ? and perhaps it
> > could be turned into a packageconfig knob as well
>
> No. It should be disabled for both, and mainly for the target apt.
> Because apt sets 'CMAKE_FIND_ROOT_PATH_MODE_INCLUDE' to 'BOTH'.
>
> The packageconfig also does not solve the problem for the current codes,
> as the zstd dependency is added in ccache.bbclass via python anonymous
> function.
> To make packageconfig work, the apt upstream needs to be patched to be
> able to enable/disable zstd explicitly. But there are many other
> 'find_package' in apt, they will need to be changed in the same way. Not
> sure apt upstream would be happy to do so. I don't think It's worth the
> effort.

OK thanks for explanation. I think this approach is fine for now.

>
> Best Regards,
> Chen Qi
>
> >
> >>
> >> Now we are meeting do_compile failure again when enabling ccache, so
> >> add it
> >> back to solve the problem.
> >>
> >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> ---
> >>   meta/recipes-devtools/apt/apt_2.2.2.bb | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/recipes-devtools/apt/apt_2.2.2.bb
> >> b/meta/recipes-devtools/apt/apt_2.2.2.bb
> >> index d1aa5de8df..7d1bce558d 100644
> >> --- a/meta/recipes-devtools/apt/apt_2.2.2.bb
> >> +++ b/meta/recipes-devtools/apt/apt_2.2.2.bb
> >> @@ -44,6 +44,7 @@ DEPENDS += "db gnutls lz4 zlib bzip2 xz libgcrypt
> >> xxhash"
> >>   EXTRA_OECMAKE_append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
> >>       -DDPKG_DATADIR=${datadir}/dpkg \
> >>       -DTRIEHASH_EXECUTABLE=${WORKDIR}/triehash \
> >> +    -DCMAKE_DISABLE_FIND_PACKAGE_ZSTD=True \
> >>       -DWITH_TESTS=False \
> >>   "
> >>
> >>
> >>
> >> 
> >>
> >
>
