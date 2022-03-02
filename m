Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9597C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 11:19:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.6184.1646219947621346589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 03:19:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=INvdQjEi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id y5so938341wmi.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 03:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=21GVFRQckzXEDsM/8Qr76nUDPxXZZILXpPEPJk0RDGU=;
        b=INvdQjEiDD9WAFQb6y7xPOY67vrHhr45cwZ9TR8UTsdrOo2V26Ohlr6sUtznP7FExh
         HrH33d9IvskTKI8Z27uHRaXc4Y/Rw/sY550IIIaSyA/F1fnqoLTICc53rdw05KTkwVjm
         UclUOg+SUNKkzwZ4hrypOnkt8crXHYJc34gp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=21GVFRQckzXEDsM/8Qr76nUDPxXZZILXpPEPJk0RDGU=;
        b=2A47+xidZ1TMS6dM2CDlIKgIHYAqtNpTlJv0oQVB2/mCXffPHpwMEgjnrIlwU4jy95
         +/DU28td/0nzPcoJg4OokN7ur66JNJm0KQV6gm9HGRG4TedqB9stlj+V1Wu90gXBTgdj
         tapyziiZCaSoZtN5SzPEIIbfQ4iHetfW5gjF2xGH2iSGYeExgBLLBw/ta/whYZg2mr+1
         3Lhx4AdDRsVEsoFvJ2SC1dWHgOg2QSIEaxNtRRjYcyHSLtnIujyDrJ1YtuChsI8AZAHz
         AuE36L6/H4u08CWDBT1r9p2HrgMOi+2cuQLgLnQyJsvxdG0OoPMvS+DVDswpqCXaO66Q
         SiEw==
X-Gm-Message-State: AOAM532NKO8+hVKhnlJUynWfrO7jASj4dvEVWgspSVUM1NDn4FrwCDhh
	Zk7uDYCxcnQZlqkef1QB7rwsBA==
X-Google-Smtp-Source: 
 ABdhPJxO8GoD7JTAwrZTtNnQJPhkkeFOo/RTni3qQvmIUdexWi2qV8uIdj44D/EW/W/gS1Lt3AjIrg==
X-Received: by 2002:a7b:cb46:0:b0:37b:dd79:e1c4 with SMTP id
 v6-20020a7bcb46000000b0037bdd79e1c4mr20020144wmj.39.1646219946156;
        Wed, 02 Mar 2022 03:19:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8c1b:f0a1:b483:4e17?
 ([2001:8b0:aba:5f3c:8c1b:f0a1:b483:4e17])
        by smtp.gmail.com with ESMTPSA id
 206-20020a1c02d7000000b003852fb7556asm1467376wmc.23.2022.03.02.03.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 03:19:05 -0800 (PST)
Message-ID: 
 <3dca214fdb27c82ee19120e4ace9d7649cb4dd4d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] sstate: do not add TARGET_ARCH to pkgarch
 for cross recipes.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "Lee, Chee Yang"
	 <chee.yang.lee@intel.com>, Ross Burton <ross@burtonini.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>
Date: Wed, 02 Mar 2022 11:19:04 +0000
In-Reply-To: 
 <CANNYZj8BAD1kmETB_UfEY=420wGuttUzAuNYFF+s8XG0cA9QDg@mail.gmail.com>
References: <20220226150217.2793953-1-alex@linutronix.de>
	 <DM5PR1101MB2361B9D94AC7EB2CD305BB79B9039@DM5PR1101MB2361.namprd11.prod.outlook.com>
	 <CANNYZj8BAD1kmETB_UfEY=420wGuttUzAuNYFF+s8XG0cA9QDg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 11:19:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162605

On Wed, 2022-03-02 at 09:49 +0100, Alexander Kanavin wrote:
> I just ran this locally, and it passed - probably caused by a different commit?

I suspect Ross has a change which may be to blame...

Cheers,

Richard


