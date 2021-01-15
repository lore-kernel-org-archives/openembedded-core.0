Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.841.1610749284519682618
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 14:21:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zi0Ad0zo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id r4so8860951wmh.5
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 14:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=1wsTYW2mYGcmbHVZnMxqM/EjFYb7PCKMVO/mpBsh55E=;
        b=Zi0Ad0zoh/2tQFuL0fgzk+E4EIJOxIxbv7tYFpbo4DMtzP+au4LL/w5uS4JFcN4kzV
         B5Wl4O55ENqnV+r6m5BtSoeTkK08XR41JZOTazB/ftgd498QRs4jEOZ750YozYtqA7sx
         MOGRJlV7EiJ/sscjMNh7SyLuvN3IF9pwA99a4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1wsTYW2mYGcmbHVZnMxqM/EjFYb7PCKMVO/mpBsh55E=;
        b=kq6U7eNlG8+7BNziMO4niudtIshPV7FQme3DGbl0ngBfMtn++palwCyKuC3tp9cAM+
         G4Tu715+naVkVB45i1KUlFwG8HlP7UU1VeMwXCFocX2w9Q1z+8pQnDT/XPA8JLhrM5TJ
         bQwhpWFqgWCmGUJfFuoGcUfDiL8diGy2nmrPM/2F2Z9zTT/1yUYxbNei0fbHFuNlsJB2
         dJGURr3CF0a/R3HsliEyRg4Z0JL28re7zIhThaSMQ5z/nQAYOduLbh6LwFJFhuG1IzpF
         IcQ7IzetTaUme/2JIXsuU0tDG0EkfpP+B5S83rFn9OK3Xg5d9i/1CkYq7OI5mwW0saRv
         AHOA==
X-Gm-Message-State: AOAM530xeyjsrouRgzBdrLA2iy/meDLNUz2+7/aSjZ2u3a8F0w2ljSWi
	4pB9xqQ+wNu19caEsjFzIbyBXlo2x2Qx4w==
X-Google-Smtp-Source: ABdhPJykj/rXAn7WULD3Nx+5aeWlRN3rppNC6heQ6KpvtxJIm5s/C2fScjK8JvjY9E7pKVjK7ZPShQ==
X-Received: by 2002:a05:600c:2f97:: with SMTP id t23mr10811820wmn.82.1610749282940;
        Fri, 15 Jan 2021 14:21:22 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b202:f78f:5317:247f? ([2001:8b0:aba:5f3c:b202:f78f:5317:247f])
        by smtp.gmail.com with ESMTPSA id q9sm2917331wme.18.2021.01.15.14.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 14:21:22 -0800 (PST)
Message-ID: <32c70df536b241c06742c5e75a4aaab8f02f9d88.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] deb: do not insert feed uris if apt not installed
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: hongxu <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2021 22:21:21 +0000
In-Reply-To: <20210115094536.18651-3-hongxu.jia@windriver.com>
References: <20210115094536.18651-1-hongxu.jia@windriver.com>
	 <20210115094536.18651-3-hongxu.jia@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-15 at 17:45 +0800, hongxu wrote:
> - The dir /etc/apt was created in package apt, if package apt was not
>   installed, there is no need to insert package feed. Otherwise, it
>   will fail with no such dir
> 
> - Output the result of apt install
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/package_manager/deb/__init__.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
> index 10ad707c23..1e2278d6a4 100644
> --- a/meta/lib/oe/package_manager/deb/__init__.py
> +++ b/meta/lib/oe/package_manager/deb/__init__.py
> @@ -287,7 +287,8 @@ class DpkgPM(OpkgDpkgPM):
>  
> 
> 
> 
>          try:
>              bb.note("Installing the following packages: %s" % ' '.join(pkgs))
> -            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
> +            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
> +            bb.note(output.decode("utf-8"))
>          except subprocess.CalledProcessError as e:
>              (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
>                                                "Command '%s' returned %d:\n%s" %
> @@ -343,8 +344,12 @@ class DpkgPM(OpkgDpkgPM):
>          if feed_uris == "":
>              return
>  
> 
> 
> 
> +
>          sources_conf = os.path.join("%s/etc/apt/sources.list"
>                                      % self.target_rootfs)
> +        if not os.path.exists(os.path.dirname(sources_conf)):
> +            return
> +
>          arch_list = []
>  
> 
> 
> 
>          if feed_archs is None:

I think this is resulting in these warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/2925

Cheers,

Richard

