Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.3232.1630535595964653913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 15:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BqeevqXc;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.44, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f44.google.com with SMTP id z4so1916897wrr.6
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 15:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iJDP25DhU1WudSlz7Mc+Rv3f/jl6N0ntpiJe957Foq0=;
        b=BqeevqXcf3c4cS16uzW1szsWnZ5SPzbigg5zu0YH73VMEm8KOUV/NC3fk6GTdUNlPf
         Muwh1hADLMMv9JhuYdvTg3Cx2sGE4OXor2bAigotN+QBSvblKeJqSxYEBX6747ZmMQgH
         DV0Bm/FcNN0Jr6rI1I0PoZ6hIjyB+xU+5ci46OhogZf5ubuRW0onstkj5TJcIBtG/Qvr
         TnBcBHSQ06KvQEV2CTBI42VsaraEgIgzMRyMtuj8BM44+nPuGsQQkjJiLZ3gr3KS3TP6
         uBDOCEXLc3qWJI6CjbF4aoOPdeRDKJc8IFQjF30xQrnWulmtDzPas5AXcfpTMvdqmxJy
         wFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iJDP25DhU1WudSlz7Mc+Rv3f/jl6N0ntpiJe957Foq0=;
        b=Dj3TMd5DskRnu2E6KJ6OpUUI5PwWDXhXI3AqnxIrsrYGslyORtNJH/dda3PNk0Fu0l
         +AqhkZmpbTC7ANf3AH9wZYVmUS+4sTnNOxPDa0qP+7qrooM8fwneyc7xWisT75vgt3T6
         dBtqDsCGpLc8wl6jedoEChGXiwzdZKu6CTVJbK9bWkN3SkzwyOK+EYNJnaFeLlLCA/YV
         fkE10vQQQ4ts8NUP1Sth5IXyYCK3uhe/Rhtuj+TqZLCA486WDkOOsPTnC3QeX5YFnlNP
         sgpXll2bBTFfS6uAxlFVgrSFFRphpZmGa5AWInLqQqzzMh+Qme2KJiOp8qUHgKJ2lUyQ
         CuFg==
X-Gm-Message-State: AOAM5334X/IAZIOQ+eQ6lplRWbG234cgiK9EvaHDXf9WJrC8RxcMUzgw
	F/8DtxMBeRZIxtArNi17v9R/BTVChhL/d9TliBxOGA==
X-Google-Smtp-Source: ABdhPJx+2JJ33SrXmaMTTkKO25DBWCoiOQ+PXHRH31jeIc+tFo7zpYuKxCfWKvf/l6Jz+dPzWfcdvcMi8xr33+HDNw4=
X-Received: by 2002:a5d:560e:: with SMTP id l14mr158234wrv.205.1630535594050;
 Wed, 01 Sep 2021 15:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210901193329.2911525-1-grembeter@outlook.com>
In-Reply-To: <20210901193329.2911525-1-grembeter@outlook.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 1 Sep 2021 12:33:02 -1000
Message-ID: <CAOSpxdaKcD_Rs_f9Sz2jp8hMkS2V_UhhJ5JtA9C42oz9g9Stpw@mail.gmail.com>
Subject: Re: [dunfell][PATCH] Revert "sdk: fix relocate symlink failed"
To: grygorii tertychnyi <grembeter@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	grygorii tertychnyi <grembeter@outlook.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 1, 2021 at 9:33 AM grygorii tertychnyi <grembeter@gmail.com> wrote:
>
> This reverts commit a155c4d4ca841ef492213a5f0b9121703c62e2b4.
>
> Otherwise, SDK installing fails with:
>
> Extracting SDK...........................................................done
> Setting it up...sed: -e expression #1, char 0: no previous regular expression
> sed: -e expression #1, char 0: no previous regular expression
> ... tonns of lines ...
> sed: -e expression #1, char 0: no previous regular expression
> done
> SDK has been successfully set up and is ready to be used.

I can confirm the above noise from sed in dunfell, though the SDK does
seem to be set up successfully as the above message indicates. I have
verified that I can use the resulting sdk to build a test app.

Also I can confirm that
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14444 is fixed with
"sdk: fix relocate symlink failed" (in both master and dunfell)

> Original commit message mentions commit bc4ee54535 ("sdk: Decouple
> default install path from built in path"), that is not part of
> dunfell. Hence, revert this fix.

Adding "sdk: Decouple default install path from built in path" to
dunfell eliminates the sed noise you were encountering.

So I think we want both "sdk: fix relocate symlink failed" and "sdk:
Decouple default install path from built in path" in dufell.

Thoughts Richard?  I know you were worrying about this.

Steve


> Signed-off-by: grygorii tertychnyi <grembeter@outlook.com>
> ---
>  meta/files/toolchain-shar-relocate.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
> index ba873373e29e..54337412966c 100644
> --- a/meta/files/toolchain-shar-relocate.sh
> +++ b/meta/files/toolchain-shar-relocate.sh
> @@ -72,7 +72,7 @@ fi
>
>  # change all symlinks pointing to @SDKPATH@
>  for l in $($SUDO_EXEC find $native_sysroot -type l); do
> -       $SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$SDK_BUILD_PATH:$target_sdk_dir:") $l
> +       $SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
>         if [ $? -ne 0 ]; then
>                 echo "Failed to setup symlinks. Relocate script failed. Abort!"
>                 exit 1
> --
> 2.30.2
>
