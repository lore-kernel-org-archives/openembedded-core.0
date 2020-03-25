Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.21959.1585166550601893301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 13:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GI69LKO5;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: andrey.z@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id d5so4931175wrn.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2020 13:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cNwm5o1Nrl6I4g8vKNyvit70b5x6VGC34qJP4JHR0HY=;
        b=GI69LKO5BFRVxCc3bqPnZCbWDyti+w7tSPrRUp9CLY2ixlfxKE3P/sRNRB5KWZCdM+
         rnccFBWMDMNiRcQuYz9emqa/DaGmHwz6MVP4aTpFjyNqR2cLK/LJX75VB3WtwghUGZZT
         +u1PjHRQqBAsu8P/tWsmI323Sue6uXE3OuMDHDuOrkqNBSL5KyvSY2pgLKY/Y9L1NFjm
         3u7U9G7AejwKWSj6BEfx6y8enfi7rxbemHk+1F08hgN6bw/qpkuCHcD5iGQYyY8/wS/5
         HT2VA5Jt8jrhZ/9WrueZiyRUDiWIwYixyDJqZond964OaP05Mfs4QqeT5j/mAOZZfTYB
         Xq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cNwm5o1Nrl6I4g8vKNyvit70b5x6VGC34qJP4JHR0HY=;
        b=Y+sHpXwpocqCTJ/99q3nZqjItsmNgFgxv9R5LqnizKDrpGcw/PZzmwBcEcl1JHA0cD
         WTBMEdD9Xvwb322DZ6Q9qTRKOfTfvjy4WAKPX4JGvjtPfwS/T2hAi1kpUw9ipCiNvySU
         qXwRTbTPtKjXhtQ2i7Z4k4DqxmaWE4TqeYwsY564Q8MDs32hPjhe0fqpVgs4J5BnKkZ8
         T1JT78A1+QxdgabxdP+JXybUC3bnmdI+pRmtwI+CSCYZc2xqWoyNlUW6JQZP2pIRu5KR
         VNnw6g+rfnZ+3AJ3c4ohp9XYvLhddwYva1GYMRJNTOGtc/0LMsfKd/0iJg6kBV72btAW
         tCbg==
X-Gm-Message-State: ANhLgQ1Yqe3j/Rdsbt8r1sv2mFDordDpFs0jqDsJRp4zkyDZkTcTYHUP
	VhReyiDBQXycmQwOnj0m/rultnOUohZG2lhF3l4=
X-Google-Smtp-Source: ADFU+vuXKlkN+HLIsNx88PQILwcbdpG2/sCSafw9vF//Hgv6crKk/Sm37QShhqn7mOhe6jNKl7m5oqC94yVuIuYbXpI=
X-Received: by 2002:adf:db41:: with SMTP id f1mr5491255wrj.247.1585166549025;
 Wed, 25 Mar 2020 13:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200325181447.14750-1-mark.hatle@kernel.crashing.org>
In-Reply-To: <20200325181447.14750-1-mark.hatle@kernel.crashing.org>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Wed, 25 Mar 2020 21:02:16 +0100
Message-ID: <CAHtQpK7OJdEQCSY1wsKGKLoz1nQZ7SHCsj9ke_BjC=VWrYfX5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa-gl: The purpose of mesa-gl is to provide for X11 usage
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Ross Burton <ross.burton@intel.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 25, 2020 at 7:15 PM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> Trying to build mesa-gl without X11 enabled, results in numerous errors
> about being incorrectly configured, such as:
>
>   ERROR: Problem encountered: building dri drivers require at least one windowing system or classic osmesa

I believe I was fighting similar issue in meta-freescale layer for
imx8mm derivative [1], where the status of GPU support was not know at
the time. What I did back then is set the default configuration to
osmesa and used swrast in order to be able to use mesa on that
derivative. After that, when GPU support has been added into Mesa -
those modifications were reverted.

I guess turning to swrast in case if someone would decide _not_ to use
X11 - is not a bad option here, rather than enforcing the X11 for
distros which are using this recipe. Any thoughts?

>
> After consulting with the author of this recipe, it was clear that it
> was only intended for the X11 use-case, so requring X11 should avoid the
> error message above.
>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> index d4b1c1c454..5674c6b1fe 100644
> --- a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> +++ b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> @@ -6,5 +6,7 @@ PROVIDES = "virtual/libgl virtual/mesa"
>
>  S = "${WORKDIR}/mesa-${PV}"
>
> -PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> -PACKAGECONFIG_class-target = "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +REQUIRED_DISTRO_FEATURE = "x11"
> +
> +PACKAGECONFIG ??= "opengl dri x11"
> +PACKAGECONFIG_class-target = "opengl dri x11"
> --
> 2.17.1
>
> 

-- 
Regards,
Andrey.

[1]: https://github.com/Freescale/meta-freescale/commit/9a2210d9ec707531436dc4b56ce655c0bf50a8a8
