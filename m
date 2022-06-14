Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81D7C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 15:11:25 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.7359.1655219476200199454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 08:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bXl5Jv33;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id v14so11717744wra.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 08:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uAMPa++ia1KnffFugYvd8o2vuvtd+oNHzbTD5UJLnpo=;
        b=bXl5Jv338+CcHVSlfF4G5/BsE68GlLoz29bUM18bFpENsjMjLmZG5BacIwahdRA85s
         GULyyPJxgY0xQSTu5bjCHJhFdFWX23iqsLjkIzCvFIYrHpDGW2iwk8tH5uHWJDjrGe+3
         lRxCm3x7JqbHEThu7ZduDoCQtapRC73EbiAXgUWp0tgRqep3tKCWjV2NxNOHmucJic1S
         J9Vvhod8WzocnllYamo29ZUHX6OLGn83ywNOtjej7HU0UkKW+hJJ2klpmHkdQ0shZaMc
         4m8BPV0MB/Dzs9R48Obv3sN/BYnSYEnupNdcPbDB5cj4bOWo+jfQNmCgCxNrxKS7m6Eo
         vHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uAMPa++ia1KnffFugYvd8o2vuvtd+oNHzbTD5UJLnpo=;
        b=jelCSHLA4jiw4ERP2n1OQORQuaKq4E6CL6agB7hl7pGd0q1un7ye4K5ft66A+G6q13
         k5vZwkJwTcI9FACb67mMWBrdUtP68hZh27pmZHpBxqA2Cvo8CdrtMz93b8JNPtMmJhGI
         PKyuTC4tZUin7C6Hkl6nW6BMHXV6AJzXn6Ng5FTaqmt9JRhxTcz30B2ZTAWBe/V90N3u
         KeYUqNaxoKzucRRqtbR7pQRxqNzouKKFQ8Z9BDuO8QtQmKgBB5u0kHLcOaWNwfkBz+ak
         yr0vSYyG7g1jL6TnJgIJ+s6CO7dlE0aBbNMGXKi9/GgiuG6iy1gwr4b6rJCxnzRTYHd1
         GyYA==
X-Gm-Message-State: AJIora8x/Jo/IiGpS3BY2kJF+iKzSFG2dUdaX+pPvrYhms+iBqLGehe8
	P7ctTvnUiYaj/gjZjQID28A0yxjfJg==
X-Google-Smtp-Source: 
 AGRyM1tGVicbwVwDixgPV2s2y3gaMZRhOIR8thtm4hGfyOhY5V28vr8u/LFrQVoMtXm4Ag9PPsyCFQ==
X-Received: by 2002:a05:6000:1448:b0:219:ebf7:79ff with SMTP id
 v8-20020a056000144800b00219ebf779ffmr5585359wrx.70.1655219474633;
        Tue, 14 Jun 2022 08:11:14 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 h62-20020a1c2141000000b0039c151298b7sm18114522wmh.10.2022.06.14.08.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 08:11:14 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v5 4/7] oeqa/selftest: Add test for shebang overflow
Date: Tue, 14 Jun 2022 17:11:02 +0200
Message-Id: <20220614151105.1890454-4-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614151105.1890454-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614151105.1890454-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 15:11:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166898

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


