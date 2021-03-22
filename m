Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.852.1616441276081492751
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 12:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NodVtcln;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: armccurdy@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id b9so18378173wrt.8
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 12:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EE1TrSdtpCT90EEwrePnkWHwcKpJd4kkt3zNH3LSopk=;
        b=NodVtclniA0zQpjwej0Xny92UbN7Hf+wSFOZLbBZ8HBXz8HABmFwsDd9L97Ko47lqW
         WphgQNQjsH4f5WiJnEDeaNC6fVL8S2lbfi6keFKdPMoXhoG9CKuoOl/56jB1XR2WlOmf
         95FytQEdPAW1vky+Ryi+LSycUgUAfPBLhAUjtpCLf1RmjYCfcSJ2V8Rx14XE3S5uX55J
         gDP930j9j9jMCKQaHLWBm5S6bAdtwsg1tCYrXGD/k39A+f5LN1ZqEG8wOhIn0c5QaB7Z
         knncW/6ykzJtdGi69OOd6+wCfqVdLjI/2SuwzkkPpfXXwJ26kIkQ24PnXjdIxTXtPwMc
         Vvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EE1TrSdtpCT90EEwrePnkWHwcKpJd4kkt3zNH3LSopk=;
        b=IXiJDLOid6qCXk9ze6ebUr0kgXCYuOWe3xAeV//LD+GgADVva29+vFAYAiMdnm2nKI
         rzO8o/AlTtJXI4fJ1GhtVm7n/OLblwuqvbnhCRzSq4FPpnk8xn6Tf2OTtazvTCEHkiIK
         7EK94n6fNI5YJIkeDuvGnc9Rt/KH1xensHARChuOKVnp6WcTjWJhIc1oUVKxSOL3Bh06
         x+8IOS2N2wAfjeZmQ8q+VBPE+ebBz+jsJo2DR7HMfcYUnkC//hI8hoclJTtBbdwhV6v3
         TGIYrlCJBAKqHguGmjXeyu5Zqa/j3e92JcM3ER1IPSX4gxHc3a6iMW0ZnmH/Q4gKy9ze
         pa9g==
X-Gm-Message-State: AOAM532lLyAlQOENj83s0HpC0MFayfkw4edkXS1d8mYk8FMohXGByhsU
	tceWnz/rrLSrDQUODkXBu20p3geYNgD18R77eV4=
X-Google-Smtp-Source: ABdhPJzrvXW718HLS4NMc5gTqXC9f4UOwkLpcPSb6dj5L2deNQuyUP9FSftRq04i+y7idF5mycGiajfrPFJyAvibptU=
X-Received: by 2002:a05:6000:178a:: with SMTP id e10mr133468wrg.424.1616441274488;
 Mon, 22 Mar 2021 12:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <5a2c7beb-bc46-5528-c84-122ea0799c29@crashcourse.ca>
In-Reply-To: <5a2c7beb-bc46-5528-c84-122ea0799c29@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 22 Mar 2021 12:27:42 -0700
Message-ID: <CAJ86T=VmDYxS5PjHazGUZD_NXeqsJ+uo=nmveGJjJrocyPVvng@mail.gmail.com>
Subject: Re: [OE-core] curious about weirdness in some FILES_${PN} settings
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 22, 2021 at 11:43 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   (warning: i've just been handed an existing OE code base, and i'm
> going to ask some questions about some head-scratching things i'm
> finding in it, so be prepared for weird questions.)
>
>   in one recipe, i see the following snippet:
>
>   FILES_${PN} += "/etc"
>   FILES_${PN} += "/etc/mosquitto"
>   FILES_${PN} += "/etc/mosquitto/config"
>   ... etc etc ...
>
> first, i'm taken aback by the hardcoding of "/etc" rather than using,
> you know, "${sysconfdir}", so i'm *assuming* that unless someone was
> doing something spectacularly clever here, that just can't be right.

Nothing clever going on, it's just a bug. In general, using /etc
instead of ${sysconfdir} etc will appear to work fine until you add
BBCLASSEXTEND and try to build <recipe>-native, at which point things
will start to fail in mysterious ways (since native.bbclass over-rides
the default values of ${sysconfdir} etc).

In this particular case, you might still get away with it since
FILES_${PN} is related to packaging and -native recipes don't do any
packaging but it's still not right.

>   more to the point, the above seems redundant -- once you've added
> "/etc", isn't the rest just superfluous? i'm not sure what the
> original developer was going for here. thoughts?

Yes, and even beyond that, ${sysconfdir} is handled by the default
packaging rules, so any extra packaging rules related to adding files
from /etc to the default package are redundant.

>   finally, if i wanted to add all of some directory, say "dir", it was
> my understanding that all of the following were equivalent (hmmmm,
> short of picking up hidden files, i guess):
>
>   dir
>   dir/
>   dir/*
>
> my personal preference would be "dir/", as it gets across the idea
> that "dir" is a directory and i want all of it. thoughts on that as
> well? i'm currently perusing the OE code base to see the general
> consensus on this. is there one?

That's more a question of coding style, which the OE maintainers etc
generally doesn't care about very much (unless you start asking about
unifying oe-core and meta-oe with respect to indenting with tabs or
spaces...).

>   more decidedly strange questions coming shortly ...
>
> rday
>
>
> 
>
