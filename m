Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E317C36010
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:30:12 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.33432.1743021006922875571
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UwtJSFLd;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso260592a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743021006; x=1743625806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4u1i+zGiI4owH/hQtr+uzMkq6J4QaJZWYHQ5L41vBLg=;
        b=UwtJSFLdvZMMUUTSzXXUYWZqTtAPfPRArZMNq3vcOCYgTULsMBVFDCxGSK2Brm6vt/
         6cVnJkBD7QdcpfMIAx8KHX5XNQpsA6hoRN/Hq6TOnQ/K4pSM2komY4BJ/sdof/fGbl3g
         6j8qa08aHjtdv8/QoGUYlgozS5KQ4xV/d+CFqlpEEnf7nFByKYHlZWVK8BgsTR0kp4q5
         0iX01s322S6g+ViUU8/PU8DJnAG7AJu3cXE19kH9ed/cUoxkI7l9kI7DIiHKX0yyLGJM
         ABINV3L2dDkU7b3ZTdxW0LnV95kFxnDX6pR1B6iXiisghHQzo5geKavrq5u3CgS0VVy7
         Yz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743021006; x=1743625806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4u1i+zGiI4owH/hQtr+uzMkq6J4QaJZWYHQ5L41vBLg=;
        b=R2UnqxhZx8EsHVqaJQz+mMPvOpNbo6sknsrclKJSILvtZfXUL6ku2uCyr7dXwVE1/P
         cVQMo1BvskPOJP+fU2BTImSTK1TdqypSLEOMCIpJu4RsgGzgbqtCUgYaaweA/dLVce46
         WbYPagrXkNGmiOw5KXsBoEVl4HB3eseesJdDMJLZuddG71e8cxbuFJDUFDbi5F9PDoxo
         RqyAORYm9avfe0tZg3PVLxabYskGCxkcvlVuyvsNwNh6E0ne3ObqeL2SrfNtg3drQIOQ
         sdi6pUO8y+ekrhVBeKqDT/60vK6L8FMD4F6FOwoV/DdnIbZeC8MRlsW07favJytkmvBl
         GLPg==
X-Gm-Message-State: AOJu0YxpT1rFGH5H++AO2yOHBm4WUfa1ePe5ZT8EjrER9BJuIauqVlxr
	kJgqJeVES1HEFPiry2ryiQ2U8ricWf42P2hDjrbqxDSMzql0nfJ5vsNm2jh4
X-Gm-Gg: ASbGncuquzbZpOaYESFpJX0IcrgI/xK7NiswWdPpN4OJevS5JNX6LNc+SZA7Sv/bKpT
	BETcczc1ntke9Z2i08fDO/L7P7qJB8xkOkeEkqz/LfpL3VqLkUgzGSGR2wf6L8KpW8zQDCJBo6y
	G8Gtn5DnvUUvwWlGueUUm2u2XXJizA/jimOY4sRDcuKTtSU2KG8dzJMXb3CjOrUt3BX07KngTyo
	SNqWuRTQ0fQ+9dmtwuSMynjwrPAmw+ArajEPxeByr+CaHP4mA+8TMVCg+xNu5UGdi3yNdJaK9q2
	yCOAnI5mBa4JVEjeiKUDletx+n+zZ1U4mkJOsEM1sRtay+0Jar9sQ0jXMlPV736dtUg=
X-Google-Smtp-Source: AGHT+IHWNYHQiC8P2NaBRxyRT8Lfq2DShm7kzuTbWiwhOWX2QZ6VOUjIIKF5Jv0jlQsCCHmyZF1wdw==
X-Received: by 2002:a17:90b:1811:b0:301:cba1:7ada with SMTP id 98e67ed59e1d1-303a7c5ba39mr1409976a91.1.1743021006069;
        Wed, 26 Mar 2025 13:30:06 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:30:05 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [styhead][PATCH v2 24/31] linux-firmware: Add RTL8723DS blobs into ${PN}-rtl8723
Date: Wed, 26 Mar 2025 17:28:10 -0300
Message-Id: <20250326202817.64437-25-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213684

From: Alex Kiernan <alex.kiernan@gmail.com>

The Realtek 8723DS WiFi blobs are under rtw88 and the BT blobs are under
rtl_bt, add both those into the rtl8723 package.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit deaaf43b8f6c905f04f3d0c56693c027ceac3e3a)
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
index b153901d65fa..80c94c5db3b5 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
@@ -1243,6 +1243,8 @@ FILES:${PN}-rtl8192su = " \
 "
 FILES:${PN}-rtl8723 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8723*.bin* \
+  ${nonarch_base_libdir}/firmware/rtw88/rtw8723*.bin* \
+  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8723*.bin* \
 "
 FILES:${PN}-rtl8821 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
-- 
2.39.5


