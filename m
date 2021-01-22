Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.9033.1611324353306298595
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jan 2021 06:05:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MjTMz5eb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id m2so4430071wmm.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 06:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3cfihLqnp+s9ZI3RHo727CuNdwPvAdVdyMQoLoG5P9E=;
        b=MjTMz5ebayodqtKz5lfmakndhw7/U+OqA0XEqhxz7TCpQls+NU9V+YwxehEe1leFXd
         N2oT4bzl+XKQ9A+vc2UtCNtDyww11nXHMTMYv5TLugs40np7sanK+fucSENMVJbO4Wml
         MueugUsDHUJLrn5N/5lTGdFYXn3VHox1kUbHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3cfihLqnp+s9ZI3RHo727CuNdwPvAdVdyMQoLoG5P9E=;
        b=m1AY/72gEq5uuhCoEJr+ebGpDZVMbcOaAGuDg51WQsyzW0rdL0x4aECaVlj8Y6Ifhv
         KK5ymLb/udmlxoRO0v8clLi4555CGYftPgMZ5N1udeyFHYtt78AFT3AShcX58zknv+bP
         CpieLN7c5kfmfVGLQ6HToWFhLlN6Z1JCFUbsh+YuddBYfPI96c8V20NZuO1E/8lVPfY+
         vLSRJ0JyMs0E8N7CYLdXGm40KPEucn/Wgfz4BhlQp9zhmpDiPtGqqtoCGWc8Dk4mdbrh
         OfJnkit5/5cuaGYaP22/VpiljAHGG6xjftcstj4v60LmbgjcG6FNt5HWPclB1l9N/tTd
         HxQw==
X-Gm-Message-State: AOAM533W3oKgQGeR4/UjZv25ftcYJYoFUIBs7unsmLm/jOBFhd6FVI4c
	BtPGmO9uvTBOOQ+JItbsZ11yxA==
X-Google-Smtp-Source: ABdhPJzF+dbHFaw6kYJLJBTcEWTXL9PfCIA8U160q8bCf5F1Hlq/VEDt7+utv1VVKg6QX1TFl+QHlQ==
X-Received: by 2002:a7b:cd97:: with SMTP id y23mr4247658wmj.0.1611324351685;
        Fri, 22 Jan 2021 06:05:51 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78? ([2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78])
        by smtp.gmail.com with ESMTPSA id o9sm13151508wrw.81.2021.01.22.06.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 06:05:51 -0800 (PST)
Message-ID: <1353ad48939fcde5e0a549020fec51553560dace.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemu: CVE-2018-18438 Security Advisory
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>, Ross Burton <ross@burtonini.com>
Date: Fri, 22 Jan 2021 14:05:47 +0000
In-Reply-To: <165C8656186C2541.12911@lists.openembedded.org>
References: <1611299746-47965-1-git-send-email-wangmy@cn.fujitsu.com>
	 <165C8656186C2541.12911@lists.openembedded.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-22 at 10:14 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2021-01-22 at 15:15 +0800, Wang Mingyu wrote:
> > 
> > diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-18438.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-18438.patch
> > new file mode 100644
> > index 0000000000..b6ce8fa57d
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-18438.patch
> > @@ -0,0 +1,697 @@
> > +From:	Philippe Mathieu-Daudé
> > +Subject:	[Qemu-devel] [PATCH v2 07/11] chardev: Let IOReadHandler use unsigned type
> > +Date:	Fri, 12 Oct 2018 02:22:13 +0200
> > +
> > +The number of bytes can not be negative nor zero.
> > +
> > +Fixed 2 format string:
> > +- hw/char/spapr_vty.c
> > +- hw/usb/ccid-card-passthru.c
> 
> No Upstream-Status. 
> 
> Its also unclear what the status of these patches is upstream, they're
> submitted, there was discussion but they weren't merged. I'm also
> wondering whether there are more of the 11 patches in the series needed
> to address the issue? Or perhaps the issue was ultimately addressed by
> other patches?

I went digging and was pointed to 

https://bugzilla.redhat.com/show_bug.cgi?id=1609015

i.e. qemu upstream and Redhat believe this is not an issue

Steve: What do we do here? Whitelist? Do we report upstream somehow?

Cheers,

Richard

