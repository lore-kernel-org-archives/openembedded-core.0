Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.795.1625679705783243797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 10:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UpZI3Nns;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id t19so2794428qkg.7
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 10:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GwTsK3gR6tqOmGDT7wxKqkEdu2yhXWuHrjf963yhBtE=;
        b=UpZI3NnsbDnZZwwCrBNCaHgJTC5lAsMeA5wAnVRppylEeUkj0zvpJHnidl70Yoxf3R
         UukEoUCpI7/kHdeqPhYtFuycmi9/IppLfKW5sGAAZi9BmcxswYUWOgz39HNFPft/jNY8
         5cPbmnajsHFnpERN4e+6Wcm83f0RZI1MYqANkldhVKQ82KXyrOrHEtIxdYT1WndyrAJv
         9dtPDbOCTaabF5GfWnCiOuPa4G6ivp6kV+mic8Fzh1GSJoYudYwQLWYY/w7/23LCm7vg
         Zbb5VwyY63+hcCXsZEOAEY2NnRd5VTuK8PD3l1gcNhA41NiFmEt5zdpc7snfa2RlFzOC
         svaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GwTsK3gR6tqOmGDT7wxKqkEdu2yhXWuHrjf963yhBtE=;
        b=OxWGLCWDKOfqJDE6JKyjglAJSxLR5K62xU3jqUoCbuCVHK6TAQhb4Kn0mOORJz2NOJ
         1nPb4Kv1VSuXN66plMcZfpeUoHp6u7GoMYj7sdz/r2utfl9fhVl/c3kPPBf6QzMxBLjJ
         M3GBrlVyRBYI93c8HulKre4uNV7iScVr58LHgc/skLjLdX85jAO824BpGsziFG1rom5/
         KLgT15NzuSCZM+D8c4lwY0KSZovcnG6t2u34aIOM3O3WG1yekdAFtQopWweRzjZ4mmU6
         5TJ3Bj/EKvuX9A36Xp7w0W4YqfH93HMreUdJNxFjyX0q+P1b72jcyDKl53As1s5PMvOY
         5bWw==
X-Gm-Message-State: AOAM531PQKQ6mduetfoKtz33jIfzqUiVlktWsZq0UZN6ISkzFtBlfAjD
	K7/C088kbuB6ZNd64nA6nEpcjfZN//fxEOROOtkgHokhk7E=
X-Google-Smtp-Source: ABdhPJzzhLm+3gkqfF7Qg6vSZs6iWVNnfCU+b7eRWPqHsww1kJRzkMvIaQnx5st9792lqo0dXFiEaSW/0hQBuYiNeG8=
X-Received: by 2002:a37:59c7:: with SMTP id n190mr26753878qkb.146.1625679704861;
 Wed, 07 Jul 2021 10:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210707155620.1145640-1-ross.burton@arm.com>
In-Reply-To: <20210707155620.1145640-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 7 Jul 2021 10:41:19 -0700
Message-ID: <CAMKF1spkS=GPc3tOYXWG2=SW-y5fWHvrX5i4gF3SgevoMRABiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/recipetool: update socat version to fix failing download
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 8:56 AM Ross Burton <ross@burtonini.com> wrote:
>
> If the recipetool tests are run with an empty DL_DIR the fetch of
> socat 1.7.3.0 fails as that URL doesn't exist anymore.
>
> Update the version to 1.7.4.1 to fix the test.
>

this fixes master but I guess releases are still broken and perhaps
backporting it may not be a simple
as newer version of socat may not work with older versions of OE.
Perhaps we should use yp download
server to provide this tarball ?

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/lib/oeqa/selftest/cases/recipetool.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
> index 9d56e9e1e32..f0685d37182 100644
> --- a/meta/lib/oeqa/selftest/cases/recipetool.py
> +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
> @@ -374,7 +374,7 @@ class RecipetoolTests(RecipetoolBase):
>          # Try adding a recipe
>          temprecipe = os.path.join(self.tempdir, 'recipe')
>          os.makedirs(temprecipe)
> -        pv = '1.7.3.0'
> +        pv = '1.7.4.1'
>          srcuri = 'http://www.dest-unreach.org/socat/download/socat-%s.tar.bz2' % pv
>          result = runCmd('recipetool create %s -o %s' % (srcuri, temprecipe))
>          dirlist = os.listdir(temprecipe)
> --
> 2.25.1
>
>
> 
>
