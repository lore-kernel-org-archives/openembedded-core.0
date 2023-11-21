Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0224C61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 14:44:20 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.42322.1700577851564050531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 06:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=E1VvmQ7+;
 spf=pass (domain: linaro.org, ip: 209.85.208.42, mailfrom: erik.schilling@linaro.org)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5437d60fb7aso8193859a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 06:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700577850; x=1701182650; darn=lists.openembedded.org;
        h=in-reply-to:references:message-id:subject:from:to:cc:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z19S+yGr2xUY3v/d6ifPNFwHfL2Q6th/IPZ+1xhVEt8=;
        b=E1VvmQ7+Sz2GHeEgzHviHcAI10pn2ZIJBh9nHaKMx9A+4hQDVLAl0qNcGYFTiILpr0
         FPYD/q1r7Mb4uTxiipmRipW7ErBPSJF4Dr9noiAIGDUTjpjVIj77wdr6q3pI+6fKj2jn
         bOUrkABg6lyX7VWKfQCexj4W7R/xq+qzMz3KIgUtYB9zgkU00gLMDvAKFbqmrGexLJNZ
         p8knptLD5qU/4r9+L6TnGCy0BHSfADYv3N/V1v/lom0S4k6LcBVybwyhBF29suw/lHZn
         apra41tgKy8kokU0gGXE0dfNb5QjOulItpstRK8ize30+q2O0Ve9+5koZ+omg5Wncq5A
         imaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700577850; x=1701182650;
        h=in-reply-to:references:message-id:subject:from:to:cc:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z19S+yGr2xUY3v/d6ifPNFwHfL2Q6th/IPZ+1xhVEt8=;
        b=Xey9l8rGVtn/uzjP2NUplxGl0FjzyMFUVbiJhbkIBz4QESvyRZQjE9V0BMt1AvW+AL
         kpx85jan/Jnvs6ViNvy98YmX5GQQDVrPsT1/QobyupBvAwKFQN0xKwlBsykkNfZCOJVg
         emrfUKnn+E4KH9X8posYjBvQ8oP+NFGDHRiIiYYZdVnfOKfPtcqshl6ahNgNxbkOeUyH
         yBl3iwpRd3bKDq6NDkqdkp9KuKhyDPgKa3G7ZiLH+/JZhds22ApaRl1gHk/+bqeyalLZ
         f3B793s1GTYQdWV7Rp+KS0MAGuAVGr8jnwr2KKgITnq8H33y34rmiPYVFYDK5tukSeCP
         B2Yg==
X-Gm-Message-State: AOJu0Ywac9hmXeyNke5NUVazCn5a3Jm6KkF1u7SoXLjUdDK90ejmUoeq
	E6z9umHaoscXP50bYs6bnXOrUw==
X-Google-Smtp-Source: AGHT+IHO369JyMqRmCZP53G0FwNIOux6dQGhgcBjm0mxmfM6X6h347IjhoBsnwlHa1O8TbKyFAvzqw==
X-Received: by 2002:a17:906:409b:b0:a01:dd2e:53df with SMTP id u27-20020a170906409b00b00a01dd2e53dfmr1669622ejj.55.1700577849607;
        Tue, 21 Nov 2023 06:44:09 -0800 (PST)
Received: from localhost ([2001:9e8:d5b7:1500::f39])
        by smtp.gmail.com with ESMTPSA id gt10-20020a170906f20a00b009fd585a2155sm2919819ejb.0.2023.11.21.06.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 06:44:09 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Nov 2023 15:44:08 +0100
Cc: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>, "Mikko
 Rapeli" <mikko.rapeli@linaro.org>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>, "Michelle Lin"
 <michelle.linto91@gmail.com>, <openembedded-core@lists.openembedded.org>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [OE-core] [PATCH] uki: Add support for building Unified Kernel
 Images
Message-Id: <CX4JZ6RNH5K3.25S4AEXNBYWSB@ablu-work>
X-Mailer: aerc 0.15.2
References: <20230901233231.1109712-1-michelle.linto91@gmail.com>
 <141c44bea4477d552aa4fc0371094b8ad4dc65b5.camel@linuxfoundation.org>
In-Reply-To: <141c44bea4477d552aa4fc0371094b8ad4dc65b5.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 14:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190984

> > +BBCLASSEXTEND +=3D "native"
>
> We've long avoided a systemd-native recipe as the meaning can be easily
> confused and I'm not thrilled to be adding one now.
>
> Perhaps this should be as a separate systemd-tools-native recipe to
> make it clear this isn't full systemd?

There is another catch: ukify depends on sbsign for some options. Here,
this dependency is not expressed as RDEPENDS on the systemd
components but only on the uki class. That of course gets around the
meta-security-core dependency for systemd, but not sure how pretty that
is.

So we got:
* python3-pefile in meta-python
* sbsigntool in meta-signing-key [meta-security-core]

It looks like we have these options:

1. Add the systemd-tools (or however we call it) recipe and the uki
   class in meta-signing-key or friends.

   This might become a bit icky with different systemd recipes scattered
   over different repos...

2. Do not put a RDEPENDS +=3D "sbsigntool" into the systemd-tools recipe.
   Move python3-pefile to oe-core.

   This means that some ukify options will fail. Users will need to add
   [R]DEPENDS on their recipes if they want signing. This would allow
   adding the systemd-tools recipe in oe-core while adding the rest in
   meta-security-core.

3. Also move the signing tools to oe-core.

   Next to the python module, this also requires to move sbsigntool
   to oe-core... In the end it allows to set the RDEPENDS in
   systemd-tools.

I got no particular strong feeling on any of those outcomes... Any
opinions? =F0=9F=A4=94

- Erik


