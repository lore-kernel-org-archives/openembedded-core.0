Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B252BEA4FBB
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 13:10:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34709.1771852214098020874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 05:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=noru0r36;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso36828655e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 05:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771852212; x=1772457012; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Efg5OmAUXVpW1Ma5OprAEk5UTtQgI0QPcJuSIeCvPns=;
        b=noru0r36nyD88C3fNij4TP0yt0IvSYmTXwZ29i8aEAIp4mHvTm1oQj2D9l7zM8zmLr
         QnXyRvWT6t+11KSLpdm72tuLNBlXUwPlNshfjGFQOqB4aon4Y56bQcGzJP7EWzPhAPxg
         VGkDeJp2Dq4RyI/Cm5SBMomgU3P/BahS/7UFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771852212; x=1772457012;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Efg5OmAUXVpW1Ma5OprAEk5UTtQgI0QPcJuSIeCvPns=;
        b=WA6AXaaQgkH1RQTph1tDN/CDKeEFx7Y/Us4u4Y4XIsITjb5UOkTx0RnzZppHo72nSH
         hoNrSl0UU/EmZbJE1ij8NK78DQzJzY8AIqqhzwRrLzkRm5mMp9ATUzIh1vPsK9eXgDfU
         MerysAFUA6o3y3wpA0bgd/eygOp+RyXoG/2z8lC55lXXj7byL7wLO0UfVkGb8wmXHeyP
         AV4KkC6fWS1/B1POXJz2dUIifXZEP2ITi+X2CaVBKtet3akfyq0Ftr4y2wQmEI/mAL2d
         /gbEypl8jr2gB+N8iWHCy+ETcWW6JgWHguhZ/a80ph3rGdztO01nd9dQBO5LLrS68m09
         M/zw==
X-Forwarded-Encrypted: i=1; AJvYcCVu4/dXLgGt4JO8ZPaYcF7nlw3ovl5P6Ay9G3Ro0bRRbc0mwKLd20bL6b1YpR4SPg++MM/p9aL2WXHGddV7TR6i4g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwvsE25xI1ph9FZzJiE5cEFw7i/LKHLnSRsyb51cJ1HZEmgoe7K
	TKjv6mgEp1jt5U6m7xvzPb/ZfORdOrkhS7DTY2pbPuvlCJXC0KLJxe2Y9JBuBKE2jKbY/lupmI8
	F4Umu
X-Gm-Gg: AZuq6aJehFLbUUvjtEYO3fbwG6OU4S2pUgBtsVEhn4qvQxxzXAxprJKgRIjQMjZzWiN
	GwRVsNGcRCRunkR2SjpSJcD6aONxGQwXn1GT3YMejjjDft4aboARB27Jkdmc04fLDDl2JvctqkL
	8q9IyXZb/aEACB40YngyKPys+CR3JbPi5DCSyHyioDTdkIYJLw1U4dL5RzvaqADXoyUIt0QQfgR
	AG4SBJXNv4vtsJ+hdzbTbd9LFYLZo9QwzUwoAMTO1z/S91LbvcGleq79ieDp2BtHZq+6vgJmRV2
	EeJPZgT++04yQENCzbnXwtlDqUXfkwCbTGdE3UVxsZK8S7DExsbkXFnGNDu4MMuaXKqZUkM7hPe
	tOhrX8EjCGhhIDxQ4+SmggULDelGjzZZRxg+31xOA6pABbHZ2Dd+WYFEgrcWGkeKdbLW7XtUVC6
	iyw0lEM4iPe7lCkEi1+NinifqoG0LKO/iCB9utXLA1+mTitSEc7dPkzlTAtDJ3em5LnQt+rzJdu
	TThbwF81jagUS2r
X-Received: by 2002:a05:600c:1e09:b0:480:25ae:9993 with SMTP id 5b1f17b1804b1-483a962e3c9mr155116665e9.20.1771852212388;
        Mon, 23 Feb 2026 05:10:12 -0800 (PST)
Received: from localhost (2a01cb001331aa00f13df544104db802.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:f13d:f544:104d:b802])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9b75e51sm195607785e9.5.2026.02.23.05.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 05:10:11 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 14:10:11 +0100
Message-Id: <DGMD6SUVHNRS.2JJWU6J3X1104@smile.fr>
Subject: Re: [OE-core] [kirkstone][PATCHv2] libpam: fix CVE-2024-10963
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260213115407.146405-1-hprajapati@mvista.com>
 <86104.1771820677772300606@lists.openembedded.org>
In-Reply-To: <86104.1771820677772300606@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 13:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231668

On Mon Feb 23, 2026 at 5:24 AM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Hi ,
> Any update ?

Thanks for the patch. But the commit message needs improvement: Please
add a justification as to why you think this particular patch fixes this
CVE: Cited in the NVD report? upstream? another source?

This remark is valid for all your CVE patches: If you still have pending
patches with this format, please send updated version with added data in
the commit message.

I'm sorry I took this much time to get to your kirkstone patches but, on
the other hand, a properly justified commit message is really quicker to
review.

Regards,
--=20
Yoann Congal
Smile ECS


