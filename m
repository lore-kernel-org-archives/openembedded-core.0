Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.165.1606935686616731573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Dec 2020 11:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gi3kVwvV;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: marek.belisko@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id lt17so6050546ejb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Dec 2020 11:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CteI38vSPz0qDvLu/ArWjkFvH8m2NMqzW1sTr5UxUKo=;
        b=gi3kVwvVhuUFDKrSu/llIvxT0jGZDNjfB9UPxuPkYm07SH0r403gut+JalM9n35cUB
         ewDEv7TLMmTgR5cUooa43zFjtx1z9i33drBxLWUqtLQ0DV7E6+SqNK8d23yuz7isOgDi
         vA53e6qabyAhwLwPCXxQv6vTwv9gk2uXtVFykG0tNU2Wnf9Afd4H50vpH75nXJan0yxx
         YsPQVfJBcA83YEd98h4efnc7eBFOvnxYl/1gAR1etPVIC2yNqlmZrd4Tgab2RSdB2zCB
         J+xgmkn3l3RompeXofyQKXeHazu2vraEflelZWmRRBFT06FmGb5octjfWRBl9LrKTIQk
         suwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CteI38vSPz0qDvLu/ArWjkFvH8m2NMqzW1sTr5UxUKo=;
        b=TGRYSfkwM2p/xUETPNwmkASiEdihZkW6W+dYz/smemc5Xp7zBRj/RjWUYkNbpcFsXK
         RDTimj2IkmnXpG/cOSol++37weGD+GwTp+bZ4SdQl38UzlVKhIe1MDzcNdQh/ctmCN5d
         kjNj3TnPAz0YEgBrYFYlp5z5Gn07sfPiS5ArEojyScMOvuNnySFKLsLsFKJO/qoxPfHc
         ILQpm3Sz7SslZcbfJjqBvw6egRbk0sKrNt7I3F0uONBOnfnzsft5iXestkUlAEv/Fri3
         N9XaVD38g1b5PA3Smhm5uL155cumRYK94oK3VR+kOofsDsouVaOv6NaNpkG6Q30MSEOH
         SC5Q==
X-Gm-Message-State: AOAM533aejb1P4t/YyLiJ1Pt0tpLh3B6/z7/9k3v+xNz3Q/8VIO28f2C
	7RVZtPAJ9Rygb3rSFTyrBQbtX4AAxbRffL4Szgo=
X-Google-Smtp-Source: ABdhPJzPGsmfWk4Ap5AInYTag7mjDyX7TJFbsc/LpGzPItuipi0FiIfztAyBCb2D6MBeTlTjeXLYboaRqGdR7LaKgoo=
X-Received: by 2002:a17:906:caa:: with SMTP id k10mr1175619ejh.204.1606935685001;
 Wed, 02 Dec 2020 11:01:25 -0800 (PST)
MIME-Version: 1.0
References: <WyJB.1606926356468119429.WUQh@lists.openembedded.org>
In-Reply-To: <WyJB.1606926356468119429.WUQh@lists.openembedded.org>
From: "Marek Belisko" <marek.belisko@gmail.com>
Date: Wed, 2 Dec 2020 20:01:10 +0100
Message-ID: <CAAfyv36ebNw=ZVMSkzgMQLNY_AjcBJMftOa=qna+DZKCDOAJSQ@mail.gmail.com>
Subject: Re: [OE-core] Multi-threaded npm build
To: michal.frynas@sigma.se
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Michal,

On Wed, Dec 2, 2020 at 5:25 PM <michal.frynas@sigma.se> wrote:
>
> Task do_configure delivered by npm.bbclass takes a lot of time, the longer shrinkwrap dependency list the longer time needed for do_configure to execute.
> Following improvement allows to execute do_configure on any available CPI threads.
Do you have some number how fast it is using with and without your
patch? I'm currently hitting the same issue with the slow npm
configure phase.
>
> diff --git a/bitbake/lib/bb/fetch2/npmsw.py b/bitbake/lib/bb/fetch2/npmsw.py
> index 0c3511d8ab..0e6075859c 100644
> --- a/bitbake/lib/bb/fetch2/npmsw.py
> +++ b/bitbake/lib/bb/fetch2/npmsw.py
> @@ -29,8 +29,9 @@ from bb.fetch2.npm import npm_integrity
>  from bb.fetch2.npm import npm_localfile
>  from bb.fetch2.npm import npm_unpack
>  from bb.utils import is_semver
> +from concurrent.futures import ThreadPoolExecutor
>
> -def foreach_dependencies(shrinkwrap, callback=None, dev=False):
> +def foreach_dependencies(shrinkwrap, callback=None, dev=False, executor=None):
>      """
>          Run a callback for each dependencies of a shrinkwrap file.
>          The callback is using the format:
> @@ -49,7 +50,10 @@ def foreach_dependencies(shrinkwrap, callback=None, dev=False):
>                      continue
>                  elif deps[name].get("bundled", False):
>                      continue
> -                callback(name, deps[name], subtree)
> +                if executor:
> +                    executor.submit(callback, name=name, params=deps[name], deptree=subtree)
> +                else:
> +                    callback(name, deps[name], subtree)
>
>      _walk_deps(shrinkwrap.get("dependencies", {}), [])
>
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index 068032a1e5..1869b63cdb 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -80,6 +80,7 @@ python npm_do_configure() {
>      from bb.fetch2.npm import npm_unpack
>      from bb.fetch2.npmsw import foreach_dependencies
>      from bb.progress import OutOfProgressHandler
> +    from concurrent.futures import ThreadPoolExecutor
>
>      bb.utils.remove(d.getVar("NPM_CACHE"), recurse=True)
>      bb.utils.remove(d.getVar("NPM_PACKAGE"), recurse=True)
> @@ -164,9 +165,11 @@ python npm_do_configure() {
>              progress_done += 1
>              progress.write("%d/%d" % (progress_done, progress_total))
>
> +    executor = ThreadPoolExecutor(max_workers = os.cpu_count())
>      dev = bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False)
>      foreach_dependencies(orig_shrinkwrap, _count_dependency, dev)
> -    foreach_dependencies(orig_shrinkwrap, _cache_dependency, dev)
> +    foreach_dependencies(orig_shrinkwrap, _cache_dependency, dev, executor)
> +    executor.shutdown(True)
>
>      # Configure the main package
>      with tempfile.TemporaryDirectory() as tmpdir:
>
>
>
>
> 
>

BR,

marek
