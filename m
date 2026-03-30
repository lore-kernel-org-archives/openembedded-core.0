Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D37E1061B22
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 20:54:46 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5785.1774904082827015258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 13:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dWO7gFOs;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cfb723793so993195f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 13:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774904081; x=1775508881; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cBQeVmv2Zo3pz+WpHVSm51g4bF4K69mrZ5Gu5pS/gI=;
        b=dWO7gFOs+DbUF3XgY3vrroDxCx8cOAurwc4Fgm2VPTKAHhTZ2vmXRSx+z5plIVfw79
         ms1H9HJxk4gvsZEiQhryEVgyAKtQZZEmanq2ZYYYX8hOQiwGV9SXGuWepYz2nIFfu8jz
         53SxAmhedwG/vPoy5AL/hyux85ZHKv7wJPzSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774904081; x=1775508881;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8cBQeVmv2Zo3pz+WpHVSm51g4bF4K69mrZ5Gu5pS/gI=;
        b=KNiBdt08oL/7AFyhB/IzMrNjKjTwD2qXTkpywpTp6WUmC+gu6n0tgx8IxA82ahkJzI
         pCydqawyHnXJ7J6bta24/WfJqpXJ7rt6EOiVN8ItIfXJHQ+D1GOyLpHePAnWAHuISCu1
         G7BsrlxO/EwPDZde0WHrfBltE7ToiElStOXB6B7dgMVkGQXsSaLgKdb/Mgxl3SR8qm22
         PZ5bl6cAUoYljp5aYQ2BBPLy1klgEuLx70KVrT4NGEIxdXSP8jp7pr2jQw3nGRG24m0q
         9gRcllDHv+Zoc2pOAiUu7aKDHSuSx/K2F/zjAKYiU4jBGGO/yEGP7AlujUsKuVVayEAP
         Bv9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQLQO5ESvtb348HdP9tIC0jERS9ijC6zqxWtNUY5bq/8UFgr6FXGODUtt1hE0Qlm9F4I2PDNW3RoNq5rPiHIi/6A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxiKnMw2puOpK8FA7LljA1NSWtu1AXBiOYvJCOS5GqKezUuTaaK
	R2q49S0kFxhU9HlGmPoWUObgRZcGA40nIhAbAjCkpf146hgYygsUbQEijkaRw1xzQWU=
X-Gm-Gg: ATEYQzw2wFSn3ZQO71KudbPPpGDdQjK/9yU5XUy8Jls+i0APYAnJqskOGP2nl/qL+8a
	Rp+tfwldc3mwqT/+vfgO9jWld0GiuGLbSUT/yg8W4uDivC5rhdFBJIO8v6djckBN4qqY58XgwIa
	cZUKl6WhCly7V7hjM+qF3/VQ1lfTVJQU0K8eXjjKmOBKYa/sOjRrLwDPsynw8CyrwYeb7sSpjko
	0hDqc4Q5e3T/99zNVgQjYoaYApNws+2t+k4hEtPsMq0t5tgMJcbod/V2WJffMMWf/Fg7L7X976K
	XB2U92/my15C4GfYcIk5MBtIRhKZrlrm2Q43b2Kl/a5BVoO/sTRPWiR4HVtW+EhUiDaf7IUemqG
	UglgFqXGXH/wJjSgmR7CSkj2IvIclMdArDOmA8GXGDH94cI5/P7US1TenDWW37DKS169LG6qhNH
	40w2VUlEgmh6kj5FnI6SvGZrrBw6jIWDJ/Te0R42pgSqibQ+gZgRfOLiUK2PEPPcd0pEiC3Nz9q
	6fhT3JdTMysoSJkapLYuXEdXw==
X-Received: by 2002:a5d:5888:0:b0:43d:184:8a9b with SMTP id ffacd0b85a97d-43d01848d7cmr7181066f8f.16.1774904081097;
        Mon, 30 Mar 2026 13:54:41 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f1749sm21898630f8f.14.2026.03.30.13.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 13:54:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 22:54:40 +0200
Message-Id: <DHGEZI37ZFEP.2OYU0NJUB8E9X@smile.fr>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [Whinlatter] [PATCH V3] vim: Fix CVE-2026-26269
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <411950.1773664515124824221@lists.openembedded.org>
 <20260316140013.66070-1-adongare@cisco.com>
 <DH75XB5A5FUG.3BGTXG13U5RQ5@smile.fr>
 <725242.1774895334350588732@lists.openembedded.org>
In-Reply-To: <725242.1774895334350588732@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 20:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234257

On Mon Mar 30, 2026 at 8:28 PM CEST, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> Hi Yoann,
>
> Thanks again for the review. Similar to the previous patch, I have verifi=
ed the code and confirmed that the format matches the upstream repository e=
xactly.
>
> The context lines starting with tabs in this patch reflect the original i=
ndentation used in the upstream src/netbeans.c source file for that specifi=
c block. I kept the tabs identical to the upstream commit to prevent any wh=
itespace mismatch or indentation errors when applying the patch.
>
> Please let me know if you would still prefer me to convert these to space=
s!
>
> Thanks, Anil

I answered about the format there:
https://lists.openembedded.org/g/openembedded-core/message/234256
This is the same issue here.

Regards,
--=20
Yoann Congal
Smile ECS


