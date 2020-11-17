Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.4740.1605596318694634143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 22:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YQrY0NRO;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id r7so19553620qkf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 22:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cuC9KAHoRJDmpKDhAbx3kN2YgCFMOlfuKU3wqiYuLxk=;
        b=YQrY0NROrF+/tSj1ye5acHJuWXtgDiA2gwMeKDWXI/JuzqqDr1UceIAsz9LHRRQM5j
         WxxnblG/bpyzI2rwJJ3GPBkB/WY7Lm/eRy2zR8AR25QFDW54VJB0r8ZZaT8hx8S5JeCY
         yVcj5G6X9SQFrFkMoen1q9MS6T5aLUo4bVMTDkp7qZcfZ07Z8rWyQXifvQQ+8XjdPx7u
         yEbLkK97zbzhFmkF2CcD5PAUewNvhRJvLMVVsqR5HHaR83PMS5CqDZv2dh2WWqmTIWEU
         5bX++pUWlNhaTyYbfi6aqhS24vNN0qOHSRznbRY7BuQBO+Prke40HRMTq/2OMOl/qG9f
         ejng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cuC9KAHoRJDmpKDhAbx3kN2YgCFMOlfuKU3wqiYuLxk=;
        b=XWnQvzzg5nNg7DILMqlLiSe4G2peJBHMzOPgC2o/t+SskHTeHqQOf8fV74+z4KJBHx
         CmCYzo1038PFQPtPRggtyZIFCHyMXRC8tRz79mrKDsBtTG6sfcGYLKw7qtWxjrUQsJ60
         VP3VJHWsKnfYyOl8Cqk8pssT5nNEPtdY3EmVKOKNLIXdYYJ7k+9XskPfTsRb5RXEjS9d
         4kx1gF2h5K9GT4/4WiEWdmt5tFMPOxpP1TyBOKMlJWUeUns4VSq6vBXE1VHbdcjTGYIR
         2+g4wJSS9oBhlrjrKCKAj3v+jTpTbPHpYNNXiXYGCR2up9/KC1avkN/MnDTTks3FGoYE
         J8vA==
X-Gm-Message-State: AOAM532VkRueloAzw9kaWHXHvTIvNDYpIfmsmAWSlR0q9vUo7x5UIitW
	hqETrvk8gKQ2OASQTOXD7JPlHcRevPrABZ7pdis=
X-Google-Smtp-Source: ABdhPJwQ7JtRl2THUR+LD7rFDFkaQMobFijZxfht0U4TmsalkusLZgqOQdRm6j5CC291GZH7iqLuzzcMI9G5aSAhUSg=
X-Received: by 2002:a37:6195:: with SMTP id v143mr17566876qkb.71.1605596317737;
 Mon, 16 Nov 2020 22:58:37 -0800 (PST)
MIME-Version: 1.0
References: <20201113194854.21266-1-alex.kanavin@gmail.com> <20201113194854.21266-3-alex.kanavin@gmail.com>
In-Reply-To: <20201113194854.21266-3-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 16 Nov 2020 22:58:11 -0800
Message-ID: <CAMKF1sonpgHGiPpDAbmTYFid+v4RfRrHCX-4Ccti2=VqMRDdAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] distutils3-base.bbclass: use python3targetconfig
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this is causing issues see [1]. I have sent a potential fix too.

http://jenkins.nas-admin.org/view/OE/job/oe_world_workspace-compare-signatures/995/console

On Fri, Nov 13, 2020 at 11:49 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/classes/distutils3-base.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3-base.bbclass
> index 7dbf07ac4b..a277d1c7bc 100644
> --- a/meta/classes/distutils3-base.bbclass
> +++ b/meta/classes/distutils3-base.bbclass
> @@ -1,5 +1,5 @@
>  DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES') == '')]}"
>  RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
>
> -inherit distutils-common-base python3native
> +inherit distutils-common-base python3native python3targetconfig
>
> --
> 2.29.2
>
>
> 
>
