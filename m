Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.749.1626472361542241218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 14:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fE9VW+4Q;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id c13so5575085qtc.10
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 14:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+ruLMwnRekC6kR/4JMYJ9O6HKkWXNRNj1+kTwfN188o=;
        b=fE9VW+4Q78kZh4ePO8NvF32eyLTOl2hG4rqzgUpbUDeHkKPvIw3DArkbPy4eBtztgX
         3ZvyiqDrWNgkkmY7iAaQyi15ALDoTfORWTt9rSTFuWeFclqS8YBhwFL9Qsw0Bqg80gQv
         OM8nnS43fVgTzohponx5Gn+J3pazH6unRfRY85Gl7X8/v5Vz+tda5oJL2OnqgL6ognZ9
         XGpgWiFAEcBc9l6owvNdjvCpjL0TY1rgWxizJj2LeCb2UDmGpWsMyg2ZPFU/SKOtre2y
         Nh+YgyyDNevBuPfbPEVihtPq7ITzOa1+MNB1FslKKMJKilkBh1ZCgZKxhiBuYdbUZ911
         IwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+ruLMwnRekC6kR/4JMYJ9O6HKkWXNRNj1+kTwfN188o=;
        b=QhdmEYu5yraoInNHFYgCzrkXw7rWi+rlIxvjvuYFjlyGMtySJ2sO5Ns4tnoh1CCVo9
         QrigdclMQ2P3489lzCWLQDAdvUJAVqv40HwT48hCR0P59Xo531lltkqbc9VVjskvXlzV
         AXapye0Dtds8vaTu/vN1iin0/hjnZg6Gc4/mwZXjXYG7j3xpndUyVqPKiecuXLIFqZI8
         viE8S1qZTFtK7DBqLWgnnfcOURlCVQHpbxRoYsQgFJzAOO+yJVuMyVHk7ISzlvkOC1iG
         gYwDxKxujy/PP8qcreRaZzLf8JUlh7QddqcZBqFE5kYB5r1BhEXNoTKzJ8ELk57h4T5o
         gn/w==
X-Gm-Message-State: AOAM5337wSXjpE1NIqE4xWf6Lu8uRjuUkZlA4DGbtK4xcJ13gkHDSTbR
	RwZLB1hDeh95K7tmkr2jBQ37Bbm4l8FUW2rpTP4=
X-Google-Smtp-Source: ABdhPJw2Je/7FPkbNnOvafmPFIa5ILbtUeXurocu0PDlw3xH2RGawJBQ2HUZcNJTxDWdLXAJUIZxw13Ys2rdbDAKY0Y=
X-Received: by 2002:ac8:73c9:: with SMTP id v9mr11172775qtp.214.1626472360556;
 Fri, 16 Jul 2021 14:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <6d41368-58fa-56e-63c5-7d445550a928@crashcourse.ca>
In-Reply-To: <6d41368-58fa-56e-63c5-7d445550a928@crashcourse.ca>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 16 Jul 2021 14:52:14 -0700
Message-ID: <CAMKF1sq2tj=wBK=OAk4QMniqgzn1_DpPLLQfN=JWMYOWen-zsQ@mail.gmail.com>
Subject: Re: [OE-core] how to configure an image with *full* debugging info in the libs and binaries?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 16, 2021 at 12:10 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   colleague just asked me what it would take to generate an image
> where the executables and libraries contain all the gdb-related
> debugging info in the same files (that is, not broken out in the
> .debug directories).
>
>   i pointed out that this would increase the size of the installable
> target image substantially but, apparently, that is of no concern.
>
>   said colleague pointed me here as to what they were perusing:
>
> https://developer.ridgerun.com/wiki/index.php?title=Preparing_Yocto_Development_Environment_for_Debugging
>
> so, once i finish this current task, i'm going to take a shot at
> testing whether the following would do it:
>
>   # Specifies to build packages with debugging information
>   DEBUG_BUILD = "1"
>   # Do not remove debug symbols
>   INHIBIT_PACKAGE_STRIP = "1"
>   # OPTIONAL: Do not split debug symbols in a separate file
>   INHIBIT_PACKAGE_DEBUG_SPLIT= "1"
>
> am i on the right track? this seems straightforward enough, i'll just
> have to confirm those variables still exist, and that they do what i
> want.
>
>   thoughts? is this as simple as i think it should be?

I think you should try

EXTRA_IMAGE_FEATURES_append = " tools-debug dbg-pkgs"

this should get you all needed debug info and tools on target

then if you want to make optimization levels to favor debug info generation
set DEBUG_BUILD = "1"

>
> rday
>
> 
>
