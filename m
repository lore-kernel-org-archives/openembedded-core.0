Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.26171.1619994559148102530
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 May 2021 15:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YZpGORhN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id s5-20020a7bc0c50000b0290147d0c21c51so2441291wmh.4
        for <openembedded-core@lists.openembedded.org>; Sun, 02 May 2021 15:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=mYqDcHiSfUzPRM4RjGc+prVLKROpB5TaswjvXOf12LU=;
        b=YZpGORhNe7UoyC9VSW93qdoEqZoVowfBBop2d7H485hsxpTwlnGeFW23zYAM45he6Q
         F5SlQi/0l4es9Mbrhn9antj1yj3EtNFMmtnw+Z3WIzIto24XA20vJ5IC0RmMg6QuORMm
         U+yTQ3a6dPCOZZkD0BswcCIqXklUJ0oayiqWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mYqDcHiSfUzPRM4RjGc+prVLKROpB5TaswjvXOf12LU=;
        b=ZssK3Zugir7WCjIsEnfTd5XgIpQlUsaN+WMn7lSjzbwAq1k1ra5/hOGXDXmf/AEVLq
         GLWozhNy/zmosKEdOCQ4cOzHKKgK2Id2bKxvRv/Oy1jbXwzZINoTAZRrmH5aCq7tbpND
         U5C/SEuMtsXDIxhHFyrCfz9KALW43K06qRAkkwSz2PUBDDWqnGylThnyLBhgnDP4Gx0u
         HiSV11+jvSmyHIvhc+XDuQ/ryaUpvLywfcFgpHoCpbeXfZCKiQOXh6qLA4IyUdoshsZ6
         PmPK2AukTXM8nz8EHZQnh0u/5BZogpkte0qgtoAn8m1NmwZHNQkiQAtu2GnSEsk8a191
         w4Qw==
X-Gm-Message-State: AOAM530Qnyk3k47UkccT3GFg0/Da9eQtYVRQf7/hcm+SGZrbVyRGNGp/
	3uiawB56ultlUbWRJMgYGm7L0Q==
X-Google-Smtp-Source: ABdhPJz1RHp23DHZdY7DFSwjUrhiNr7SqVRDhZGjQel3mQNJ0qcLf+28YaSGrNXNtdHen2hZkD1wdQ==
X-Received: by 2002:a1c:6382:: with SMTP id x124mr28825156wmb.142.1619994557660;
        Sun, 02 May 2021 15:29:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2abe:bb29:590f:e028? ([2001:8b0:aba:5f3c:2abe:bb29:590f:e028])
        by smtp.gmail.com with ESMTPSA id x8sm10185829wru.70.2021.05.02.15.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 15:29:17 -0700 (PDT)
Message-ID: <a7cd5d19859941f77793559f61cf64fbbc603d53.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] ptest-runner: libgcc must be installed for pthread_cancel to work
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 02 May 2021 23:29:15 +0100
In-Reply-To: <20210502175441.368688-1-quaresma.jose@gmail.com>
References: <20210502175441.368688-1-quaresma.jose@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-05-02 at 18:54 +0100, Jose Quaresma wrote:
> found on runqemu core-image-minimal with gstreamer ptest-runner
> 
> STOP: ptest-runner
> libgcc_s.so.1 must be installed for pthread_cancel to work
> Aborted
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
> index 57a3ae005b..fe6ef2a43f 100644
> --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
> @@ -26,3 +26,5 @@ do_compile () {
>  do_install () {
>  	install -D -m 0755 ${S}/ptest-runner ${D}${bindir}/ptest-runner
>  }
> +
> +RDEPENDS_${PN} += "libgcc"

Just to check, this was a missing symbol in ptest-runner and not in gstreamer?

Cheers,

Richard

