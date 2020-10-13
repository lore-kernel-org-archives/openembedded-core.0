Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.12049.1602596073706164846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 06:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IcTf3CxU;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id o18so20948724edq.4
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 06:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/S4xwEUYT4wA0o9Iof83kVDuY+8WQhHWLVG/ZbaRSEI=;
        b=IcTf3CxUR58dvetsFwyXPRI8tSh2BI5+CN0lH/ZuqPsHhghvI+Q603CcQD1bElz0Ld
         ufQzw0/z5QRbIr25jBhW3Pu+0xAaF/jR+UQTbWUNLrX9s6CwfKDq3af+DyJurGiuFjLH
         MxknMwZ47RYOV+WnGvmtoSruWbtCGnXU0hzYQzxJHITnIbM7hsj227Bf5kiEJAwfCXjQ
         EZ9stAsPYo/wGspJwH9b75jczWFyCFb3rNC6seA7L5GT/xmT8Gn19Wd4givFHVvA8gb3
         W6pWkZCiA8ceSpW/AYMl1DxYFKTWH9+XC1+/LAkoHjkVZaDNYGzTzxLRRVnmTQtkXsB+
         DHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/S4xwEUYT4wA0o9Iof83kVDuY+8WQhHWLVG/ZbaRSEI=;
        b=HUyV9CmIkrFHjV8dtbzr+BeOawAczy8q4lmVAoguMWHOluwN5wh2lx0ZOKXm7Rs4ib
         jmofizthImKDONzniA1Zfpn9g8BxMbAdURudek0QqhDtfMjw/5z+2dQ5MICEi0d5gZod
         JD6A6PnkBrFRR2AVmLAsiw/WF3jzKRMCgvSiTLQeuJZ6oQVCLewCtmIpm6AlSxNpWg72
         /iS6bGelrNBUT+rMvWJOqFZjlN1IAP2kideZBJ9vjnzdI9lnS89I+qOqs0iWyyCoAfZP
         mVxaDpOaPuzLDL4emXsiNt1XWvG1M3GZn4bgUmHmPERFsat+GSmobVPNjUmD29dKmU+g
         Ufog==
X-Gm-Message-State: AOAM530Y1sfSTYEqwBkAHBhdIsrinO6qjNh6pRiDPumizTPCQfHMSBq3
	FrUExxmvT/hosYZ3laa54SRDCPZVO9C2DqeWz9Q=
X-Google-Smtp-Source: ABdhPJzktWSoI946+lZ7pjWyN/ekV73X2hwjuqcst6G2swjsygjRVCych8uOdR+XhNlVa5r/wUWmeZxcvx/O4THHIpE=
X-Received: by 2002:aa7:df0c:: with SMTP id c12mr20608315edy.234.1602596072064;
 Tue, 13 Oct 2020 06:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201013132109.2588755-1-yann@blade-group.com>
In-Reply-To: <20201013132109.2588755-1-yann@blade-group.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 13 Oct 2020 09:34:20 -0400
Message-ID: <CADkTA4PLQYvpAAauYP1MP3FNNeZQdimMt2j-itVSf28vHarhDg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] kernel-yocto.bbclass: fix reporting of config mismatches
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2020 at 9:21 AM Yann Dirson <yann.dirson@blade-group.com> wrote:
>
> From: Yann Dirson <yann@blade-group.com>
>
> The warning was not issued because of a filename error (looking for a
> gatesgath-era file in older tree).
>
> Before gatesgarth we have two files (one with short list and one with
> more details), whereas starting with gatesgarth we only have a single
> file with all details.  Nevertheless, for consistency with the
> presentation of "invalid.cfg" we'll just print the contents of the
> short "mismatch.cfg" and point the user to the more detailed
> information.
>
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> This is not applicable to master, where the "mismatch.txt" file exists
> and shows even greater details.  Looks like the change was introduced
> for sumo in 5ef0620b18606fd5749b6e7811d337f26075b86b - would that be a
> mismatch with yocto-kernel-tools version ?
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index cc8bcb909a..771b4d8654 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -431,12 +431,13 @@ python do_kernel_configcheck() {
>      bsp_check_visibility = int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or 0)
>
>      # if config check visibility is non-zero, report dropped configuration values
> -    mismatch_file = d.expand("${S}/%s/cfg/mismatch.txt" % kmeta)
> +    mismatch_file = d.expand("${S}/%s/cfg/mismatch.cfg" % kmeta)

The use of mismatch.txt is completely intentional, and it is populated
by hardware tagged options that are detected as being mistmatches.

So no, we don't want to directly expose mismatch.cfg. it shows
unclassified options.

Cheers,

Bruce

>      if os.path.exists(mismatch_file):
>          if config_check_visibility:
> +            mismatch_details_file = d.expand("${S}/%s/cfg/mismatch-all.txt" % kmeta)
>              with open (mismatch_file, "r") as myfile:
>                  results = myfile.read()
> -                bb.warn( "[kernel config]: specified values did not make it into the kernel's final configuration:\n\n%s" % results)
> +                bb.warn( "[kernel config]: specified values did not make it into the kernel's final configuration (see details in %s):\n\n%s" % (mismatch_details_file, results))
>
>      if bsp_check_visibility:
>          invalid_file = d.expand("${S}/%s/cfg/invalid.cfg" % kmeta)
> --
> 2.28.0
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
