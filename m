Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web08.7449.1603971864696804849
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 04:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ez/c1IJR;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id k3so3337559ejj.10
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 04:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lEpY45UYaKI7LdVYGmNM9Kxs24Z/yABbZs/aj0+EuIw=;
        b=Ez/c1IJRko2nsPT1cj+kaQa+XQ1a8BJIIeJ2lTNH1zqLjKEh1ViKp3L25XiAuZDZyb
         zsiv7bvBLCDQY+fZ5o3xrU0qYhkL2pHbbwLQp2OFa3TYIDQhDp0aIKd74kSQzAENPw51
         zM3WqYYL0V+e9QH58faKhRFowtfxQ7VGJc0fhOyau0hiofedQyJQ/7FIhBNnfkRjDP+P
         kT3RrMCIhbYu72c7+nIWBR41d79sFimScFrpqy70kBdVBoQ+eCjM9/xo6yjRRC9zh+2F
         SVECT/oc0REYuOqjDKHK4xgknjNxrTyo7X5MxZ3el0sPQ2eCT8xOWZ+RCy/24wl/vPhz
         DNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lEpY45UYaKI7LdVYGmNM9Kxs24Z/yABbZs/aj0+EuIw=;
        b=h8VCSr46i1QXCBEiTM1ba4vvu+0CvVibhtZMT7D8grXjr7lNtzlHSdaT53HsbHVG3Q
         Q06DVv5HNoxI4L7p3pjcrOdpSA+ALTH9x7ZAK0jc9D8Fhf9/TMO/uE0Jm0RerdgYSFt1
         ZbnxLw4sLxAcfKvAO5xtWWOZPeCnxqrPQszRU7rquCVUnpptgP+03W5xo8m0Vh96y6b3
         gq2/fIADlBTCNipT4b0BuHxNfhH/SZNCAuVsnrvUSdsKucfAzJgNsWDBNe4/OjqIlOMX
         Qd7a6hOwYcO5uInvCBhXAHqqcyrzVM+A3/C52OBV7ltOmmF7TbJmlFZoniwZPjrLpGSi
         WTHw==
X-Gm-Message-State: AOAM5307nwrAY+fLvSLYW5hltqcb5kDpQFH05ZEcRlCNFM97Mq/cUZau
	8IrrtGjAMOPf0DsAmMTHKHGZrAsylnjaWz28FUY=
X-Google-Smtp-Source: ABdhPJwexP/hxqYu92C8IA8BUdrxbXW2zeh9NsrXJfxwXWvKSg4X2FmOATCJ9F2dSfISZ8THPfNFN5c7cEgTFgL4JcI=
X-Received: by 2002:a17:906:3a55:: with SMTP id a21mr3520756ejf.357.1603971863016;
 Thu, 29 Oct 2020 04:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201029114052.23141-1-dzagorui@cisco.com>
In-Reply-To: <20201029114052.23141-1-dzagorui@cisco.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 29 Oct 2020 07:44:11 -0400
Message-ID: <CADkTA4OGBOtnMD=t1xppe-5quLow8uPf99ZHknrSnPLAQKkoDA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-devsrc: improve reproducibility for arm64
To: dzagorui@cisco.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 29, 2020 at 7:41 AM Denys Zagorui -X (dzagorui -
GLOBALLOGIC INC@Cisco) via lists.openembedded.org
<dzagorui=cisco.com@lists.openembedded.org> wrote:
>
> .vdso-offsets.h.cmd contains command that was used to produce vdso-offsets.h.
> It breaks reproducibility because it has an absolute path in it. There is no
> any value to package such files so it can be dropped.
>

Have you confirmed that an on-target 'make scripts prepare' property
regenerates the file without triggering and oldconfig ?

Otherwise, the change looks fine to me.

Bruce

> Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index aa8e162f4f..f8c750beaa 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -113,6 +113,10 @@ do_install() {
>         # but without this file, we get a forced syncconfig run in v5.8+, which prompts and
>         # breaks workflows.
>         cp -a --parents include/generated/autoconf.h $kerneldir/build 2>/dev/null || :
> +
> +       if [ -e $kerneldir/include/generated/.vdso-offsets.h.cmd ]; then
> +           rm $kerneldir/include/generated/.vdso-offsets.h.cmd
> +       fi
>      )
>
>      # now grab the chunks from the source tree that we need
> --
> 2.19.0.dirty
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
