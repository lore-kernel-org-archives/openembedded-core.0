Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.13026.1591188516006032690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 05:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@globallogic.com header.s=google header.b=PkNugkPc;
 spf=pass (domain: globallogic.com, ip: 209.85.219.65, mailfrom: oleksandr.s.popovych@globallogic.com)
Received: by mail-qv1-f65.google.com with SMTP id e2so985427qvw.7
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 05:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XfH16xOivihUE4oPE0L4kAP0y78Pqk3im2yqN+f+pzw=;
        b=PkNugkPck7Us4K6dxe+HlzyH6TaLXAWzxjGaxwX3UL1zkjhZz2iq03Iex5eA5pr43O
         frZLkXKL90nZmAJMI4/CEaIwINAt0+HzGvY5bxIKQWnw47Iwv5OlBigeurpZUOHwv0Ae
         0dyBd6AJpcKrS3v96Wfl2ZVngDuiyfQnw41tEnJltf19KZ0k0GiyjN6WK24WVHWYTcmp
         K3mtJr3IkJYAvFVFUxtorIJaFzA4Vog94uR8bdbCqr1/fK3O5RO5hQsQ/ujpcPTYd9ZG
         +t7OSLHtywKl8AIvr1upe5D7seZLqJaPpYkrppmjpRJhS7HlwADRnAbV50PkKUI3ue62
         BIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XfH16xOivihUE4oPE0L4kAP0y78Pqk3im2yqN+f+pzw=;
        b=ndBuxru2/oA3Qzi6kzRFgt3kb05HOcAiILPromz6gKOBECaNxCD9IltK2Vk5A3N5N6
         QuX92pdc2c5CV1A6x4WlM2nBmTLk3DKCy8Cj8GCBWv0P90FfOHTjsgh9efBNdRjZlchM
         LoOMkAOr+fKQNh+SdWxx9nj54h5HPPFOFJAz3C9JcgsasH5qMzWkDaVL9g1VpSxNsNji
         WazN34XdhrbcOHZAssVrmhvpxOuPLxlbfP+LNw3NVFbKyJRKq/CGL8qnjlYISKuGkeNQ
         0AcVt+23M1mzMbm6VsSd4IdbAAluNMdyCUU66q1DsDQF/IPb/AvY4RAoVFdLdu49XuoT
         1fqg==
X-Gm-Message-State: AOAM531JSoB5BJSSI1s1c4Xj6pBBeAT685aPp30PSxq5dv4xe+zzqZaX
	0h0k6wHv/SUo0nStSn+PjwEr+lsqf1NznQJT+R8nDA==
X-Google-Smtp-Source: ABdhPJzVFqAnp6qn0P6LVH44LX3RoEhlDzm1A4wz5DmeLXSiMh++uo2QshCVlLsep7yZ8vCojkvTdfuDDN7+3G2Q5u0=
X-Received: by 2002:a0c:bd9a:: with SMTP id n26mr29035893qvg.21.1591188515033;
 Wed, 03 Jun 2020 05:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200430165529.23657-1-oleksandr.s.popovych@globallogic.com> <9c6bfc2b37121a36c866bffff3f72efe91e847aa.camel@linuxfoundation.org>
In-Reply-To: <9c6bfc2b37121a36c866bffff3f72efe91e847aa.camel@linuxfoundation.org>
From: "Oleksandr" <oleksandr.s.popovych@globallogic.com>
Date: Wed, 3 Jun 2020 15:48:23 +0300
Message-ID: <CAKqUGW-3RDNU1SFmy9egAbPv8AEOfGBHWb9o34O0P2TxF3boMA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v8] expat: Added ptest
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Joshua Watt <JPEW.hacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello Richard, Joshua,

On Mon, May 11, 2020 at 3:45 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> ...
>
> Thanks, this is definitely getting there. There was only one test
> failure this time, with meta-mingw:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/1884
>
> I've cc'd Joshua in case he has any insights on this.

I`ve tested my patch with meta-mingw layer on my host and it seems I
have fixed the current compilation error, with making some changes to
meta-mingw (by changing "CMAKE_SYSTEM_NAME" variable to "Windows"
value during toolchain file generation in
"recipes-core/expat/expat_%.bbappend" file using a
"recipes-devtools/cmake/cmake_%.bbappend" file as template). However
this is only part of a solution, because another error appears next to
it: gdb-cross-canadian that depends on expat now fails to build,
because it can not find a proper expat library. It seems that expat
recipe, which was switched to build with CMake in my patch, does not
generate output library in proper format (it compiles only
"libexpat.dll.a", when the current version of expat recipe from
upstream, that uses Autotools, generates both "libexpat.a" and
"libexpat.dll.a"). This is such an error that I can not figure out how
to solve it by myself, so I ask for help.

Additionally I would like to ask you: How should I send patches now
when at least two separate patches with similar purposes should be
sent to different layers (one for [OE-core] and other for
[meta-mingw])? Should they be connected with some kind of cover-letter
or is there another option?

Thanks for your attention.
