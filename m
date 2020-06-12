Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.22191.1591975054217893325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 08:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GrthHM7M;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id t9so10585614ioj.13
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 08:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Byr7/YuAlzBZ+NuUFf3WSUmf4HaYFEXZ6/ugQjEHU4s=;
        b=GrthHM7Mnj5yDoyQp+0xb0czwGgR5HQXf8mshNOtc61Cemixbb2vcu3/WwukRoq3zn
         M7L4XllK5v/RTtpepI/TdocBDjYcV9Fzdhk0JJ6+5ELakwaFTixy75koA1/zfjRTKp6s
         FiR5BcfakU2x0X9QyxuNM4vPcGv4PdH3R85R4d4DDzbsV5QbXPM6Us6cZAoEqDnhVq2b
         ELDWu196Zki6Sr4dFVBrK6TrFXD/7yGkWJYz6B1EjgiE9J7yXmss1uZDAb+q8nJR3uCx
         /kFSNG+QkV04J8HWBpDcmI+Ih0T1bad4Ow18uVcTTFVPEYIi4nV60/KyqV1GWlG4wJI9
         AIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Byr7/YuAlzBZ+NuUFf3WSUmf4HaYFEXZ6/ugQjEHU4s=;
        b=bTpFFmdGyPazxQ4h62t0XPCqydE0Dkqz9MQIAa03Q0LRhaIehkNQoKVYqFMbPcKq2f
         o2q3MrjXFNWU2z8Wk8lGH4h4+rlU4LBKtQQdz17bJRgBbu+9ek5x3xQQz2fGDj9Jc1HU
         qh+oPl8kG2nBbmLplGSIr88ihqemDDwbFjZN9PEct3j2xVVbmNkXv1dq9j9b1BnwB9WO
         jFOsFHA/CWiNaU1ZbrBSwLRiPwMBnjQLsU7KfTlbV8AFrBqY76k2HaBj/MyDY7UXFsH6
         rpJGylTfEwqPtFBk1kyytJnUHU2/+cqWXSpHta55ZlDqYTv10k8Ymht3u3kxjDkolICJ
         h70g==
X-Gm-Message-State: AOAM530OLs8XIT3bTd28jHDYhXJLXMzDqzoqKC/sBIs/luxqLExlEdBK
	Jt2LwpYzDjzrGg/0kegmST+NdCiFjg+y2HM727g=
X-Google-Smtp-Source: ABdhPJzyzBdiseEBGAZM5gGm3Hfw0nUukq7lk5Eop51JNDh25l9v+g/Ep5cSWMjGYq4+c60ohaIHVLuh30DIzLNQpeg=
X-Received: by 2002:a02:c004:: with SMTP id y4mr8430669jai.81.1591975053514;
 Fri, 12 Jun 2020 08:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <1617CF6F85240247.10901@lists.openembedded.org>
In-Reply-To: <1617CF6F85240247.10901@lists.openembedded.org>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Fri, 12 Jun 2020 16:17:22 +0100
Message-ID: <CAO5Uq5Svd45REbgn3xEZhd_NzS8sX7FQrpVS0yo4pyNGkkT2Rw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] recipetool: Fix list concatenation when using edit
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 12, 2020 at 2:38 PM Alex Kiernan via
lists.openembedded.org <alex.kiernan=gmail.com@lists.openembedded.org>
wrote:
>
> If there are multiple appends, ensure we concatenate compatible things:
>
> Traceback (most recent call last):
>   File "/home/akiernan/poky/scripts/recipetool", line 111, in <module>
>     ret = main()
>   File "/home/akiernan/poky/scripts/recipetool", line 100, in main
>     ret = args.func(args)
>   File "/home/akiernan/poky/scripts/lib/recipetool/edit.py", line 38, in edit
>     return scriptutils.run_editor([recipe_path] + appends, logger)
> TypeError: can only concatenate list (not "tuple") to list
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>

I should add a test to this too, since what's there is well tested
today (apart from edit!)

>  scripts/lib/recipetool/edit.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/recipetool/edit.py b/scripts/lib/recipetool/edit.py
> index 94bdf7bca4eb..d5b980a1c03e 100644
> --- a/scripts/lib/recipetool/edit.py
> +++ b/scripts/lib/recipetool/edit.py
> @@ -34,7 +34,7 @@ def edit(args):
>      recipe_path = tinfoil.get_recipe_file(args.target)
>      appends = tinfoil.get_file_appends(recipe_path)
>
> -    return scriptutils.run_editor([recipe_path] + appends, logger)
> +    return scriptutils.run_editor([recipe_path] + list(appends), logger)
>
>
>  def register_commands(subparsers):
> --
> 2.17.1
>
> 



-- 
Alex Kiernan
