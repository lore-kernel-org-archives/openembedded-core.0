Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122F5C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 15:37:13 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.12505.1639409832788648145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=5S6NG7vg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id u17so11411405plg.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2A0LLg20upClIJTQ3nuQ/e36UWeO80gJwgYiaS50qj4=;
        b=5S6NG7vg0L5C5ZQs3rrV69zKeMWsCFrmH50rHMijHbG+IXhshc8MCTmi5b7l9fTRfT
         /uZmRuGGTYT27mFBWM1x5Fzdb1XdSAWXYe5vaxRa6TEVdCcXr5IC0yG7EfrN38MwATLe
         YnPZ5PJFSK4heWOAUOnkLSKPohBFOcGqdjFpJqyfzbOSny5i7RUBpQTOGMrcyZjpSYP7
         178E8hkTvTnfznPye52bslRnnkP/SUj+76q0fF7jRZ6PgAeK8LjzV7DLHjc9VBxqcTcU
         aL4mr5v3rH9EeFc1xnmxJhSIzwj67iL46XW4RAgD7HnzNkhlvGhM9m/abWtwRsEMRJbF
         5Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2A0LLg20upClIJTQ3nuQ/e36UWeO80gJwgYiaS50qj4=;
        b=agxiQuA1qottxWySkoXt6EHMkxlrgpP7FYI+mLfboJpsAVlQ+myErczCDaTUF3+wXM
         Y8l4d9TEBX6naL26IYmQXy4qNntaa/1ghwLWSaAXZJAz4s3DmYLZO4MZ/JCO2FEXpRsh
         qYHrda5IU5PG8KkBnfWwwuISBLNhtmufkFEawfXDRu8Rwu/Xi6lFxvtIWY2w4cfKaMG6
         TLZvwvm4JGKdWaP7a4WRkPrcTG1jTBFQ+9Siyjtj/M2K0tMjSIIm1fVIzzFRorb3UjY1
         AUuL3SarTEDTMNpH3lPQqALJdp3+o8U5knesztlMI4AoBIX/PfpDJTBSUcex2JlozMI/
         LeaA==
X-Gm-Message-State: AOAM531jyUf2+YiNA7uWf5pUqKkTPtRCSSvAK5L0vkjas1qnLqZw5Nd7
	lGnFyun0M9uD+KHMNfTpCh3IPOxOxXGaxyXy
X-Google-Smtp-Source: 
 ABdhPJzQ8HbfV9TuRTc16tkg9kX+5N5QRhkw7yAZvRuZtkWy5T1beIFNMZ4y11Xb4nYZ/nM1Y5XD5Q==
X-Received: by 2002:a17:90b:128e:: with SMTP id
 fw14mr45812332pjb.173.1639409831757;
        Mon, 13 Dec 2021 07:37:11 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y28sm12850297pfa.208.2021.12.13.07.37.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 07:37:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/10] selftest: skip virgl test on centos 8
 entirely
Date: Mon, 13 Dec 2021 05:36:28 -1000
Message-Id: 
 <74bb94a7d249b5c53f3e1d15688a3a323fc8e828.1639409496.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639409496.git.steve@sakoman.com>
References: <cover.1639409496.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 15:37:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159653

With the sdl frontend, qemu isn't able to even boot fully,
so let's skip the test early.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 1c935da919..9e5c3f2878 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -179,6 +179,8 @@ class TestImage(OESelftestTestCase):
             self.skipTest('virgl isn\'t working with Debian 8')
         if distro and distro == 'centos-7':
             self.skipTest('virgl isn\'t working with Centos 7')
+        if distro and distro == 'centos-8':
+            self.skipTest('virgl isn\'t working with Centos 8')
         if distro and distro == 'opensuseleap-15.0':
             self.skipTest('virgl isn\'t working with Opensuse 15.0')
 
-- 
2.25.1


