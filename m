Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882D6C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:42:07 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.44254.1676990521544338934
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=RekSQt23;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id f11so2674796pfe.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxTZRwZIuS0BJgo+EoYKHb90T0klFAF7USleuLJ2eQs=;
        b=RekSQt23TbC0P4A0G+JYNjUVk1HLhtLEdLbbLjoOEOQFwBm23ZVJcxeub8lg02/B8p
         JApBPP2F7JO/SAty05z2CLfR2pVIQhmhKRy3NdwIiPnndQuoIc4BYkI/aFdgVjlEkNEg
         g9Hdsfveze5IYfyKFhUqgnn4lYMeeeUmOpfe7J5k6P+HzBuqzaLKrRq8Gse/ojqP/NZC
         Qzmx15k91mSezgS7Sb7lXbaZcxYHD49ZFEYgHScM9CKRCLdkYyxZvAxie9VdkDwseRrS
         j97rqZ4lq/jC0oqAKqzIJ8A6OGAZtkndXG0oBIN04magwYgmOBqXvWJuaoQ+gdfaK3cx
         MoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxTZRwZIuS0BJgo+EoYKHb90T0klFAF7USleuLJ2eQs=;
        b=1dAN577glLUcvBfR2sYgD2a9pPdpCDRVOAPKljL11cMW40oR2+i+kH6gnWgap93GnR
         35LZlo1hWr13Ug5x2EDfidsvU9f7liCiolHg1ABalJ1vMXlNWk6KRhb5W2aAW4i67Rkb
         csckb6digOkbKsvcj8tZ1FiKfDVCnjkuVCqJTH6wCEOmwyGQSfH3xHyWysFDFR1tSrnP
         s1IlbZa792IRwyzDk1rpitvx+VdOcs9AA7ksvdteCDr5bLv/D1vGe4UnB9JZPNzPZw0d
         c0Bk6+JZi5n0fOrhPBfBcNCcY76SgCflNDknI2etljeDUwqCQ0GH5GaF4VDQsqs8imhZ
         O/Bg==
X-Gm-Message-State: AO0yUKUTSpsDavqyGEhng0K7XKVMUKPh0JHc4TL/2wMIv2EXbUM26hSU
	RL8iGgTUvRjZGd7wl6E37Lv6+YgrBt0ml4T9Q1g=
X-Google-Smtp-Source: AK7set8fA7Ynby6vL1FtDVTOI5GkA/yorsuxn6+WYliuGUlnYwOQ3S0UzqUalENK5rwPWt7YYhMltg==
X-Received: by 2002:a05:6a00:4194:b0:5a8:cc39:fc58 with SMTP id ca20-20020a056a00419400b005a8cc39fc58mr5251087pfb.6.1676990520538;
        Tue, 21 Feb 2023 06:42:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:42:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/23] oeqa/selftest/bbtests: Update message lookup for test_git_unpack_nonetwork_fail
Date: Tue, 21 Feb 2023 04:41:06 -1000
Message-Id: <6b50713cd51002584915f46eb366b8667db210ea.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177523

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

bitbake's output changed, update the test

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e64b63f96dd1d71e263e7bbbe6591e51e98395a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index cfac7afcf4..b42bbb651d 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -350,4 +350,4 @@ INHERIT:remove = \"report-error\"
         self.write_config("DISTROOVERRIDES .= \":gitunpack-enable-recipe\"")
 
         result = bitbake('gitunpackoffline-fail -c fetch', ignore_status=True)
-        self.assertTrue("Recipe uses a floating tag/branch without a fixed SRCREV" in result.output, msg = "Recipe without PV set to SRCPV should have failed: %s" % result.output)
+        self.assertTrue(re.search("Recipe uses a floating tag/branch .* for repo .* without a fixed SRCREV yet doesn't call bb.fetch2.get_srcrev()", result.output), msg = "Recipe without PV set to SRCPV should have failed: %s" % result.output)
-- 
2.34.1


