Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.9248.1591257739906961206
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 01:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XAzAoOav;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id u13so4271343wml.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 01:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=qGND8gQJtpblizTfhcV4wUTBfDc20nPmHmH5DKQT37Y=;
        b=XAzAoOavkpiWPK4pgEzGZSvzUdxISYlZ10HxJHp6TwPY2Gj2WZma6e6KyG8Lg4tA9M
         8lfzupU+QJUrUHCkPl170aJ9MfEx6lNqlzAmlfTGGNiHbJAvmVmUN5ZWhrOYbiGEuML7
         VdwqMOgvEHgY3p2wffES/66ox47fua3PAcvOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qGND8gQJtpblizTfhcV4wUTBfDc20nPmHmH5DKQT37Y=;
        b=mv7ZXzLXJU77N7/hCfRGX+hUgEAVOJTWa+Msls5r7m/JwhNfKeAGK5GisnD6KoN3ul
         O4aYh6oZrsyNF7psGdFzOzFBQeG9Z6744RO9gCvUU7b0/ymmLrc1ultHtAPK3q/oDeOI
         wvzLjd/E11I/aqrUScEihUmOi9zd4+0YBJQcdSiZ/ChzFDpsj8ZPYFHbGG6ASaMln51M
         zVrFzZdW4UulQlOF1wrzTBT808AfbOHem+mXIPoRSU04UOlQqwf2ywPUxfNC4DtxBxgt
         PK/mLw5fTYincBDC7ve73dlMKPgpGFPeYapQyOHgvVTixu5SHtzc8hRmbfGWcg5KtgX9
         3aOg==
X-Gm-Message-State: AOAM532c2KeISOBaAbZ/M8Q7i8EHp373DOWcred2WEvly7gLMQjJy4xj
	wmhmPy+Srg5WEsWcFBHYGRM8+w==
X-Google-Smtp-Source: ABdhPJwPQSk4IqwkW0CVIlxV7HWoGY5zJ1rTwqmoRryxFsGA4jTQHf0ZVSweCc3PFerBYyxxvfyojg==
X-Received: by 2002:a1c:9d96:: with SMTP id g144mr2718832wme.126.1591257738330;
        Thu, 04 Jun 2020 01:02:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c65sm6396629wme.8.2020.06.04.01.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 01:02:17 -0700 (PDT)
Message-ID: <14b27a884632bd9c33b1b6aab57422c31422a3b8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kmod: fix RCONFLICTS setting
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 04 Jun 2020 09:02:16 +0100
In-Reply-To: <AM7PR05MB6881DCC70535A434D4B63AEFA88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
References: 
	<AM7PR05MB6881DCC70535A434D4B63AEFA88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-02 at 22:44 +0200, Konrad Weihmann wrote:
> Previously used libkmod2 isn't known in this scope,
> replace it with the correct libkmod
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/recipes-kernel/kmod/kmod_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
> index bd21d2ff73..5cfd2238c9 100644
> --- a/meta/recipes-kernel/kmod/kmod_git.bb
> +++ b/meta/recipes-kernel/kmod/kmod_git.bb
> @@ -10,7 +10,7 @@ RCONFLICTS_${PN} += "module-init-tools-insmod-static module-init-tools-depmod mo
>  RREPLACES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
>  
>  # to force user to remove old module-init-tools and replace them with kmod variants
> -RCONFLICTS_libkmod2 += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
> +RCONFLICTS_libkmod += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"

This change caused:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2006

(and pretty much every other build to fail too)

Cheers,

Richard

