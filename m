Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.2690.1585704568955689825
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 18:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XlLtJSXU;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id o1so9479337edv.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 18:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zzyOcgdzSW7aklztlFTE4nV/8QqLsby7/79RgoF5MNk=;
        b=XlLtJSXUD77WQfZ28A73GFnYft4y0mEx0s9uXdPLf1v6IgqmbYDR+mMB/yCOWai6w1
         GvIdiHpNKmXCakcgLtyJQLPQlM0mnxITW4isvEKGb2+f2HyFjhFArL1jmyOEZMjZIS1k
         A0s5zjGfaWd0JS33u3+AvWlyIJiHvcUnlKfg1jm+OS45v+Ffw7vrqx+Pqh8ak6gcykSm
         yltK10OqOemrQ0iiuzSXO4EcNNn4paP0MapXdAP80ITrmW1f3YTRwZzaT640z5jl4fLv
         Wos/ypcx1ihFA0icMZovPsxp84eLwHil0z/sle0CrCL+24r0wLMaqkwozlN34cffhE8J
         4Jnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zzyOcgdzSW7aklztlFTE4nV/8QqLsby7/79RgoF5MNk=;
        b=tyHlJjZ4Z/IdWCPwXWcHrlSJ1hEiEEU1Gf7hrH9TyEl/uDP1MSUmsPNenyJ15OZRuY
         az9bfq47D0z913r+tO2vthTbyZRUiwTLqtcoWDi8cGkQBIKlsgmKYllQ8Vvy6sq/eggu
         LDUWUusPNVu4NZxMVkGDIy5wzMR60kzk0BR9mEaFmGB4pgJ/WPxt2ZMlJNhBeBGSYqiQ
         V79IGBKvaEPDIZKy/tOH5/RePjdwj6csYt52HGm2YZrWN+aNPD4FTYv1FVvM/qT7Td97
         vUITCZkc8ftByZociRV+1rk0I6ER6aru+7w186t+XUFP050tsnXqeXp36J/f1DmzgRgC
         ix5g==
X-Gm-Message-State: ANhLgQ0lv4BH5ZmIKiZJR43GBhGCcl8WwdRl2SDzmFL/3sXM78z9KTX3
	D03HpDEd763vTNXUoxd5pH0HJtkLyVIyqmZK/QY=
X-Google-Smtp-Source: ADFU+vvyFP1tQs1B+UCZ8NPkQ9q9NQnlGb6t7bT/V7TP96WHGkQreGy070I5d5hwOPBtXVqtVVxfPvshDKtJhwyW0mY=
X-Received: by 2002:aa7:c48f:: with SMTP id m15mr16693080edq.164.1585704567219;
 Tue, 31 Mar 2020 18:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200331235607.93023-1-paulburton@google.com>
In-Reply-To: <20200331235607.93023-1-paulburton@google.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 31 Mar 2020 21:29:16 -0400
Message-ID: <CADkTA4NEN1PPVrm7N2HF+tVa4j2Tgv1_=YYFmQhbFscV5RSjWA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: Stop creating empty .scmversion files
To: paulburton@google.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 31, 2020 at 7:56 PM Paul Burton via Lists.Openembedded.Org
<paulburton=google.com@lists.openembedded.org> wrote:
>
> The kernel_do_configure() function creates empty .scmversion files
> within both the source & build directories. The presence of these files
> causes the scm_version function within the kernel's
> scripts/setlocalversion to always output the empty string, breaking the
> kernel's CONFIG_LOCALVERSION_AUTO=y functionality which appends that
> string to the kernel version. Rather than appending the git commit hash
> or another SCM revision to the kernel version, the empty string is
> appended causing CONFIG_LOCALVERSION_AUTO to do nothing.
>
> This behavior was introduced for the build directory by commit
> c73e50a91e02 ("kernel.bbclass: fix extra + in kernelrelease") and
> extended to the source directory by commit cafb94f57123
> ("kernel.bbclass: touch .scmversion also in ${S}"). The motive isn't
> entirely clear since these commits contain no meaningful descriptions
> and the former links to a mailing list archive that is no longer online,
> but the '+' character referenced would be appended if the kernel were
> built from a dirty working tree. This in itself is useful information;
> hiding that fact can only serve to muddy a user's understanding of what
> kernel they're actually running. I have verified that building a kernel
> from a clean working tree does not result in a spurious '+' character.

I have all the original email from 2011 on the topic, Martin probably does
as well.

A snippet from the conversation is this, and it is about moving some kernel
build steps into oe-core from meta-oe:

------
"If you're working on shared linux.inc in meta-oe, could you please
integrate this:

do_configure_prepend() {
#otherwise it gets extra '+' "2.6.37+"
#because:
#$ scripts/setlocalversion . => +
#$ make kernelversion => 2.6.37
#$ make kernelrelease => 2.6.37+
  rm -rf ${S}/.git
}

I have to do this in every git recipe as I don't like dirs like
/lib/modules/2.6.37+

Maybe it should be fixed on kernel.bbclass level, because linux-yocto
suffers the same ie /lib/modules/3.0.12-yocto-standard+

Ccing oe-core for that.."
------

I didn't make any of the changes, but looking at the thread, if you aren't
getting a + added to the localversion or directories, then I can't see how
it would break anything.

Cheers,

Bruce

>
> Remove the creation of the empty .scmversion files in order to restore
> the kernel's CONFIG_LOCALVERSION_AUTO functionality. This allows users
> of kernels built from non-tagged source & configured with
> CONFIG_LOCALVERSION_AUTO=y to better determine what kernel they're
> actually running.
>
> Signed-off-by: Paul Burton <paulburton@google.com>
> ---
>  meta/classes/kernel.bbclass | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index a724645466..46e24a19e2 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -521,12 +521,6 @@ check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
>  do_configure[prefuncs] += "check_oldest_kernel"
>
>  kernel_do_configure() {
> -       # fixes extra + in /lib/modules/2.6.37+
> -       # $ scripts/setlocalversion . => +
> -       # $ make kernelversion => 2.6.37
> -       # $ make kernelrelease => 2.6.37+
> -       touch ${B}/.scmversion ${S}/.scmversion
> -
>         if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.config" ]; then
>                 mv "${S}/.config" "${B}/.config"
>         fi
> --
> 2.26.0.rc2.310.g2932bb562d-goog
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
