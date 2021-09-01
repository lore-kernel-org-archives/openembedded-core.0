Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.1014.1630525437488953425
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 12:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DCgrDAR1;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.54, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f54.google.com with SMTP id v10so1316800wrd.4
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 12:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K1KlDKAP7tls1IwmO02JViGZZ2DpFqiwNXiAWrL3xL4=;
        b=DCgrDAR1HAkJ0497nBjJyrfreJIW+TODMLAVY5+tLfgVebZjeAhCL8ge5zH4M2z4NM
         +oGG+qweTWjoqWNnxcSe27ZL0HivG2L2yFYNjsSlVHkVOlCIZw5C21enxtx0Mw3oFZuK
         gbqAB4U4F31oo2bMO1JcsBvB1aOvoqgq3xB3Gfv+Qobu48sHJqiwz4Zhfk16/BVM/9yz
         jSTZVXw/dT06pm/J+sXzVQeRSJq4Q9ZjcJpxaKzJxRoQLsjg6cx/85iMrNv+0C/Re9HF
         DzBDUXdPUdzWcTAxMQGGQ2DB0JfLJQeUE7CtzLG8mEeGItgO810jtQmgQr76nZ42PQlt
         PWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K1KlDKAP7tls1IwmO02JViGZZ2DpFqiwNXiAWrL3xL4=;
        b=Phpt9eF7e1xHEg3R0sPia5ZSmKa7PUiSXgj0H9eWNZlrGOIJkGn9ugExbCHjB35wJ7
         4+NTnU2IMdr5dwPzxllIgBzx6BCFsZCuxwCRJIQtuB7OtLGkmBhUM99DC4aCsjnTWAw9
         b3cSD2Ga4z6jzC8ZsAmwC5fuJSXSBDquXVXdqN4WnLecbEJ0AJkWTOlCtT5VJNEdEhYp
         AVxds3J9iCYnjZayxr3PBgIvLvna7XOd5MbUjpyrvCAuVOUxzDPfENQzF3Qfm9I2hrbr
         jfTqkc1MPxAMb9SUy5kAJRU4LpqHCunlB9Ja9gaEVhrYNi/R2sSdUgMNTzYaGNfvgvYx
         fuqw==
X-Gm-Message-State: AOAM531LkFSFE15KWmjEr2pffsBwvt4BzKUHE94gK8r0SOwAAudmdU+s
	lVbLA/O/IKSR6EKF0BO5W8st5B4IaHoRPtIP/dUuPQ==
X-Google-Smtp-Source: ABdhPJxHX9ao0eIjRQgzhLQt1Ya3xTBPrUOXdfwQAKNu7m5OYoX6HnpoQ107637vR8bHQwSVgiSaZZgJVqW7cI5SiWg=
X-Received: by 2002:adf:e74a:: with SMTP id c10mr1175341wrn.350.1630525435795;
 Wed, 01 Sep 2021 12:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210901193329.2911525-1-grembeter@outlook.com>
In-Reply-To: <20210901193329.2911525-1-grembeter@outlook.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 1 Sep 2021 09:43:43 -1000
Message-ID: <CAOSpxdaqGdKxytVmDkZtcxWv8zcDPboNy95_Z5ZT7LqH3PcgvQ@mail.gmail.com>
Subject: Re: [dunfell][PATCH] Revert "sdk: fix relocate symlink failed"
To: grygorii tertychnyi <grembeter@gmail.com>
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
>
> Original commit message mentions commit bc4ee54535 ("sdk: Decouple
> default install path from built in path"), that is not part of
> dunfell. Hence, revert this fix.

Have you by any chance tried with the above mentioned patch to see if
the pair of patches works in dunfell?

This patch was intended to fix:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14444

It does seem to fix the issue in master, which has both patches.

Steve

>
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
