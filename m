Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.16299.1601474589135177920
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 07:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NYdPHhiL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id t10so1959105wrv.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 07:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=uKunKOVnNVWPTazYwtbDOEZgYgNVVUeXdq92gyeqB7c=;
        b=NYdPHhiLLMPoWsYSpdThtoR6fxEVAu+okXZFP7F7Ckpe/vYVU1mbp7azJkVRqh+Hfl
         lLMmOLowp5O44t4zgO+JbWDJc7/2eYjh3wV+2Le8r5dxO1ClPpjeLxJDR1NmZ1mgXsVv
         Y+G3MO3rR1HoZaYFjXyaVygbhh4bh/LO0jbZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uKunKOVnNVWPTazYwtbDOEZgYgNVVUeXdq92gyeqB7c=;
        b=hxDuVoppczRH9wjvuNHs814oe2Al6dZ5Vy0jB/9rf1P4SU0zNKBndphky86Nn9pBLm
         XlOFXWdwPE5iaWTwUZ0DU72P9p9dUwfax9EoSnX2R0eWcNwNpPEItP4GDxNC5KuWGlda
         yF5kuw+vP2GNYrgxXYcy/eYSMyIgeIY4O2jL/g1czzWzW8b86lv0pqgIHUrzrbz6qr54
         +XxTUHMHZqQP3yD7O7TGNH88J+km0zJqaWGxu4eMexeb8vhX7qil9H07C11SGwC6oqY3
         C/y5cQVePiZgGJUvxUqEB7lJaWWNVlHQBZLGTwqGnaIt9zNFsb9F4T0Z6KdQj2ri3ar9
         GHVA==
X-Gm-Message-State: AOAM5313FPF5cTvdojJodpiZag4qtzvLdyndhDQWXD4OCY9oRkvyJpi1
	fi+XfQWlQWac+JVqd217KgCWig==
X-Google-Smtp-Source: ABdhPJzZr5ZPdwt0BlL0Lien58C67tpP6Ckwq328CDjCsOb8UFlbc1wFvot5JwAZPzghs0VumQ8aXQ==
X-Received: by 2002:adf:f88d:: with SMTP id u13mr3579005wrp.213.1601474587527;
        Wed, 30 Sep 2020 07:03:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9c3e:7322:3204:3cf7])
        by smtp.gmail.com with ESMTPSA id b84sm3398442wmd.0.2020.09.30.07.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 07:03:06 -0700 (PDT)
Message-ID: <c1505edd28fbc0d3298ead49957cee8eccb668f0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] kernel-fitimage: generate openssl RSA keys for signing fitimage
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Usama Arif <usama.arif@arm.com>, openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Wed, 30 Sep 2020 15:03:04 +0100
In-Reply-To: <20200930104800.27569-1-usama.arif@arm.com>
References: <20200930104800.27569-1-usama.arif@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-30 at 11:48 +0100, Usama Arif wrote:
> The keys are only generated if they dont exist. The key
> generation can be turned off by setting FIT_GENERATE_KEYS to "0".
> The default key length for private keys is 2048 and the default
> format for public key certificate is x.509.
> 
> Signed-off-by: Usama Arif <usama.arif@arm.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 44 ++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index fa4ea6feef..bb2f3c4ccc 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -56,6 +56,22 @@ FIT_HASH_ALG ?= "sha256"
>  # fitImage Signature Algo
>  FIT_SIGN_ALG ?= "rsa2048"
>  
> +# Generate keys for signing fitImage
> +FIT_GENERATE_KEYS ?= "0"
> +
> +# Size of private key in number of bits
> +FIT_SIGN_NUMBITS ?= "2048"
> +
> +# args to openssl genrsa (Default is just the public exponent)
> +FIT_KEY_GENRSA_ARGS ?= "-F4"
> +
> +# args to openssl req (Default is -batch for non interactive mode and
> +# -new for new certificate)
> +FIT_KEY_REQ_ARGS ?= "-batch -new"
> +
> +# Standard format for public key certificate
> +FIT_KEY_SIGN_PKCS ?= "-x509"
> +

Thanks, I'll queue this. Could you update the documentation for the new
variables please?

Cheers,

Richard

