Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.3274.1608763386007200764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 14:43:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F4WwXXnJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id c124so187941wma.5
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 14:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=i3G8hOMaIP2+1AZV+dJjHGH4PoVMpLorL6T0/ZmPg10=;
        b=F4WwXXnJpxvGOpC6/sqxXzUEyGQ6WZqp5Ecfuz73xnkojfgnDGB84YEnDuwIky/wxg
         m2M08mFtxOztfQHEJN/iHPllZtJylI1ryeevbe6A0A2dHRgiIqDCl+oqbFYVgJMClpBc
         5RXOvM7uuFNU5ZimgUprnzfnHMnGM4vTI9pbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=i3G8hOMaIP2+1AZV+dJjHGH4PoVMpLorL6T0/ZmPg10=;
        b=bshXBdb71DmMXejONhC5otpSxaWrzyHMFw2bZhuPX8WDXXFtKee7RFR87FL+1YINeI
         SmYuRcJv1P0YI1SkSwqB8fRsxU4nH4N8RbCqyf6dSNFgDS7VaEDiUdepZgMxWkaF1MvI
         JLkJdx/BaUhg/6TZZwodUG2MQSMohDDk6UljVUDyt7hvmqImf5T/x5JSJKrsYB3z5AyN
         q0Ue5UvNaKYtNv7nez7NHrIaJqT45jftLYZaFrQXv7Wo2iA29soBv6GZOlGQWJarYtjQ
         3MDbcunAOZckxh+xzk7efGDcYBReTwYMHyeVh9Fuzc7xkvEjQ3HQeqwgJKY5KgX9U1eb
         tuGw==
X-Gm-Message-State: AOAM530BUbVIexu2Iym7ncmEKFKba9F9GbpB0VrUpcC6WkNeblrYFeci
	0HG9VNJt3hV9I+YDyTsDuAOf9Q==
X-Google-Smtp-Source: ABdhPJyhzbx5Oy5Y2qI6WAKwX0JhseKq9YypruJdm4gBH0S4i/sA8WPaFqqv5Z9wlONMA6YgqyLakw==
X-Received: by 2002:a1c:8016:: with SMTP id b22mr1586119wmd.135.1608763384539;
        Wed, 23 Dec 2020 14:43:04 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.7.9.f.e.b.4.7.3.0.6.1.b.d.b.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.7.9.f.e.b.4.7.3.0.6.1.b.d.b.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8bdb:1603:74be:f976])
        by smtp.gmail.com with ESMTPSA id m2sm1200177wml.34.2020.12.23.14.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 14:43:04 -0800 (PST)
Message-ID: <595b6989f099f65292ba79446e2dc527b4587aac.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master-next][PATCH 2/3] psplash: work on first boot (sysvinit)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 23 Dec 2020 22:43:03 +0000
In-Reply-To: <20201223224129.GA1691@localhost>
References: <20201223170621.35727-1-twoerner@gmail.com>
	 <20201223170621.35727-2-twoerner@gmail.com>
	 <743d9e91ea6fb99193e315f8b20778e418109da7.camel@linuxfoundation.org>
	 <20201223215005.GA9542@localhost> <20201223224129.GA1691@localhost>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2020-12-23 at 17:41 -0500, Trevor Woerner wrote:
> On Wed 2020-12-23 @ 04:50:05 PM, Trevor Woerner wrote:
> > On Wed 2020-12-23 @ 06:00:21 PM, Richard Purdie wrote:
> > > Personally, I don't really like the idea of having a top level
> > > directory called .psplash,
> > 
> > Neither do I, which is why I also added the code to remove the
> > directory once
> > the psplash program is done running. Whenever psplash is run the
> > directory is
> > created just before it starts and removed when psplash is done.
> > 
> > > is there a reason it doesn't work in /mnt?
> 
> specifically…
> 
>         mkdir: can't create directory '/mnt/.psplash': Read-only file
> system
>         mount: mounting tmpfs on /mnt/.psplash failed: No such file
> or directory
>         mkfifo: Read-only file system
> 
> then
>         umount: can't unmount /mnt/.psplash: No such file or
> directory

You're misunderstanding my question. In your patch you create
"/.psplash" in the splash recipe.

Is there a reason the psplash recipe can't create "/mnt/.psplash", i.e.
match the original path ?

Cheers,

Richard

