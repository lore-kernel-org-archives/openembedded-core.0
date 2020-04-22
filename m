Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.5278.1587597582666949016
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 16:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T1szrY/o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id t63so4426206wmt.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 16:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=1oUaWvgOI8OYRKBf/+v5lIJ86u3Xgl8ikDyeT8JacyE=;
        b=T1szrY/oewNhw2FwogWUuk+xVMfd3yoNHjly+9ZErxJXvxee/OhdYsBt8xJbNcdIIR
         NEiV/7bznzb+TJcGqiWIguO8Ky7SQm4ulMpVVyVWTGfEnTtCLXjvEZbf4E5LTmublQVN
         oRKm/UeTNJmp9FNwDAVozpkaF67nH1RAT+qEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1oUaWvgOI8OYRKBf/+v5lIJ86u3Xgl8ikDyeT8JacyE=;
        b=PAvvq2UHNGJZpRsaB27CmOrEWT5XCV2YTAMuof7IUYVnxxE59tPIHESLON3Q51xwjG
         iZMtuYHGV669GwmF97wBPaGX7S2pkratiGcFm/c7fcSax4PRMrOMrBmXyBYPGvSeHe5x
         zWw6u2AOAP3jrb8zLs5j+bRPXJu3iKKU06LFvLMV/IA7vabEmf+7Jg0KI8rCcIbUNp6O
         s8s4/gKICbf3zpr6GvwVQNgs2lPyahx/yvecOqIT6VuIUrlsXrCLasxJ3yE+4oV6ss3+
         8Poo4TJ0Jn5FpNYktUuVr7nSMuLqbQBVvedYytBPOEzcZvURpiOs+JAvCFeKZUOrdqAy
         GAUw==
X-Gm-Message-State: AGi0PuaicfGQxyFSq9727l5ppYSF9ON7ir8VYOEfxwweVdXlDUFjFU6o
	T+uyP0TZl9GY6rRID7mgo6l/2bM0Zgc=
X-Google-Smtp-Source: APiQypKbjuu9xV1B+QncXo0v+wembz42YLjFVnYT1M6erki+pLHEf3Wi2ckDliPqN43CCRuf+m3+7g==
X-Received: by 2002:a1c:2705:: with SMTP id n5mr862191wmn.94.1587597581014;
        Wed, 22 Apr 2020 16:19:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id p7sm1027993wrf.31.2020.04.22.16.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 16:19:40 -0700 (PDT)
Message-ID: <127a7d4591d9071eed0dafddb69bf8dc180cfba9.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/2] toolchain-shar-extract.sh: remove legacy .o files
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2020 00:19:39 +0100
In-Reply-To: <20200422072838.27867-1-Qi.Chen@windriver.com>
References: <20200422072838.27867-1-Qi.Chen@windriver.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-04-22 at 15:28 +0800, Chen Qi wrote:
> We want to make sure `make scripts prepare` succeed inside SDK. However,
> the legacy .o files under scripts/kconfig will introduce build error
> on some hosts, thus removing them.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/files/toolchain-shar-extract.sh | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
> index 04527f891f..61911e72c9 100644
> --- a/meta/files/toolchain-shar-extract.sh
> +++ b/meta/files/toolchain-shar-extract.sh
> @@ -286,6 +286,9 @@ if [ -e "$post_relocate" ]; then
>  	$SUDO_EXEC rm -f $post_relocate
>  fi
>  
> +# Remove legacy .o files to avoid kernel build failure
> +rm -f $target_sdk_dir/sysroots/*/usr/src/kernel/scripts/kconfig/*.o
> +

We should be removing these at SDK construction time, not at extraction
time, then the SDK is smaller and we don't have special cases in this
extraction script...

Cheers,

Richard

