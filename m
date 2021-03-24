Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.33.1616598610528832767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 08:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HzufO6iH;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.50, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f50.google.com with SMTP id j7so24827472wrd.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 08:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w0Qdapmku9pwtjb/4fc3SzwxuigbcP11nZjtRiONYb0=;
        b=HzufO6iHEheffynpeLlm8xvnflx3BUle5jjuJZiP+sC6Ubmq4tOGwWy+ZgUdhZg1bv
         izNHrZqc6abeFhr6qIO3OAtSDmvGPhXOQZ/QeIqVMyc34fUQkwRBqINmHlTrFg6cxXaL
         iCqOLbOWhW/e0iXx4Hfmo7cDo45n0dqLKX+DLM6BMociC4R9uBshUDMSgb/Qyaw283rK
         XVYInqm0ZULXiWYT23bHXOvUnLpHTCSf7aC3+t2qTqfjrab8NFXk5TfvyC+408fT6lSV
         yOG1LXYSySNNnOamD/h0rGRvzjY21pSmmiKtfP4r9ZGG18DuJoqoQESqGgAbULd1wF+5
         2nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w0Qdapmku9pwtjb/4fc3SzwxuigbcP11nZjtRiONYb0=;
        b=KpXXYYWl9Fi2STkCAsPo6Gz1pHZToO9qLAj7TO/SSEuBanJk+e39Oa8FVVeMJHi+zM
         zT34y+9PWame1fzT+ALYx8lkZ4CqFdNbXWlV2xnBeICzeWl/GpGMzdDPJITByXgTklHP
         nM42QX4RvGnbx/eQilF1KP+uwzf2Vg2EADWSCL/xSYNYwKkMclIdXtn14JGBhJOmQbjr
         POkVagfyhSfpqKwBKa/Lm7dUQ2+3LNYk5zCh+utfpe1ONRipdphy5efOkWXoz6AwBEP2
         ECrn3Rq/a3R7tHuiCttb5HD47Rkk9a2z6kMdEXy1cSiFDQy2lYLRbGTQYZM2f8RVMPW0
         VRUQ==
X-Gm-Message-State: AOAM532Az4vvIk8UPMLX10K9EByBzNa/UYevPkuK40EC/tE/9f9N7HSe
	QHELAA0BzA7mE+vaseSJZN6mBGkyDsTI6M1I16lvlw==
X-Google-Smtp-Source: ABdhPJzT2C6ML/Ndc/LwsoOxKZ4gAchE2eXz1GTX4eoRE+0yOnJLzoYqH4rsgn4Tq+Ey5zaQhXBcipIgK3g01rKbT60=
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr3941900wrv.329.1616598608696;
 Wed, 24 Mar 2021 08:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210321102616.3752416-1-gmouse@google.com>
In-Reply-To: <20210321102616.3752416-1-gmouse@google.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 24 Mar 2021 05:09:57 -1000
Message-ID: <CAOSpxdaWrkdaKgnJDpPCxibMfj9y9ttQ_TCOT839RGYHBaCNdg@mail.gmail.com>
Subject: Re: [OE-core] [poky][PATCH] run-postinsts: do not remove postinsts directory.
To: gmouse@google.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 21, 2021 at 12:26 AM Anton Kachalov via
lists.openembedded.org <gmouse=google.com@lists.openembedded.org>
wrote:
>
> From: "Anton D. Kachalov" <gmouse@google.com>
>
> When running on the systems having read-only rootfs backed by overlayfs,
> removing the whole directory lead to create a special char device file
> on the upperdir to reflect directory's removal. Once it is required to
> upgrade the whole read-only image that might contain new postinsts scripts,
> it will be impossible to run such scripts with a "deletion mark" file
> on the overlayfs -- the whole directory will be marked as deleted regardless
> new files in it.

Is this something that should be considered for backporting to
dunfell/gatesgarth?

Steve


> Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> ---
>  .../run-postinsts/run-postinsts/run-postinsts          | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> index f84a7e18c8..95dccb9cae 100755
> --- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> +++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> @@ -72,12 +72,12 @@ exec_postinst_scriptlets() {
>                 else
>                         echo "ERROR: postinst $i failed."
>                         [ "$POSTINST_LOGGING" = "1" ] && eval echo "ERROR: postinst $i failed." $append_log
> -                       remove_pi_dir=0
> +                       remove_rcsd_link=0
>                 fi
>         done
>  }
>
> -remove_pi_dir=1
> +remove_rcsd_link=1
>  if $pm_installed; then
>         case $pm in
>                 "ipk")
> @@ -92,9 +92,7 @@ else
>         exec_postinst_scriptlets
>  fi
>
> -# since all postinstalls executed successfully, remove the postinstalls directory
> -# and the rcS.d link
> -if [ $remove_pi_dir = 1 ]; then
> -       rm -rf $pi_dir
> +# since all postinstalls executed successfully, remove the rcS.d link
> +if [ $remove_rcsd_link = 1 ]; then
>         remove_rcsd_link
>  fi
> --
> 2.31.0.rc2.261.g7f71774620-goog
>
>
> 
>
