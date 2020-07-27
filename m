Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.464.1595888798252567547
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 15:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HXJMEPE0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id a15so16359062wrh.10
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 15:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Opy3VBwQVbIrdHcX2OZ78/uIEaucuLsO7fqM7EZ7B6M=;
        b=HXJMEPE0kTBA5iJkzLUrbhPzhG5To+MJFW6M2UxDNUDrz1+ewg8fkrtBdZDDS3lDAX
         WALRmxDeazoOHICpPrX8TDi437yu+aWk+Fh/OLsHqdPND2cfgrkwAdRiTao5/9MpPhT2
         MNk8OlWsatyIQSMdRtYIscJuKAbtzaO7GI/0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Opy3VBwQVbIrdHcX2OZ78/uIEaucuLsO7fqM7EZ7B6M=;
        b=U9NH3319TIK7FXBKZIOoel6DEhaod92+0zRQM+kvpRnrFfRUIRCX7OcoPAUMwEAaL1
         yPuWBUjgwZJi7TOI15uWtQUtJPiryfbb/gMsfKn+gXdxnd3N/YI3/M4cJTEtiRW4PouS
         QkWWdmVvO6NuAIRTkfVdHYg8W6SG12rsYPRScN7uctlCXZYw5RrzaHda/LGh6zF2IATs
         +3huEG0ZJvFuVQlFF5d52tQoJqkGyEWUFAKYOUeWhrHahPdyFp0LxDYCy+o+QpZQQ2U/
         Qvt6kmZL/IPy2gJXM60Vi65cxv6HRLHkOhehyamSD+XVgPkBcWEpgkvt7HgLkOmgalmc
         Exew==
X-Gm-Message-State: AOAM5324lgz9q1WczHI4q8wm9pNkBYYsOfrS59nQny+nnGLHMYPxiq0x
	OMf1xW7bKeBINPgYevOX8RfdYg==
X-Google-Smtp-Source: ABdhPJzu68NXH840hFGxvyvvyM6m5mG3+GD91Sg7JNy5J4ErOFBB6QmC3iz8+Q3wK+wVNdl93Wti5A==
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr21665209wrm.113.1595888796772;
        Mon, 27 Jul 2020 15:26:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c1c0:577:97eb:ef04])
        by smtp.gmail.com with ESMTPSA id 78sm1328967wma.31.2020.07.27.15.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 15:26:33 -0700 (PDT)
Message-ID: <6e3bca823e2379bc8b1965a0de33e75cbeaf14da.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2 2/2] buildtools-tarball: eliminate overwtiting OPENSSL_CONF
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jens Rehsack <rehsack@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Jens Rehsack <sno@netbsd.org>
Date: Mon, 27 Jul 2020 23:26:31 +0100
In-Reply-To: <20200724052606.6726-2-sno@netbsd.org>
References: <20200724052606.6726-1-sno@netbsd.org>
	 <20200724052606.6726-2-sno@netbsd.org>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-24 at 07:26 +0200, Jens Rehsack wrote:
> Remove overwriting of OPENSSL_CONF from buildtools-tarball.bb to clarify
> whether nativesdk-openssl installs wrong content or buildtools-tarball:
>     (nativesdk-openssl) tmp/sysroots/x86_64/usr/lib/ssl-1.1/openssl.cnf
>     (buildtools-tarball) buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/openssl.cnf
> 
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/recipes-core/meta/buildtools-tarball.bb | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> index d0f8dd7d7c..02e662b5cc 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -75,7 +75,6 @@ create_sdk_files_append () {
>  
>  	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
>  	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
> -	echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
>  
>  	if [ "${SDKMACHINE}" = "i686" ]; then
>  		echo 'export NO32LIBS="0"' >>$script

I did look at this further. I don't see anywhere in buildtools-tarball
that the code you add in toolchain-scripts.bbclass is actually run, it
doesn't make it into the buildtools tarball.

Note the code does:

     rm -f ${SDK_OUTPUT}/${SDKPATH}/environment-setup-*
     [...]

     # Generate new (mini) sdk-environment-setup file
     script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${SDK_SYS}}
     touch $script

so your patch definitely breaks buildtools. I therefore don't plan to
merge it.

You are right that we could add something here to source the
environment.d files within OECORE_NATIVE_SYSROOT but you'd need to add
that to the buildtools environment script itself.

Cheers,

Richard

