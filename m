Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F73C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 22:23:11 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.100.1742336556261213934
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 15:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bjESLEm8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394036c0efso26404685e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742336555; x=1742941355; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdnloHgXRlfy40uChpDO060KnKixIavUwG68BpKr8Jo=;
        b=bjESLEm8v/r8UHhhsRuDeYce9+kcaPcXXu/N911wjQQoBJKeOA7e9oYjRayMiGCUkO
         ctfeXyN/b0t6eTMp6CkEPz0HeEzWiyGhxGZm1y0symvzhNYCElEisPXkmn2TeBq64dZc
         25en43KAltaVZeAuMN79s4K/jQybKtsM68Ufs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742336555; x=1742941355;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LdnloHgXRlfy40uChpDO060KnKixIavUwG68BpKr8Jo=;
        b=FWp2SblFIVnECEuvSDu0UZ/2EIs8uMZMcexXrCkjcLesFt8osYhyQ8zns7LNv2QhxY
         OWDUB8uxMHr6fVGNumDwVSvgzcEUJPtlD8dRBPvu9r9iQ34aKpnl7Jp6FVy+iEhhW9DL
         tVjM69/TAl6zEWFr0LFIZNnDfMwZ71QvDU2j6QPlFwOfbeiJQzoW4QPS9AQOYGSY6tXN
         qPmr95bF6cAEZ96PCXOpQia1N88FZWFMJm+Jgb1on8jMMLYefSU1MSExPmstTQ5JbxYy
         /WVgctoWaHsYStahAczZnYgSe9BNNQG+xKvJTRlh+55iDWGDZN/TuBx6sqoyAZBicKzF
         Bedw==
X-Forwarded-Encrypted: i=1; AJvYcCWykzfjTm/RFy7xfS+KcYClibRcOP26D6fA8Ctd42NhpeemdCGascZTeN2Fm2eseKeriNJgnlKBnlDqxlPyzc8byA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxJrQzUsU880h48NMjx9SS+g3sddYmFF9sLKewZ5z8K3Owvbo7u
	kbRuXRnYPIECI0niWgCh82/MDYgnTAMyfrjyhKL82JKZv+IABPG13/bz1hhlwe0=
X-Gm-Gg: ASbGncuOCj3Q2Ux3C2JB/+qnf7I6SXRNOzrJdcJQE9LDTPyUt9XApHuVNtg2+cxazzV
	kUuXlurJvVF5h9T7uhTEJsCeObljLqDU6DjWULmBeRPjtULPqP1mCI5kIWJUBt5uiB+7RY+6SYA
	WbvjeCSqEwP0327pp/7M15Y1WQXf9e8Q+OvXAZliEr7qy6BXBpKWVuA5m5orarqbtfXHRzQze/H
	Kgb9guNX4vnkNedDS+C2kSJ2gWpK7ydKxHwU11+jim/iKbBVXrHaXHU9doKkJ1LY1I7SzmlLzaV
	z+6JkgNtzXYOxFxDL0AWdR2YsIFPvU7W27uo/f2hCRK24kbt6n+xjIkoyWytdn139o1KJugkV82
	HVbYD/3vV3N0E+jMOCN7LYRT4DTAgwxey9g==
X-Google-Smtp-Source: AGHT+IH01m79du7bEKrRiHn3Wgz2kdX6gX/6+5e/euFk1RJPnntEhwqMEyfOjN13VZfBZ08MnnV0Hw==
X-Received: by 2002:a05:600c:5391:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-43d437c3360mr2075475e9.14.1742336554623;
        Tue, 18 Mar 2025 15:22:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:686c:8c32:99b8:c349? ([2001:8b0:aba:5f3c:686c:8c32:99b8:c349])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39971b56299sm1351870f8f.98.2025.03.18.15.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 15:22:33 -0700 (PDT)
Message-ID: <83c9c92162d9c0bc1387c633f1464e67f57c70bc.camel@linuxfoundation.org>
Subject: Re: [OE-core] Issue: /var/tmp does not persist due to /var/volatile
 being tmpfs in fstab #scarthgap
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: vs.yocto@outlook.com, openembedded-core@lists.openembedded.org
Date: Tue, 18 Mar 2025 22:22:32 +0000
In-Reply-To: <2962.1742314292470649522@lists.openembedded.org>
References: 
	<PH0PR11MB561183431E26C593148B543AEDDE2@PH0PR11MB5611.namprd11.prod.outlook.com>
	 <2962.1742314292470649522@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 22:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213258

On Tue, 2025-03-18 at 09:11 -0700, Vish via lists.openembedded.org wrote:
> Thank you for the reply.=C2=A0
> =C2=A0
> In Scarthgap LTS implementation is different, but I got the idea.=C2=A0
> https://git.yoctoproject.org/poky/tree/meta/conf/bitbake.conf?h=3Dscarthg=
ap#n387
> =C2=A0
> I believe default behavior should be same as before to persist
> /var/temp over reboot and these changes should only be required for
> any customization. Also somewhat difficult for us to upgrade CI/CD
> with this config.=C2=A0
> =C2=A0
> Can we know the reasons for original changes here?
> https://git.yoctoproject.org/poky/commit/meta/recipes-core/systemd/system=
d/00-create-volatile.conf?h=3Dscarthgap&id=3D3cc8c3520cedb66500757f843f7576=
46da69ab30
> =C2=A0
> I reviewed commit message but not giving much details. Considering
> default base-files and as persistence is required, this newer
> approach seems be an issue.=C2=A0
> =C2=A0
> We recently migrated to Scarthgap and noticed the issues with our
> system. This can be issue for other developers as well whoever is
> planning to migrate to Scarthgap and embedded devices in the field.
> This commit requires all build systems to adopt changes bitbake.conf
> which is not preferable .=C2=A0=C2=A0
> =C2=A0
> What is the usecases targeted with the changes? I believe the commit
> should be reviewed again and potentially reverted considering default
> behavior with base-files and 00-create-volatile.conf.

scarthgap has been released for a while now so making a change like
this well into the stable release cycle would be a problem in its own
right. I therefore don't think this can be reverted now regardless of
whether it should have happened or not.

Cheers,

Richard

