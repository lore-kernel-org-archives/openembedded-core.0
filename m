Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.7139.1615473883091746057
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 06:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NUb18IVA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id r15-20020a05600c35cfb029010e639ca09eso13362676wmq.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 06:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=QkOj5X36/wc5JUUZRfNn3DnbgYD0TK7HhCpyORGiQTs=;
        b=NUb18IVAHD6V2y8Hc1HRP5WPw8w20+PtQ+W/v8YFxDgRuUoEcI2/2EozHBl6hOIbRd
         481LFvUtIlEuROz9XDx+Kyax5gI6L4oi0uAkNkeYLlpOzp0X2sB71RWzilSXs0QjQwM9
         Abc7oiQZfepZ3tEIgWQyinEblAeFGaJixvySA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QkOj5X36/wc5JUUZRfNn3DnbgYD0TK7HhCpyORGiQTs=;
        b=rbo1mrFG6aKuUTuxtpf2ipphKKyjKoqLYk8MY8YCXvpxIR3acTs8Unt24SYRqkpaNo
         R/9voM8Kyncl8U5QCY4QSVrL7ZSGAz1NELYnEYZXCTkEw4QLdH5Jr25rZqqkgV8bpHzJ
         czNS1FUp/PhqHhFeb+o0LodPB+y869liBTN8v23BrzYmCFs2pjABRC1NPE32KRUJqd5p
         ENdlQmiLzIugEEsuFvQI2vZ+yCUWYaEtE0QrvGxVOTbktDhrHBD2woz8I5A4xEV1GwE6
         0ZWY8Blk8uzw5pIjAzC9rN3c1Kux8U1V+aVbgI4MtEv1uxNzL40J/Hp22qDQ8A6XgWdT
         tS+Q==
X-Gm-Message-State: AOAM53169umAA1AsV+gJN5HSgv46R5M8ehqXBSHqtbG98h35mH9vuVWt
	WhMecnc3ggMVsM2Wde84OWWb+g==
X-Google-Smtp-Source: ABdhPJz/FbCJjZR30VRTO56ggKfmNpdyUZ1wBI24NaqcTvH2cm7R85pDQFgzdvJdHD/Nv7HtauHRmQ==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr8350221wmc.43.1615473881482;
        Thu, 11 Mar 2021 06:44:41 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:79d1:e29:deac:3ff5? ([2001:8b0:aba:5f3c:79d1:e29:deac:3ff5])
        by smtp.gmail.com with ESMTPSA id s20sm3883045wmj.36.2021.03.11.06.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 06:44:41 -0800 (PST)
Message-ID: <f25a7ae612bdb191e436beb726d17581e2ebb628.camel@linuxfoundation.org>
Subject: Re: [PATCH v10] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: luca.boccassi@gmail.com, openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Date: Thu, 11 Mar 2021 14:44:40 +0000
In-Reply-To: <20210311143848.777532-1-luca.boccassi@gmail.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210311143848.777532-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-03-11 at 14:38 +0000, luca.boccassi@gmail.com wrote:
> +# dm-verity support introduces a circular build dependency, so util-linux-uuid is split out for target builds
> +# Need to build libuuid for uuidgen, but then delete it and let the other recipe ship it
> +do_install_append () {
> +	rm -rf ${D}${includedir}/uuid ${D}${libdir}/pkgconfig/uuid.pc ${D}${libdir}/libuuid* ${D}/lib/libuuid* ${D}/libx32/libuuid* ${D}/lib64/libuuid*
> +}
> +

I think you can replace:

${D}/lib/libuuid* ${D}/libx32/libuuid* ${D}/lib64/libuuid*

with 

${D}${base_libdir}/libuuid*

?

Cheers,

Richard

