Return-Path: <yocto@nkent.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23352CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 11:22:08 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17209.1781781722690056613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 04:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@otiv.ai header.s=google header.b=OPmkO+uk;
 spf=pass (domain: otiv.ai, ip: 209.85.128.49, mailfrom: nathan@otiv.ai)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so5302245e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 04:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=otiv.ai; s=google; t=1781781721; x=1782386521; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pz6BHlMMBFiR7yveho5pXCAkAF+2n/e2yt202PVGta8=;
        b=OPmkO+uk3aZyHg17z+yBV40CA8kEH72jayzS58RXKD+3EOVGumSiAdlx/AIuVSPk7z
         dEMtwn5GmxFG6TJxGMXryeT82MueBI7L0y2j2RpH2hUDdkLNapMi2RMepT10FlmJ96Z8
         JgAsff3kZ9zptqd/QBr+/VZtC4VUK6Y5GLy/sQ9ic78f/7VCgKspvTGYb5FrZZmPxTjA
         WO5hIr7bAwWO2RuhgSU6vyabIGDCt+uJNsGksZ6tLPiv4G2XQYAzjDAFamDOJOngPymw
         E97UJhpRpml7NnSqx/o5A9EY2dZ9Z83Cf6nqxaBVNPc5VxHF6rydy3P2ms6ZSa91fyYE
         FKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781721; x=1782386521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pz6BHlMMBFiR7yveho5pXCAkAF+2n/e2yt202PVGta8=;
        b=TLE7v9dcemO/vWu9LrKScceFezvVakLbia1eu/b+dOIazgwHJsZKCpBmt66RK7Gl0/
         9w5+1Xq8NYJ07KjI0KGUK/zwso0so2D5gD9977DUCvZXdqNvZJTc684heQu4qOJQOF+O
         wr78XsO4nX9S6vPwlD5Aot8MJRl3M1qGI1FKxDauaGBwoSakgL5G+vtoX5XLjywRY3f/
         dI2jr+s2xbD1cNJodOb/X+JdZAUXyphEsNmNYNzdzwK5P/ItcqQTA+x8cakRfDpcaoNL
         cFrBEhMCAzevubqhbj3buVrVTkV+Hk3YfjmFAiSAQkWL83kWAOFsyvdZER/Y7YxqqKoR
         XbSw==
X-Gm-Message-State: AOJu0YyAli8F2kqNhMEnPzKtxsjfWALKCITEivDIOnQQaN6gGtH2iSAv
	2zvg2PvrBRMN6tqQqwTAWkO458/2MrVwvHKUCo2pYSQ85e8JNIoyXZoXNGP+nxxo0qk=
X-Gm-Gg: AfdE7cmJNN8ltVNjXov7wIUpEFIm++tMiuAhLR6f+Haa8hsC/TF2yT/YQ5tOaY+He0q
	Z5GHl59YTduBaepzEFO0hTAq2dm91PVJmEW/JxxMI5bxaAWgRMtFnWMIOcGu+OjV2ky2KM1HEU/
	4d5uWvgSBHc+nTzIaRoOcqWhtLUY2XHN0mcw6oAO3gfs8t2Q02mZMjqxrdjyksFKT6YgZgM7hPN
	l6EYFBavG9WLImP4tVaLMGwjzoMHJ7nIMPaClzpKhGLPMFqilPudqVMtHeRb5WZ3C6yoxP+J+s9
	fytgSPF98ZnFbhsksW+YLCU//rDuKjlA1WAMX3+3ZoHg+MpQqnv1unJSCOxNrh1IH/SvY+y3qvU
	iq/+g7A5HSwqyCvI5rR1CwXLznclXoy7cpalTTWl7AhsJ8UAM7sc8x5FlACHno9GlHLo5nRQAH/
	prGKHg01gM+zziLuoVZ2gCZ68AKmwXLBbFFoXJHx0GhQdvK4u/d5zEukXFryASTGzjrnoZn4+Ar
	9/K3g==
X-Received: by 2002:a05:600c:4f84:b0:490:d354:bd0a with SMTP id 5b1f17b1804b1-4923822a867mr54014425e9.31.1781781720826;
        Thu, 18 Jun 2026 04:22:00 -0700 (PDT)
Received: from localhost (2a02-1811-e507-d800-de56-e30c-805-27e7.ip6.access.telenet.be. [2a02:1811:e507:d800:de56:e30c:805:27e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a9b45bsm206056135e9.15.2026.06.18.04.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:22:00 -0700 (PDT)
Date: Thu, 18 Jun 2026 13:21:57 +0200
From: Nate Kent <nathan@otiv.ai>
To: Siva Balasubramanian <sivakumar.bs@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Update sed usage by 'pam-wheel' for sudoers
Message-ID: <uzyyorseo2zcjbxjk4yi4h6kxcienx4tdo3funkrnpw6k5lwv7@aimmwwbtvknn>
References: <20260618102839.363123-1-nathan@otiv.ai>
 <20260618111458.3490459-1-sivakumar.bs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618111458.3490459-1-sivakumar.bs@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 11:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239077

On Thu, Jun 18, 2026 at 04:44:58PM +0530, Siva Balasubramanian wrote:
> The code change here is identical to one I independently posted:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20260618110111.3484982-1-sivakumar.bs@gmail.com/
> 
> One note: patchtest flagged the shortlog (it should be prefixed
> "sudo: ..."), and the bug reference is best written as "[YOCTO #16321]"
> so it auto-links. A v2 would be needed for those. Happy for either
> patch to land.

I am also happy for either patch to land - I just want it working. That being
said, if it's all the same to you I'd like to use this as a learning
opportunity so I am better prepared for the next patch I submit.

Assuming you're fine with me fixing this: is the proper course of action to
fix the patch and then repeat the `git send-email` I originally did or should
it be a reply to this thread with the fixed patch?

- Nate

