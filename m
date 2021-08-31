Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.21.1630440672667887476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 13:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K3I578KC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id m9so1030695wrb.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 13:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=wfmy1eKa9hPjf5pL5a0FRXXLa+Kay7Mh8Ozyj5Y7uKI=;
        b=K3I578KCquE/WrvvvONH8MelGyPbSt81gMGi9FmgBQCfEpFp7m4GmO4mv81PSfPR3F
         hKRz92wyH2CNvyMK0VO+IOBMNPiseSnfjfb4dO/Jocjh5VlY4tTJN+Rks6w7JbTOMAma
         JvFV/iW+oCbqf2rxbLS38EBFLkLwlrcEvowdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wfmy1eKa9hPjf5pL5a0FRXXLa+Kay7Mh8Ozyj5Y7uKI=;
        b=AZTak/Gb/3PGqZJUB0Rgh9oCuQA6krZJsszjDfu4L7L3HdX8jrZzdshcCKMHL5uOfc
         xyCCgvy1vjsqUsmjBdE8pj8SmwLkucPyjVMC0fPjJcloGkw2MWSQ74kzlOip+j80fst0
         8XdT1dxX2rdIp1tJYAxWGdgkmVLmcdjodxy3Au531cy5cm0vC2gQlrahqoqMoGy//ju1
         cxDMg7GSv8PPYALKd2UIg5I4v/ekvh16SfAWkXdVc3aimO7b9WuP30idX3CboNvQFjPK
         EswpsogykKbt5QJtY7UPQnCP2lQTAIeW9yBAi6DrMWpPywV39JXZPjxlc1WRwAApFDOp
         Ri7A==
X-Gm-Message-State: AOAM530QISp/WVGhhQBAEahpTOB7gIOjkxxLpwUGc5PKCR0bBF87s6iC
	JhxNkP6mi5AI4veyfnLViDn2Qw==
X-Google-Smtp-Source: ABdhPJzZarj7LoiWnrjt5U/fOZe2W35KjJav6/JJytfmSh/vhp+fXGhhTUtWLjEhYFCLghdrMb8DOQ==
X-Received: by 2002:a5d:5262:: with SMTP id l2mr32960522wrc.190.1630440671085;
        Tue, 31 Aug 2021 13:11:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7e06:66c6:32e7:e304? ([2001:8b0:aba:5f3c:7e06:66c6:32e7:e304])
        by smtp.gmail.com with ESMTPSA id c2sm19323201wrs.60.2021.08.31.13.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 13:11:10 -0700 (PDT)
Message-ID: <95637a535b2c81de95c57e87de554386d265a066.camel@linuxfoundation.org>
Subject: Re: [PATCH V3] glibc: fix create thread failed in old unprivileged docker
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Date: Tue, 31 Aug 2021 21:11:09 +0100
In-Reply-To: <20210830022054.70867-1-hongxu.jia@windriver.com>
References: <169FF34664D4ACC1.22970@lists.openembedded.org>
	 <20210830022054.70867-1-hongxu.jia@windriver.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-08-29 at 19:20 -0700, Hongxu Jia wrote:
> # Changed in V3: add missing Upstream-Status tag
> 
> Since upstream commit [d8ea0d0168 Add an internal wrapper for clone, clone2
> and clone3] applied, start a unprivileged container (docker run without
> --privileged), it creates a thread failed in container.
> 
> In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined.  If
> __clone3 returns -1 with ENOSYS, fall back to clone or clone2.
> 
> The newest docker has fixed the issue in commit [1], but it was applied
> only on master, to backward compatibility with old docker, discussed
> with glibc maintainer [2], explicitly disable clone3 wrapper work by removing
> macro definition of HAVE_CLONE3_WRAPPER
> 
> [1] https://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594
> [2] https://sourceware.org/pipermail/libc-alpha/2021-August/130591.html
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

Just for reference, I'm going with v1 of this fix.

The reason is that I do want clone3 to work on target and I do want the wrapper
to be available. Falling back in the EPERM case is therefore easiest.

I did wonder about making the fix nativesdk specific however I decided that was
going to complicate upgrades and so on a bit too much. The v1 fix is simple
enough it can be used everywhere without too many side effects.

Cheers,

Richard

