Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.494.1609968188102626859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 13:23:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fCJyi99T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id n16so3842629wmc.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Jan 2021 13:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=4+lVkYkPQleqpzDHJjOsw2Ss2I87s8uVO55H4BBQ8XQ=;
        b=fCJyi99Tpv6s9XfmZ7oy/Qw795gmLQehlXD258HvQaIbkjeKzecFzJ11L51NpfZVUD
         0w7Bx0wH2RQwPacC+7ZYr9UugJx47TfK0Cr/VGmCAIFYYx9elW3KCA1UVQKTN/rmP8KR
         kQNTGX01xNF8PEjA32RthmXcy3+YPb7D3fNIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4+lVkYkPQleqpzDHJjOsw2Ss2I87s8uVO55H4BBQ8XQ=;
        b=uP1o23X8oiM2e+N7A4ynfCNLupU1MMa939tP+oWU3FJXYpwNq8qFMZGbMLYnh6tczk
         zRYjC0UlIdIQQBcKnxdpOSNYavE6OexViwTnXml2DEximvd3gt7cql1nfRuENitayj5F
         VlP8AynRaULDdBZuBddA10iaR39z+Rf6OIduvHI6JD2jHYwMLCo6km8XQRf9oEeypLDu
         As/kA9DKhJTAulbXY7fv17jrjP/iOeOtnSCBooulBguK0lV7mV7B75Px3LNtmtOeDGMq
         Bx7hUJikN6J8pUFP9KJfi+5amWshwnx/U4yHbHObmBpS7JA/zs2gvtogWdDQ8DPYuDXR
         S32Q==
X-Gm-Message-State: AOAM532Y61MFF0XEMwq/Rt2JHna7OIsCY0abxy89glfFO8fj24aixNly
	JkvBjtKRNOI2CAAbfKVf5eWicQ==
X-Google-Smtp-Source: ABdhPJyxUbcSaSBXl6Zcj+tw2uXjoeeqXzrG0bXR4jgZ7rFXIyRD2SPoVL5mMQihzrAqgRYhPexs/A==
X-Received: by 2002:a05:600c:218a:: with SMTP id e10mr5303374wme.27.1609968186446;
        Wed, 06 Jan 2021 13:23:06 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f082:51:8822:ee14? ([2001:8b0:aba:5f3c:f082:51:8822:ee14])
        by smtp.gmail.com with ESMTPSA id b200sm4625266wmb.10.2021.01.06.13.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 13:23:06 -0800 (PST)
Message-ID: <afabe035831b1987521868bfda74a6dc43298aa7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] pulseaudio: define -mfloat-abi=softfp for CC on armv5
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tanu Kaskinen <tanuk@iki.fi>, "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org, armccurdy@gmail.com
Date: Wed, 06 Jan 2021 21:23:05 +0000
In-Reply-To: <25433ae4028ee7784430c585a71bf503a4a1d37d.camel@iki.fi>
References: 
	<CAJ86T=VZtAHf2cP==VnVK1mM4XEY+DaJqyokmzPfCzGT0UvwAQ@mail.gmail.com>
	 <20210105033719.809-1-mingli.yu@windriver.com>
	 <89cb1de79cc242d0545829a3138685ebc4ffe8cd.camel@linuxfoundation.org>
	 <25433ae4028ee7784430c585a71bf503a4a1d37d.camel@iki.fi>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-01-05 at 21:04 +0200, Tanu Kaskinen wrote:
> On Tue, 2021-01-05 at 12:37 +0000, Richard Purdie wrote:
> > sed -i -e "s/\(; *\)\?$2 =.*/$2 = $3/" "$1"
> > 
> > I really don't want to add things like this to the recipe, I think it
> > will interfere with other parts of the compilation. In many ways I'd
> > prefer an option added to meson. Do we know what upstream are thinking
> > in relation to this?
> 
> I think Meson should be fixed, but it may be necessary to add a build
> option to PulseAudio to disable the neon code while waiting for Meson
> to get fixed.
> 
> I now filed a bug for Meson: 
> https://github.com/mesonbuild/meson/issues/8156
> 
> and another for PulseAudio: 
> https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1088
> 
> so at least the relevant projects know about the issue now. I may work
> on fixing these myself if nobody else does, but I don't expect that to
> happen quickly.

Thanks for that, it does seem to be getting a little attention so
hopefully a solution will emerge!

Cheers,

Richard

