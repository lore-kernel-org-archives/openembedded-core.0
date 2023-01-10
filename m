Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C287C46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 14:29:16 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.105114.1673360945747136902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jan 2023 06:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GiG5MYUM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id co23so11957260wrb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 06:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4a/9CnQPtlMtpSaB/6KNjyDYAK6fs04X7TmrlNsPp2w=;
        b=GiG5MYUMcXyiKAg3zZ00B1AVH4MHk4Npl67ZK5ZCb0HJ/uyFxWF8hN5zWgCiIJbfbG
         49BCANAeXa6SOkZob5MaGVr5d4eTuDBFaluvdPz0lz6dETY5+FxTEKwrbRdH15b2HEym
         6vK4cxW8/dzSz72ZhKRuqMYuFAEv3LjKQnLA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4a/9CnQPtlMtpSaB/6KNjyDYAK6fs04X7TmrlNsPp2w=;
        b=t+QJAs335Xcxgq5amYLyh8kYgVHAqvkpZpDAVobXugnRUOWusT16TmSdFYE+oUbdc7
         bmhocA1KRp6m0DTecrxcmgX2F8K70RkWJU92DDwWToA851wNVqd/8tKk3xZDVDrcvpSn
         amk5FOLv+X8n4i1DIm2eEQdf2w6sSQpgMPUT/osp/1CtHUzGsFeaIDc9z10Thph6yeHe
         Zanl1MXagTLioV1VFb15+f9SXaVNYhcHHNZA5X3zCCcxsHZYfVs1vxsFYLhBR+iSEXM9
         fcVIL7vGQ2gb1H4fa6S1J0wYR+1pKTL/b3M4U0ruvyw31lrAgj5pnPDdeG53BM9kYQ9v
         pwFg==
X-Gm-Message-State: AFqh2krdlDrFuzwkFA2IwZDLbO9D7W5yM4GryPpJ0MZXEecyCsMMSLWS
	7H7JdLn0pv9TkRm8qyYg+3adaNC+r1avdsRD
X-Google-Smtp-Source: AMrXdXtWBTRIn3CCsQ8G/4y0IDYeOueEcB/FZUuDj71/L8yMZOQNkz4JZFpGk6HofgtM8cH7qeMdGw==
X-Received: by 2002:adf:ba10:0:b0:263:9208:2dd with SMTP id o16-20020adfba10000000b00263920802ddmr51224546wrg.18.1673360943577;
        Tue, 10 Jan 2023 06:29:03 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ef35:464f:aac3:7a])
        by smtp.gmail.com with ESMTPSA id bu3-20020a056000078300b002bbe7efd88csm6891393wrb.41.2023.01.10.06.29.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 06:29:03 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemux86-64: Reduce tuning to corei7-64
Date: Tue, 10 Jan 2023 14:29:02 +0000
Message-Id: <20230110142902.1464524-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 14:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175714

Much as I'd love us to use the latest tuning, we do have some autobuilder
hardware which isn't ready for this yet which breaks KVM and some qemu
user mode usage. I suspect we're not the only ones with such hardware.

Drop the tune back to corei7-64, anyone can easily customise it
themselves if they need it. We can revisit this in a year or two
as we should be ready then. It has beena  good test of the rest of the
support which all seems ready.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/qemux86-64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index d355375f13c..968e3c82a2a 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -9,7 +9,7 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
 
 require conf/machine/include/qemu.inc
-DEFAULTTUNE ?= "x86-64-v3"
+DEFAULTTUNE ?= "corei7-64"
 require conf/machine/include/x86/tune-x86-64-v3.inc
 require conf/machine/include/x86/qemuboot-x86.inc
 
-- 
2.37.2


