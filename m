Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.1305.1610183946799103698
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jan 2021 01:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WRa2bkM/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id 91so11250277wrj.7
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Jan 2021 01:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6yO75HgQx8sgykt/Nwd9dZBh3VHpM+wV8Wr8BcNjXLU=;
        b=WRa2bkM/MxyNlpUNcda2Tq1AgHvQcPxf/7gOWH1+4Rzs4YgaDb9OxhA1fcH/qKfgNN
         wZMVKjxIsX+V7zvnnvYQQRy+uzKFVASEbiJ3yfGKqlRu5ppvyCea4VA0+aYBRElvKMQE
         Wfr5swKXr6bmhfH2jBQsfP7NTTl3H/LuF7Vtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6yO75HgQx8sgykt/Nwd9dZBh3VHpM+wV8Wr8BcNjXLU=;
        b=JVsKOtwHT07MkEDTCML/2QigdBED//yRDIA64YR2Yvxh2DDpIP7MU705qpogk+NsuY
         rAbOPMwGt5tvTOyLqTQi3omgexMIEavuydxoMRlNSgHY19KO66S8Nzu7zXUBdt2EpeMS
         smdWzxlexfsF/DVqnf9Cw3pnzGyW8ezlGpohtgfog4mhEdMuyEnv00CD1rxNrdZwHIJc
         kiiaoZWXJ8s7Ys4bnQhVlm+eOiluQ2l8UlCIYqYYc/v8rCG37OHmxfUaNarGIqTqcv5n
         mnFsrugp4wnOC50q5OuAvL4+/3G339OCe79FzHGrXSfnFPuiywXCdKRYUPh8uZGImnzt
         1Uew==
X-Gm-Message-State: AOAM533F+E+nUSoyT7NDxgrF42YhpFK9T4rfJcRfiXlqgA1mce/N4APp
	+1ruHEYwfmrMpTBHTAxwloz5oA==
X-Google-Smtp-Source: ABdhPJzEqHDtWXmJoQfl7laUQ6LQy9gYhGCnuCslECMYyfB3aYYnyaQIhTAB6B5PAYXVcVjGAJoZgA==
X-Received: by 2002:a5d:69c2:: with SMTP id s2mr7252939wrw.36.1610183945486;
        Sat, 09 Jan 2021 01:19:05 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9f59:d30:dcb7:19cb? ([2001:8b0:aba:5f3c:9f59:d30:dcb7:19cb])
        by smtp.gmail.com with ESMTPSA id b7sm15851585wru.33.2021.01.09.01.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jan 2021 01:19:04 -0800 (PST)
Message-ID: <dc27903d2eafc24814d131cce1f57bb7380024e4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] qemu: Drop vm reservation changes to resolve build issues
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair23@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Sat, 09 Jan 2021 09:19:02 +0000
In-Reply-To: <1658397859ED357D.11938@lists.openembedded.org>
References: <20210106223628.561432-1-richard.purdie@linuxfoundation.org>
	 <20210106223628.561432-3-richard.purdie@linuxfoundation.org>
	 <CAKmqyKM9UtUSs6sQReZqzoy8=kPGmOyGNG4+BJx5vU0gFvhWVA@mail.gmail.com>
	 <1658397859ED357D.11938@lists.openembedded.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-01-08 at 10:00 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2021-01-06 at 14:53 -0800, Alistair Francis wrote:
> > On Wed, Jan 6, 2021 at 2:36 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > When building with the new version of qemu we see errors like:
> > > 
> > > """
> > > qemu-i386: Unable to reserve 0x7ffff000 bytes of virtual address space at
> > > 0x1000 (Success) for use as guest address space (check your virtual memory
> > > ulimit setting, min_mmap_addr or reserve less using -R option)
> > > 
> > > ERROR: The postinstall intercept hook 'update_gio_module_cache-nativesdk' failed
> > > """
> > > 
> > > The VM reseration patches we're carrying look suspicious in this context.
> > > Drop them since we don't appear to be seeing those issues any more on the
> > > autobuilder and I suspect the patches have become broken and a liability.
> > > webkitgtk builds seem to be ok now.
> > 
> > Yes! Getting rid of these patches is great!
> > 
> > > 
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Unfortunately this issue is still present, I thought we weren't seeing
> it but once other errors cleared, this one remains, only on
> qemux86+musl for webkitgtk.
> 
> I think we need to get to the bottom of it and figure out something
> which is upstreamable. This will block the qemu upgrade until we can
> fix it unfortunately unless we block webkitgtk on musl on 32 bit x86.

I've sent out a couple of linux-user mmap patches for this. With those
fixes applied, qemu seems fine so I've upgraded.

Khem: I do wonder whether musl's memory allocation is all ok given it
loops indefinitely if it doesn't see EFAULT and only ENOMEM. That may
need investigation?

Cheers,

Richard

