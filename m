Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.6129.1604419202908210848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 08:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q101zLtl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id g12so19075692wrp.10
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 08:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=n3TeMb3ucu6YPhdZfbRDnJ/Nt3i2hStSyCUjEGrYDgo=;
        b=Q101zLtl1OFRwLrmQAE5KKbLSL8tMEOjoemeVhbXC0k0l62qzD55h5JwWgcphZFTX9
         HMxTfsoE34XDxH0PgC8t60ytEg39T/NMlglwplqR2HBx7+963rygXBHlZmBND3Bn6vha
         /ubN/eMf98ZHhVD1np2Rq0o+7SKfKgsEt+E/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=n3TeMb3ucu6YPhdZfbRDnJ/Nt3i2hStSyCUjEGrYDgo=;
        b=k2j7nmaRAZQGESspK1Ph63JYax/ZlKxeS2qxczi1fHwEbe3K02fZiwagb2TZWmfOse
         yTfWFqZlTkgXkOTJBxtnet5MkSk8/wYuRwxCmqO+TRNMbRtYs0u1EEMd7XDNJDEC2jZD
         DQOFnMc6uQIDPmwhzciayWQ8r8Q+1tcRFp3FPq/NyaR7IVtVVZio3LFZrnE+0oFr0gB1
         d7+eZ6XMD/zLSEVgnX+aHnwf8j704ZC0CcsVyi2mCrYeQVHUMWjZxqLQGCNm6xuNGSWi
         TNcO9NRTRTEtJ353qayfYtFC3yF3MSOPqXcmi1YoY5mT9gH6vNCSJF1NOgPp3fQjjhul
         /NWg==
X-Gm-Message-State: AOAM532H77VxrpwVnVmXmoC5MqrUmjRbJtuSBCMvlLS7DIQeRcR9iW5f
	OgsIz+R9BhAQjX/k6amO69xEWw==
X-Google-Smtp-Source: ABdhPJxNg1s0eOIbqMgw3YZ5eYdQlJTl/KwSaMuo4f2Ah5Ntj03mtKrqylgDN3UpAmpBUWT2qCthjw==
X-Received: by 2002:a5d:404f:: with SMTP id w15mr28205857wrp.39.1604419201465;
        Tue, 03 Nov 2020 08:00:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id f23sm3196943wmb.43.2020.11.03.08.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:00:00 -0800 (PST)
Message-ID: <3ef5e39f58625f8044ffd75e790df399979b2243.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] openssl: Do not create /etc/ssl/certs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: nate.karstens@garmin.com, openembedded-core@lists.openembedded.org
Date: Tue, 03 Nov 2020 16:00:00 +0000
In-Reply-To: <20201103134411.118217-2-nate.karstens@garmin.com>
References: <20201103134411.118217-1-nate.karstens@garmin.com>
	 <20201103134411.118217-2-nate.karstens@garmin.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-11-03 at 07:44 -0600, Nate Karstens via lists.openembedded.org wrote:
> The openssl package previously created an empty folder for
> CA certificates at /etc/ssl/certs. Other packages, like
> ca-certificates, would then populate this folder.
> 
> Certain systems need more flexibility with how this folder
> is created and populated (e.g., a symlink is needed). To
> accommodate this, the openssl recipe no longer creates the
> empty folder. Instead, the folder will only be created by
> packages that populate it.
> 
> Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1h.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
> index eb11fe3960..5723d19dbf 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
> @@ -134,14 +134,12 @@ do_install () {
>  	# Create SSL structure for packages such as ca-certificates which
>  	# contain hard-coded paths to /etc/ssl. Debian does the same.
>  	install -d ${D}${sysconfdir}/ssl
> -	mv ${D}${libdir}/ssl-1.1/certs \
> -	   ${D}${libdir}/ssl-1.1/private \
> +	mv ${D}${libdir}/ssl-1.1/private \
>  	   ${D}${libdir}/ssl-1.1/openssl.cnf \
>  	   ${D}${sysconfdir}/ssl/
>  
>  	# Although absolute symlinks would be OK for the target, they become
>  	# invalid if native or nativesdk are relocated from sstate.
> -	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/certs')} ${D}${libdir}/ssl-1.1/certs
>  	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/private')} ${D}${libdir}/ssl-1.1/private
>  	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/openssl.cnf')} ${D}${libdir}/ssl-1.1/openssl.cnf

When you asked about this in the previous email, I questioned whether
we still needed the symlink. Did you check into that? I suspect we may
need it as openssl itself may reference that path internally?

Cheers,

Richard

