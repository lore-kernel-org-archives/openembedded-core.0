Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.32381.1613985503977318201
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 01:18:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uQf57YCR;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: mans.zigher@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id y7so53791011lji.7
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 01:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K8Im3yZrQjfsRAnElZKbBpHSiUjo8UVsBr5OCn2IYP0=;
        b=uQf57YCRnULNL9UBqm9bKz6YQc2l7T9vvNdyrhgFm0B1WO6mbOi0vznOUXVawRBFjV
         wDqCYHuj3lpr5DAMWd9PGoda4oUxphyW+IQMLFMsGOxF2blj58+5Kl1JhO96gzkdFvz3
         3b4hmlu+QLdCaXTo1/mhDdg1IrTol6VHwP95lBobaBN8OYUP07IBkzdW4kxp7IKh9sz5
         cfvA3bGlX8L9QqE35x3h83ZYiDv2+6gOzLwEpit5+l/dP7Dal5yGc6GToqI0+8spgLzL
         L9rxh57RYx2Q9EF+gRkWEKWa2p99ERlgzDstSb4w+fXk2CjPXwPaiXGgeTteo90VMVvq
         6LiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K8Im3yZrQjfsRAnElZKbBpHSiUjo8UVsBr5OCn2IYP0=;
        b=HePsKRb8R4r/xLf14UTBWoY/9zOGGqx8bXDTk/0en7RxRasY1LMXF78R6faRkWiuuj
         Miif9JLn7ufeiKzoZA3jOwdPw9TDG2Ua9C+j/xZiwcJdG73hDBHuXCFCYz22ZJ2FOgrN
         TiHApIr4KACyYoN5WyUzqCNpEaTcJe0W1VipC1aTe/6EOHoz2fmFB1ItDwSyRA2SAPHX
         1nsVQTC/VgMqXOmYq9tos/0vLNggRuIl6EdX3RunSe+3Clwz11gjWp4lxUteWqaiiI1Y
         mCvwI+o6KEDLT3t8w3iKrmubyJfYDgHUmVQUeKyyz3C0to37ORJOJF9prfKnOoYVJHv2
         36+Q==
X-Gm-Message-State: AOAM532IxbFNI8tO/UKsLeAXl3ANK4Nr4k79b0urViEr9Ef3m2N14E0a
	K8kKGUfP9XWrwocK2stkCf3kQXkgPQIbHRMl+0Y=
X-Google-Smtp-Source: ABdhPJxbhVG15G8Q+KKIpV6p7qT8LzXTb3DElZ0gig+VRAPzUNxT/r7GyY6gF7LBqhCT/AFle1Du//qrz92xj5qgHYU=
X-Received: by 2002:a2e:9812:: with SMTP id a18mr7153433ljj.479.1613985502139;
 Mon, 22 Feb 2021 01:18:22 -0800 (PST)
MIME-Version: 1.0
References: <CAEhQi8=E4K3h5Y8ui3PRXYx68Jgk=RzShj0UwQEcGupd_YMYWQ@mail.gmail.com>
 <9802d27eadcf72dd628a236fb42b06834d1158e1.camel@linuxfoundation.org>
In-Reply-To: <9802d27eadcf72dd628a236fb42b06834d1158e1.camel@linuxfoundation.org>
From: "Mans Zigher" <mans.zigher@gmail.com>
Date: Mon, 22 Feb 2021 10:18:11 +0100
Message-ID: <CAEhQi8n443scKapCNSRw0R5Yj_1+puUq1O-2rQua6Lcf7y64rQ@mail.gmail.com>
Subject: Re: [OE-core] [Question] "global" package list used to bump up customer packages
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for the reply. My customer are not really interested in going
into multiple recipes so that is why I am thinking of having a
manifest file for them to update packages in one location. I still
want to have some kind of step where someone approves the "pumping" so
even if AUTOREV could be an alternative I am not sure that is the
solution but I will investigate that. The pn-somepackage variable is
likely part of the solution.

BR

Den fre 19 feb. 2021 kl 18:38 skrev Richard Purdie
<richard.purdie@linuxfoundation.org>:
>
> On Fri, 2021-02-19 at 09:53 +0100, Mans Zigher wrote:
> > Hi,
> >
> > I have a problem getting my customer to understand how to work with
> > OE. They have a set of private packages that they continuously need to
> > bump up to use the latest version. The packages are stored up in an
> > artifactory server. I have an idea of maybe helping them out by adding
> > a manifest file containing a couple of entries for each package
> >
> > VERSION = "0.25.6"
> > SRC_URI[md5sum] = "0d6bc46bb69b2a0dce0c042d27b4f25c"
> > SRC_URI[sha256sum] =
> > "c20ea63a5e2f24e25d91e5cdfaa6b4b3735739d6170bea7b2b7d429fc397b718"
> >
> > This manifest should then be pulled into the bitbake environment so
> > that the packages can read these entries and download what is needed.
> > Any comments regarding this potential solution would be greatly
> > appreciated.
> >
> > Also I have a faint memory of seeing something similar solution so if
> > you know if something already exists then I would appreciate if you
> > could let me know.
>
> Are you thinking of AUTOREV? That works if the fetcher has support
> for the source control system being used, e.g. git or subversion but
> I'm not sure it would work for artifactory without a dedicated fetcher
> module.
>
> Certainly generating an include file like this is one way to handle
> this. You can use package-name overrides, e.g.:
>
> VERSION_pn-somepackagename = "0.1.2"
>
> although its harder to do with flags, you might have to put those via
> an intermediate variable:
>
> SRCURISHA256_pn-somepackagename = "XXX"
>
> then in the recipe:
>
> SRC_URI[sha256sum] = "${SRCURISHA256}"
>
> Cheers,
>
> Richard
>
>
>
