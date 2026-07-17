Return-Path: <lianux.mm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED656C44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:45:37 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8156.1784270734556433578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UyDvWjb2;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: lianux.mm@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso7406338a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 23:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784270734; x=1784875534; darn=lists.openembedded.org;
        h=references:in-reply-to:date:subject:to:content-transfer-encoding
         :mime-version:content-type:from:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3El8zJh/fMfcd0Ufudy5lojcuUvSt53le6fJEskhuM=;
        b=UyDvWjb2ilfcX18sEZFTVqQKCmOKHzwjvQxBa5Oe4EyhOV6CovFcAXu44zAah71eMq
         t6ghPQ4V0KODmV5ztzZzylyb/TEGNa3qOxbu8hZ9B5QqirjRl/rLY/xorN/jDWdKhjZi
         6yiuILI4ESpmBcW+LSFN1JBN/hk+qJnHLzznIYGRucVi/w8ohWei8PeUK1lHbjiAcGZ2
         //6MDKPzaooUgiJbgsgD6rWjV5oxPzW73Sk5YDlU1aNKZ/jBp/xY7p1hZtSL5c73Emwy
         1gWZVFdOgYxvuznqvkqlOAcJ/+ipknU5tvHoQ3dddAZsoa6aTa4TKVUTzklWcT2AYRwl
         298Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784270734; x=1784875534;
        h=references:in-reply-to:date:subject:to:content-transfer-encoding
         :mime-version:content-type:from:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3El8zJh/fMfcd0Ufudy5lojcuUvSt53le6fJEskhuM=;
        b=sr3mDN8bow35BE9QbfnPi0vdwkVIZnHu6bzpvXsPIrr1L/DCpPq99jwrxZ11LVgyB3
         xiMLuAMiZpIp2daqH8tm9x1mCdt7wXKrb33gmMxYSNr7Q/MZ9W5LrMEUgGrW6ObVe/iB
         cJebmmK9Inl4mQkkc5JuAEaERdGXwRbUR3Zz5tgRnPlsFkmc2qt3M+9BT28RuuHppENT
         gscyrX0YWJamlYYDeXsaFb5F4xPMnXLa+1WBhsTU5qs31NeG+QuxNIBD3NyLwSf1dZ77
         NRHD4SENI03HxhzZWXLA/3su4X6Pa8zkWllYL3qeAjK+PAa92y4rJGp5WP19YvCIdFxG
         9Hcg==
X-Gm-Message-State: AOJu0YwRqWwqdBVf52+oxqGBWZ6oNiquXEDm1iBnr+p6VRuUbibFbzwm
	tgerzs+EgjYwzkj/dp8rRJIBs3LQqP2VgvV4F2Nr+9RBW/zIRz91BwK4QR3QHP2dzUw=
X-Gm-Gg: AfdE7ckle8oYszAKJjsCkIEUE2j+CrgWynLaLIZD5UnkM3LhY94YJyKglfitX8W8qqy
	fa9OWQgLFfxsKAtO2B2c8Y19BZ14Pgx060TYqP6nA/McfrFmgjAUh26ZyxDtQvZ98Nz1/AhVr0r
	brLl0zobOZ0wFSg0FbC92fVE+TGW3kMNK8Glz+E/YSfp3oAXlVfRbudeElzCsJ+mL13NY+bQyam
	7IfAirkqMnI9YdHqJzBJZemgF1AT6SkMVZHHqO49GZk2K0GooXN4zJpQGbdgjOGbuE4zHFVyrzs
	pqzLQ6TFMArpFkXEgxvvMtMDQDJP2/60lKzTwW5z/ioUN04F7be2wLJFStER7khCfT8q702V8p8
	vfLq7nqyA4CJDBir/EScwrWCOnhlQKV5Q7kt/6iHzhf0eAb6rdykM0UO+2fLV5jH5pW+OqfrF0m
	BI
X-Received: by 2002:a05:6a20:b786:b0:3c3:8d86:9856 with SMTP id adf61e73a8af0-3c3ad66b65dmr1366606637.14.1784270733772;
        Thu, 16 Jul 2026 23:45:33 -0700 (PDT)
Received: from lianux-2.local ([2605:a141:2231:7698::1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb517f8f04asm366484a12.8.2026.07.16.23.45.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:45:33 -0700 (PDT)
Message-ID: <6a59cf8d.8a854648.30daff.11e6@mx.google.com>
From: Lian Wang <lianux.mm@gmail.com>
X-Google-Original-From: Lian Wang <lianux.wang@processmission.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rsync: upgrade 3.2.7 -> 3.4.4
Date: Fri, 17 Jul 2026 14:45:26 +0800
In-Reply-To: <20260716071942.16681-1-lianux.wang@processmission.com>
References: <20260716071942.16681-1-lianux.wang@processmission.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241152

Hi,

Thank you for maintaining the stable branch. Per the stable branch
policy, please ignore this version upgrade patch. The existing 14 CVE
backport patches already cover the listed CVEs in the recipe.

I will follow the stable branch rules and send individual CVE backport
patches for any new CVEs going forward.

Thanks,
Lian

