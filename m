Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9002DCFC27D
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 13:39:46 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11593.1763732382978951606
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 05:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Kv2wi4ZT;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37a3a4d3d53so16136901fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 05:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763732381; x=1764337181; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=faIrelrQoEIe2t8V5NxPXa/Yx+f7VpVx+7v8rnk2gfk=;
        b=Kv2wi4ZTnGvWjye5pBoVx0Ek33DvCJvXHlt7YTRKLpvYbZTUm/Mej1zU6i36+Zq6jY
         vNCiXc+L2d4LTst9hHuu9kuVwvXF7chFgvL5Qow7/BeR0JgERBawmqDsIozpU737aUmV
         vHy8+LIDf5IeNYYhn0E3hBK8Jhg+WmlqJJGnIyMangq0Rq4iFmWsvNtOOMFP2pN+1mu2
         XxqWHfaP0yHebgsLecPztGPUi7JuMk3y4tTSSjPmE6AVMAFraEUxNYAbSLf6E0SwW2XE
         tOqcz9eQ14ZlwUGYAp3j+ku09sQV19CvL1pxX8L/dkS3CYHgkPIzM9pk1bVMSjsTwiCn
         6i1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732381; x=1764337181;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=faIrelrQoEIe2t8V5NxPXa/Yx+f7VpVx+7v8rnk2gfk=;
        b=Dnx+UDPXzR4R5LPdPO/XxmxWuKNLZlx0AwtbgE8sxzl8cSg6YvJbxbvXJQFLgLtm5X
         Bw3ggKrn0ouS/yl1v7upRvsEtMmw+N4WcRSiH7gcbwy3lY8FV+9yZJetqbZvmMdBGZMD
         /o+fN+LTUoKZbeywyJUDWxPh1FsgZCcLM+XqioioygpW4NkX1mnJLNNUfdbIrV+QNDdb
         /+EF5W1lM7bCl5Qd75KC8OE/csRJjHy2T7rQVBJgJF3hxNheVhKPbPQmaoPys5aTub7N
         T5CJBpd5nwsOdSfZFvvB9rGQNvqTbVW3RV9cy1eg50ztSkfjg65451s8ZgyG+bbK03Zb
         euPw==
X-Gm-Message-State: AOJu0Yz93wQfQAiVUB/Q/9/sw415ajbx70rXhhz57YnDrl3DLjtP3GSa
	PAEoO/RXRx7y16lM4p7gtCxKxfFsTTElN21gdlCEIY7C/upmb1ZjNjV5Au2YZOeFp5M=
X-Gm-Gg: ASbGncu425PYrL/8xh5AJvapp9oWXa5SpwFWw95L+T0TihzQzuegUlsfm4C+24lfdsm
	plqprV0iAtDM/bYYNwPhwLBXA4XC7aZT8iaNFqgEvzdcCBNahzNQN7//T5boZwIXS4BboeKj0wd
	rFzR8b8n3BRQjxeOxFN74wwLmW3JiZGxLJ5O0rOVp1Imq2xvnxGWXXsBdYlnysYzAEj5rn7e8kC
	uvQRdzYwElGwWTZemvVmvp+8ihfndt3HhwIiXS2+9qZGP2VX0PbOwNy9qYj2szXtVoyTcMvu+Al
	pVsnQiv35g2NfExDaKLeV/Lfuqxff7/0JSqsk40b9+STyimNcLjzgh+F0AwhcS4aj58/+3ql5vZ
	appZ/XKzL5Nk20ziK9QwaqbbCpqH1t2/SLG+HZO5wjOiOX+DU6W4f+RoXUWx8PHR2eDidIMLHfs
	RJPkwJPRinTxjyDvGxg7sI38WcIR0f6ovB69+JLvPCrtHr2teLZtCBNbM=
X-Google-Smtp-Source: AGHT+IF2ITT27oehxNeOiIRgeeHe2gcAkyoWgleMnpHevKW6XElpCnX4nGx2QShXoQtOqW4+UVOE0g==
X-Received: by 2002:a05:651c:23db:10b0:378:e3f9:2d26 with SMTP id 38308e7fff4ca-37cd92efd86mr5559371fa.39.1763732380977;
        Fri, 21 Nov 2025 05:39:40 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b59cafsm11421541fa.13.2025.11.21.05.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:39:40 -0800 (PST)
Date: Fri, 21 Nov 2025 15:39:39 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oeqa httpserver.py: fallback for
 multiprocessing import without bitbake
Message-ID: <aSBrm8wURTS-3e55@nuoska>
References: <20251121105951.1158626-1-mikko.rapeli@linaro.org>
 <c3d49e5931af8e746ed25587fdd9b180497dc343.camel@linuxfoundation.org>
 <aSBpgnKI2iXwD78B@nuoska>
 <4abba13482d2a5b933d34a0eb49edf693e0d7da3.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4abba13482d2a5b933d34a0eb49edf693e0d7da3.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 13:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226686

Hi,

On Fri, Nov 21, 2025 at 01:34:44PM +0000, Richard Purdie wrote:
> On Fri, 2025-11-21 at 15:30 +0200, Mikko Rapeli wrote:
> > Hi,
> > 
> > On Fri, Nov 21, 2025 at 01:27:56PM +0000, Richard Purdie wrote:
> > > On Fri, 2025-11-21 at 12:59 +0200, Mikko Rapeli via
> > > lists.openembedded.org wrote:
> > > > When testexport.bbclass is used, then build environment and
> > > > bitbake
> > > > may not be available when oeqa tests run.
> > > > 
> > > > Fixes oeqa test execution:
> > > > 
> > > > https://ledge.validation.linaro.org/scheduler/job/123974
> > > > 
> > > > ImportError: Failed to import test module: apt
> > > > Traceback (most recent call last):
> > > > � File "/usr/lib/python3.13/unittest/loader.py", line 396, in
> > > > _find_test_path
> > > > ��� module = self._get_module_from_name(name)
> > > > � File "/usr/lib/python3.13/unittest/loader.py", line 339, in
> > > > _get_module_from_name
> > > > ��� __import__(name)
> > > > ��� ~~~~~~~~~~^^^^^^
> > > > � File "/lava-downloads/core-image-
> > > > sato/meta/lib/oeqa/runtime/cases/apt.py", line 8, in <module>
> > > > ��� from oeqa.utils.httpserver import HTTPService
> > > > � File "/lava-downloads/core-image-
> > > > sato/meta/lib/oeqa/utils/httpserver.py", line 9, in <module>
> > > > ��� from bb import multiprocessing
> > > > ModuleNotFoundError: No module named 'bb'
> > > 
> > > Breaks with python 3.14.
> > 
> > Understood but this would fix current test setups which still have
> > python 3.13.
> 
> Where should we document that testexport only works if you have 3.13 or
> lower and not with 3.14? Who is going to maintain these requirements?
> This "not needing bb" requirement isn't really working well.
> 
> I'd rather require lib/bb be present and included in the exported test
> data for example.

I agree this is the long term fix. If you don't want a "quick fix to unblock
testing" then I need to look into that. I was hoping to keep changes to
master branch minimal until release done.

Cheers,

-Mikko

