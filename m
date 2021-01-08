Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.1726.1610100055351392310
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 02:00:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xc8NSwG6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id d26so8358363wrb.12
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Jan 2021 02:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=T0iu0hyhgQml4t4t2zdPkx5wMsPbxEoYkjB2GQT93Uw=;
        b=Xc8NSwG6KI9+dsLD8a2K+4Y+qaGYjAOrS5G1c0sGq5Mh32+iztSZbHLrC0REFw4NJ9
         u3tdgaKa35u5bVcQN+1kmVKsgvRddbeAnMwuV4nAkd8o8F7UHC2yKGntD1nuDH2Hyd+/
         UT38lTNiUkl3i6mQHD1FE48vz/p8/dVLSdAzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=T0iu0hyhgQml4t4t2zdPkx5wMsPbxEoYkjB2GQT93Uw=;
        b=Ms78rFDXcsl1wusRginvppgXhiVjiNu3lx2b/5rqejfBnnF0a63w6b1wfE1Fu/pVoy
         BrgWcu+Cewp3JRoacfsG+Kw2PpszHs/9r79ow4krwH5Ih5RCjmOdDbXGmLmGLfQvPPId
         TcwBP0gfI/Iul9Pllkld4MUaiBa1nSEhQGY+mLjLWO3d6jhuqv5+6Of+4saU/xH5aGv9
         V7qpPmzqdR0ws9VFHKHBcPjJj+DXe83brK2ZNxj26uadLrBUaOQ6UDKcDXMTEuUdBktv
         UU1TFwEiK/TNnkNTzU+kOxMr8U5aHza+gHYEJPAITfP2D91sl6Kzh9e3bO/5LLjPWwCQ
         peRg==
X-Gm-Message-State: AOAM530vHrmfMndLOSfILIkWQc2OIQz26cVXn9LMAz5q9NTwtvvoxevT
	vAhAgg+ZHOiHuFsAsdFpXVSe/w==
X-Google-Smtp-Source: ABdhPJysBEsEU73UdOhC7OL4lmZ+RlVNuJWebx3K3r4BV5vqaESLSXMxXVCE11t+hLwN0qDGbJXzIw==
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr2746219wrj.79.1610100053585;
        Fri, 08 Jan 2021 02:00:53 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8262:2156:a38b:824c? ([2001:8b0:aba:5f3c:8262:2156:a38b:824c])
        by smtp.gmail.com with ESMTPSA id h20sm13333820wrb.21.2021.01.08.02.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 02:00:53 -0800 (PST)
Message-ID: <4a8c851ec5bd0343c5805d5f2180be70c6023b74.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] qemu: Drop vm reservation changes to resolve build issues
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair23@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jan 2021 10:00:50 +0000
In-Reply-To: <CAKmqyKM9UtUSs6sQReZqzoy8=kPGmOyGNG4+BJx5vU0gFvhWVA@mail.gmail.com>
References: <20210106223628.561432-1-richard.purdie@linuxfoundation.org>
	 <20210106223628.561432-3-richard.purdie@linuxfoundation.org>
	 <CAKmqyKM9UtUSs6sQReZqzoy8=kPGmOyGNG4+BJx5vU0gFvhWVA@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-01-06 at 14:53 -0800, Alistair Francis wrote:
> On Wed, Jan 6, 2021 at 2:36 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > When building with the new version of qemu we see errors like:
> > 
> > """
> > qemu-i386: Unable to reserve 0x7ffff000 bytes of virtual address space at
> > 0x1000 (Success) for use as guest address space (check your virtual memory
> > ulimit setting, min_mmap_addr or reserve less using -R option)
> > 
> > ERROR: The postinstall intercept hook 'update_gio_module_cache-nativesdk' failed
> > """
> > 
> > The VM reseration patches we're carrying look suspicious in this context.
> > Drop them since we don't appear to be seeing those issues any more on the
> > autobuilder and I suspect the patches have become broken and a liability.
> > webkitgtk builds seem to be ok now.
> 
> Yes! Getting rid of these patches is great!
> 
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Unfortunately this issue is still present, I thought we weren't seeing
it but once other errors cleared, this one remains, only on
qemux86+musl for webkitgtk.

I think we need to get to the bottom of it and figure out something
which is upstreamable. This will block the qemu upgrade until we can
fix it unfortunately unless we block webkitgtk on musl on 32 bit x86.

Cheers,

Richard

