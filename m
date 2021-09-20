Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.11654.1632144440135228317
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 06:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ehT3lPpT;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id q11so29695136wrr.9
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 06:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XdWuh3La7TAzSgFzZWloi3i8gvTC2e8YW3G1rMNk8u0=;
        b=ehT3lPpT02nb8mf6VE26pAYsvhGVps8zx6rCau4czQU5yV6y1mPMJVOMsCis/C2egF
         nlcMcbF52GatHbdm35e0kvdAR0/IM5ksUQ00Fa2oFN2It0kUfbv2xhRyV0QRv1Wekihc
         dO1Xlood8VXRpiD2fexeBhZjvt1QaoGFYyXC8EFz1nA7k1A7EZCRLnnntK5c8yAVrgb7
         Tkr2qkFrle05oWSyWaHydd5IBkguA7R1891NgSgh5crex+ErJ67PuV0xidpHUcEkxTUC
         nLj8l3MciM8KZRpH0uI3tcbOlrxW0NYmw7ZmgQjxpUHjjJnyC6Xd/uVupcnQYLjr5WPW
         KPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XdWuh3La7TAzSgFzZWloi3i8gvTC2e8YW3G1rMNk8u0=;
        b=hXv6MuDaxMuibfhhmzZN+IF5eRUEf6vFeNSzvFyrQzvsocdDchFbARnFWmE4nyxfRV
         yWGQNbh5aDC6RKByUN0o8YVYi44IQdR9c2l1RtldfFL6fKln9xouZgotT2E3+xfKmbeZ
         2RAdpe4BKdeFH+tqRlCErO5V2IQTs63PJg3gsTlV6cQXX3oiwKqkh2NckcVZvQNUHWpu
         VX8jgVxpCrR/EBlfi7RDORwhW4/Pfo8jZqyeFc9jsIodOrDFmtRyH40PUwyAoExMT+NL
         8De37LidXIa833D4DbU11NdLdNjXwvIVrBO2YmbgmG5nVumTJ6U+gCWoAEpHxjVDrQ2B
         V3xg==
X-Gm-Message-State: AOAM532iKkw4aepSTzehq1YZaZcKMkAvQ1aG5uzp5Yns6KgFotUiwHp+
	YTOyILWgo/ZcrRPHVrE5ve1jQVtvmK0pubskR3s=
X-Google-Smtp-Source: ABdhPJw/ZCLuzf3WjcMAkZWUqP6RoskEGPA7/BdDcv9nCxRiyySrxb8/euyFVKl/tT2o5jSClD5WUIHqBEw/r3EgPaQ=
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr27892428wrr.382.1632144438618;
 Mon, 20 Sep 2021 06:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210919105735.1543088-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210919105735.1543088-1-richard.purdie@linuxfoundation.org>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Mon, 20 Sep 2021 08:27:07 -0500
Message-ID: <CAJdd5GZAEFJZmLjRFadjF5s2zu_b-k3dftwaNanUAA-GvN9Bnw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] package_ipk/deb/rpm: Drop recursive do_build task dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 19, 2021 at 5:57 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> This is a controversial change which removes the recursive dependencies
> from the do_build target of packaging tasks of recipes.
>
> Currently this means when you "bitbake <image>" or "bitbake <recipe>",
> the packaging tasks run for all packaging backends enabled for all recipes
> in the dependency chain. The same therefore then applies to images.
>
> We don't actually need that, it is a convinience thing. Removing it
> massively simplifies the task graph and causes much fewer tasks to execute
> in many common scenarios. It also means less sstate is fetched for
> example when building an image.

Faster builds in the common cases seems like a great idea!

If someone really needs the old behavior, is there a mechanism to do
the equivalent to what it was doing?

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/package_deb.bbclass | 2 --
>  meta/classes/package_ipk.bbclass | 2 --
>  meta/classes/package_rpm.bbclass | 2 --
>  3 files changed, 6 deletions(-)
>
> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
> index eca43e17876..8f0eadbcd2e 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -320,5 +320,3 @@ addtask package_write_deb after do_packagedata do_package
>
>  PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
>  PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
> -
> -do_build[recrdeptask] += "do_package_write_deb"
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index c3b53854e8b..756744279e1 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -278,5 +278,3 @@ addtask package_write_ipk after do_packagedata do_package
>
>  PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
>  PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
> -
> -do_build[recrdeptask] += "do_package_write_ipk"
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 88d861c0e75..9f415b234de 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -752,5 +752,3 @@ addtask package_write_rpm after do_packagedata do_package
>
>  PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
>  PACKAGEINDEXDEPS += "createrepo-c-native:do_populate_sysroot"
> -
> -do_build[recrdeptask] += "do_package_write_rpm"
> --
> 2.32.0
>
>
> 
>
