Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2C8CD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 08:18:57 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30961.1782461934890674734
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 01:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=R2d24/t3;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45fd464d51fso318195f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 01:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782461933; x=1783066733; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+Sa2ftRVF+tTa17x0jHREswTHaUOwOfoW2hpodyJH8=;
        b=R2d24/t3ZyFTfz7+HltCDku+cKRQ4hgoi08fwR/xJy4OqGgVEvzWix11yhZu1pnSFp
         Cp1/ISt3uU+evwo3fsepH2NFE5Y4G8d6sUQWlZCjh+yU/bfZkCYylFWGc3Z/4W5aWhuJ
         pwpmP/wL1Fe/V3eBx2Mgfp05+aMzZz4ZOFHGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782461933; x=1783066733;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+Sa2ftRVF+tTa17x0jHREswTHaUOwOfoW2hpodyJH8=;
        b=gsiAlpTgSge7+BuD/tv5vp96nw9NgawrEc+CjZXHCTmT4GqGZ4ET+LWu2d7MbpOYgi
         nPp2MitP2GuICaXRs+A2pFy4zeh8tni8t6DfKzOxuK7HjFwV9MM86qE/P849saHDbRI8
         G040oc/Pe4fPtPOUDZORRnHroBEq4L6nOYmrCeEFJr7XuMu4uad54JdetNjdbv1+F3AQ
         pcbL9b4/bN8v5sHEPYANxP5GeZOThHLnnFN0fjqgOz+Z8V9h/lReZlcwTbeRev4Hr9E0
         Hbv8FyRoxgNSYt7lYYzLd+a1FqwrFzTtIuTq1hef0HRy/ryZ6iwZrDg5q7EDbbWBqIsc
         6lhQ==
X-Forwarded-Encrypted: i=1; AHgh+RrA6wCNM8OsnroN6O15RqzCmLPz1J2CCPYI212yqsIu3Y/2FO1EAvUyxtGWOxW0r+Jw12I7q2mIcz56VK+nZWHmLA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzMVpiY2yBdLC8HkKBpY5uDYWFkCvjYqIRIQUKusGi62ozT32p7
	FqJzfDK4kovfrEoCuvI+9Z0mB87w/CJ2iFTRwnHee2vXxvZwBj/sdMZoYljSZBrk0kY=
X-Gm-Gg: AfdE7ckrsozA3U9JdA04royT75bJwbI3wToh040SWPSZRBYwlHt8/2mbXz5Y6EOWROM
	DyO52nB9eJSMbkkW34n5RNQKFIbVdm+I5bR9sY7TVkGmOfxtMdYTOxTVsnztT0MnSXkqSVHS3GI
	CB++jmRdA+ZRtadJKiq3EDTkUgN2rHZJRPhaAEwZKtInkWCkSBacW61fn5lzD9rOon+WkqTcpyR
	77UQNbH7r1yGXdkB7wd0d29v7nOPeVduwZs/rZ+erOgo4X3CEdwNYOZiCdX7P2/4758sRJHNQpq
	wgeciasTNj1tcxhZxmmxUZ7sC4l/ul14IGn8Wo9yt0LugxC5hCz8JpKHj4iFnkUVk70T7MBokbt
	sUaOILEBYaZkRvpvbKaEzSPWsSoem4pB0mYxfvwvUz950dEv/6DWRv0aArlYaN5RwLlXB7ZWMNW
	nFeT8+akRS0wEgum6gYyF6Hr6KnN6zF3cHrIC85fsQGvKaJVybWmPjIfz+MtNHgYNmUZY/V1ogO
	mxrJA==
X-Received: by 2002:a05:6000:2c0b:b0:466:6ed8:1e1b with SMTP id ffacd0b85a97d-46dc263a79fmr9768469f8f.21.1782461932912;
        Fri, 26 Jun 2026 01:18:52 -0700 (PDT)
Received: from localhost (2a01cb001331aa00dc663d106f146c8c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dc66:3d10:6f14:6c8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f978dc0a9sm84740f8f.15.2026.06.26.01.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 01:18:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 10:18:52 +0200
Message-Id: <DJIU0RAK8OYL.3PM31UJSJG9OJ@smile.fr>
Cc: <cheng.jiang@oss.qualcomm.com>, <shuai.zhang@oss.qualcomm.com>,
 <mengshi.wu@oss.qualcomm.com>, <jinwang.li@oss.qualcomm.com>,
 <xiuzhuo.shang@oss.qualcomm.com>
To: "Wei Deng" <wei.deng@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] bluez5: backport fixes from master to wrynose
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260626064233.704350-1-wei.deng@oss.qualcomm.com>
In-Reply-To: <20260626064233.704350-1-wei.deng@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 08:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239614

On Fri Jun 26, 2026 at 8:42 AM CEST, Wei Deng wrote:
> These four patches are backports of fixes already merged in OE-core maste=
r
> that are missing from wrynose. The first three patches (fixes from Jinwan=
g,
> Xiuzhuo and Mengshi) shift the SRC_URI context in bluez5.inc such that th=
e
> fourth patch (OBEX IMTU fix) cannot be cherry-picked cleanly onto wrynose
> without them.
> Please add to the wrynose review series.

Hello,

Since this series is for wrynose, could you resend it with [wrynose] in
the patch titles?

Something like (adapted from the README suggestion):
  git send-email -M -4 --to openembedded-core@lists.openembedded.org --subj=
ect-prefix=3D'wrynose][PATCH'

This helps a lot to avoid losing track of patches.

Thanks!
>
> Jinwang Li (1):
>   bluez5: fix set volume failure
>
> Mengshi Wu (1):
>   bluez5: fix gatt cache sync issue
>
> Wei Deng (1):
>   bluez5: set L2CAP IMTU for OBEX profile listeners
>
> xiuzhuo.shang@oss.qualcomm.com (1):
>   bluez5: Fix sending extra bytes with MGMT_OP_ADD_EXT_ADV_DATA
>
>  meta/recipes-connectivity/bluez5/bluez5.inc   |   4 +
>  ...sending-extra-bytes-with-MGMT_OP_ADD.patch |  33 +++++
>  ...2CAP-IMTU-for-OBEX-profile-listeners.patch | 118 ++++++++++++++++++
>  ...x-stored-gatt-cache-DB-Hash-value-no.patch |  84 +++++++++++++
>  ...t-volume-failure-with-invalid-device.patch |  46 +++++++
>  5 files changed, 285 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-advertis=
ing-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-profile-=
Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-src-devi=
ce-Fix-stored-gatt-cache-DB-Hash-value-no.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-transpor=
t-Fix-set-volume-failure-with-invalid-device.patch


--=20
Yoann Congal
Smile ECS


