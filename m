Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3B0C77B7C
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 13:58:18 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.80364.1682431092362068506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 06:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=VqPC/51C;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-63b50a02bffso4858585b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 06:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682431091; x=1685023091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCxg+qDwu4wIOFgIIv++y9hFfyOJTtTcIlFA0FcZWQc=;
        b=VqPC/51Ct2dj2GlyQvN7nRtKt6VWZLIy4YmTpuPCxVLrSmr7tOzP1ejlE1vc0jmRG5
         qIqLaruA6uL9m/sDGDnCuqEjEdoSZMaNMiyQbcdlXx1zj+/ouE94vtTJN+nuoEDFgpZa
         XLt61QInv6DFYqdsgJ6gBq7RiHqFYhso8hDG4P1JsPtJtJMS1hbJKDeuQGP/tcwYPSbB
         PJccIK2ZE5zBqHwNBZwcysbLENnd1tGyDd4HDsrimkctIDwivdt5RMEt6TjCkGwr7uFN
         7EVNm19x9GhuDAgbYWnCOlnYAcBNHD7uESdMxJ6vhq8p3FUULxZXU9+d5UAvI8NXo9on
         Pc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682431091; x=1685023091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCxg+qDwu4wIOFgIIv++y9hFfyOJTtTcIlFA0FcZWQc=;
        b=Kh8PQjv7nv5kx1cQ36tpEbtQksusmv75bjwN0IGmAMTHQSRBdbccXCKeCguSRkUyxr
         UFPjoel7/XlAWQVKOurMaS8FwmgVhQ52zN3RHeVwqu6Gu3md6hKypXM6e9UaZNCBsdII
         FbwCsTHSbPL761owXotvZBClZrV7VMuAcQtYA8jouSYmldYGw4ko0VcDd26cVvr0KABI
         wHhczO2GvEv7kKuM2NPNbqT0hWzAjl137E6lFkFXpFIh8sCvz34IEGaIoss9UMpJknYv
         2I8+6kjyJEF1ca9pHPrScB0gH4Lps/lmPyWQTATJEcasokdFaY5H07JJQF2pN4Pczb5/
         JFHQ==
X-Gm-Message-State: AAQBX9ftU0YvtRR8y30kTTGxaepcCT4HMlnCvubptZdpGcKchIZMcw5O
	89gMnjh/fcXKAzWiWwdD/efdql02w/1mwj8eYCk=
X-Google-Smtp-Source: AKy350aSW56DvcvzHs6QMZQy5Gjpxj41oej3pnklsr7JezBAG0P3kFdvxSaAbNcwpKyuu9JM/2rFNw==
X-Received: by 2002:a05:6a21:1518:b0:ef:53b5:fa01 with SMTP id nq24-20020a056a21151800b000ef53b5fa01mr18717714pzb.49.1682431091474;
        Tue, 25 Apr 2023 06:58:11 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b0051b930b2b49sm8229117pgv.72.2023.04.25.06.58.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 06:58:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/10] oeqa ping.py: fail test if target IP address has not been set
Date: Tue, 25 Apr 2023 03:57:40 -1000
Message-Id: <b14b8f38da9195852e9a2fd6b2e446ed8a1fa0b8.1682430831.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682430831.git.steve@sakoman.com>
References: <cover.1682430831.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 13:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180384

From: Mikko Rapeli <mikko.rapeli@linaro.org>

It is possible to call exported tests with --target-ip set to ":22"
where IP address is not set at all. Detect this case and fail the test
instead of calling ping without an IP address.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 17c995c53775b8cee279ca4ced916092067e1195)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/ping.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index fcb72d4543..f72460e7f3 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -17,6 +17,7 @@ class PingTest(OERuntimeTestCase):
     def test_ping(self):
         output = ''
         count = 0
+        self.assertNotEqual(len(self.target.ip), 0, msg="No target IP address set")
         try:
             while count < 5:
                 cmd = 'ping -c 1 %s' % self.target.ip
-- 
2.34.1


