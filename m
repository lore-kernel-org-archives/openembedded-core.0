Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web08.8198.1631780914545425718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 01:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bOg2sUoW;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: pgowda.cve@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id c28so5322608vsh.11
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 01:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KmDX9xPa37pGh1LyQOe6A06zPS6RZxCw7mifuWZVBjQ=;
        b=bOg2sUoWxVDjgMycc3sRMiU5bJqrk1IB3+h1q+INT2AEnsbreBa8igcGz3FQy6o6N/
         bA7IEonafbyghw1m1SZwX8yY4MqWzvxs+quP+BE3NIm7fYmTg68omNelqAXuy/8JiKJD
         8OYEytusK03xV73kj7sXmRdOBXDzFzEhqSV8AeDf5kplcWfPmT7EnblKRuFlN4upyHji
         4Q7LL/pDLdnqGrZ8OSgqioSrmY6qfyyx+X+s2JzLZuOq/MD+ELUKOBd75lEV11Dt/lwl
         yUL2JKpKCG0D/gZTML/reQ9o+WusXZq3OggyQcF15EpbN8T3pZTHX0Pws6mvSlQGG1JT
         IVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KmDX9xPa37pGh1LyQOe6A06zPS6RZxCw7mifuWZVBjQ=;
        b=1NazEieXhu6qytcPBEr6CV0JsaX3VBI2sgwyHJpuFKAPlk1jYjIIjkjbQ9aN1Z23Ma
         N8rCEnF0NQDO9kjOP1+t++afES/8XAWRauNXgYhyXSbiaoVO/FMgb6q9G6bBkRhH0h4m
         tljXB/IdFYO0u7fQ3JkcISvUvP9PllQX8vU5g12+LQ/td9Qk8XjZEpmx1PwPBDUWjbBk
         j0L0PRq0SHaTNBu7cwsVnh2zCiWlrwS3U6/J7MEjR4dDfrJo4NlAat5DTFmDzzT93IzK
         Fk+2CT2mdiTjDT0+MLQ7AnMBtMhBY0PC72vcLKkYHFuXHEfQdw4PL+qipOCF94XUcWpn
         Xj6Q==
X-Gm-Message-State: AOAM533ga49j8UEuV7AG72PRv2+LbeGWI3TFOOp+fyeSSDaMCXTNIXOU
	o7WpsqYw6oGHfJ6V+J0Xx9W5Z5XhR75CtMrVSjw=
X-Google-Smtp-Source: ABdhPJzd+XOKOS2soHanDc5+taHiDrKQfQ0j41ethGseLuHlwWweGFYyb+43ITfxL0ithyijw9GaiEuVlF5jQ68xI3o=
X-Received: by 2002:a05:6102:3099:: with SMTP id l25mr3011719vsb.49.1631780913692;
 Thu, 16 Sep 2021 01:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210915114618.157245-1-pgowda.cve@gmail.com> <16A53DBD300C0C8E.4388@lists.openembedded.org>
 <07fc5dc3d216f0fa6c081506aa92701508604bab.camel@linuxfoundation.org>
In-Reply-To: <07fc5dc3d216f0fa6c081506aa92701508604bab.camel@linuxfoundation.org>
From: "Pgowda" <pgowda.cve@gmail.com>
Date: Thu, 16 Sep 2021 13:58:23 +0530
Message-ID: <CALY4984U1txY2y6yJQQKts20Hb6x-86gtXhHx9UoEeDxF1yyTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] state/staging: Fix directory not deleted for race
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <rwmacleod@gmail.com>, umesh.kalappa0@gmail.com, 
	Vinay Kumar <vinay.m.engg@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Thanks for reviewing the patch and your comments.

> Looking further at this and your description, I think you might be saying there
> are multiple levels of empty directories.

Yes. There are multiple level of directories as follows:-

/tmp/work/x86_64-linux/rust-cross-x86_64/1.54.0-r0/recipe-sysroot\
/usr/include/c++/11.2.0/x86_64-poky-linux/ext
/tmp/work/x86_64-linux/rust-cross-x86_64/1.54.0-r0/recipe-sysroot\
/usr/include/c++/11.2.0/x86_64-poky-linux/bits
/tmp/work/x86_64-linux/rust-cross-x86_64/1.54.0-r0/recipe-sysroot\
/usr/include/c++/11.2.0/x86_64-poky-linux

> I would also like to understand why these files overlap and are symlinks in one
> case but directories in another. Can you show some specific examples of the
> files in question?

It happens when we build rust-hello-world for glibc followed by musl
as follows:-
TCLIBC=glibc MACHINE=qemuarm bitbake rust-hello-world
TCLIBC=musl MACHINE=qemuarm bitbake rust-hello-world

The recipe do_prepare_recipe_sysroot tries to populate the sysroot file.
The glibc build had already generated the sysroot and copied properly.
When we build the musl later on, it tries to remove the above
directory and symlink
the newly built musl files. It was deleted properly before the race
issue was observed.
However, after the race issue; files are being deleted but the
directory and sub directories
are left undeleted which resulted in the error.

> The missing json file sounds like there could be some file not being handled by
> sstate but it is hard to know without looking at the code.

Thanks. I will try to debug the issue further.

Regards,
pgowda
