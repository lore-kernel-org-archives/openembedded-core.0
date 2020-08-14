Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.458.1597423984219924375
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 09:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Bvuox1ad;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id x5so8014550wmi.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 09:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/HaCPxvikRNjvIOufMNsPS7wUHGjBXkGxmQiwCVGtIs=;
        b=Bvuox1adE0izBA41fK5qtXar04Xpb2NWvy3p6dE1s15SrKKlg0WIqby7yjVAu1gr0R
         64QFKZN8/s4Oeg+YoxGu/ouQgeL1jbupWb9kKwIu1l8XqbSkOYE12wPdhiOXsvtkbzvE
         o7pd3oTWvPCaYWPoZhlCYid2/krT3F8Ec2Gv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/HaCPxvikRNjvIOufMNsPS7wUHGjBXkGxmQiwCVGtIs=;
        b=jteE+3Ekbz9d/Y1GfY9U9dpnT+vEbPD75Bhd7OUrc8VG5FqyHTtYn3QEawAj0RvsPU
         FZpbGhf/ffUGwDYGONsi6Ege+QWKZpzDfVGx5nymn6JhVRZat/9U3IVisVQTEkayWu7p
         YeZIWrwq4Pg5HpmPWj1i96cgRra8JbPZT6Arninr12uTFWG46GeYadou562qHwOv7iJi
         bBwjP0Am21TBNQAMvRkvv1xugH875oaoNMRyiwXCwZuaQIfw8goMUCqZ6CHl3fLoUT6K
         fEesMRM7SgOkjEgOKvHxwPj0TCSqjbfAlNIQ6Dw6aPNM/O3yWtde6MWA214veWOm88FX
         tNYQ==
X-Gm-Message-State: AOAM532oJUMs5FQo8ZsM6VDD9BDpvcdY/KHy+ZeE6b2kOyDhUNwM0VwZ
	wI7Z/OwUXjtx2C+ZKIsHsVdHzg==
X-Google-Smtp-Source: ABdhPJywVQ1qQBYdGq9tqs2BftITXVzgucn1ki5tnOXZNKGa7HuPX9qUVwZOf9HxS9A19oKbWQthag==
X-Received: by 2002:a7b:c185:: with SMTP id y5mr3332308wmi.95.1597423982717;
        Fri, 14 Aug 2020 09:53:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.2.b.8.e.7.7.2.a.f.d.7.4.c.d.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.2.b.8.e.7.7.2.a.f.d.7.4.c.d.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:edc4:7dfa:277e:8b29])
        by smtp.gmail.com with ESMTPSA id d7sm17656524wra.29.2020.08.14.09.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 09:53:02 -0700 (PDT)
Message-ID: <5b0f066de407dde9e70cc3dde3532aadc31e3b8e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc-target.inc: fix multilib conflict
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com
Date: Fri, 14 Aug 2020 17:53:01 +0100
In-Reply-To: <20200814061830.314124-1-changqing.li@windriver.com>
References: <20200814061830.314124-1-changqing.li@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-14 at 14:18 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> fix below error:
> file /usr/bin/g++ conflicts between attempted installs of lib32-g++-symlinks-10.1.0-r0.core2_32 and g++-symlinks-10.1.0-r0.core2_64
> file /usr/bin/gcc conflicts between attempted installs of lib32-gcc-symlinks-10.1.0-r0.core2_32 and gcc-symlinks-10.1.0-r0.core2_64
> file /usr/bin/cpp conflicts between attempted installs of lib32-cpp-symlinks-10.1.0-r0.core2_32 and cpp-symlinks-10.1.0-r0.core2_64
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-target.inc | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
> index 1e25dad86b..03057dc71b 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -28,6 +28,10 @@ export gcc_cv_objdump = "${TARGET_PREFIX}objdump"
>  
>  EXTRA_OECONF_GCC_FLOAT = "${@get_gcc_float_setting(bb, d)}"
>  
> +inherit multilib_script
> +MULTILIB_SCRIPTS += " ${MLPREFIX}g++-symlinks:${bindir}/g++ ${MLPREFIX}gcc-symlinks:${bindir}/gcc \
> +                      ${MLPREFIX}cpp-symlinks:${bindir}/cpp"
> +
>  PACKAGES = "\
>      ${PN} ${PN}-plugins ${PN}-symlinks \
>      g++ g++-symlinks \

Surely you just shouldn't be installing both of these? Adding
multilib_script just create symlinks of symlinks. Perhaps one should
REPLACES the other?

We really don't want to create a tangled mess of symlinks though.

Cheers,

Richard

