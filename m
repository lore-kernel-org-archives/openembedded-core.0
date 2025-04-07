Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7091FC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 17:01:42 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.53290.1744045291273554657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 10:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NnrvRYAI;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so54689376d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 10:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744045290; x=1744650090; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zflOB6X3sxIEuELvJAU9cGkHx5ZxVi8fm+1Rgnvnotk=;
        b=NnrvRYAIHND52ajum+Ix7iTA+gpszvnLqK/zt2nDcPVOTUHE8P2ON+MFsr0uzSQ28Q
         JlZSPgvv3MSyxFkmxW1V48jQ2I7FHTArS1IRxeNnjrQYVsTX3YXNjp13OYOVzk8qflCX
         lHv4p/er2eOCyDw4FifBoCOG/0efWtMt7K697R2kT/wv8qoHGYyLFZHHcpZ5LsOuCiYQ
         wAe+X+hUbIrik1XA0J4SIcI24JR2jTv1aTWXWqzKsvjIRqQHaepujgX+TLRq6fLA6fyG
         smyQtK05VdvPRkRp0YpcbMCKBdNW8j6KHTK/D07YQ9rpredIbhCWsqPt0k/w0GaYqCDQ
         l51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744045290; x=1744650090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zflOB6X3sxIEuELvJAU9cGkHx5ZxVi8fm+1Rgnvnotk=;
        b=kdgp0x+tLMpWWLCO3Zf0UYkOBLQqnrQSi0hnTK9SIcv9z9K80gQ6Ha0mEQ/gQszuBD
         qSgFnKs/JVSXZ9B1Dqz3/5VDbhS1b7H84l7m23hjYd982gWRDOZmOapfypqjhQXSlwXS
         h9DCka9s+46zo1huwb00Z/8P5sGPfdRO8DgJQFutoSRntx3IC+mtICKeqCsRKiA7TglM
         Pf316zWHGsL6giY+VzJmdJ+qjg4vOEaKJ8ruaRRSwTB76EhRTpI9hgyZ9c2zZCncYW7k
         SvaxSU8WMdUH1cYjCbwX7YjAspiFGkX6h8WBIms6NkA2/QC9YCYQAmx2VJCgVH/xgUHB
         U6AQ==
X-Gm-Message-State: AOJu0Yxp05NszQPr8k8+wJA2QDPUs2dk/OYyoI7YbonsCJHoYxVFlCgP
	zUHo0lfzFnK2GMbpkzX1JYDrS/11AVYJ2ZpkwrctWNIYW4fe9GNJiJTCoBOb/PZELq1VGrmteC+
	3PDUlZGQC2vLncQ3YxBhMERuQAmXblA==
X-Gm-Gg: ASbGncvBdjTtJ6a4TXkFBbFL+r24Aj6nlUmZaVRsajBDb9Kai22j9jN2DFVT/j8nw1Q
	9y+38wbJCiNye4CcwN3yMsWAb7EMKlhej22qxEpmqGKSpaaOrmRzvpBa89rFvRpGBdPu0iWusNu
	0YJ7+LD+iVW3hpQXXEKxriWU9u9kOgFa5fYW6pnYA9+vFQOD1RE71JK43Fv2bZ
X-Google-Smtp-Source: AGHT+IG+WOxgyhQ5Z1Uh3pqh3xOKblMgIPyulA1KdEasx5VH30M8Kyzu9dMtFrHR8WUTNJ78mY5wQigvFx4EL57Pw04=
X-Received: by 2002:a05:6214:d6e:b0:6e8:f120:80ce with SMTP id
 6a1803df08f44-6f0d256b491mr3293346d6.22.1744045290236; Mon, 07 Apr 2025
 10:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250404084324.3024896-1-samuli.piippo@qt.io>
In-Reply-To: <20250404084324.3024896-1-samuli.piippo@qt.io>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Apr 2025 19:01:18 +0200
X-Gm-Features: ATxdqUEls6OX7-0KJF-7Pe_2d06SFCNK27lxVxS66RDiyzYFw6Hqfa3QY24DYIY
Message-ID: <CANNYZj_vroEwnqmrect-uL0QDRjAFStkmdijZ2codxz1XUVxLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libjpeg-turbo: don't use chrpath on mingw32 builds
To: samuli.piippo@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 17:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214467

On Fri, 4 Apr 2025 at 10:43, Samuli Piippo via lists.openembedded.org
<samuli.piippo=gmail.com@lists.openembedded.org> wrote:
> +CHRPATHS = "${D}/${bindir}/* ${D}${libdir}/*${SOLIBS}"
> +CHRPATHS:mingw32 = ""
>  do_install:append() {
>      # The binaries have RUNPATH=$libdir, which is redundant
> -    chrpath -d ${D}/${bindir}/* ${D}${libdir}/*${SOLIBS}
> +    chrpath -d ${CHRPATHS}
>  }

This chrpath snippet is a workaround for an issue in how upstream
builds binaries. The commit adds a second level workaround to it.

Rather, it would be better to go to the upstream source, and check:
- whether the workaround is still needed
- can we fix the problem at the source, rather than after fact?

Alex

