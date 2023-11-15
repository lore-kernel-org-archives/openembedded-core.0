Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A074C47074
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 03:18:16 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.5045.1700018292136842943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 19:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iZFk0nAH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6c39ad730aaso5117873b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700018291; x=1700623091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+wrIwoH4EQauXcwyYH6G5+v4KY0i0UqIY5SB5GKwPg=;
        b=iZFk0nAHYv/pDGbmXdTB5r1nBpkemdy2WthRBiBXe11UmpoGPPAkI5mMc5LQ6Rw8T7
         Tn1C8Upau2PO3NqPfafgSfWfv/5YuZwBUGkc/Ci8go6P6EFgTcLva/4VdeP6GBXUQkHn
         Kp83/X1KM5tW6QJL5GZRKaQwktlRQFzTaJB8wZ3TmHJicrC1mb15aQGIVvf4OH5UA9BU
         PyodgSP/e3al5Iv/Eq0bh98MOIUKfGX7DE3el8Uvx3q7Z2LaD+XEXa007tmpfBBJDBPd
         qXDNEQn4ch3/mxnQ35TBniWj8/kJ3yEfh9T2QeR1vgGKu6hp+CGEJRQzMnq7DT/u+xKy
         EV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018291; x=1700623091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+wrIwoH4EQauXcwyYH6G5+v4KY0i0UqIY5SB5GKwPg=;
        b=fciyGf2wBGKqXKn/+LkBr7EJH8Du/sk4Z+L7kYaRxhm0cF5M8KJirYA/uZsGBzlPb6
         rt5hk3MuC72lb77HyzUSJg4w3YE9PDQ0hbAso/UJiBa0WNFXL6IpOkaq04up/E7ae9Y4
         z/66a5SfeKEHJfV3VZZfmkVyN+OGaDLZ8ayWd2BKiXIhsU6Gr9PBcJuQDY03+PNcSor9
         yLJKG5IT2Wl6HKNM9seTJgF5Rb+rwizozlglsibfNvJy2XlIgo73oeSLkRN2dbDMTOVS
         NQoRpN/1Q13VvRhqmk2Su2XXumNEOxTqbRAGTVol9lDkK/g5LLRZyM2QBTAssG67eoWk
         CUqA==
X-Gm-Message-State: AOJu0YxO79empl1Dk9yFt56ap1pVr4/LReqknXRqfbcksNqs0aXHXlCV
	s925JeQfRwpBOa6aMgx2osUI2HxLvcgw0D7l2KMG0Q==
X-Google-Smtp-Source: AGHT+IHp5ZSD0CaXaRksI5E7cATY2zK9SOPvxJghW/0kJMBNwNyOwuLtdwSlujnQmSPb2IHlU/6Igg==
X-Received: by 2002:a05:6a20:1609:b0:181:74fe:ba83 with SMTP id l9-20020a056a20160900b0018174feba83mr8991838pzj.40.1700018290920;
        Tue, 14 Nov 2023 19:18:10 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001c6187f2875sm6369300plh.225.2023.11.14.19.18.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:18:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/17] selftest: skip virgl test on all fedora
Date: Tue, 14 Nov 2023 17:17:34 -1000
Message-Id: <ff7dbcc0206203e2ece68ca91a37050a4bc822a2.1700018112.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700018112.git.steve@sakoman.com>
References: <cover.1700018112.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190547

This test will fail any time the host has libdrm > 2.4.107

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d80f85dba2..cc4190c1d6 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -185,14 +185,8 @@ class TestImage(OESelftestTestCase):
             self.skipTest('virgl isn\'t working with Centos 7')
         if distro and distro == 'centos-8':
             self.skipTest('virgl isn\'t working with Centos 8')
-        if distro and distro == 'fedora-34':
-            self.skipTest('virgl isn\'t working with Fedora 34')
-        if distro and distro == 'fedora-35':
-            self.skipTest('virgl isn\'t working with Fedora 35')
-        if distro and distro == 'fedora-36':
-            self.skipTest('virgl isn\'t working with Fedora 36')
-        if distro and distro == 'fedora-37':
-            self.skipTest('virgl isn\'t working with Fedora 37')
+        if distro and distro.startswith('fedora'):
+            self.skipTest('virgl isn\'t working with Fedora')
         if distro and distro == 'opensuseleap-15.0':
             self.skipTest('virgl isn\'t working with Opensuse 15.0')
         if distro and distro == 'ubuntu-22.04':
-- 
2.34.1


