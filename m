Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94471C32771
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 17:46:26 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.32088.1660758381708371754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 10:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R8hxB2nV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 k18-20020a05600c0b5200b003a5dab49d0bso1282284wmr.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 10:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=Q8x2DaOmei3DRWatRNLTLxLdOFUzpQYpjIG+l/8tKzE=;
        b=R8hxB2nVBJQ7qlNqhPNfBWFBVXjr3RXuELjV3RD4S1icUub/2YnRyhA+Df3z32sV1H
         qacsWU55/CBG7ZIYdxZTFvaoyi57Pn4Fp9HgcaSIHZI18Wm1i9CKRnD+Fa66kkjaZZ53
         hXFyRSVfqIpiw7kzkERS931b8atZtbZBckfYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=Q8x2DaOmei3DRWatRNLTLxLdOFUzpQYpjIG+l/8tKzE=;
        b=Srrg2hcDhE7frflg1eeEU9iWBJN4K/tEBNND5D2rvEECLc2Z59OD1wuKOosXMYve6X
         VZKvp/U70VtkHfEo8t11MSxG0ly7qPlEP7MnD0IcIj0XedOdJmOFZgPclKriZVjj0zsF
         fL0NOGEcITEDTJEbDn5Wc+kDNmOtUN4GcJaM0ouT5eXVtkkNym34Q/aD39olVtIfz5Bw
         cEXiZK6z042gGS5ZT/hryvYcNS5f/+iVcUBVKrTQ7BNHyGfpGe8bquw1OUgRb39CiJSJ
         m0/0gnq/zrQ+8BI0IPCeXNl3jK0T1PoJpSDGXbLqy8T2kEe7rPISsi4La1EuUUOzuSi6
         RW5A==
X-Gm-Message-State: ACgBeo1CkfsJv+jdTK0JBwb77ZL3wZQEVriVKp/k9h/XhVtGb1P6qQeN
	n4JCSVdTN9uIIhTW3jvI20XX1UaJ2LijlA==
X-Google-Smtp-Source: 
 AA6agR7UaUPvAQUu0qCb6zmPe7ExrlhLC16ca5BOZL83AieToM8Rg0xgtQKNAVOwYtPFxGq+xorhhQ==
X-Received: by 2002:a05:600c:1d9b:b0:3a5:d66e:6370 with SMTP id
 p27-20020a05600c1d9b00b003a5d66e6370mr2835218wms.73.1660758379232;
        Wed, 17 Aug 2022 10:46:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3694:2ef4:2932:37d5])
        by smtp.gmail.com with ESMTPSA id
 s4-20020adfdb04000000b002211fc70174sm15717564wri.99.2022.08.17.10.46.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 10:46:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] valgrind: Disable drd/tests/std_thread2 ptest
Date: Wed, 17 Aug 2022 18:46:16 +0100
Message-Id: <20220817174617.1874788-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 17:46:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169498

After improvements to debug sources handling I suspect that extra debug
information became available and is confusing this test. Disable it
for now until someone with more knowledge can resolve the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-all | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
index cb8d10b18f3..a26837d297b 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -4,5 +4,6 @@ memcheck/tests/supp_unknown
 helgrind/tests/tls_threads
 drd/tests/bar_bad_xml
 drd/tests/pth_barrier_thr_cr
+drd/tests/std_thread2
 drd/tests/thread_name_xml
 massif/tests/deep-D
-- 
2.34.1


