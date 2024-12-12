Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BC5E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:41:21 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.21073.1734014477015766904
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:41:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DwaBMW+w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434ab114753so4829545e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734014475; x=1734619275; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p5/e+Iir0zS45pzQi4dLlkRrSEXIvh35LuJ7TM/aIIo=;
        b=DwaBMW+w4HlJ9vIvJ686rA22+oZKwofFpZ0HmxFcrsQxFFvVNZ5f2sc7gNuxhcxLst
         5z3H4p6CPW3WYVii1RsJOzvlogwhq99gatvcgL81fZdZW28YvNY+oIVMOSHI4lNrELwm
         2YC/0OOkTbsCyzRMC7AihoNTOxrBsEh+RwleU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734014475; x=1734619275;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5/e+Iir0zS45pzQi4dLlkRrSEXIvh35LuJ7TM/aIIo=;
        b=EKK7gBwR5zBwl7oO4hH2/FTQOf1vcX6ocWRAZoF1VnQKy+tL7GEORWo7uymZxm0QdB
         RmWLa29Ad/5OXd2mspNRM0iEjEpOlaAGm2T3SOEonsIaspOwExpSXb3NUL5+1buVXFIG
         v8JYhYW3cF7IvbMNF/+JHew9kJMrxfafJvGczQTnSPHCDTHFcFNxVpM2EUxbGCWrU7cx
         DmXawq4nFRNlX0yBKvVtW/kxSmlnKG5aUImaeZm8tG+IZkS88WW5M5k/KHBq9TUGZFaI
         xkJX73lKgg9noLCi9FJvD0TG6rinz+bYideguvF8G4MnnZjftewpR1RbdnJWjYoSzR4f
         PJ2A==
X-Gm-Message-State: AOJu0YxAC9Q/vh5Y44PSlvPrbtVb/wDrA3J1kiL2/kuKqSMBgr1n8h62
	6Oln2AJ8VM9B0q7x5qEOfyyF1hl1EW2ZUivr2P93GdxwB8eJtQ1rdSbNrN+++88sqo5FaKadaMA
	k
X-Gm-Gg: ASbGnct42PctrooY6+zlAXAguqIZGZfCyJ37HqzclxcncMBvrJDablApslcc80al+Lh
	ysKH4BLlYUeq1Mpclc/EulQdJKHmzokvApsVDT6CnpnCxyFnEbq3To7rYdZUzfXz6/TNvHViqpM
	0i/BP3DsuM+ahlBkzbzCrRiWqI/fTsgktKM8sbFnDTjosyvFS2rf3+71Mp3MRft7/BCd+hpXUxO
	LHYC8neskuxX5oxNgzqa6Sb7DkHJL/aVBDmMr3/zC3ybLUX0TU9l2jsaYuz5sDD/UMZbkAs2j6u
	gMJTW8OHJ/oup8zCPoKd0LezL88NnoCnxrc+76maiQJhYA==
X-Google-Smtp-Source: AGHT+IGLzHPHzBA6sHUtdPA8LYtUscFTRP6ShM6y0pUq3SmgfT0UWIj31Lf5qGAa8gUl7PrEXuMiKg==
X-Received: by 2002:a05:600c:1c16:b0:434:a315:19c with SMTP id 5b1f17b1804b1-4361c3445a8mr63859485e9.3.1734014474825;
        Thu, 12 Dec 2024 06:41:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f82d:b861:da6a:fb38? ([2001:8b0:aba:5f3c:f82d:b861:da6a:fb38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559edc3sm18754885e9.22.2024.12.12.06.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:41:14 -0800 (PST)
Message-ID: <d3df2bbe890a456a7d967d27ad0821067fa492ee.camel@linuxfoundation.org>
Subject: cve sqlite database 'malformed' issues are back
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Steve Sakoman <steve@sakoman.com>, Marta Rybczynska
	 <marta.rybczynska@syslinbit.com>, Ross Burton <ross.burton@arm.com>
Date: Thu, 12 Dec 2024 14:41:13 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:41:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208651

Unfortunately the malformed sqlite database issues are back. We had
hoped that moving off NFS would solve this but as we've backported the
changes, things have started to break again:

https://valkyrie.yoctoproject.org/#/builders/76/builds/594/steps/14/logs/st=
dio

This means we've ruled out a lot of things. It is interesting it is
only starting to happen as we ramped up the older LTS releases.

At this point I'm starting to suspect the older versions of sqlite in
the LTS are somehow not compatible with the newer versions of sqlite in
master :(.

This may be another sign we need to switch to something json based in
DL_DIR.

Cheers,

Richard





