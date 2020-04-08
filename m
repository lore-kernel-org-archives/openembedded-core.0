Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.2051.1586389569594738497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 16:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QAZmEjW6;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id o15so2124996qvl.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2020 16:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yvvG8JQjI9zv1ru4shSVfOK69Oz3dE2lHsjSQCwjMcY=;
        b=QAZmEjW6Ael2NRhvcSXQFBx5L71HUq/DzKuC15YjwjH4oWVTukhJQuFX6vU4ENRLDc
         6PNnZSVJC21FsDgRGc9LDGMBa4ky/h7E83tpMCn5DZ4l2RYqhq67NOsWFwhBb+sinRnC
         qKKD7jE8X5r9V2hEmwzsjm13PhBUstXES5CKKB/n9l6s2EHzdAei7dLag9xAnE18HKtI
         KY+Z2w0Un2F5ZF5kiuh+z+kFSY0Opaly+ZbKqzuO/eKA4mpDAhbXG5xa8Ye4V12TNa0l
         wIYl5LvZorHk2ccfGZ0AfsQndJ89Hm6RIwOvw857Zta3pdf99eWEGyFMKYxKFTqWJEnt
         EI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yvvG8JQjI9zv1ru4shSVfOK69Oz3dE2lHsjSQCwjMcY=;
        b=DTpnPxx055niy9kdZ9fPEJqTDE0VBiVsz6PJM56ci43q4wCdGlYrmwRvJ4JgdHesQ8
         kWsluyZmm0P16js6MuKv/5cwB2ufLn68wMZ8TgtjgHl1O9fClLJyH/xsU/HLUsMLiPYh
         YxJk1xuyQPeNqR4ayR/RXPgV2e5RN70St0xBwpO6lgkCYuO89RTofFVdyB7t7dTnWeaA
         uYTxuzrtYj1pv1M8XkyWkUkaeuI+6F/6l8Nd+asn5wozcb4YWVme/iapFlSMPKCcX2jh
         lgWcM9ggaxwLyl51ZkRIQVuxzPDPjyK6ADJrBfwk4Rod+5QjvLTE9n4IKt6tXN5XsuP/
         fkpQ==
X-Gm-Message-State: AGi0PubCV5zjr782vRW2FoLPiG0G9jUSuZjOV/HEq6LahTsC5sRdp7WJ
	ybFZOtjvrkoUNIAbqq88Qizg6MLnQcSy2ckCQeI=
X-Google-Smtp-Source: APiQypLj+1My8W2Rc5zKpBzN8FEQGUNfPOn5Y4eCWb/1jTiZxhGZ8HXzbUMvbHbcgkxgoDU1yOaMjOgDNWZUFEl73f0=
X-Received: by 2002:a0c:b78e:: with SMTP id l14mr10252392qve.4.1586389568397;
 Wed, 08 Apr 2020 16:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200408231808.393685-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200408231808.393685-1-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 8 Apr 2020 16:45:41 -0700
Message-ID: <CAMKF1srJ72-knr8BJxGcJ6Mct=y_Dt4DtZWMhs5UM+eoCf4i6A@mail.gmail.com>
Subject: Re: [PATCH] musl: Show error when used with multilibs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 8, 2020 at 4:18 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> As discussed in the bugzilla entry, musl is not compatible with multilibs
> and has no plans to support this. Therefore tell users this from the
> recipe rather than letting them run into build failures.
>

I dont think thats the case anymore, I have sent patches to fix
multilib on musl.
this seems a broad brush. What are you trying to fix ?

> [YOCTO #13122]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/musl/musl.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
> index bdce412162c..f2f3d3d054b 100644
> --- a/meta/recipes-core/musl/musl.inc
> +++ b/meta/recipes-core/musl/musl.inc
> @@ -29,3 +29,9 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
>  B = "${WORKDIR}/build"
>
>  do_configure[cleandirs] = "${B}"
> +
> +python () {
> +    multilibs = d.getVar("MULTILIBS")
> +    if multilibs:
> +        raise bb.parse.SkipRecipe("musl is not compatible with multilibs")
> +}
> --
> 2.25.1
>
