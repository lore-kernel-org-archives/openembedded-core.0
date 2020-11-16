Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.35462.1605538253402286073
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 06:50:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=QIktgTDW;
 spf=pass (domain: burtonini.com, ip: 209.85.167.42, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f42.google.com with SMTP id j205so25507262lfj.6
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 06:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kNHe6C5i7CKS498gSoqjXVFrujUSlW3ie51bURDBmIE=;
        b=QIktgTDWyVq/Lu2UtpZ0i/Z6ApgVsqtWXoR9z2Hc6dPFf00Iz9874UZ584HgQPO43n
         3xXtAIIYvUoF3KFtov/8g+hIJTCyKudU8wKR7nyW3mshHvOO5kEnz8/q2zUJXUXNJDRl
         WZFbb74fWvXTSlJxk/bhYGa594Dns19QKltY9oHlJwxX4VtAzjKOTFfFFBtBoMT0S0ja
         KMibF038u1PfqEROUbx0SSEL/9dNfZRtJHrAK343/I9qLWmmdTwI9sMbq6+1a7FDHxFu
         9zzWQOapOpgaQB/i/4hzC5lSDqGnX2fskjKhqUXKPPQnq4YUhX24PMkCIhy9d+1aLXdh
         h2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kNHe6C5i7CKS498gSoqjXVFrujUSlW3ie51bURDBmIE=;
        b=UmeIPOy1RQMnwwkypDuAPXHOLWIP5Puyg0nj3p2rXswkXfORk9EGswDQGJdEQu+HeM
         zppZmS2k6ojHAuvBEQLyJmOgi00J2JwpD0MAMOXHdERT/Arq+FSSOXNm6hrxQZrZjmmR
         wHO+u3TB4b6nRZP/nizK1rlXlmz9aTlcqUHIyS22DQGpjRWzClDdYyEptz8MRMnSiuk3
         ETSlE58CajcwR233BsyagSzeU/MVlMLjQorMjB3k8w3Y3o0LVz82mNxRsNuUVBzFwhN3
         Xk5G/gc8rxSDGyVKmhcmrL0V9UEKkoXjPE7O51uEdjC9ceRj+q9L8v9AMAX1oDj1qGEH
         E3tw==
X-Gm-Message-State: AOAM531bsxN03Kpiw9+06eA8cfhTGZVHAg5Wt/wBK9pcyqiCvwlGIBFP
	qloxfA0IkKZzjDYkcTXm0L38dZ9vta/Jvqq+Gqt3lA==
X-Google-Smtp-Source: ABdhPJzyTRiQ5d+cRZVowRYf4COyivuuUkdDKQh43Ql3GaTBx6IB0UGCKEuPfnXrzFyJlZIb1F0Vx9KVtn6vZ8iJeo8=
X-Received: by 2002:a19:4296:: with SMTP id p144mr5325450lfa.205.1605538251533;
 Mon, 16 Nov 2020 06:50:51 -0800 (PST)
MIME-Version: 1.0
References: <N8dTusv8HRYbXICsENrr0Xs8dy2xw-8TOU515yBu6Jg1TzOcH3ccglVEvtqNUlRIW-bOM29tttjs6vI6lcldLoX6bmYsRbDBaJAWqY8RTIY=@pm.me>
In-Reply-To: <N8dTusv8HRYbXICsENrr0Xs8dy2xw-8TOU515yBu6Jg1TzOcH3ccglVEvtqNUlRIW-bOM29tttjs6vI6lcldLoX6bmYsRbDBaJAWqY8RTIY=@pm.me>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 16 Nov 2020 14:50:40 +0000
Message-ID: <CAAnfSTvuhY2nYG9P4d3N=fXNu=NWOhYQmRkS3ZKFLsX7EJVx3A@mail.gmail.com>
Subject: Re: [OE-core] Using OE's native bzip2
To: jc.begue@pm.me
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The recipe you're looking for is bzip2-replacement-native.

Ross

On Sun, 15 Nov 2020 at 07:20, Jean-Christophe BEGUE via
lists.openembedded.org <jc.begue=3Dpm.me@lists.openembedded.org> wrote:
>
> Hello everyone,
>
> I'm trying to build a native bzip2 version because my system's one isn't=
 compatible with some archives.
>
> To achieve that, I remove bzip2-native from ASSUME_PROVIDED:
>
> ASSUME_PROVIDED_remove =3D "bzip2-native"
>
> But then I get lots of circular dependencies, running bitbake bzip2-nati=
ve:
>
> [...]
> Task /home/jc/code/yocto/oe-core/meta/recipes-devtools/libtool/libtool-n=
ative_2.4.6.bb:do_compile (dependent Tasks ['libtool-native_2.4.6.bb:do_con=
figure'])
>   Task /home/jc/code/yocto/oe-core/meta/recipes-devtools/libtool/libtool=
-native_2.4.6.bb:do_install (dependent Tasks ['libtool-native_2.4.6.bb:do_c=
ompile'])
>   Task /home/jc/code/yocto/oe-core/meta/recipes-devtools/libtool/libtool=
-native_2.4.6.bb:do_populate_sysroot (dependent Tasks ['libtool-native_2.4.=
6.bb:do_install'])
>   Task virtual:native:/home/jc/code/yocto/oe-core/meta/recipes-extended/=
bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot (dependent Tasks ['automake_=
1.16.2.bb:do_populate_sysroot', 'gnu-config_git.bb:do_populate_sysroot', 'b=
zip2_1.0.8.bb:do_fetch', 'libtool-native_2.4.6.bb:do_populate_sysroot', 'au=
toconf_2.69.bb:do_populate_sysroot'])
>   Task virtual:native:/home/jc/code/yocto/oe-core/meta/recipes-extended/=
bzip2/bzip2_1.0.8.bb:do_configure (dependent Tasks ['bzip2_1.0.8.bb:do_prep=
are_recipe_sysroot', 'bzip2_1.0.8.bb:do_patch'])
> [...]
>
> Is there a hope I could achieve this or should I look for another soluti=
on ?
>
> Jean-Christophe BEGUE
>
>
>
>=20
>
