Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.21162.1603031227673782966
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 07:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fo4IkXmr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id n18so8545635wrs.5
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 07:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=frkrHuC8yePy27v23SNVNoeLdQ8cpPzX5yhzw/cGMZQ=;
        b=fo4IkXmrYghMn0L4F3bOOE295e0plbHP7amEgDt1jNwE4ZNoBFlvRwcSrr8BOBmsjg
         PgkWTt9jSUNYWCe0ICj2vVXumUbTcjLYN591lhe5OwSPaMz8qeduLZNbJ2nLElBhTWVR
         yMwK3SReU4AacWanZQORFr2D/cjcRFKtTYJdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=frkrHuC8yePy27v23SNVNoeLdQ8cpPzX5yhzw/cGMZQ=;
        b=mWIul7b6phIWud8CBlKPrdG1zsSqL02zirt/442yR/M6DwKqAENn0DNAEslhk5GGY8
         9h4lsIE++TcHuTuoJ/oECq3UUzQ2y2H7u6J6CEQYSUH7O5VHEUvJCn1MmplJbi85w0x8
         dNem6UALmmpHUY25c/5KDHn32TIVBCPYNdPxbAPtvVSQvv0RsTPwRtdf7/S5Zb92wxcK
         BKMH0rgz61sRZKGWxCqSyOyvxsHaOBxG8K/BvCeSVFeXLScehzgTu8ALJb6eW1SF10Uw
         grMxXfRqIUHmXZx5l2wqeuzw7il6w8gWzkdJID9uxBXZKCEg8i7kyhyXM+Ea6CRZDO4b
         M7Bw==
X-Gm-Message-State: AOAM531+qrzxY5v1ApwMD8KrtjTtekuYAb8VaFMXzZKH8p9DlTTgqEl/
	RbOGCWl/bDPLdeT+gGkMBkRhjQ==
X-Google-Smtp-Source: ABdhPJyNPrY4UiqpKe6cTeyg9+ceFFhcbZI4rxKnCnvNljfM3hmXaGsgmuMRKOmBU2pUZOsUT8BkoQ==
X-Received: by 2002:adf:c00b:: with SMTP id z11mr14481070wre.320.1603031226021;
        Sun, 18 Oct 2020 07:27:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7d78:e5d6:b970:ac7f])
        by smtp.gmail.com with ESMTPSA id q5sm14686876wrs.54.2020.10.18.07.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 07:27:05 -0700 (PDT)
Message-ID: <ce3f803cce21cd9ca80c4701c3ede32a8c2ee10c.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 7/8] qemu: add 34Kf-64tlb fictitious cpu type
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 18 Oct 2020 15:27:03 +0100
In-Reply-To: <464f9f50bce368fb5109a5d7cc06cc25b0bfbe6a.1602771116.git.steve@sakoman.com>
References: <cover.1602771116.git.steve@sakoman.com>
	 <464f9f50bce368fb5109a5d7cc06cc25b0bfbe6a.1602771116.git.steve@sakoman.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-15 at 04:15 -1000, Steve Sakoman wrote:
> From: Victor Kamensky <kamensky@cisco.com>
> 
> In Yocto Project PR 13992 it was reported that qemumips
> in autobuilder runs almost twice slower then qemumips64 and
> some times hit time out.
> 
> Upon investigations of qemu-system with perf, gdb, and
> SystemTap and comparing qemumips and qemumips64 machines
> behavior it was noticed that qemu soft mmu code behaves
> quite different and in case if qemumips tlbwr instruction
> called 16 times more oftern. It happens that in qemumips64
> case qemu runs with cpu type that contains 64 TLB, but in case
> of qemumips qemu runs with cpu type that contains only
> 16 TLBs.
> 
> The idea of proposed qemu patch is to introduce fictitious
> 34Kf-64tlb cpu type that defined exactly as 34Kf but has
> 64 TLBs, instead of original 16 TLBs.
> 
> Testing of core-image-full-cmdline:do_testimage with
> 34Kf-64tlb shows 40% or so test execution real time
> improvement.
> 
> Note for future porters of the patch: easiest way to update
> the patch and be in sync with 34Kf definition is to copy
> 34Kf machine definition and apply the following changes to
> it (just change 15 to 63 of CP0C1_MMU bits value)

There is discussion upstream about just changing the tlb to 64 for this
machine. I'd suggest we hold off this for dunfell until its resolved
there.

Cheers,

Richard

