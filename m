Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.97196.1597870979041865677
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 14:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20150623.gappssmtp.com header.s=20150623 header.b=jx1kBoBy;
 spf=softfail (domain: sidebranch.com, ip: 209.85.160.170, mailfrom: leon@sidebranch.com)
Received: by mail-qt1-f170.google.com with SMTP id w9so18935713qts.6
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 14:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4s1ZD3XvNyFSV78KjJNp6l1PddIvM2tO/xjVLi6q5Vw=;
        b=jx1kBoBys21f4q6sfkghY/CuDjchdkiQVqAWlNFHZm+2+5VpgJyAX99xGPF0YKNabS
         AFNIjMuzl/pZFhvaqCOZMMmM7AFVyti+fqrY9/pN4EB8ZsM/CoNMOPfrTSsRDvuDIhb4
         j6jLGekopw+2Ifj0ArFHrsMYN9nnvC2Ckd6VjzqS1Ev78NtqJxqBAmP0nDzkthHhR4ia
         i0VzwcZkN+GJ+4zS599PzB7nNS7ced6CVkrM5mvyYXmn0yNqRrTA+62giS6p6E9pAwZP
         fpauQQjnA5izmi5iHQ+5h272AIhD23qhX0R7EDmmTBZmB5QS5tp34vdUtjTXiAW7TbAk
         UZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4s1ZD3XvNyFSV78KjJNp6l1PddIvM2tO/xjVLi6q5Vw=;
        b=UPefziMau7FSLh+I7VtOjwNsdJdDHWI8XqhgWO20fKNO2bEpCLCVFqCVFjNprthaKe
         8MZA3PMWyU7kf5bk3tdfJgzpe2yIUsBoyqQGDMR5O90/n9KMMnom+rjce7OJvjX07Pc4
         dkN+TrZIJb0fO9UNcbyni2Gyk9RUZI1P2A4zvKkEE0Kj1oMnqtrxEAs8Pbfvn35OOgd7
         pG4baYe3x8gh8WtP/66kO3dVrDeZJ1ZmjETtDr2+XcG7tu7nl4+XD9X9SzcFO2GdK7fn
         VMYLyy/s6kaUfY6LSmabPZ/U2LrnVpNXzLk4teIQpKfU06yb8k5okH0gvXBLzSoEetsc
         E52A==
X-Gm-Message-State: AOAM533YwfpKu7orBZAT3TC5uut7qB3xVcrVhZ9cHK3cY8xi4bUWkqby
	8K5DoDv+0G5W2yEj+L5iC+WhJDK1RwmoZ5cpde5H99siyz92j7oP
X-Google-Smtp-Source: ABdhPJxKGI5iG2vNN+r290f0DAkG52SjYMYkorHNLDz+MTKUs24axUokkrnzLRiWPBu+mr7r7fMg2w+qYgPtG+Yz5sE=
X-Received: by 2002:ac8:c0e:: with SMTP id k14mr25508591qti.364.1597870978037;
 Wed, 19 Aug 2020 14:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <162C17C3E9BAC6AE.7353@lists.openembedded.org>
In-Reply-To: <162C17C3E9BAC6AE.7353@lists.openembedded.org>
From: "Leon Woestenberg" <leon@sidebranch.com>
Date: Wed, 19 Aug 2020 23:02:49 +0200
Message-ID: <CAMjhiJhwiAH4Wuvdom5VkD1aL=2wAEHg1n9Pb-QVsaO=qk6cQw@mail.gmail.com>
Subject: Re: [OE-core] -mmusl missing in SDK / CMake MUSL toolchain
To: Leon Woestenberg <leon@sidebranch.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

RFC:

During the creation of the environment script for the canadian cross
SDK in toolchain-script.bbclass,
for a MUSL C library target, the OVERRIDES contains libc-glibc instead
of libc-musl.

OVERRIDES=task-generate-content:linux-musl:x86-64:pn-meta-environment-qemux86-64:qemuall:qemux86-64:nodistro:class-cross-canadian:libc-glibc:forcevariable

This can be easily inspected by adding these lines to the script
creation (Thanks to Richard for the suggestion on IRC).

        echo 'export TARGET_CC_ARCH=${TARGET_CC_ARCH}' >> $script
        echo 'export OVERRIDES=${OVERRIDES}' >> $script

This append at the top of toolchain-script.bbclass is thus without effect:
TARGET_CC_ARCH_append_libc-musl = " -mmusl"

This works:

TARGET_CC_ARCH_append_linux-musl = " -mmusl"

(notice linux instead of libc, as linux-musl stays present in OVERRIDES.)

I have a (minimal) test case here. Run make in the cloned repo.
https://github.com/likewise/oe-musl-sdk-cmake


Regards,
-- 
Leon

p.s. sorry for the HTML sig earlier.

-- 
Leon Woestenberg
leon@sidebranch.com
T: +31 40 711 42 76
M: +31 6 472 30 372

Sidebranch Embedded Systems
Eindhoven, The Netherlands
http://www.sidebranch.com



On Mon, Aug 17, 2020 at 5:28 PM Leon Woestenberg via
lists.openembedded.org <leon=sidebranch.com@lists.openembedded.org>
wrote:
>
> Hello all,
>
> Compared with a BitBake/CMake built of a C application, the SDK/CMake approach lacks the "-mmusl" flag. The resulting binaries of the SDK do not load on the target (wrong runtime linker/loader).
>
> Minimal test case here (dunfell), just run make will show PASS / FAIL for BitBake and SDK approach:
>
> https://github.com/likewise/oe-musl-sdk-cmake
>
> Has something to do with TARGET_CC_ARCH not propagating, investigation further...
>
>
> Regards,
>
> Leon.
> --
> --
> Leon Woestenberg
> leon@sidebranch.com
> T: +31 40 711 42 76
> M: +31 6 472 30 372
>
> Sidebranch Embedded Systems
> Eindhoven, The Netherlands
> http://www.sidebranch.com
>
> 
