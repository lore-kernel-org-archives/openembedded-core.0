Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4DACAC58C
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 05:08:27 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.9967.1757480905372119104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 22:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vv/zWtEg;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4b340966720so44178531cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 22:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757480904; x=1758085704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7VDdftAL98z7RDz+MDCOhqr75tHltAzuFN9PchsuiuA=;
        b=Vv/zWtEgEwMm4ZThL6DRAXA04IKv/+0qRof7g/gxlfQ/i8TvewMwz0DiaOWk1PDgFK
         D/FsmdZthdRsGicX9VsW3SFcKZ+OcjNxHZMLVnY/aZhgrFwG5PkoTbWShqQxXDEc/Xc4
         TU/frqjgLnJd3/GhMff92YnZz7rI2ukebwp+PIUJUbtGcter2ZVqcUveakSF1zmYE3sN
         lgryV49SkQRtB/PWSHsXj6+Ha7RPEafH0+8dc7e3xdoQvkyuQdvn3ZxBr77TUe9ksU/d
         WRZVufML/CHKgP6vX1ckHpJFAVhOltQYo9HGF+hk4ZKTmBN84bsY5MavTWY5tx0mnjo9
         26yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757480904; x=1758085704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VDdftAL98z7RDz+MDCOhqr75tHltAzuFN9PchsuiuA=;
        b=AU1eomsb0mKeQSp5/HEhl38rqBLH3ZkyVKMEVPweJaEm7HHXUxFX3t56pp+9IUlihw
         Kyv7FhHrPxR6di0kzVK/TrTKUV8f3YEqOrxZ3xZNmuKdhCJYBsr9EuEo4bi6RJgI4iTM
         A3YfjDCZGBlzanveTZMOPoiC4BimNMtDCrs/QykyGy/IthPj0+fYEIYtd2xGLHWyOwD0
         s++rdOvqPOKkcUhxB770e7o4VqB7dL4lscMjAMaA3onCIgtiCIgKbjFpLfeywHHcMJ0q
         HScfy64/gwxHH+DSpZ4n2S4W1JczfS9RWXgeV7kwNY/tFYPpVm54VLSzUd41dUzDBZOU
         X1Rg==
X-Gm-Message-State: AOJu0YyY3m595kcA0/z/gWYSqLDItqYjZRRg2xXDsP5dwX4SlYzbj4yQ
	xarGLlaQ1WMCjb+uLeNitDUHVu+40PKJUoqITQN7lrQ1Up2MQP7t0aQv
X-Gm-Gg: ASbGnctcoxBRKVT1JuzObDtl6Qwynew7ihFuZYRPmlzr3BM3YxhdXa2M7Vl4neczlOd
	lqO9kUH9YvDFde4mT6lRn+2BkIDYVZtiTtb/xLRChWIOfoF+roDxnzNWv+97hiUdLcTUtx8brvB
	ZI8scm+1rH9B+VLPT9gpY4Uu5hvWvHXYP8t7gRui6VaXy0uwbr0D//aw3A6m4c0jLQgIYdM/Xo1
	sS64Svz4c0PxJpzGUnDaYAnQcI4WETfyWU/2TuaKU1j+SqUjI1HhA6iW4hlK7MC3UdKCvxf8myg
	fxttKBuruhsyJqBYrrJ9REhpSjj2Zm1naI0LYoy2Khj1oMznuxDlaSFjMUrvy/YbptisA7tQe4L
	qlGZAyofIVzkIRsIiytc/j+F+6S6urBKheUkb4qcq18m7uDUyk/tXY33CSiWaizdesyY+vBOY3i
	lkugFGo7ppHSopSPb8lfuYKybx65IRJS5dioCdTbhm7O60gmUga9JCg8kDzFdeGAg/NQ==
X-Google-Smtp-Source: AGHT+IHWU3r8Hbu3nQHuM0NS1k5RFK3Rb7SlQgCOj9uBtDBKQ/WhMUiTsOyhcjLQ939Fk0Zs1faQIQ==
X-Received: by 2002:a05:622a:5a8c:b0:4b5:e6eb:a24b with SMTP id d75a77b69052e-4b5f839940bmr148504421cf.34.1757480904274;
        Tue, 09 Sep 2025 22:08:24 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b5ed72c49sm227866685a.51.2025.09.09.22.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 22:08:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com,
	mikko.rapeli@linaro.org
Subject: [PATCH 0/4] kernel-yocto: 6.16 fixups and genericarm64
Date: Wed, 10 Sep 2025 01:08:18 -0400
Message-Id: <20250910050822.3273330-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 05:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223142

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

These should cover the first set of warnings / issues that were
seen with the 6.16 reference kernel.

The first fixes vboxguestdrivers in meta-oe

The second is the qemux86 configuration warning fixup

The third is to get genericarm64 building and uses the changes sent by Mikko.

Cheers,

Bruce

Bruce Ashfield (4):
  linux-yocto/6.16: cfg: DRM tweaks for guests
  linux-yocto/6.16: cfg: x86 BIGSMP removal
  yocto-bsp: introduce 6.16 bbappend
  linux-yocto/6.16: genericarm64 config

 .../recipes-kernel/linux/linux-yocto_6.16.bbappend     | 10 ++++++++++
 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb       |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb     |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.16.bb          |  2 +-
 4 files changed, 13 insertions(+), 3 deletions(-)
 create mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.16.bbappend

-- 
2.39.2


