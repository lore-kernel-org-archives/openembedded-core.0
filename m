Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C93BC53210
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 12:03:51 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.43340.1673179423340131925
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 04:03:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=G44qTvST;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id k19so4204405pfg.11
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 04:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YuIdqcKbgDTrySxVxB2obQc7EgZqT3ePxfNV3hyPUl4=;
        b=G44qTvSTZtgT6JB6edD4qdIF59/m4LJevLvif3JgkfOQQTzWYqcDKmJ0tTCZBAT4ln
         AgdBtagCuoVL9yhWNmt3okdS1SGx/+32jUzAqKLPNNgIiiowmfTerONr8fvEYF6M0c9x
         uFrCuFbHUMO0l88SJ0LlsmL7sHwjoBgAZwML1gff7ZsPT9dDL0evme8J/ZYkMvz+fWaS
         G49jKL8L6ANmONIL2BVolwN0A0BCl1rJn5bMeKMhC+CT0b34CFRXs+mEwfTHDJL1v3BB
         CdK9aKoUO38x473riXnadeBAsoLiuVz2hstrVrcp3JdmoSHG7GSRctbeSxZzm3CkINaj
         jrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuIdqcKbgDTrySxVxB2obQc7EgZqT3ePxfNV3hyPUl4=;
        b=O6MEr7ZTT4RRZZCsBCrzdRiYoEYQiIj4bCjWao6jaFdrCdu+p8TgLBZfq1qUxo2iGd
         BhAaWNe0s4YMtQ6LlFnV9/zrNhMgN7Gd57QUoXGlLgFdIMuhCYSLlbXuYCtvAmoIyD1n
         9O202IGp57PMAbNYa2/Zy2GehbGHL4NwbWnXrUuUsLulIJjEiaTIC8J6Hsv6y2sTyKiE
         1g3R7lrXp3hRiI/82ezFhOOobOD+xKGdguNB/oIiBuDUiU7AS1ljtWsPV7jzdaCX0NI3
         T7oXvwgKIePWSKEa3UFD/v33F29jrJYu+xPmKVdsbEN8tjHQcySPQ7f0f692RTNJ58Hx
         L0Bw==
X-Gm-Message-State: AFqh2krEx/Faw/H0gmLu//eyOW9LHnESjQ6gjSMNlKmFB7rJeI8NhCYV
	REp2nRVBP+z+SFtHj5w6vQyVVsOOva3If6k19jo=
X-Google-Smtp-Source: AMrXdXtjycUrPpuJ8rVyWEHAQfP+KNPefpi3miOqSJgKNHlk7xK/H87natoXZ92WnsNuD4v/TejdAA==
X-Received: by 2002:a05:6a00:bdd:b0:582:e67b:205f with SMTP id x29-20020a056a000bdd00b00582e67b205fmr16426246pfu.1.1673179421902;
        Sun, 08 Jan 2023 04:03:41 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p6-20020aa79e86000000b0056b4c5dde61sm4240128pfq.98.2023.01.08.04.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 04:03:41 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 4A49C9602D3; Sun,  8 Jan 2023 02:03:39 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 08 Jan 2023 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230108120339.4A49C9602D3@nuc.router0800d9.com>
Date: Sun,  8 Jan 2023 02:03:39 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 12:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175625

Branch: master

New this week: 3 CVEs
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3970 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3970 *

Removed this week: 1 CVEs
CVE-2022-46908 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *

Full list:  Found 6 unpatched CVEs
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3970 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3970 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

