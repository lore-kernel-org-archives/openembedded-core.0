Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.13535.1587063233913213399
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2020 11:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F3gp2/bi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id k11so6110981wrp.5
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2020 11:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=l7wl56f+VVLnbrGFV9dvBqVYT5LKNkIHdnQFWPMhZV4=;
        b=F3gp2/bi00qdcZ7eCGCsvT5ne/9oARIJUfYxDLHiAl5t3vZ6zatcULQWoNISfTbArx
         ICUCxenYUhPgYZ5e8LOAZt+O44Ia3b+3f+t/apmqcSYbdwPVolnTYgqZPi2tT0/cniS1
         vazuI6QKtQR15nYggjZuKKjr9jJpjPujfza6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=l7wl56f+VVLnbrGFV9dvBqVYT5LKNkIHdnQFWPMhZV4=;
        b=CnfgN/X2UZ+y1F5OoeZtyFMdqZoT3sTbye36OK5p6DLuuUabsype0Isbj3CNVHkZfT
         cWUEeSadlGtYurL2OOZHGwRzw3JbyAcUZIPmKtddPAvKAwEYzoEgDD5VQIQwhW/qSNpq
         FEpIKdquUFADESX6hk4DOZIuDJnP4FC8FeFMqJGumIn9rBdLndHAn+4yemdY8YXhfA8z
         pKbjPLqZDa4gide6g1OlyfNJvNfLHXrsv/o4S0gHrNswQUu+d3CA2xKBDDsLx+/ab+IQ
         fd2kTeEt3bVJW4mv7bcNMf/oQbx0zOUP60y3qprfjjER79NHxxkb1Iypxw7t/uwtsE4a
         sUqA==
X-Gm-Message-State: AGi0Pub8UDMxptCOQcnqVkcX0KavYk5Vy5DNNgc04MP+trrpj04hl6X4
	MYC+46s1IZC1nHKfkCP+BHH7sQ==
X-Google-Smtp-Source: APiQypKwm7FgMAhqdK2PQSHZKyU/2hXZWq6ifvJK592cI7BkcsPLRhn6pRiEMFUSsuNg/G6oG01OgQ==
X-Received: by 2002:a5d:4e12:: with SMTP id p18mr15432118wrt.148.1587063232230;
        Thu, 16 Apr 2020 11:53:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z18sm22409513wrw.41.2020.04.16.11.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 11:53:51 -0700 (PDT)
Message-ID: <075d3fbdff1e8a88413210319576675e25fc71ff.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes: base|package: check pkgs lics are subset of recipe lics only once
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>, 
	openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Date: Thu, 16 Apr 2020 19:53:50 +0100
In-Reply-To: <20200416183921.3032-1-quentin.schulz@streamunlimited.com>
References: <20200416183921.3032-1-quentin.schulz@streamunlimited.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-16 at 20:39 +0200, Quentin Schulz wrote:
> Yocto bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=10130
> 
> Move logic checking that all packages licenses are only a subset of
> recipe licenses from base.bbclass to the package.bbclass so that it's
> evaluated only once, during packaging.
> 
> As explained in the linked bugzilla entry, if a package license is not
> part of the recipe license, the warning message gets shown an
> unreasonable amount of time because it's evaluated every time a recipe
> is parsed.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
> ---
> 
> - We may not want this patch if we find it important that this warning is
> displayed at parsing time and not only after packaging has been done
> (which means dryruns aren't going to detect this issue anymore).
> - Do we want separate patches for each class?
> - The original bug report isn't very explicit, so hopefully I'm actually
> fixing it :) adding Paul, the reporter, in Cc so he can confirm.
> 
>  meta/classes/base.bbclass    | 13 -------------
>  meta/classes/package.bbclass | 13 ++++++++++++-
>  2 files changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 45f9435fd8..7aa2e144eb 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -584,19 +584,6 @@ python () {
>                          bb.debug(1, "Skipping recipe %s because of incompatible license(s): %s" % (pn, ' '.join(incompatible_lic)))
>                          raise bb.parse.SkipRecipe("it has incompatible license(s): %s" % ' '.join(incompatible_lic))
>  
> -        # Try to verify per-package (LICENSE_<pkg>) values. LICENSE should be a
> -        # superset of all per-package licenses. We do not do advanced (pattern)
> -        # matching of license expressions - just check that all license strings
> -        # in LICENSE_<pkg> are found in LICENSE.
> -        license_set = oe.license.list_licenses(license)
> -        for pkg in d.getVar('PACKAGES').split():
> -            pkg_license = d.getVar('LICENSE_' + pkg)
> -            if pkg_license:
> -                unlisted = oe.license.list_licenses(pkg_license) - license_set
> -                if unlisted:
> -                    bb.warn("LICENSE_%s includes licenses (%s) that are not "
> -                            "listed in LICENSE" % (pkg, ' '.join(unlisted)))
> -
>      needsrcrev = False
>      srcuri = d.getVar('SRC_URI')
>      for uri in srcuri.split():
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index d4c6a90e84..1e87108e43 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1322,9 +1322,20 @@ python populate_packages () {
>      os.umask(oldumask)
>      os.chdir(workdir)
>  
> -    # Handle LICENSE_EXCLUSION
> +    license_set = oe.license.list_licenses(d.getVar('LICENSE'))
>      package_list = []
>      for pkg in packages:
> +        # Try to verify per-package (LICENSE_<pkg>) values. LICENSE should be a
> +        # superset of all per-package licenses. We do not do advanced (pattern)
> +        # matching of license expressions - just check that all license strings
> +        # in LICENSE_<pkg> are found in LICENSE.
> +        pkg_license = d.getVar('LICENSE_' + pkg)
> +        if pkg_license:
> +            unlisted = oe.license.list_licenses(pkg_license) - license_set
> +            if unlisted:
> +                bb.warn("LICENSE_%s includes licenses (%s) that are not "
> +                        "listed in LICENSE" % (pkg, ' '.join(unlisted)))
> +        # Handle LICENSE_EXCLUSION
>          licenses = d.getVar('LICENSE_EXCLUSION-' + pkg)
>          if licenses:
>              msg = "Excluding %s from packaging as it has incompatible license(s): %s" % (pkg, licenses)

I think that this check really belongs in insane.bbclass as its a
validation checking issue. I'd love to move this away from parse time
and to runtime only! I do think its something for the insane class
framework where we can configure it to warn or error for example.

Cheers,

Richard



