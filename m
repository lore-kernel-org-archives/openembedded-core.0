Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.7241.1624453983145088278
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 06:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jZZGwIDw;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: andrea.adami@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id he7so3908034ejc.13
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qq1Z1waiyK8mhWpWiV7LvpVAXk/TqppNSmjDeKveH2o=;
        b=jZZGwIDw2wZX5g8mxxRhtbzC9VWHNGKyd0T3IQQjxd00FZLwoA4OGOeZZ5plN7l6nk
         tbSm463t9CgyUcQR91S4ukAqR2ZHoFvlw07Ju6rgzmd69DJU2XCG7qdYHvrexddNlm2d
         xOzVPEHA38/NznmXIg7gptd872SjD2ExJVfkVrwnIHTqN9dZsPpVVIGLm44pULKb0A1A
         /mmZS+tJo0Yd+CD+83TpCSzSzbMzjUAE/jO0cUTexeN6L8BMsJWI5zNU6ghJoG9YaP6q
         uLpkrH1t4K/tr40UHFiU23FY8fC0hOkjAnas85pXv01VVgUm9wBjJF5VyFxmAdcnlAW+
         8iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qq1Z1waiyK8mhWpWiV7LvpVAXk/TqppNSmjDeKveH2o=;
        b=akfo1L9unRgVHlVQ6gRMVHzfj3e3qbIyyHQvRSIig4Kv3+b8KHE7DrtNDlZHf7Y24b
         OmBiwb8shomvTmkqQLmy2d0PKmz/2yBk1u76HcdsqrZVy8+P2Rtvi4fHbe4c3dU0Tb+B
         1ZqxyUfD3GjKO1dcUSriDEb2jh9VxlVRUdbjgdACHwDAmNvZNH75IM8dsFW3mX1vXweO
         L6mgfuWO3LkfAPOj3mwb8cv/1SKgvt6J2vtB9pA+RJBLaLE/IDVSBUwkdOgqet9luVm2
         DbZCVpzQv2sGX3wvov/xtoVlRKQgwPtScpLF9hSkp62fnJHryy0woe+H/W2fToWZdir4
         gNkQ==
X-Gm-Message-State: AOAM532haWLTS6jiwlKDdLBpdRnHr+tI5wobmKRmX33sKerKmD80plPf
	REaflvAPgUvA3T2S4D5hAbCLn7gWvdJs1gEwq/E=
X-Google-Smtp-Source: ABdhPJzOohvayxKB27fIs/fzaegw43BwFJCGwdF8sQObcZMiFisW9V8ucd94eCr2zF78Tyk7JWXDnqE+Dzd9m4GD5pA=
X-Received: by 2002:a17:906:9754:: with SMTP id o20mr9665229ejy.337.1624453981413;
 Wed, 23 Jun 2021 06:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210622221818.4613-1-andrea.adami@gmail.com> <20210622221818.4613-2-andrea.adami@gmail.com>
 <e7a7a1a335404229b99a7815b2b6e15b@XBOX03.axis.com>
In-Reply-To: <e7a7a1a335404229b99a7815b2b6e15b@XBOX03.axis.com>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Wed, 23 Jun 2021 15:12:50 +0200
Message-ID: <CAAQYJAtBoiaX180FxOKzXPwm0hciYQths0eOYiTRSyZypmdrkA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] kernel.bbclass: inherit kernel_devicetree only if KERNEL_DEVICETREE is set
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 23, 2021 at 11:32 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Andrea Adami
> > Sent: den 23 juni 2021 00:18
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core][PATCH 2/2] kernel.bbclass: inherit kernel_devicetree
> > only if KERNEL_DEVICETREE is set
> >
> > Now it unconditionally tries to create package kernel-devicetre even for
> > legacy devices w/out DT.
> >
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >  meta/classes/kernel.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 06e6446a08..68369e3791 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -779,4 +779,4 @@ addtask deploy after do_populate_sysroot
> > do_packagedata
> >  EXPORT_FUNCTIONS do_deploy
> >
> >  # Add using Device Tree support
> > -inherit kernel-devicetree
> > +inherit ${@ "" if d.getVar("KERNEL_DEVICETREE" == "") else "kernel-devicetree" }
>
> That doesn't look correct. Don't you mean something like this:
>
> inherit ${@ "kernel-devicetree" if d.getVar("KERNEL_DEVICETREE") else "" }
>

As you prefer, I don't think bitbake has likely/unlikely optimization.
I took the style-example from line 6 where it reads

KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") ==
"kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"

I am for any option providing a guard.

Cheers
A.A.


> > --
> > 2.17.1
>
> //Peter
>
