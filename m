Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85599CCA47C
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 13:17:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.5979.1655212620761240563
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NJn/ZISS;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: ptsneves@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id n185so4628324wmn.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uAMPa++ia1KnffFugYvd8o2vuvtd+oNHzbTD5UJLnpo=;
        b=NJn/ZISS00qzyTdAmzu0/wN8B+7W6XU97VtFvv4KLwlcmW+JR9AZhRB6/pWWEwuk/s
         zJe78QqmG/V/Sjw/J/CmFn9hjNYFwk0mboPTmGROi8HPUM7ziLXojRj7AcGjr+HL2sKI
         IOlutcdxZtGFdnegR/4ULlwTW0r2rSZD3zyNoGZWek+Pk9VJ8YgkYRkMULsIAK9FPnQc
         qoP5hT88QwW2VUTustQ9hpSriYZC6hVmnLdm//3QF6DpTMTP4T2Ocm9UC3dUvraZjhPk
         HGqVbExQ87Xg28Px/8RQgsUl7gEUxwZbebbkMUpIyzFjRUHNpsQWj2H5w64aWSRMNccz
         xAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uAMPa++ia1KnffFugYvd8o2vuvtd+oNHzbTD5UJLnpo=;
        b=s1eC46w1r4e4zTVQgeqchcf+hkAHk/D4sWwBs5upzKFWoUMgNSI4fIeu3BYPVsKiyd
         wFZEEUkUQo1NzhK2BfdrL0CTDQB+dRWHNmqRo38IiASQr3sUF+PScFe04RrtQEO2B8i5
         PxBkciCkFSrtLtygAVxC3iWt8yT7iJLK7oieZsmnNzHVmu+y49G/1oIfAT5OQ9A641eC
         21G7kIq2D2aVDARndyq+jPg4BzAJoj6gMVCcX8VcdEy1HOvts/8of0ZKDkQA8VY5NghL
         0MFM685dSy9vMHGtO9mJ73gPxDc59UXIEGij95SFj+U/Q8bBsM9LI+QYjmrsXpMrtye9
         5NQQ==
X-Gm-Message-State: AOAM531fck4CCBWtaS2HPSgc7/NVwrD/0JuSO/v+Z73tDlYrzKXgC9+p
	89y2pXsPkfaVlYX4QKA0MKqN/m4gBA==
X-Google-Smtp-Source: 
 ABdhPJy84HNZe+idvvaFqhFM7d9vtKNbgZyj03px+uTM00nVoKKBF7oTDnoQetaapi/lcSSqvAk3hA==
X-Received: by 2002:a7b:c31a:0:b0:39c:4783:385e with SMTP id
 k26-20020a7bc31a000000b0039c4783385emr4187963wmj.185.1655212621131;
        Tue, 14 Jun 2022 06:17:01 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a5d6f0f000000b002183cf9cd69sm12161092wrb.15.2022.06.14.06.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 06:17:00 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v4 4/7] oeqa/selftest: Add test for shebang overflow
Date: Tue, 14 Jun 2022 15:16:49 +0200
Message-Id: <20220614131652.566471-4-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614131652.566471-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614131652.566471-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 13:17:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166885

Make sure we do not stage any executable with a bigger shebang
than 128. Fixes [1]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11053

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 .../sysroot-test/sysroot-shebang-test_1.0.bb         | 12 ++++++++++++
 meta/lib/oeqa/selftest/cases/sysroot.py              | 10 ++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb

diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb
new file mode 100644
index 0000000000..6c834be897
--- /dev/null
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Check that shebang does not exceed 128 characters"
+LICENSE = "CLOSED"
+INHIBIT_DEFAULT_DEPS = "1"
+
+EXCLUDE_FROM_WORLD = "1"
+do_install() {
+    install -d ${D}${bindir}
+    echo '#!BiM3cnVd1Amtv6PG+FynrQiVMbZnX5ELgF21q3EkuB+44JEGWtq8TvBJ7EGidfVs3eR3wVOUbLnjYDlKUWcm7YC/ute7f+KDHbwxziRUSUBZAUqgjiQdfQ0HnxajI0ozbM863E9JV9k13yZKYfh9/zR77Y6Dl4Dd3zOWS75LSpkAXV' > ${D}${bindir}/max-shebang
+    chmod 755 ${D}${bindir}/max-shebang
+}
+
+BBCLASSEXTEND = "native"
diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/selftest/cases/sysroot.py
index 315d1a61c2..9457f1e3ac 100644
--- a/meta/lib/oeqa/selftest/cases/sysroot.py
+++ b/meta/lib/oeqa/selftest/cases/sysroot.py
@@ -35,3 +35,13 @@ TESTSTRING:pn-sysroot-test-arch1 = "%s"
 TESTSTRING:pn-sysroot-test-arch2 = "%s"
 """ % (uuid1, uuid2))
         bitbake("sysroot-test")
+
+    def test_sysroot_max_shebang(self):
+        """
+        Summary:   Check max shebang triggers. To confirm [YOCTO #11053] is closed.
+        Expected:  Fail when a shebang bigger than the max shebang-size is reached.
+        Author:    Paulo Neves <ptsneves@gmail.com>
+        """
+        expected = "maximum shebang size exceeded, the maximum size is 128. [shebang-size]"
+        res = bitbake("sysroot-shebang-test-native -c populate_sysroot", ignore_status=True)
+        self.assertTrue(expected in res.output, msg=res.output)
-- 
2.25.1


