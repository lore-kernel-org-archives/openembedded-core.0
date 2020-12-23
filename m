Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.3845.1608766097481903770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 15:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=idQpBLev;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id h19so489667qtq.13
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 15:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W0xyMIe7kz7jDY41KrqkXrAlHkxkNQAoy6WxFLexErM=;
        b=idQpBLevU2ITtq8TodXgiPqOdcBWFxAg77mXqhXXTm+oTq7b40F2gvrPNV//4iEejC
         Dx4x9zz9AaFIKPBxGURS6M7vURSonUZjp5ZcL83doTXfbriT6IYv5M9lRbDNuwrhZVmc
         grjJcdL56oxyiRqDmRWGVfAZta+SzW0VLHHzpNfmPLW23fU5xen5z9S2ZB2Yp7OJLrp5
         52HuvY9H4+0H8ShrJu5bntxmwDf3rV9VMfXwzOyOFAp2RWuZw3FHhVm5CqSDwYJ0FkCH
         AeRuFj6UWa+IXnmfBsSbP2I94JyeLcnAPgNZy84i20jJuAInhXV22bEeeQjW42wvRfTE
         Uv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W0xyMIe7kz7jDY41KrqkXrAlHkxkNQAoy6WxFLexErM=;
        b=it5d1T5TJ18LyZVYF0A7kMiTmByUO/b+AIW3MFt0UX8bl0km843abg7hcD8ORxvZOw
         1qViexV01LuMIQzOsqJxCLWvBGQ1uYGdytLeHvgZiqHn9tKGxyG+CRy3I4MVbmWkNKN4
         z5HXmEC5lyxiveAkKRLaBB4cJJ4NBJzjsN/pMsbh+MjHia++s/Jf3LihtLrAtMRBL0OA
         oOL5jq6AWfcGW+SqG+Hw426HVZ7XJmPyqW5Dwa7RUgNFB0xctFXZKowdPCUcaV4ryDul
         uWQksZ8mSATRdQtIWU51pEw6Lk0FJWehruSPNIpbZlxNKos2JekOykPBOm4KkKSBU037
         mhIA==
X-Gm-Message-State: AOAM530HfADJhgKQrA+dvs3Bckds+EeZ7IABceiLsSswvt4SrClM9FZ6
	9BH1CGt40Cz1uswllo9LdnvkR6MR27obq7elwXw=
X-Google-Smtp-Source: ABdhPJyT4RJJ4dst35s2g5TOAlsy3cO3iJCyjDcaDEL59W8mV+vihwgRpQ+mlvXQcxyoNC0TMXQ8Rp2j4CynHdcvu7o=
X-Received: by 2002:a05:622a:1c3:: with SMTP id t3mr28189865qtw.378.1608766096443;
 Wed, 23 Dec 2020 15:28:16 -0800 (PST)
MIME-Version: 1.0
References: <20201222070029.40230-1-twoerner@gmail.com>
In-Reply-To: <20201222070029.40230-1-twoerner@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 23 Dec 2020 15:27:50 -0800
Message-ID: <CAMKF1so1E7Dw8Uwy8epT0UanOv0QcdcPqzobSV+tOMURHPK5uQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] sysvinit/rc: show text progress
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 21, 2020 at 11:00 PM Trevor Woerner <twoerner@gmail.com> wrote:
>
> In addition to the progress bar, show which startup routine is running by
> using the "MSG" facility of psplash.
>

This is ok but lets make it optional and controlled via some knob. End
products usually want clean graphics

> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/recipes-core/sysvinit/sysvinit/rc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
> index d0d3149821..6995930ee9 100755
> --- a/meta/recipes-core/sysvinit/sysvinit/rc
> +++ b/meta/recipes-core/sysvinit/sysvinit/rc
> @@ -27,6 +27,7 @@ startup_progress() {
>      fi
>      #echo "PROGRESS is $progress $runlevel $first_step + ($step of $num_steps) $step_change $progress_size"
>      if type psplash-write >/dev/null 2>&1; then
> +        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "MSG $(basename $1 .sh | cut -c 4-)" || true
>          PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "PROGRESS $progress" || true
>      fi
>  }
> @@ -53,7 +54,7 @@ startup() {
>                 "$@"
>                 ;;
>    esac
> -  startup_progress
> +  startup_progress "$1"
>  }
>
>    # Ignore CTRL-C only in this shell, so we can interrupt subprocesses.
> --
> 2.30.0.rc0
>
>
> 
>
