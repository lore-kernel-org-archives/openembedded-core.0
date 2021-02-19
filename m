Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.12306.1613757116406584705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 09:51:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hvc/RiQi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id i7so4735942wmb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 09:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=m4jIIc5swcrWsbfYCBFjbKcNmmJ9pr/M6awps2etOhE=;
        b=hvc/RiQiNjkX/9jan7oFti14g6QAmUmR0kRSH24vL0fnt3xn2RDXUe3H+MytrTfytg
         Jwjnb8duTWa8WuMcCsAWNz7vBChHCuGGrhKXhsZ5CBu5VbMdaLYvNtzXhplkknOWtD7S
         8gvjVq51r4ECwYhcRR84wXaXNT68RoAPlTLlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=m4jIIc5swcrWsbfYCBFjbKcNmmJ9pr/M6awps2etOhE=;
        b=KPen24mlnHbxP44cxMOyfMl+zFi2WHRun2ROTn+o3dd2H/gLueelCcxeCCLuIod5TZ
         9pqhPXwzkrWXUpj5Tw04thPzcRy8yIV5Nqp3mjxB/mdbec25ywP7bxBG3yMbXfyudaDu
         +vpHDrgz+Gauu5GU+EgPv+mHcqCGi3Z8lEREa9G8bi1SJIA4sObOlSHY4FHv4Gzeqyab
         OAy+BR54fXKi0JZf9qtcGdvcqVhdw0mAa5vDTxwwJNs2CSGMEesISDvliD5ibgDuH+gu
         7SzXP8449Dpq2VkF8ZTNY53HSEUS1LCFMepYtzHjaLe6MEbgKNdZTlAkjn2AdQlpdEcQ
         OV9g==
X-Gm-Message-State: AOAM531mS37AlJNXk5ZUyC7qmuEYknc16B/JYYbNXBatmTzZax+bIuLS
	9ims+pPh5FxTjce/TpMdQTqcxw==
X-Google-Smtp-Source: ABdhPJyWPGQgXfqypuCzvYNUmBmg8vWP+FouYx0RJ+9pDghEPhnZOYB8GxXQdvb3TO7yFSTpHpdhyw==
X-Received: by 2002:a05:600c:230c:: with SMTP id 12mr9254923wmo.30.1613757114872;
        Fri, 19 Feb 2021 09:51:54 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9? ([2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9])
        by smtp.gmail.com with ESMTPSA id h11sm11502056wmq.26.2021.02.19.09.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 09:51:54 -0800 (PST)
Message-ID: <908203e58ebf8774af4afb05d147b8b3b4590ea7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Add sstate-build-populate_sdk and intercept_scripts- to PSEUDO_IGNORE_PATHS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Feb 2021 17:51:53 +0000
In-Reply-To: <CAJkqNs1L+J1e1WVLwO46VB-PfpRgaM+aA3D1mC68ryHg86gcGw@mail.gmail.com>
References: <20210217224915.23546-1-tomasz.dziendzielski@gmail.com>
	 <075c7fbe4df698d6919b3c6bebbb43d83fa1c861.camel@linuxfoundation.org>
	 <CAJkqNs1L+J1e1WVLwO46VB-PfpRgaM+aA3D1mC68ryHg86gcGw@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-02-18 at 11:30 +0100, Tomasz Dziendzielski wrote:
> > > Recipes using populate_sdk.bbclass are failing with pseudo abort due to
> > > path mismatch on these paths.
> > > 
> > > Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> > > ---
> > >  meta/conf/bitbake.conf | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > We build SDKs on the autobuilder and don't see this. Any idea what you 
> > need to do to trigger it?
> 
> I was able to reproduce abort on sstate-build-populate_sdk on the latest master without any old build/
> directory.
> $ . ./oe-init-build-env
> $ bitbake meta-go-toolchain
> $ bitbake meta-go-toolchain -c populate_sdk -f

Which packaging backend are you using? I suspect this is package 
backend specific.

> Please note that above commands might not fail every time, it seems to 
> be a bit random. It occurs not only on rebuilds but also on the first run. 
> If we build multiple SDKs at one bitbake execution the build is unlikely 
> to finish successfully, because each time different (or the same) SDKs will fail.

The "better" way to test this is to look inside WORKDIR/pseudo/files.db 
with sqlite3 and then see which paths are in the database which you'd 
not expect. That way you'll see the paths regardless of whether there
was an inode reuse issue or not.

> In our environment I also had to add ${WORKDIR}/oe-sdk-repo,${SDK_OUTPUT} 
> to PSEUDO_IGNORE_PATHS to make SDKs work but I'm not sure if failures on 
> these two are not related to some of our custom mechanisms.

In my local build I can see WORKDIR/oe-sdk-repo, WORKDIR/apt and 
WORKDIR/oe-rootfs-repo in files.db which look suspicious.

I don't see sstate-build-populate_sdk or intercept_scripts
paths though :/.

At the very least I think we should append these to PSEUDO_IGNORE_PATHS 
in the classes which define them rather than globally.

Cheers,

Richard

