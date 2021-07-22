Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.62.1626988038608437422
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 14:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GoAYhSHf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id z8so128378wru.7
        for <Openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 14:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=4dkBGjrEPNY5JGTbzwYgOnrib46Rz/C5lfRnngBaJ1k=;
        b=GoAYhSHfvc2gHImUYvaUXXXOB9MqPJsYJEV5PLspnh1ijOdjmzqumzc0wDn+CvFGfk
         JOoOZwYW5F0WM1Uvlb63pHXVBAjVxghgegMne08UpMF6prWAa5oFyr8cm0Pj4/re0oOB
         fRtrKRGIxEZvolaVen0DFXouNfexc2hOHjdhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4dkBGjrEPNY5JGTbzwYgOnrib46Rz/C5lfRnngBaJ1k=;
        b=o+FDidLglBGRHTPMCQCeG3UNr9AjwTkX2FMlAKKEqednopjOASOI0df6fS5e7Jv+Ab
         rjw+Y3ojnDyyFrxcA2qr+sEGDsSRyelF+7oxGZxwnob8/Gn5VH11dj4RgTmTLyWulh65
         RpiW/i+s3GJH7v0qE3ME7uf8qb1PJDHCrmzWzT7RS43/jNdFIPSgcYYWZyD6jLFY2uX6
         G19tTBUSct6b2viZhMTBHOhahVwdk+tMGxiTOa5yfPBAHk2gMhtO2HwRfcgn7zb4CSWt
         l5nRfrlCQdQFi+RKHBBQqViWm2ALI80o0ke7Z7NcwNfwviDxafvwnsQe/VgKTAB3gwB2
         iuLQ==
X-Gm-Message-State: AOAM533d+XLc+zDpp7+oI8wZpMpXIw6hTXDE7M0dFcEbMjWUi3DNDzgS
	kpwJffu/k96f3vQHS/ZX0dP1fw==
X-Google-Smtp-Source: ABdhPJyvms2pTvbDJku0hmP3cm5RzJedy3POHsYAbZR1HYBt7xiouh3EBvck26VqTYPnBqw94SKGpQ==
X-Received: by 2002:adf:f8cd:: with SMTP id f13mr1865464wrq.328.1626988036815;
        Thu, 22 Jul 2021 14:07:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e1dd:b42c:9243:6ba8? ([2001:8b0:aba:5f3c:e1dd:b42c:9243:6ba8])
        by smtp.gmail.com with ESMTPSA id w3sm30768045wrt.55.2021.07.22.14.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 14:07:15 -0700 (PDT)
Message-ID: <0ba045b9996d35344c96f1208bf189309338f9ee.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/8] overlayfs-qa: common functions for overlayfs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, 
	Openembedded-core@lists.openembedded.org
Date: Thu, 22 Jul 2021 22:07:14 +0100
In-Reply-To: <20210715193933.66120-1-uvv.mail@gmail.com>
References: <20210715193933.66120-1-uvv.mail@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Thu, 2021-07-15 at 21:39 +0200, Vyacheslav Yurkov wrote:
> This class provides commom functions for overlayfs and its QA check,
> which is performed in ROOTFS_POSTPROCESS_COMMAND
> 
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/classes/overlayfs-qa.bbclass | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta/classes/overlayfs-qa.bbclass
> 
> diff --git a/meta/classes/overlayfs-qa.bbclass b/meta/classes/overlayfs-qa.bbclass
> new file mode 100644
> index 0000000000..54fa8316a2
> --- /dev/null
> +++ b/meta/classes/overlayfs-qa.bbclass
> @@ -0,0 +1,14 @@
> +# This class contains common functions for overlayfs and its QA check,
> +# which is performed in ROOTFS_POSTPROCESS_COMMAND
> +
> +# this function is based on https://github.com/systemd/systemd/blob/main/src/basic/unit-name.c
> +def escapeSystemdUnitName(path):
> +    escapeMap = {
> +        '/': '-',
> +        '-': "\\x2d",
> +        '\\': "\\x5d"
> +    }
> +    return "".join([escapeMap.get(c, c) for c in path.strip('/')])
> +
> +def mountUnitName(unit):
> +    return escapeSystemdUnitName(unit) + '.mount'


Thanks for working on this, it is passing our automated tests but I had 
some review comments. I think the above would make much more sense as code
in meta/lib/oe/ somewhere as it is basically just function library code.
There is a general intent to move the more generic python functions there
and try to establish some better APIs so if you could move this there as
new code, that would be great!

Cheers,

Richard





