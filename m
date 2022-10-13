Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F3EC43217
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 16:37:27 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.98.1665679038266229915
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 09:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6cKVGT9k;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id i6so2264254pli.12
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 09:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZNYaK1I/R1fyrg+z/qp74cnuMP7dZV4dd/WUM1rg28=;
        b=6cKVGT9kWBUKZosY8N81V5KME/k+5o7tl+JRGDwTFK4aU0j+1346eqB1Edx8KUiKN8
         2hk6Lv3l95xxuFfjhU4E/7CZNaSB54CMc0b/mjfq41cDyCxC+JXZ+rTcwf44Dr4SlVKe
         IQGn1VnpX1YYXYBAIhoheyDz46ooYhbNliM9LKbmZHJRYSl1B9yxVeJP1kd7XEh7KW0O
         cYJ4HIOkwzLkprZl5vggFf5foNfcURHrwnZCxzHBoOIPS5jyXKa8iecRpSbyHvVax9rL
         9Gu2uYrD/yIDpKKGEo+n4ztTdKsIlhpLcUWU06dm8Y6XNrxr1meIbGvCBB7eV1tAus0E
         lT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZNYaK1I/R1fyrg+z/qp74cnuMP7dZV4dd/WUM1rg28=;
        b=PbppmVpOApYYICRjxPYYksKcDJxEfhpE4Jx3vAhXvaml49TC955nkwzg9j5FpS3j/P
         24Zn7BTIsSmF5MqVNvZgLerLeOqw9TYXtDNju4/XFnmL4Oe8sZRI9dV3cJHireddJlUq
         6vu/7bTZlaWqn4DNONxhvztpxdSQ/Nb+y4yix9Y7OQ2VQsr2wzORrvQ1+rruRbt3PjEt
         0Vsw6AzsXibE/kS6362ot5A8ih7abHtV8DXwsdVV7c52UNzo5noG7OOIpg6ZQcoTdAhE
         41tRWPyKf5o/ibRn6lFNiyn8mSZ+Z5Sq6zJCgkDOvnAWIW1lGbWBIebz0R37Is0zLrof
         1OYg==
X-Gm-Message-State: ACrzQf2egK2aFo9G6cwYEj1Emw/5nEA4Ch6rxXFQZ7Sj+oi9iagXEUL/
	1nrZSESLZmTOPi9fgIcDUdogi9ZtVEhPm3fW
X-Google-Smtp-Source: AMsMyM51lGW8fnyp+53dTch6ietLmNBHRD+FlLSyOn+PQQA6z5DBtsUuTHxc+U6nDpwgNGmPE0tD9A==
X-Received: by 2002:a17:902:6945:b0:17b:f38b:900f with SMTP id k5-20020a170902694500b0017bf38b900fmr500377plt.85.1665679037366;
        Thu, 13 Oct 2022 09:37:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d29-20020a634f1d000000b0043a09d5c32bsm3460615pgb.74.2022.10.13.09.37.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 09:37:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/9] selftest: skip virgl test on ubuntu 22.04
Date: Thu, 13 Oct 2022 06:36:51 -1000
Message-Id: <8f53bba4936b79dfe8dfa30216990b3d440150a7.1665678874.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665678874.git.steve@sakoman.com>
References: <cover.1665678874.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 16:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171712

This test will fail any time the host has libdrm > 2.4.107

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index df11984713..399727de49 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -191,6 +191,8 @@ class TestImage(OESelftestTestCase):
             self.skipTest('virgl isn\'t working with Fedora 36')
         if distro and distro == 'opensuseleap-15.0':
             self.skipTest('virgl isn\'t working with Opensuse 15.0')
+        if distro and distro == 'ubuntu-22.04':
+            self.skipTest('virgl isn\'t working with Ubuntu 22.04')
 
         qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-system-native')
         sdl_packageconfig = get_bb_var('PACKAGECONFIG', 'libsdl2-native')
-- 
2.25.1


