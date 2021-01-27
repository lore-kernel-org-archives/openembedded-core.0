Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.5219.1611736058666160781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 00:27:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M5XO8JRF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id 6so968642wri.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 00:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=qQRlebMAVwYfnXmJSKSo0aDd0mrDYlKfwOHPSGEINHk=;
        b=M5XO8JRFkvhugi4j0kdc6FJaHOzG4swrINGYqVRnG7RCuyH+J+lz8FN3hl0/WZrPEx
         XapS885qOsoOJK0WOhRWzh2bub7lmSOresJTXDg0Ti3AAMPO2IfAdcVlVYkU+YhiH2Tj
         J0MloVeMoNHPU+R7/XdRyY63nuRONQrNhB2S8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qQRlebMAVwYfnXmJSKSo0aDd0mrDYlKfwOHPSGEINHk=;
        b=Ffs0LMX7/6kbBL5mTp9KxAKa6VWtnQRHsfAi76FJPqwNk7E1vuWKR9YcU1iTHtHnwg
         Sr3fH+i++WK/NfM1IGrIbxSBzB1EZSJwbKt75RNPUY7Z8rU+4V9Nh1Yu7LxPmSZQZ8fT
         GqX5cd96XYY9f0Vphtp3Bqi+l9g99p/bVNr6H5SNVgo+cm3mPF7ozieMHjwkmVI38bVX
         n2vKqA0QSPW1QEuPufv8G7mnSc6aKluI6GavNCLWyJEPZbp6+YKX6BMzLLT+80oJzrhN
         Lsz7dRNmWYfYovg58aDm97hE+WIeRe7CWa2l4Cc8Tim/u0OOwCTmhImZfvE2X3o9Y/5Q
         wywA==
X-Gm-Message-State: AOAM5335QmKlMf3K4RIv9zA6Wpp6vJbvq/kpwRYkSCpMmegf6SZ/8QvZ
	ewCXOvQaeWfm8wxB9SK/1VrduA==
X-Google-Smtp-Source: ABdhPJyDy19oY68P0HQNCMsYkVLr2jJuIaz7Mx8E89Hw5eOQ3+fZfBROhGcCQ68ATD8OQJr14ud3NA==
X-Received: by 2002:adf:dd45:: with SMTP id u5mr9859024wrm.392.1611736057279;
        Wed, 27 Jan 2021 00:27:37 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc? ([2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc])
        by smtp.gmail.com with ESMTPSA id y24sm1552875wmi.47.2021.01.27.00.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 00:27:36 -0800 (PST)
Message-ID: <30b9655a235160de1a9083122a258a93d026654c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] qemu-system-native: install qmp python module
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2021 08:27:36 +0000
In-Reply-To: <20210126173107.2204111-2-saul.wold@windriver.com>
References: <20210126173107.2204111-1-saul.wold@windriver.com>
	 <20210126173107.2204111-2-saul.wold@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-26 at 09:31 -0800, Saul Wold wrote:
> The qmp python module supports the Qemu Machine Protocol [0].
> This module needs to be installed in a known location so the
> qemurunner python script can find the qmp module.
> 
> This change causes it to be installed in the recipe-sysroot-native
> of the target image and that directory can be added to the python
> sys.path that needs to use the qmp.py module.
> 
> [0] https://github.com/qemu/qemu/blob/master/docs/interop/qmp-spec.txt
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb
> index 222b55cbc6e..4a58bf9055b 100644
> --- a/meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb
> @@ -2,6 +2,7 @@ BPN = "qemu"
>  
> 
>  require qemu-native.inc
>
>  +inherit python3-dir
> 

In this patch the inherit needs to go before the qemu-native.inc, as
in:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=5267509ea39770655dc707e9879158ca2ff3959d

due to:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=62367fb4c240a054e6a73d0316cc6da6b5f18f79

Cheers,

Richard


