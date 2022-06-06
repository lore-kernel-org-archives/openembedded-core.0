Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC61C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 15:58:25 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.9.1654531099233859382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 08:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AtbRC66q;
 spf=pass (domain: gmail.com, ip: 209.85.208.169,
 mailfrom: ptsneves@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id b7so3715637ljr.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 08:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AwuFuVIotauytERcW3KjdycidVWpyW/0IL4KZRC/B5E=;
        b=AtbRC66qGPOI4A9qAJnLFk3TdNc9pgJ6lG7BVFBgNXz9DGsfV1rUBpgKR+lLy8slYz
         RP+cYgf/TBa1dXr3R+rovkz70eXtjvYOTyjrX6cQyy2aYwpLxvnFhxnG21jopFl4/9aR
         N+n2B3kQgImsgPom5UoLFDAaDSV77NSx6Igxz58Mox5FnJZHxR3FiJmWzoLStAVyIWTj
         YzkxuTpdyCDQEEk/mg4EZaH4nwV69jx0nMQmhiHo9tdrnga0Qoo57/+bK02JSuTnMN/q
         P+x1YuuuTQ+a1ZXJ7T4IYs6//rGZh5DOmzaeljWr+CG5X7N9/zuFUYZjHQ+L8ckktUIu
         FONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AwuFuVIotauytERcW3KjdycidVWpyW/0IL4KZRC/B5E=;
        b=HSM4DZPPHO2u+TFe8ymJ8IOjlH//bdI3gP3gkuwsTBgoz8Nw8FwTXjK8ZqFjBrUsQl
         mcYyA6g9jkAFQh+XSoV4lkcumemCsD8OHrl73v+RzmPEIqGt7v4LSrImyotWx+E0qDQT
         afq78CUVK7ZBWxBE0sjPq2WKl7HP3W0Q/f6Fa4cQSBppKxn4eDEYHkAEvi06rZSzAw0n
         zZ4OuOVsATzJTvqQwI/uJaR4gpwjIJPlf05Ti4vgzIm2qrBZSmchg4pgffbX0OMGDNCE
         kG6brwAUwl3cLa4FspwNorRzBsVKk6KRIuTcuzyB9K+HofjpAqATAiM7JUq9Z7dKrwV+
         QjSQ==
X-Gm-Message-State: AOAM530PwNapBB/H49SN3Jx9YxnFqpw1ZELxdGyTs/hLvSSFBhF7Y+o8
	pA1njIpy+vfVqOd0XgSZXgGGmzIiTQ==
X-Google-Smtp-Source: 
 ABdhPJzBHUvXcvcxwvxNQ8uqTC3p3Sao3nnJjUx0q5DrPWT4CSHCN2ukxwDp9nT8MbxLfhR4xNLjBA==
X-Received: by 2002:a2e:8919:0:b0:255:5b60:e8b7 with SMTP id
 d25-20020a2e8919000000b002555b60e8b7mr18962880lji.294.1654531099736;
        Mon, 06 Jun 2022 08:58:19 -0700 (PDT)
Received: from pneves-XPS-15-9550.sigma.local
 (85-128-83-172.static.ip.netia.com.pl. [85.128.83.172])
        by smtp.gmail.com with ESMTPSA id
 l10-20020a056512110a00b004791c4858e0sm1595074lfg.114.2022.06.06.08.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:58:19 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH 3/3] oeqa/selftest: Test staged .la and .pc files
Date: Mon,  6 Jun 2022 17:58:07 +0200
Message-Id: <20220606155807.1414519-3-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606155807.1414519-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 15:58:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166653

These files are checked by qa_check_staged but there was no
test cases for whether the tests actually worked. Now there
are.
---
 .../sysroot-test/sysroot-la-test_1.0.bb       | 16 ++++++++++
 .../sysroot-test/sysroot-pc-test_1.0.bb       | 12 +++++++
 meta/lib/oeqa/selftest/cases/sysroot.py       | 32 +++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 meta-selftest/recipes-test/sysroot-test/sysroot-la-test_1.0.bb
 create mode 100644 meta-selftest/recipes-test/sysroot-test/sysroot-pc-test_1.0.bb

diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-la-test_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-la-test_1.0.bb
new file mode 100644
index 0000000000..21f06782fb
--- /dev/null
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-la-test_1.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Produce a broken la file"
+LICENSE = "CLOSED"
+INHIBIT_DEFAULT_DEPS = "1"
+
+EXCLUDE_FROM_WORLD = "1"
+
+# remove-libtool.bbclass is inherited by default and removes all
+# .la files which for this test we specifically do not want.
+REMOVE_LIBTOOL_LA = "0"
+
+do_install() {
+    install -d ${D}${libdir}/test/
+    echo '${WORKDIR}' > ${D}${libdir}/test/la-test.la
+}
+
+BBCLASSEXTEND += "native"
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-pc-test_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-pc-test_1.0.bb
new file mode 100644
index 0000000000..e748310fc4
--- /dev/null
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-pc-test_1.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Produce a broken pc file"
+LICENSE = "CLOSED"
+INHIBIT_DEFAULT_DEPS = "1"
+
+EXCLUDE_FROM_WORLD = "1"
+
+do_install() {
+    install -d ${D}${libdir}/test/
+    echo '${WORKDIR}' > ${D}${libdir}/test/test.pc
+}
+
+BBCLASSEXTEND += "native"
diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/selftest/cases/sysroot.py
index 9457f1e3ac..588fc8c713 100644
--- a/meta/lib/oeqa/selftest/cases/sysroot.py
+++ b/meta/lib/oeqa/selftest/cases/sysroot.py
@@ -45,3 +45,35 @@ TESTSTRING:pn-sysroot-test-arch2 = "%s"
         expected = "maximum shebang size exceeded, the maximum size is 128. [shebang-size]"
         res = bitbake("sysroot-shebang-test-native -c populate_sysroot", ignore_status=True)
         self.assertTrue(expected in res.output, msg=res.output)
+
+    def test_sysroot_la(self):
+        """
+        Summary:   Check that workdir paths are not contained in .la files.
+        Expected:  Fail when a workdir path is found in the file content.
+        Author:    Paulo Neves <ptsneves@gmail.com>
+        """
+        expected = "la-test.la failed sanity test (workdir) in path"
+
+        res = bitbake("sysroot-la-test -c populate_sysroot", ignore_status=True)
+        self.assertTrue(expected in res.output, msg=res.output)
+        self.assertTrue('[la]' in res.output, msg=res.output)
+
+        res = bitbake("sysroot-la-test-native -c populate_sysroot", ignore_status=True)
+        self.assertTrue(expected in res.output, msg=res.output)
+        self.assertTrue('[la]' in res.output, msg=res.output)
+
+    def test_sysroot_pkgconfig(self):
+        """
+        Summary:   Check that tmpdir paths are not contained in .pc files.
+        Expected:  Fail when a tmpdir path is found in the file content.
+        Author:    Paulo Neves <ptsneves@gmail.com>
+        """
+        expected = "test.pc failed sanity test (tmpdir) in path"
+
+        res = bitbake("sysroot-pc-test -c populate_sysroot", ignore_status=True)
+        self.assertTrue('[pkgconfig]' in res.output, msg=res.output)
+        self.assertTrue(expected in res.output, msg=res.output)
+
+        res = bitbake("sysroot-pc-test-native -c populate_sysroot", ignore_status=True)
+        self.assertTrue(expected in res.output, msg=res.output)
+        self.assertTrue('[pkgconfig]' in res.output, msg=res.output)
-- 
2.25.1


