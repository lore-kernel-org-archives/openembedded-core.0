Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.3118.1625349775736718338
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jul 2021 15:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QicDrw/f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id n33so1353210wms.1
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Jul 2021 15:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6J4JvXO9XrQ5ec4CkI6XSAL0+Nc8+04OGGomRPaZc7s=;
        b=QicDrw/fiWKqAmuuft0cGj+2n1jdGqUGbI3aP2fzXescQeQ63d+MCY9OV8yS2JOCl0
         7hhxfuxiuBp2O2wpgfE4uP6f3jv1z76po8pSc7PQLJE3vx7X3dNhVflc9T5XnIeYbvm9
         ByT4Ugynp5yD7HQ2Sty3rWMaNUj/wEAoNGjnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6J4JvXO9XrQ5ec4CkI6XSAL0+Nc8+04OGGomRPaZc7s=;
        b=P4BBd12li2UYuimHgWptRrJViMHck/+5t6f1jBXWD6XVOjQABfQRDHlPp8apJ76o6D
         sCvXobqtnGnKmonrlNWnn+kkrcko1dlo2FASjyEkpYFgnCE5efC1oKfMa9EJEkP3loW2
         sMdzWrNw3VgjvYHJq8486qC+pinllm/vm9fqwE5DVRFgUMLYDLYtHWlyqSnd6J9qjo0R
         Jzygs5w28fAQp+VRNWKkiHBsD2x26PEwqRnWclvnhczCBs8LypEXZa1S5v/ZSep7a2M0
         GOWAlzojjH9/af/ClruTPq999k5+wiNbjkgv3/y+oNSISwIHjBHkbI09hM82yjRp6DyF
         DKdA==
X-Gm-Message-State: AOAM531O+9YUyyJ9ge4AvHdYN0jDiGYMqzU+mhUErJVaI2zL0UdgJp88
	UZHJMqQRhm6aiKqNcmNxd9At1Q==
X-Google-Smtp-Source: ABdhPJwS+v18DEE/Q12muiQQxS68rF15aK/14cJxvWUhArcu1VmhL6D9QAGyOxiDFX5uIC8kwLyxzw==
X-Received: by 2002:a05:600c:3782:: with SMTP id o2mr6516967wmr.152.1625349774222;
        Sat, 03 Jul 2021 15:02:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f8cb:97a3:103a:4a52? ([2001:8b0:aba:5f3c:f8cb:97a3:103a:4a52])
        by smtp.gmail.com with ESMTPSA id y13sm7843049wrp.80.2021.07.03.15.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 15:02:53 -0700 (PDT)
Message-ID: <16e9488d8d4b8f200f506a6debb464e54a4bb0d9.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/8] linux-yocto: consolidated pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Sat, 03 Jul 2021 23:02:52 +0100
In-Reply-To: <cover.1625238537.git.bruce.ashfield@gmail.com>
References: <cover.1625238537.git.bruce.ashfield@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Bruce,

On Fri, 2021-07-02 at 11:13 -0400, bruce.ashfield@gmail.com wrote:
> Here's the next consolidated pull request. It has two normal -stable updates
> for 5.10 and 5.4, as well as the first steps in bringing 5.13 in as the
> reference kernel (and then dropping 5.4 from master).
> 
> I've built and booted 5.13 as the default for qemu*, as well as building it
> against both musl and glibc with the 5.13 libc-headers. I didn't run into
> any issues, and neither did my AB runs (I'd like to think it is all the
> other patches that have been sent as linux-yocto-dev moved foward that made
> this relatively few patches now).
> 
> I've also ensured that AB intermittent fixes are in place for 5.13, so it
> is safe from that point of vew as well. Folks without exlcit versions set,
> will get 5.13, but it is already sane and fit for that purpose.
> 
> Obviously you can pick and chose what you need from this if there are issues,
> and I'm around to trouble shoot anything that pops up.

Thanks for this. In general it looks good, there is just one failure worrying
me a bit:

https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/425

which in diffoscope speak is:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210702-c3hu90kc/packages/diff-html/

You may wonder what this pull request has to do with a gcc-sanitisers failure?

If you don't speak dwarfish or elvish, it means that perf_branch_sample_type_shift 
was declared on line 162 in one build and 182 in another. I wondered about a 
bit flip however it is two bits and linux/perf_events.h has 
perf_branch_sample_type_shift at line number 162 in 5.10 and 182 is 5.13 and that 
file comes from linux-libc-headers. The logical conclusion is that one was built
with one header and the other, from the other header. Why/how this could happen
I simply don't know. The problem build came from sstate so there is no real 
audit trail to follow :(.

I'm not sure this blocks the pull request as the issue is probably somewhere else
and this just exposed it but any ideas on what happened are very welcome...

Cheers,

Richard



