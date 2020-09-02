Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.8827.1599057255266622200
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 07:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iq8utIN6;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id n13so5146679edo.10
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 07:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qFp+ZPFmkwwCuVNgPBe7ymnHyxgksm6SXbk39E9i2rk=;
        b=iq8utIN6Q1LNy+iDkECxKj9Gqf1NlLyvecndHnAfpF/xfMo2coQ4INL7iXVxR/g33r
         c5jBo2IzbXUZKvvn0aYM7k5Rk2lqlrrLVFK/vgqAqf4alyOWJQAHtf7Ntw+rt4U/qi+B
         IwiaJ0kYg52butDRXxilziRhasSTo7UgYUGrWTKr9cwWc5uL3uUePnyLnY2w03rLIUvN
         4IwptwhlRENryA6SlHzJ4WX1sdgHU1pFRwihAwmeBI0JKQFPONywcbTBdMHUAtVMrPC8
         zoFYQYLIw0h58qvMPtgXQ4QEP9esu2flZGj+lFgFG4pOl5UAyYsBOqxYgDjZoynjCt9A
         j47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qFp+ZPFmkwwCuVNgPBe7ymnHyxgksm6SXbk39E9i2rk=;
        b=R+aqRYTsldJIjUei7g64sNl9ufHjdthYDFyGvP/ZKruycFTiFtdkvsTtXzd/FVQAEz
         +uZCgSmYOCJFr+lKxtvlf8zbtJwBt7OrOjXv7s8DmSioWrK4heMepmTnR5sv3jvuApnK
         c76zzPiUb8ekpNwWhtETBxSqdypYTPN+eujwofjlDXisfigevF9lwnwEVYqf1RaKK6rV
         iu9UPRpkijat3D8kizn1yaxJcDfBzjg61RDi6UqLCycRlJJfjyxn0lL6t36cXRzDTiYe
         Aw4aBdK5uosOaJqh7y3/Iqw9++7FaDETiAMW304ma6dDbnRERY2prIvWPTRcWL7KrEUu
         qgBQ==
X-Gm-Message-State: AOAM532OYJynSBVKv3G30aZkFz5nIPrOmsoivR8u14T0GGUyQkJE8Gwd
	EO3aL6bkakvU6xq74xBozX/0rS1pd7Hgxtq+CJE=
X-Google-Smtp-Source: ABdhPJxHVmg9cvre330M9pP+ygpu4VkEiUbgAGVFtWrezbaU+bOFaTm/VY4xu7+ClHq5+eqYpLo2k/49BvFakpa+QN8=
X-Received: by 2002:aa7:cad3:: with SMTP id l19mr351628edt.352.1599057253574;
 Wed, 02 Sep 2020 07:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200902143304.22364-1-bruce.ashfield@gmail.com> <20200902143304.22364-2-bruce.ashfield@gmail.com>
In-Reply-To: <20200902143304.22364-2-bruce.ashfield@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 2 Sep 2020 10:32:19 -0400
Message-ID: <CADkTA4Ok39sQq7s6XndbnjJo3Ts8SVCVPr6+SBRtfW3gMm+3xA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kernel-yocto: only replace leading -I in include paths
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Note that this patch is slightly changed from the original.

I tweaked the short log, and added an anchor to the sed expression. So
this one should be used, versus the earlier send.

Bruce

On Wed, Sep 2, 2020 at 10:33 AM <bruce.ashfield@gmail.com> wrote:
>
> From: Yanfei Xu <yanfei.xu@windriver.com>
>
> We just want to remove the first '-I' in $d, hence removing the
> g' of sed avoid changing the real path which is include '-I'
>
> We also add an anchor to the regex to only match -I at the start
> of the path.
>
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index cb7614d64a..6e74d08dca 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -226,7 +226,7 @@ do_kernel_metadata() {
>                 for feature in ${KERNEL_FEATURES}; do
>                         feature_found=f
>                         for d in $includes; do
> -                               path_to_check=$(echo $d | sed 's/-I//g')
> +                               path_to_check=$(echo $d | sed 's/^-I//')
>                                 if [ "$feature_found" = "f" ] && [ -e "$path_to_check/$feature" ]; then
>                                     feature_found=t
>                                 fi
> --
> 2.19.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
