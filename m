Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.3120.1594071170527345368
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 14:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dQKhVcC/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id l2so42075008wmf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 14:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=kiS+NLJyBG4WXxKOnZqjx/jlefqEF9w41AuzttwLXlg=;
        b=dQKhVcC/CMPkLZ7GDT+7gt5saGqc+EfI9G3OjhMLU6dvTj1h5eG2Z0YSq9+P0oGJvY
         +7b42jw4v55F7BCdGNjEm6Rw+1QExt/K8HxEnwUmdxhXVIJQn07Llk2OQku8BHENvAl+
         1tlwzUtuO3aL220fDjN7zL2UMxJzuUy2AkaB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kiS+NLJyBG4WXxKOnZqjx/jlefqEF9w41AuzttwLXlg=;
        b=OROrJuL7fZbwCd7Q9MnH5DN0sREuQpd58Naig6v/MqJRUUfY7QtjxszN7b5xI8MH/1
         M8zIfnEjDF8gujyygMfRWhFjk0QfxHqttf1+UQqlxY2IyXC5ASZGu2e8Ti2aG8bbfs2s
         QurnDryApSYRtpX6Q1tFOfLaLZRLNez+dkbxjsbsWjE68KPqt52HqyYfMu6g796sUaIP
         aDdZWMeskhNL8Dx9P8xxUmGSltzi3e63AiTDP3tpxGz/rTJ9if7XknAnsG69/ZrF0acT
         Bxdn7ZAdK/JaJ1NTjDST29dL0WKEFvzeLzWedEB4LlwjLB8BedMzcUe7byJiCnjYELZO
         4VZg==
X-Gm-Message-State: AOAM530/Qe7bL86U6X1nBnrHJgeF1TThnv7EVcRFxEPWYCLUfbYa+qK8
	y7Z7I9rDIeRvigoO638MSnBkyA==
X-Google-Smtp-Source: ABdhPJzVeppXK3S1fQ86o9guGRSbol31T+KIXmRKj3k7x5TIscFAgboWF2TimnCtkb2Y53JTVxSM+g==
X-Received: by 2002:a1c:9e45:: with SMTP id h66mr1014931wme.15.1594071168925;
        Mon, 06 Jul 2020 14:32:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u10sm797162wml.29.2020.07.06.14.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 14:32:48 -0700 (PDT)
Message-ID: <f929bc5edd891a8ae06736b423f95bdf1c240d59.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] openssl: make ${PN}-bin rdepend on ${PN}
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Hannu Lounento <hannu.lounento@vaisala.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 06 Jul 2020 22:32:47 +0100
In-Reply-To: <20200706152325.4075747-1-hannu.lounento@vaisala.com>
References: <20200706152325.4075747-1-hannu.lounento@vaisala.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-06 at 18:23 +0300, Hannu Lounento wrote:
> Some openssl command line operations like creating an X.509 CSR require
> the file /usr/lib/ssl-1.1/openssl.cnf to exist and fail if it doesn't
> 
>     root@qemux86-64:~# openssl req -out my.csr -new -newkey rsa:2048 -nodes -keyout my.key
>     Can't open /usr/lib/ssl-1.1/openssl.cnf for reading, No such file or directory
>     140289168594176:error:02001002:system library:fopen:No such file or directory:../openssl-1.1.1g/crypto/bio/bss_file.c:69:fopen('/usr/lib/ssl-1.1/openssl.cnf','r')
>     140289168594176:error:2006D080:BIO routines:BIO_new_file:no such file:../openssl-1.1.1g/crypto/bio/bss_file.c:76:
> 
> which is the case e.g. in core-image-minimal with just the
> package openssl-bin added to the image by declaring
> 
>     IMAGE_INSTALL_append = " openssl-bin"
> 
> e.g. in local.conf.
> 
> The file does not exist in the aforementioned image / configuration
> because it is packaged to the main openssl package
> 
>     FILES_${PN} =+ "${libdir}/ssl-1.1/*"
> 
> (there is no other FILES specification that would match the file either)
> and
> 
>     path/to/poky/build$ rpm --query --package --list tmp/deploy/rpm/core2_64/openssl-1.1.1g-r0.core2_64.rpm
>     [...]
>     /usr/lib/ssl-1.1/openssl.cnf
>     [...]
> 
> Hence make the ${PN}-bin package rdepend on the main package to have the
> required file /usr/lib/ssl-1.1/openssl.cnf installed.
> 
> Note that the openssl recipe has the comment
> 
>     Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
>     package RRECOMMENDS on this package. This will enable the configuration
>     file to be installed for both the openssl-bin package and the libcrypto
>     package since the openssl-bin package depends on the libcrypto package.
> 
> but openssl-conf only contains /etc/ssl/openssl.cnf
> 
>     path/to/poky/build$ rpm --query --package --list tmp/deploy/rpm/core2_64/openssl-conf-1.1.1g-r0.core2_64.rpm
>     /etc
>     /etc/ssl
>     /etc/ssl/openssl.cnf
> 
> /usr/lib/ssl-1.1/openssl.cnf is actually only a symlink that points to
> ../../../etc/ssl/openssl.cnf.
> 
> Signed-off-by: Hannu Lounento <hannu.lounento@vaisala.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 1 +
>  1 file changed, 1 insertion(+)

Perhaps the correct fix here is to move the config file in /usr to the
-conf package?

Cheers,

Richard

