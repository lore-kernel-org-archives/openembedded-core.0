Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.14320.1628194041297269517
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 13:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C6CFM1R1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id e25-20020a05600c4b99b0290253418ba0fbso4539725wmp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 13:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=8i3vshMn6jq2gVNuTyWKf4hwMjZy2Uv1D/+6Z0uJRYA=;
        b=C6CFM1R1NTML/4dXn7iA3xYZ3G4yVV4oe4jbIfClh7JVNL+Fuxo8c74suFdMW8E/dn
         bTK5NBPiYGeBt8xOD5QzvYbixrWXVjJMMoUVycCXL7Jxwqot3uXpBFvTbaSt5eg4W+sN
         FXnFUYUG/unTxZTHg1M+HhS/4pwaIomjXnWek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8i3vshMn6jq2gVNuTyWKf4hwMjZy2Uv1D/+6Z0uJRYA=;
        b=TDlarPRxvQV0/zKLSmUHIG0mU2My2fj+naZk6i/7u1WgFjUZu0vEg3DVKnY/A4ImKR
         teb1L3N7jTqYOcHPmEkc0npCzx7/GzgZX+UO+bV8V7NnQAKqUp8VYIvvIG1o0AzU9/E/
         v+rvzHZzx/QL2f3uy/0ptABX0VjFM+tdICoD7K5AvmH54N5+S5gsLb/Xhi8rpIBvIb7D
         rMoaM8V8/rZ4j1xB0zkD223gfK+/to2RqbtjytbJxB6fu+JQuAmQLtsoC7SM90ZzmB6M
         Z2CTUM9kMuO6G+giWb8T9MNriKnHQMIvbziWxZMA3BXXrURLc5D7ZMWpOgqXY7qx1n14
         ZFhw==
X-Gm-Message-State: AOAM530m3Dm/YXKz2ulDCmVQ7ptvqFUfa6jxBjRNmsiOyp+5S9vRMeF2
	5Qabb5U0ZsZ7Z3+kfLRgKFSTGQ==
X-Google-Smtp-Source: ABdhPJw19Af34JPggmMyxuBIt3RU1KoBE7VmCcmVMrdfMDriI+L0zSYxRuppn/1pn85sAMNI68eCEA==
X-Received: by 2002:a7b:cd87:: with SMTP id y7mr17056401wmj.59.1628194039678;
        Thu, 05 Aug 2021 13:07:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0? ([2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0])
        by smtp.gmail.com with ESMTPSA id g12sm7144382wri.49.2021.08.05.13.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 13:07:19 -0700 (PDT)
Message-ID: <178070cdfc26d835e5cbb6ffdd55fb18932cf1f9.camel@linuxfoundation.org>
Subject: Re: [OE-core] Issue after override syntax change
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 05 Aug 2021 21:07:16 +0100
In-Reply-To: <AM9PR09MB4642973A068A5ED354160ABAA8F29@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: 
	<AM9PR09MB4642973A068A5ED354160ABAA8F29@AM9PR09MB4642.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 2021-08-05 at 18:59 +0200, Konrad Weihmann wrote:
> I'm currently seeing the following behavior after the latest override 
> syntax change (tested up to today's poky and meta-openembedded)
> 
> Take an image and install any kind of packagegroup, which references 
> several recipes, which pull in dependencies by their own.
> 
> image:
> 
> IMAGE_INSTALL:append = " packagegroup-foo"
> 
> pkggroup:
> 
> RDEPENDS:${PN} += "recipe"
> 
> recipe:
> 
> RDEPENDS:${PN} += "libxml2"
> 
> pkgdata for the recipe
> 
> RDEPENDS:recipe: libxml2 (>= 2.9.12)
> 
> and the pkggroup are correct
> 
> RDEPENDS:packagegroup-foo: recipe
> 
> still I don't get libxml2 installed into the final image - there is no 
> sign of that in log.do_rootfs or anywhere else.
> 
> The same thing worked pretty well the week before.
> 
> Thoughts?

There should be no change in the behaviour so that is a little concerning.

Is there an OE-Core example of this I could look at?

Cheers,

Richard

