Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.9602.1591173851682754734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 01:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IORs5n4h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id r15so1100301wmh.5
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 01:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=1XObLFuEs3+UxzBU3ZccssdInzfadde8Y38coQzar74=;
        b=IORs5n4hhhsI6gv6jEWDLsIeEJphnDqvbtUPky+78NuAmz+MHfBQkFYbgIdjulIBuc
         jdNofvDdtwdo6jQQFG9kx59GnbKM7wr892NYYGSGLVjZ5ivm8vSlq+aLWHaaGGCYS1X7
         t8SXVpeF7F5sw1NQleNvawDDMrFj3fWO7Bpno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1XObLFuEs3+UxzBU3ZccssdInzfadde8Y38coQzar74=;
        b=XkdsIgrR22Zwx4wQvSLQ7/VRDC//uqLSspYq7HJZO4Z2Y2CiRGsm3D6DH2aAspcOUF
         6TRvYAN1uq+dudR+3Z4PP5uI0o3mlWVnJVUWR8zNvPaw0LC73sCw0vrQF2PoP5QQzy9D
         v7hs9OBcL8MNCsvndup8YQk++o64Vbqzcs3slMcZoMoogfsdiXov9FtjYo2NVxbL3cjS
         OTReVwvM3JKdQbyGrSkjCCPY0nWzJkQImf3phqsG6kW55em6moYLuNw1LlCLhwrj0+zQ
         Npq4LX9hXHRyr0YqMpcWPYReWGb/LF4avIM7rhuzJna1u+UA27iqCdDG4x+k0jG/prxi
         ao6Q==
X-Gm-Message-State: AOAM531McGg894aSJfQ6A1cSB43X7zPTFlEj+9oQJnTG5w3jMLk3fSxY
	FAYG5x0Ii/zAm1iDlTZEvnFLVhDKcsgLew==
X-Google-Smtp-Source: ABdhPJy0XGZVr0ymzIBUywr17ohPWvb09/3Kuii9354Hm5wZZ6pWEcOk+bVgmNSWAvgCcFIc4Xp+RQ==
X-Received: by 2002:a05:600c:291e:: with SMTP id i30mr7242224wmd.47.1591173850257;
        Wed, 03 Jun 2020 01:44:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id b201sm1887204wmb.36.2020.06.03.01.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 01:44:09 -0700 (PDT)
Message-ID: <837a7d98eafe1faeb0addb1db72e76b1d7c76fcb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ruby: properly append PACKAGECONFIG
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Jun 2020 09:44:05 +0100
In-Reply-To: <AM7PR05MB688165541EEC54AF8DE1016DA88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
References: <20200602204418.26224-1-kweihmann@outlook.com>
	 <AM7PR05MB688165541EEC54AF8DE1016DA88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-02 at 22:44 +0200, Konrad Weihmann wrote:
> As ??= assignment will be overwritten by += in any case,
> one can't define a default of PACKAGECONFIG in this recipe.
> Using _append instead mitigates chances of accidental overwriting
> the default
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/recipes-devtools/ruby/ruby_2.7.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/ruby/ruby_2.7.1.bb b/meta/recipes-devtools/ruby/ruby_2.7.1.bb
> index 3dd9fb0a62..3d7d095fbf 100644
> --- a/meta/recipes-devtools/ruby/ruby_2.7.1.bb
> +++ b/meta/recipes-devtools/ruby/ruby_2.7.1.bb
> @@ -12,7 +12,7 @@ SRC_URI[md5sum] = "debb9c325bf65021214451660f46e909"
>  SRC_URI[sha256sum] = "d418483bdd0000576c1370571121a6eb24582116db0b7bb2005e90e250eae418"
>  
>  PACKAGECONFIG ??= ""
> -PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> +PACKAGECONFIG_append = " ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"

Shouldn't this just be:

PACKAGECONFIG_append ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6',
d)}"

?

Cheers,

Richard


