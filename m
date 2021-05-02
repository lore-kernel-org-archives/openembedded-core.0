Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.26574.1619996435412123197
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 May 2021 16:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ekPGKth1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id n205so1382961wmf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 May 2021 16:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=x5SrZoppnsU0t9Wg8czO46hA7snND6YIKLP0+xxN23w=;
        b=ekPGKth1jzRbC/dtdc7QzPLdS1aEwtTRBOurzDaAC1ZC/SqEzHN8eGNQrxWzcS97y0
         3gC32QCIhLpkhhCE1l8wt4nO9eqm8dnDTB5PZtA63BW8zRQNPuxSdgmwt3B6LfKDeE6c
         EBBGgzaxchHPOfRj+WBzHPhc8yPCRvE7eD1XM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=x5SrZoppnsU0t9Wg8czO46hA7snND6YIKLP0+xxN23w=;
        b=QBOEQ1pYmP7PDkaYc7ZIXBzuXTtmUsT/gI2n2MzijItT6DqAROupfuJH3WQ/J9b0Ls
         901SAUd6RpzTcssFQ0fRVOHOXxxRpu9p4bm5x2IAVSCMYWrAYMZr7yHF8VJ1KwioX4hu
         jRYMmTEJgMQKnmIfUWcRuw0oATXxMV5fItn9J9RCYRWsEw/jwwrS1cAzbeRGFlWWpfQH
         hK+6dj8pbDGx/3WwYGyuGZvklu8JQgYGEA4qvpI3nLf3+YGaKYu95OucWueyA7DvE7Ms
         cr/TZDWzYq7ChpaqQ2YnouX5SKmnJ5PMpsOiTgEr6MlCIVqm9BQpkis0SeVBVKg0xuG9
         5zuQ==
X-Gm-Message-State: AOAM530UxkdMsVOgfhWhOBjYPO6B7LirH+e/BVO3Rz/+ioXDZCQB/s/C
	uRZPTCukSWXjln8LmDQYIrcjhA==
X-Google-Smtp-Source: ABdhPJx14wEw+jtzAXI1iwF2d+VKy7NUNbzBUHk96OE6CLODPaivwDj6KMFMMtGLISy7oPkrB2Jc3g==
X-Received: by 2002:a05:600c:210f:: with SMTP id u15mr2376893wml.167.1619996433869;
        Sun, 02 May 2021 16:00:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2abe:bb29:590f:e028? ([2001:8b0:aba:5f3c:2abe:bb29:590f:e028])
        by smtp.gmail.com with ESMTPSA id f3sm10509574wrp.7.2021.05.02.16.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 16:00:33 -0700 (PDT)
Message-ID: <f9d76fc95bd43c5418eb5c947c48399f5f15b7a2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] testimage: hangs if missing debug-tweaks
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 03 May 2021 00:00:31 +0100
In-Reply-To: <20210502201227.3587958-1-akuster808@gmail.com>
References: <20210502201227.3587958-1-akuster808@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-05-02 at 20:12 +0000, Armin Kuster wrote:
> The only clue is this:
> 
> WARNING: core-image-minimal-1.0-r0 do_testimage: Couldn't login into serial console as root using blank password
> WARNING: core-image-minimal-1.0-r0 do_testimage: The output:
> root
> Login incorrect
> qemux86 login:
> Login timed out after 60 seconds
> 
> Poky (Yocto Project Reference Distro) 3.3+snapshot-65e75bd5d40c10509a3416026e551b7b7111c42a qemux86 /dev/ttyS1
> 
> qemux86 login: <<< run_serial(): command timed out after 120 seconds without output >>>
> 
> Hangs here....
> 
> We should issue a error and quit.

What happens if I set IMAGE_FEATURES = "empty-root-password allow-empty-password"?

Should we disable the serial monitoring if these or debug-tweaks isn't 
enabled? I'm surprised it causes the image to hang, it should just trigger the
warning but continue to work...

Cheers,

Richard

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/classes/testimage.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> index 43de9d4d767..18ebbf90ec5 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -142,6 +142,10 @@ do_testimage[depends] += "${TESTIMAGEDEPENDS}"
>  do_testimage[lockfiles] += "${TESTIMAGELOCK}"
>  
> 
> 
> 
>  def testimage_sanity(d):
> +    if (bb.utils.contains("IMAGE_FEATURES", [ 'debug-tweaks'], False, True, d)):
> +        bb.fatal('testimage requires a blank root password'
> +                'Please check if debug-tweaks is IMAGE_FEATURES.')
> +
>      if (d.getVar('TEST_TARGET') == 'simpleremote'
>          and (not d.getVar('TEST_TARGET_IP')
>               or not d.getVar('TEST_SERVER_IP'))):
> 
> 


