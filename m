Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F59CA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 09:05:13 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.69509.1754989510848580512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 02:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MZz/7r9p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-459ddf83023so31869345e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 02:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754989509; x=1755594309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=M829EQEVyDi0+HR60KtoehHCleUJFGB2sqPj1++BqHM=;
        b=MZz/7r9pAIQ3K0h1e37d/7fZBUEs7OULEcxkYO2mygeY68SGv9/u/+tNWH3l/8C31E
         LVxjV6A8WqEgKVpK8XX8G4OBvSo2URmEajlE6x8YSQecv9GikPJU0yr1+IF5MNSsO5c7
         R4ZBUa8G157rFcdz8PW7Mrw/ANgrmvpnzTnzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754989509; x=1755594309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M829EQEVyDi0+HR60KtoehHCleUJFGB2sqPj1++BqHM=;
        b=Nbs9YilgSiVj/sE120XoxwptDCf327QsJ/2N2BGDQmWpy0/CmB5lSCePTcOv9y9diD
         VBPe1CoDpGwjV/iwUdvff2gKnIDGUCF1ihAxekbPaoluXMXLO85hSsThEwgWcpItIyOP
         XHSmyWEs54w6NcjzWEoxZcXAdCbZDW5hE7DgxKDAAeoJZSTN/h8gwOMLBGkeQLHX+nVO
         AFPd4JqIIFjnjHZvG9aig24rXg3hkB4EGZeaGEubKUXSDtNrQNDCdkeYTrERZhrPCbak
         WLepVyEcNrjmoj3tsLY1J/cE85uGxIV7QBMntOc6mTQN3c/2mvQb3U01n9LZlo1w/3mX
         meZA==
X-Gm-Message-State: AOJu0YznhJ0LyEZwSnGkAwzHGYuaujz8VNpTKzNzkvwAh1mrvjui1795
	TFcY6aLTdaO8CoZBMlUHVk8t9WPuDXmeXg1YbSMuTFv+2RjLKTOU3MsJnFWAs1tYqd9USPuaMCw
	1WhXa
X-Gm-Gg: ASbGncuUSGxdbBohX1ECIsarcrYK3rqXvuisFIVRISdTO/L4WcDbjP0P1CzzpB9XBLL
	r+0YLVTmK+2AurPaTgblzzANkU8siapky9k16svCoCHj8/rb0fHipB7q1Pr44MGtXnex+rR0VAW
	Fd+X9f4uaPUgl/fm+79uIMQ+tExJWDF2m/D1Ynl2waoSDlO6wN5kSlpUUi/OsUOYm45NgyjSC9j
	AO1dmZ6Bw1Uyyz9RDBpsdp2y5hHwo8oYVEogfRCxinpfULcxa5lPi6udEBxBwTPHwiVUFRr7kFi
	GYPWefdzHKuemD1+G92WVlT5mYwL+MaZ3YVDRaLN2KpyGS244A64ai0BkIZs5x7k0TL8ecX0nBW
	G0IIYRTCI5sK6XcboyJv7VEH928SaWw6L9Ckx+RYloRnPLc3iUVA=
X-Google-Smtp-Source: AGHT+IGF98s8XaI+UhfGnh3Wr3MSK21S/bql91RhYXSDmTcGWr3O1xjtiFg/yqs24yzDTWNk8fDXsg==
X-Received: by 2002:a05:600c:46cb:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-459f4f3b207mr123697545e9.29.1754989508624;
        Tue, 12 Aug 2025 02:05:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:89f2:883f:9153:ef6b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b914e70596sm431268f8f.61.2025.08.12.02.05.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:05:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] conf/sanity: Increase bitbake minimum version requirement
Date: Tue, 12 Aug 2025 10:05:06 +0100
Message-ID: <20250812090506.2696752-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 09:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221757

We now need the new bitbake setVarFilter function. There was also some
changes to bb.event.check_for_interrupts() which changed in an
incompatible way.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 474816797aa..71828542748 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.15.1"
+BB_MIN_VERSION = "2.15.2"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 

