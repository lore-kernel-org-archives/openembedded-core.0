Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web08.2044.1607023821983927718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 11:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QEadOYWH;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id y197so3226220qkb.7
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 11:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WkrfkoDO57A1k3dmcEg1EFqjLsBCK/EqA7UF4YhLBDM=;
        b=QEadOYWHz1q11fGe7ENsCRSgVH2quMAj6CEPjoHjdP6YEzBPC8q0XoQ2U4hSFSCmq1
         qHTxlAmHmiSqk8CMpbs7wglMCZ9//7hhVBLgbbd1A+lhkSXnDD9TM8WIrYyiS/doD84N
         EXPwzvn5Vu9Glec3HbJFQhNVOlvO28Rc1dvyYTORKU1r843kRp42GmDfQnZT7MVKGQMj
         2ceW+6GUzm94e+yJgzuyoopz5F+kTig4jMzNXMXfMhUGIiqqV5wsll7HuixUb4ijtqyJ
         /oQkY4iAAvxxo2U9GQHoVW/CBNWfYrlhNj+ppdHaq/kRrY9tYQz59kzRyO6IdU7Xt9Mz
         QjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WkrfkoDO57A1k3dmcEg1EFqjLsBCK/EqA7UF4YhLBDM=;
        b=sJwjF4LpqaWqKk40DRjl/atRLQ6JgTCd4LacHbPQmmCkjDj56aL8YQXHdbTH3Bj9hL
         uIRdfOsQJMox3iuqhmQzjdVJbXddxhenKX6VznVNOFmwYsExixG9gKwgAVRHlPzlNaUg
         WyRWCeOjWK6sxc+ZVZRO7/mXTR/L2a6CqlR47m8BRcxX4xKUhXHbtEBaXAqahjBfZzTS
         9BX6zu+MR7FVc6qYfndyT74iW3bnHUMVua8+LGpPxAtRveXUYhep1FJ9cI7Ne8JuCfFr
         9tzubej0kPiq3LeiIwHHwy3EskKLFuU6kucMU3Bns2Agf8CfbSPxu3QcwoqWdAiO0Qzw
         pWnA==
X-Gm-Message-State: AOAM531uTk0dmAVMwccpljdyFHT2+NwgCipyu5fs0Vw0EvbE/0FSssXx
	ftiJu+gMJBdQROZ4AV/YaqxkY+b7US3E1aY1fuo=
X-Google-Smtp-Source: ABdhPJxbWkw0dLPIEdXwrWOFCQHVZa69vVSgb5iN91TxcYKVHvTQnX7x7R0aYpoNf4GnV4F696ExEFbFwlkm2Hh+wGM=
X-Received: by 2002:ae9:f402:: with SMTP id y2mr4511952qkl.9.1607023819692;
 Thu, 03 Dec 2020 11:30:19 -0800 (PST)
MIME-Version: 1.0
References: <20201203133727.12936-1-alex.kanavin@gmail.com> <20201203133727.12936-8-alex.kanavin@gmail.com>
In-Reply-To: <20201203133727.12936-8-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Dec 2020 11:29:53 -0800
Message-ID: <CAMKF1sq+iTO90AcsPaMVcRXiqEaPYtfoar+LMTQwEWOoQx712g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/11] serf: do not install the static library
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 3, 2020 at 5:37 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> scons is using host ar to create it, which may or may not
> be built with reproducible option by default. Rather than
> patch scons for the benefit of a single recipe, let's
> just not install the .a, which is unused anyway.
>

honestly, scons should be fixed here. Since it will be used in more
than one places
using host ar is never a good option for cross builds.
if you dare reluctant to fix scons properly that's fine but at least
create a tracker bug for it.

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-support/serf/serf_1.3.9.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-support/serf/serf_1.3.9.bb
> index 6a27f12102..2fbf96f997 100644
> --- a/meta/recipes-support/serf/serf_1.3.9.bb
> +++ b/meta/recipes-support/serf/serf_1.3.9.bb
> @@ -30,4 +30,9 @@ EXTRA_OESCONS = " \
>                    OPENSSL="${STAGING_EXECPREFIXDIR}" \
>                    "
>
> +# scons creates non-reproducible archives
> +do_install_append() {
> +       rm ${D}/${libdir}/*.a
> +}
> +
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.29.2
>
>
> 
>
