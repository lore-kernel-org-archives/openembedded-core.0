Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.17092.1602858863192830718
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 07:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DmtotED6;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.54, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f54.google.com with SMTP id cm24so2676871edb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 07:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rWVJyRR2EaZQuBVXdRx33hVuP13vY0FB62f5iJfnEOk=;
        b=DmtotED64vpNxPTwFVP67ssiniGoxobzJk2ptVcPF9/TpF5jsKKcS5q3ir7NLZiub1
         BS/aQ8UdhnSDwpU3y9clVsIrD3o4gMpUMsFMsoiUKd+BF0LI9MSn7qWSWIN/eI420w+6
         fzH9aL4+5Gc3DeAWoWZWnrVG2R20BrZ28vErjYvgdtqdKVYQPJRb51Ldr6/1Q46Y6BAr
         z6NYA15PK0kZOJQeDaYogpteRy1MO+eyRiYexxelehlg95MrsfPCtykat3liv6f8oIkA
         F24xfr3rtBPiKrTC5LTpKrmWEFGA13Q6Sem1maJ1LAxgzGCZfdCW7thi8cvIT0g+7EfB
         UuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rWVJyRR2EaZQuBVXdRx33hVuP13vY0FB62f5iJfnEOk=;
        b=kqyZjbLNPiJ2UY6eSjvCFK5f5EPOmpp5d8zs2E10cPq7PTgIWArQfZfEGPfDp0NMbZ
         XAQqfWVIKcLe2LGFdt1dHnIlQkVuUNUOOE1Ahb3jx2FrQpQmnDutgIwnmUgSEL0fQjJD
         ORgR1UtJ27ksCRYI7f6BHfAjoMe5+0jDulg2xExjJgDMpe+nlIfeIvGCMNLx/r9J6gvX
         /GyRAIJjh4UmTII+CSnPjPAzzlwcPQhwtmfTueDhNjqalq85xIc6cVUNflN+00nyc42q
         KVDK7rfFpqioE6l/H97CMmZwNpH4+keLxJtAFORMR//i9/TVI/IADNlUm9e5dklWa04z
         6bfw==
X-Gm-Message-State: AOAM533OrRaD+CudQTrafOIFEl9jidNryJiw+Gj6b1Llt77AYIJQfSBK
	Zvd49LNHaMquDlqnZDb2R6v0cMJALm5wachipNXp0Q==
X-Google-Smtp-Source: ABdhPJzMloWDiB+2cLYmrbOk4ExaV8OaEGif9fizcJ7fNk/5CBJhLZ3NEsEqYMIIVxQKd/POT7vzGA4kA72DKNBsNjg=
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr4257095edu.295.1602858861392;
 Fri, 16 Oct 2020 07:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1602771116.git.steve@sakoman.com> <163E30094343B958.12811@lists.openembedded.org>
In-Reply-To: <163E30094343B958.12811@lists.openembedded.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 16 Oct 2020 04:34:10 -1000
Message-ID: <CAOSpxdbZ9yKWyLkALJctu5BCP77AX=PSNWuBffNa8snxMOEgjw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 1/8] Revert "package: get_package_mapping: avoid dependency mapping if renamed package provides original name"
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I've included this revert patch for comment because I have gotten
several requests to revert and I'd like wider discussion of the issue.

At the moment wireguard is the only known recipe that is failing and
there are no proposed fixes.

If you are aware of recipes in other layers that are affected, please
let me know.

And if someone would like to tackle fixing wireguard in
meta-openembedded that would be much preferred to a revert.

Thanks!

Steve

On Thu, Oct 15, 2020 at 4:15 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> Breaks wireguard
>
> This reverts commit 210ebed1e9c2285d6e457bf03d1f1a1f3ddc7fda.
>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/package.bbclass | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index cc64ddffc3..23ff4772fa 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -535,7 +535,7 @@ def copydebugsources(debugsrcdir, sources, d):
>  # Package data handling routines
>  #
>
> -def get_package_mapping (pkg, basepkg, d, depversions=None):
> +def get_package_mapping (pkg, basepkg, d):
>      import oe.packagedata
>
>      data = oe.packagedata.read_subpkgdata(pkg, d)
> @@ -546,14 +546,6 @@ def get_package_mapping (pkg, basepkg, d, depversions=None):
>          if bb.data.inherits_class('allarch', d) and not d.getVar('MULTILIB_VARIANTS') \
>              and data[key] == basepkg:
>              return pkg
> -        if depversions == []:
> -            # Avoid returning a mapping if the renamed package rprovides its original name
> -            rprovkey = "RPROVIDES_%s" % pkg
> -            if rprovkey in data:
> -                if pkg in bb.utils.explode_dep_versions2(data[rprovkey]):
> -                    bb.note("%s rprovides %s, not replacing the latter" % (data[key], pkg))
> -                    return pkg
> -        # Do map to rewritten package name
>          return data[key]
>
>      return pkg
> @@ -574,10 +566,8 @@ def runtime_mapping_rename (varname, pkg, d):
>
>      new_depends = {}
>      deps = bb.utils.explode_dep_versions2(d.getVar(varname) or "")
> -    for depend, depversions in deps.items():
> -        new_depend = get_package_mapping(depend, pkg, d, depversions)
> -        if depend != new_depend:
> -            bb.note("package name mapping done: %s -> %s" % (depend, new_depend))
> +    for depend in deps:
> +        new_depend = get_package_mapping(depend, pkg, d)
>          new_depends[new_depend] = deps[depend]
>
>      d.setVar(varname, bb.utils.join_deps(new_depends, commasep=False))
> --
> 2.17.1
>
>
> 
>
