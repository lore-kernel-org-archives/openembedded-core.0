Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.496.1616451523297983081
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 15:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f6jPFQl4;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id x28so23703034lfu.6
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 15:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2nmaoKXQVVweMMnxi7PJaVo8m8QoxfwNz7qtt31WcmQ=;
        b=f6jPFQl4BflotmaidKdIejFv9MlXT2vGsfVG3rePe001QJ0rGNtH1cpTE5wI9XQndQ
         93N+w32/cpUBpubx8aHWqEVXcrk8qdazBdqFbSz4VRGCYTSr094mrdNEFATpp8gV5my6
         ElhFom9NyqW/SKOiciApUWsR8oKGGLyOAw181cADMj5zgdcvR7yMlcXlNd/xUmM5gChz
         Foh9E+ExJvUgs4PrXZ8EldlbBmo/D2CLRD7A2Eh8oSPsyKecaDMc0+NNuWcgVQMueVze
         t4nmYpAgK+xLU0TVy0TjebFA93jW9Hj4nXN8IAcXQcKW8g2BA1FD4LrzTEyI7Z4SqXeI
         zkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2nmaoKXQVVweMMnxi7PJaVo8m8QoxfwNz7qtt31WcmQ=;
        b=Xx0RNNnpL1snjsN9bHijbrGTTJdtVf950dX5ECnJ26i0SFGBGIAucaAyyi5g6bPenS
         cGm4qHdMCrTdZ0eJL/cDxcYrhyxGMMtlXm7HZ8sPvwOqtyhww5eKBR0Drf/odn6BOoz4
         STvlKisE6HhIr15Cx/ycIYSrTpAqJMzahwc9L/644ahaKaBXv/PWcuI6jdff52ELGXjz
         YI1Vrim5UB9qTZq4i7TsexIrZE/dNFQJhhLzuuXpSfoFW4QXNRdus7RX3ReL+YALqTKt
         aYk+x1v9AwXmIyVDDRZP3vTU9nH7hS/v1WoqJXl7WLhnGN6Y985wEQaeLC5EO6Y0LGXL
         N+Gw==
X-Gm-Message-State: AOAM530XmWk98E61t1yi8FPxSSQ6tVc9ixGg411Ho2oKAJvJpK7LK3NT
	+Io5Ws04Mwr84TC/yQbGqkxveCfS+yrV3yDNgM8=
X-Google-Smtp-Source: ABdhPJyQAnyM/4AC/M5A+YTPUTFidcNM4jaUX5fzC+uD/xP2iIEHarkzVIFJjc0y5gaGWHdOEXTGagBETOEcomFVwXI=
X-Received: by 2002:ac2:532c:: with SMTP id f12mr857970lfh.73.1616451521356;
 Mon, 22 Mar 2021 15:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <cb3f5a5e-fe71-d4fb-7cd6-86f457238fde@crashcourse.ca>
In-Reply-To: <cb3f5a5e-fe71-d4fb-7cd6-86f457238fde@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 22 Mar 2021 15:18:30 -0700
Message-ID: <CAJ86T=WDjxift1cMeACmSE+an1kC+t+EuTeaO4PT6_+cM+mnjA@mail.gmail.com>
Subject: Re: [OE-core] really strange usage of FILESPATH and FILESEXTRAPATHS
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 22, 2021 at 2:29 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   here's the next head-scratching oddity i just ran across in the
> current layer (and there's more weirdness on its way).
>
>   perusing a recipe only to see:
>
>   FILESPATH =+ "${COMMON_STUFF_DIR}:"
>   SRC_URI += "file://file1 file://file2 file://file 3 ... etc ..."
>
> ok ... apparently, there are a number of recipes that want access to
> some small set of common files, so the solution(?) was to put those
> common files in some (out-of-layer) directory, and prepend to
> FILESPATH in each of those recipe files so that SRC_URI could find
> them.
>
>   i am not going to ask if this is some wickedly clever trick, since
> it can't be. it just can't.

It's unconventional, but I guess it will work OK (i.e. it won't have
any surprising or negative side effects).

It's better than (for example) one recipe fetching source from the
build directory of another recipe - which obviously breaks if you
don't somehow guarantee the order in which recipes are (re)built. I've
seen projects which did things like that and then needed to disable
sstate for CI and release builds as a workaround...

>   even stranger, one of the common files was a configuration script
> that contributed the line:
>
>   . config.sh
>
> to the top of a number of common tasks like do_configure, do_compile,
> do_install and so on.

It's not clear how a common file in SRC_URI could affect any tasks?

>   a similar tactic was to find this line in a class file:
>
>   FILESEXTRAPATHS_prepend := "${COMMON_STUFF_DIR}:"
>
> my head hurts.
>
>   first, if i needed to do something in common at the beginning of
> some basic tasks, i'd invent a bbclass file that "_prepend"ed to those
> tasks, and just inherit it when necessary.
>
>   as for a number of recipes needing access to common files for any
> reason, well, thoughts? my first thought is to encapsulate those files
> in a separate recipe, then make that recipe a build dependency so that
> those files would be available from the sysroot, but i'm sure there
> are better ideas.

Build dependencies are heavily geared towards libraries and header
files rather than common source files. See SYSROOT_DIRS and
SYSROOT_DIRS_BLACKLIST in staging.bbclass, which limit which
directories get staged in sysroot. You would need to navigate your way
around that (e.g. ensuring that the common source files get staged in
sysroot without being included in the final image, etc). Certainly
doable, but I guess too far up the OE learning cliff for most typical
users.

Adding the common source files to SRC_URI for each recipe which needs
them (whether as individual files from a local directory, as in your
example, or as a single tar file or git repo from a remote server) is
probably the better approach.
