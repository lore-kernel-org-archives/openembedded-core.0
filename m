Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.8394.1608798892704931499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Dec 2020 00:34:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bJhCJ1Ek;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 190so988367wmz.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Dec 2020 00:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=rHYS5cbuJcGV/2kBTTGqXYfslbVZcDG1jLqceEjBvbY=;
        b=bJhCJ1EkMMxFGHG0dBMLa1Y2mH93LQoqsuwchjAgsNryOlMtZcGwR7gRRGFhoLSjOi
         2djjEQA7fIaZ3c10Wpo4WBf6yvnDEtY4bxeYamF+1cf005So1Auuba1O7+2tbZOWSx5i
         Lo9cje7lkG4Yde1pMGGexguoggd9BnaQLpFQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rHYS5cbuJcGV/2kBTTGqXYfslbVZcDG1jLqceEjBvbY=;
        b=iSpF3rMHNLvi3lywFLO+H1CRTO3QpasZlWWNZ+juwS1qr1VmL2M6fmeAjx9+n33Ea3
         jmJchW3eYI9/R1Da5S7yYpmvX1SVindGS8ZaemMFSFQWFGX/f/gGYfM/BiRclRUyUcc0
         Iw1i/rBqnqdAYfy75JC29G39uxp3toJ1eHyNg3fVO+pULOOCrGUwGTrYrJzXVpmOZj0Y
         GQ4BsYgUVSvp51da2rXgQgt9rJSGwohKGlRlDTglPtkl92RQt6uHpXVrm53BLNBiPDo7
         kXZwQ7rH9dSf8lRx3B6YoOSaLcAnXPTj+Ar66azJ9iZuLuuIc4HiAfTvzr2hlqh3WKqU
         32dA==
X-Gm-Message-State: AOAM5312XoVB91kXpzeW2hdBZubKVe5RRD4mZGXSqNjl5XjUZCLtKPHm
	krilolTolYZ4Ut05fjJbUBCVJA==
X-Google-Smtp-Source: ABdhPJx+Sqf9od0D2oU4M+m1BGXgjs0vv3gnVRF4Z2t7HhlwHEVsHlgICPmrZPJq4UvROqT4fl6wNw==
X-Received: by 2002:a1c:b742:: with SMTP id h63mr3289578wmf.122.1608798891126;
        Thu, 24 Dec 2020 00:34:51 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.7.9.f.e.b.4.7.3.0.6.1.b.d.b.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.7.9.f.e.b.4.7.3.0.6.1.b.d.b.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8bdb:1603:74be:f976])
        by smtp.gmail.com with ESMTPSA id k1sm38892854wrn.46.2020.12.24.00.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 00:34:50 -0800 (PST)
Message-ID: <5df655f3130bb4184d9691d4e04c51c350c590be.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master-next][PATCH 1/3] insane.bbclass: allow fifos
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Dec 2020 08:34:50 +0000
In-Reply-To: <20201224074354.18751-1-twoerner@gmail.com>
References: <20201224074354.18751-1-twoerner@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-12-24 at 02:43 -0500, Trevor Woerner wrote:
> Allow recipes to create fifos. If insane.bbclass tries to read() a
> fifo,
> the process will hang waiting for something to read(). Therefore,
> skip any
> check that would try to read() the object, if the object is a fifo.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/classes/insane.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass
> b/meta/classes/insane.bbclass
> index cf2165c517..105d2a5ce8 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -87,7 +87,8 @@ def package_qa_add_message(messages, section,
> new_msg):
>  
>  QAPATHTEST[shebang-size] = "package_qa_check_shebang_size"
>  def package_qa_check_shebang_size(path, name, d, elf, messages):
> -    if os.path.islink(path) or elf:
> +    import stat
> +    if os.path.islink(path) or stat.S_ISFIFO(os.stat(path).st_mode)
> or elf:
>          return
>  
>      try:

Good catch, I think there has been a bug open for a while to fix this
one!

With the rest of the series, I can't get the patches to apply, I think
there is one that wasn't sent to the list. I've added this fifo fix to
-next since its ready, for the rest could you send a series against
master please? That should allow some cleanup of the patches now we
know where we're going too!

Cheers,

Richard


