Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.286.1608746426182352373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 10:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CtsYDAUv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id y17so16642wrr.10
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 10:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=XelBZ7eHkKRsCUFiVKCz6swRPpVQQFoLLUPEDvNG48I=;
        b=CtsYDAUvuhzBEcJ/RnPKX+Kk6SMRBQsf8oCGFHxbJDq6nnrZPTfthfAoEK+iQJt9yx
         MjKZ855roUyf+JarDwPKtUAPYYfMlR6yUrv3bL4U2fK1ljtRAgZN8S/6B3KaM/E8DWVi
         LTX2w+MODoJOQg32fSHIxJAy8ZFaWfuw596BM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XelBZ7eHkKRsCUFiVKCz6swRPpVQQFoLLUPEDvNG48I=;
        b=Wcp6kVnCEYszxubdubjJmJsYE7+1OZZ1W8LRmJj5WdavVGcCiFtMectPxXKmUpsnQ1
         p0ZFyUk/YJAp+39RovO4heRu+He+0jKigfFGwqfv/q3yY8V606l92IXEZHAi8PwYrTqH
         MYELF6Q5J1y9EoDbBaPtJzoE/Jgcgii1vkStKwXFZMVcn+wo9FlinzQ0BZM6qLS8KTVh
         hZKXAp/+U/vPtoQLDMulCDB2AqIDgswrrMbHocPpBjUntVPVr+zLOngc+cWBYi5zXUG0
         5hqkmQroAmPEQ9ARNqtIGatu+A1P3BDNfCWOMeVZ1k3UxO8eHWCg2XZxURBdl/O3UNAc
         tEYg==
X-Gm-Message-State: AOAM532Wjz5MZPg6vB95v+hvP0x2hGT0qYonJ77VVXSS1zNH3M7Gz6B1
	1tv3jgBayAk0OHQzn9ffpbUBbQ==
X-Google-Smtp-Source: ABdhPJx4KKufQFf7RLf/NNHlKs3jLUrskeFq2O7ijdBrrx7+3hk4q6u3P96ouiQO5Ly2L7i6wXJQ1A==
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr31602573wrq.189.1608746424723;
        Wed, 23 Dec 2020 10:00:24 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.a.4.f.7.2.0.3.4.6.1.7.a.0.b.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.a.4.f.7.2.0.3.4.6.1.7.a.0.b.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7b0a:7164:3027:f4a6])
        by smtp.gmail.com with ESMTPSA id t188sm600669wmf.9.2020.12.23.10.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 10:00:24 -0800 (PST)
Message-ID: <743d9e91ea6fb99193e315f8b20778e418109da7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master-next][PATCH 2/3] psplash: work on first boot (sysvinit)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 23 Dec 2020 18:00:21 +0000
In-Reply-To: <20201223170621.35727-2-twoerner@gmail.com>
References: <20201223170621.35727-1-twoerner@gmail.com>
	 <20201223170621.35727-2-twoerner@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-12-23 at 12:06 -0500, Trevor Woerner wrote:
The psplash program has a mechanism for showing progress/updates. This
is done via a pipe. On images that are R/O or images that are assembled
via wic, the pipe is being setup in a location that is R/O on first
boot,
therefore the pipe can not be created. If the psplash program is not
able
to create the pipe, the app will not run. This situation is "fixed" on
non-R/O images when the first bootup is complete. Therefore the psplash
program is able to run for the first shutdown, and all subsequent
bootups
and shutdowns as well, but not on the very first boot.

If the directory in which the psplash pipe is to be created already
exists in
the filesystem and that location is not R/O on first boot, then the
psplash
program can run on first boot (and subsequent boots and shutdowns).

NOTE: this is only an issue with sysvinit and most non-qemu machines. A
systemd image, and images run on qemu machines, are able to run psplash
on
the first and subsequent boots.

Personally, I don't really like the idea of having a top level
directory called .psplash, is there a reason it doesn't work in /mnt?

Cheers,

Richard



