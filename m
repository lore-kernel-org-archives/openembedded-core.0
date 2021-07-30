Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.25404.1627658341313312841
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 08:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JhwAKwZa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id h24-20020a1ccc180000b029022e0571d1a0so6657284wmb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=DBQnkB/KWDsYRHAAiYq8LeooQkfpu6Rbf62mh87fFe0=;
        b=JhwAKwZanHmbkW7HDHs4HEUmC916feGWmeYuBh3JpdGeg9UihKWQXM10ea6zOSdiI8
         GMNMYN7/i8P1cu1EfUaxvBJzwUgOFI3jNBIx6E4hTE4QLHhK7Lb6DP4WgTgDWLftSQ4E
         srTCClfjrTyEAbiX9+/Ty7AFyLIeZVs54DAwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DBQnkB/KWDsYRHAAiYq8LeooQkfpu6Rbf62mh87fFe0=;
        b=cl638TXHMbL9W8h7+p7D3Rf69NI1BM/kjTM1azXAwz5O/eBAUt6D0c8UAmc3ovPiuS
         72JuQi2xXTea/UYl5HRmFUoyjDtoRAeaU0/iptzs5aaoNSjHCI8uG9h8FTQHYfBcPoYA
         1LGrp9KhPKF2dWNt8r3S4qI/VBMRmzp8QN/aFsAj5WahKf2xOZpq/SDeixbqLbAHsNl7
         yuaUTv2I9oMDHwwZmjPifXh7d87kgzYFhh+EUxzgk2oEi1NPxk2AXYNNYL+eWYFDG1lO
         PTGneVQhviTMlizNzQpGBrdfFJToNf1XrAOYQOi1oAx/FeOwyohDL6Kq1G0RIEZ3s43Z
         ex+A==
X-Gm-Message-State: AOAM532fSBDC+xFknLJjwvVPRYKM57BlfXA9LTHuyyFxyU4mKhKZTQQp
	FPv1+HdfEldTu7fVXoJKRA/Nqw==
X-Google-Smtp-Source: ABdhPJzb1ZGkE2fV3Idh4fdGuQK991vu9F5LVHAOlnIIMjjgOvyE/27VIAQjVJE7Ydolztnl9yUoSg==
X-Received: by 2002:a1c:c918:: with SMTP id f24mr3457037wmb.88.1627658339696;
        Fri, 30 Jul 2021 08:18:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b? ([2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b])
        by smtp.gmail.com with ESMTPSA id o34sm2066696wms.10.2021.07.30.08.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 08:18:59 -0700 (PDT)
Message-ID: <e3f3675380a84f3c726f8238707653fbaad1136a.camel@linuxfoundation.org>
Subject: Re: [OE-core] SYSROOTS_EXCLUDEDEPS_SYSROOT changing more hashes than I expect
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jate Sujjavanich <jatedev@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 30 Jul 2021 16:18:58 +0100
In-Reply-To: <j56E.1627657320792818740.TZ4M@lists.openembedded.org>
References: <j56E.1627657320792818740.TZ4M@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-07-30 at 08:02 -0700, Jate Sujjavanich wrote:
> I added meta-java to my bblayers.conf file, and the next build invalidated 
> much of my sstate cache. This included such recipes as perl, which I thought 
> would be unrelated to that layer. Through some digging, it appears that the 
> addition to SYSROOTS_EXCLUDEDEPS_SYSROOT in meta-java affects that recipe.
> 
> I wonder if this variable should be added to something like BB_HASHBASE_WHITELIST. 
> I'd think that the value in the exclusion should only affect the signature if 
> it matches the current recipe. Is something more needed in a hash calculation?

It definitely should not be in BB_HASHBASE_WHITELIST. Changes in output should
affect the hash and changing SYSROOTS_EXCLUDEDEPS_SYSROOT does potentially change
the output.

This is a bug in meta-java where it should only be setting this for it's own
recipes and not every recipe in the system.

Cheers,

Richard

