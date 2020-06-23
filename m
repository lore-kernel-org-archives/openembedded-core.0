Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.4123.1592907661091810567
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 03:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JsTS3YQY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id g18so10870100wrm.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 03:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=rtq2MqWoce1aCe8+XBCVNGmNpuAftXdH6V5ijcpXPrA=;
        b=JsTS3YQYtKUKHD/Uti9S4vDOMiVh4sOM67V99Y5y6dgqDkpSYBrSKVwbKKOyN8dsGp
         cVrD32fK1m+HEZSoJgtm49wa2weXJ7bonLXQ8vHyIzKmYFIXhhOEyo23r0jumS0j7Uc3
         b2OgGH4xSqD3Etjeb9jQAQDfR9R1LBBYGNufs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rtq2MqWoce1aCe8+XBCVNGmNpuAftXdH6V5ijcpXPrA=;
        b=oVZSEgEL7E4hg67WpE06sHtg5/6BNc8BgIRWxh9k/TWsZSDFVVvuk6SZjFlLRcteX+
         Mf4EcATkcqyzLbufj8Iyd+ulVmjpTBVHEMlFkO2JC/owXhFkLorzFiaFU9BX6W8oB57e
         fGpdeaLGRystYP1TjH1kRBHn8NBhuBHfMfAKQ2bVUidKi4MlLLnOaiTtsvoKgonOa3bo
         8kq3Joa8L0yhBpmCq/qgvpsenJV8E+DLYgyt9wnQeL7CCAgOzFL6T+ltDetB5FAwpJT6
         Wr25nHNx/E+f+W+0D3EZx0zIqURYM99eK2VXGp+WPpGc0fiJzpJq4b2rgBk6X9JypSZW
         Z1Xg==
X-Gm-Message-State: AOAM530XGGV9eo8uXtX+gcu1eR3BgTTav0Guina6P47b9nVHdExNad7U
	g5pMS0AzdSh6at6LjRXGARwSzQ==
X-Google-Smtp-Source: ABdhPJzlnbg89aj0axrV8LM9TP6cFUe6S3QrF9hkgN7oQ9ku8TOFXlCxbsfiFj+BndM1ZCN0jWex8w==
X-Received: by 2002:a5d:5387:: with SMTP id d7mr19888614wrv.305.1592907659570;
        Tue, 23 Jun 2020 03:20:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id y25sm3133331wma.19.2020.06.23.03.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 03:20:58 -0700 (PDT)
Message-ID: <e1beb83bc2a019539c989cb86f2a7c9c3167a7ff.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] grub: Remove native version of grub-efi
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2020 11:20:57 +0100
In-Reply-To: <d1d3a67b-5eaf-312a-aa8d-09f49137a53b@gmail.com>
References: <20200622114343.481513-1-jacob.kroon@gmail.com>
	 <d1d3a67b-5eaf-312a-aa8d-09f49137a53b@gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-23 at 11:54 +0200, Jacob Kroon wrote:
> On 6/22/20 1:43 PM, Jacob Kroon wrote:
> > The native version of grub-efi only installs the tools
> > 
> >    /usr/bin/grub-editenv
> >    /usr/bin/grub-mkimage
> > 
> > to sysroots-components/, but equivalent tools are already provided
> > by
> > grub-native, the difference on x86_64 being 4 hardwired paths in
> > grub-mkimage
> > (values taken from grub-native):
> > 
> >    LOCALEDIR       = $TMPDIR/work/x86_64-linux/grub-native/2.04-
> > r0/recipe-sysroot-native/usr/share/locale
> >    GRUB_DATADIR    = $TMPDIR/work/x86_64-linux/grub-native/2.04-
> > r0/recipe-sysroot-native/usr/share
> >    GRUB_LIBDIR     = $TMPDIR/work/x86_64-linux/grub-native/2.04-
> > r0/recipe-sysroot-native/usr/lib
> >    GRUB_SYSCONFDIR = $TMPDIR/work/x86_64-linux/grub-native/2.04-
> > r0/recipe-sysroot-native/etc
> > 
> > If grub-native and grub-efi-native are built with the following
> > patch
> > 
> > --- grub-2.04.orig/configure.ac
> > +++ grub-2.04/configure.ac
> 
> For the record, embedding the two lines above in the commit message
> was probably a bad idea since it seems to confuse "git am".

I did notice, I have scripts which help me handle that case as I've hit
it before. The easiest fix is to add a whitespace before the +++ and --
- :)

Cheers,

Richard

