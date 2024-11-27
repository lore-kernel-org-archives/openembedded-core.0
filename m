Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDD4D609CD
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 10:13:39 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.68781.1732702408624302562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 02:13:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bK75zMoa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434a7ee3d60so3500885e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 02:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732702406; x=1733307206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OM27RBoltvYjh7nLtGJ3R+mkJrsPBizbWWabfDUgAMw=;
        b=bK75zMoaRa7sYyMlKED7JRR8A9o1JqdwdwfVTZ459c/L/D7T1+tkvipYpXl/VHSoGb
         ofDWlyrvqznlBN4U+9gH1yMejk/XfmlglP36pF6fVbFXjbzvwHRofkGMellbyW3Bp3o4
         9CZRYp+O84Md2qwSelcFQzfILuEC5eLQ64m+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732702406; x=1733307206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OM27RBoltvYjh7nLtGJ3R+mkJrsPBizbWWabfDUgAMw=;
        b=Y6vqzQEuh1hoWSChkwm6bUkjaIOps4VruYw5SYZSK/OXKl/V2ARm2kFl+q4LbkDx5m
         wciNMuV2fkXUOr3wmdBrnD2Onb/NwvHFl+AKztLEGEN92WBWPcTQTdFAGy494ygfIE1z
         Gt04INhfHFDOveKM/Hae7uLDlbo1AfHTVpQO+O0PolpWWGu5J2b5klLLWn0jT/SZepmv
         5ZaQcMA04OMnqJGIbeoh1tVAD8Ze2uK7z8fWBzSNgF5VZvSLNHTxA8NMbq6cUZ0oAZxP
         YknYIL9a7wF1v4+d6TkgI2fsqG1elKVVgS6KWUpQNKZ9FyE4N7nNAVXeVdmqyBoDiu3y
         OCOQ==
X-Gm-Message-State: AOJu0Yxg2YnCU7ygAIZnE9W56YhOmBzvT0G0fM0/xz7ABzbweREhRooC
	54Yoz4WqSE5dXlaIOnvKFvo4Zv2CLAhM5F8yeGcROPjUwr8TObmh6iws/Nl58BwBMxn9dfJvPdk
	f
X-Gm-Gg: ASbGncszbIswUGehF5/W9yfcalc9JGpclIHoN94bng8zO+z2tsrpJVB/CtU3MdEhKke
	5SCWCx7kap/xB+Gvzwk2ehcCMCI/7gkux1AUI3wL91uzVQpl+OGi86ylG6RK1xGFwweGJnyweX0
	d7GWTwdSqJjeQhV4MIcASXSyMVN1dkoLtsW/SfeHR0VkmazRo07oadd+av+42ELY320Rb6sChtr
	DPcsBIRrxHfWt/TdxTtM1DXAT5bzkLSTsEyjMvWX4S7RIbazLuNeXEagwOMvPD/ugdhB0CXpgcd
	Ag==
X-Google-Smtp-Source: AGHT+IH01ZgjmOSekye2Vv+X9xdJQz2rNtfpZXnp0x7ZYbPdp3bk4MUV3G8S14SdkJp+wUR5JmKT7A==
X-Received: by 2002:a5d:6d09:0:b0:37c:f561:1130 with SMTP id ffacd0b85a97d-385c6828cafmr1741945f8f.18.1732702406099;
        Wed, 27 Nov 2024 02:13:26 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d8f2:574:7ade:5a68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbed85bsm15874598f8f.90.2024.11.27.02.13.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:13:25 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/static-group: Add seat
Date: Wed, 27 Nov 2024 10:13:24 +0000
Message-ID: <20241127101324.3335729-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207923

With a group added to the seatd recipe, we need an entry in our
static group file for selftest.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/files/static-group | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index f7a66de24de..441123e2c55 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -27,3 +27,4 @@ render:x:527:
 sgx:x:528:
 ptest:x:529:
 xuser:x:530:
+seat:x:531:

