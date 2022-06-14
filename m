Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C9DCCA47A
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 15:11:25 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.7467.1655219476933957674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 08:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YU0TvCuC;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id u8so11678384wrm.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 08:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L214Ml3yzg5bNWzkvsSdrl1/Ke3TbE7wfxjnrdmaebs=;
        b=YU0TvCuCTP7HQoiFSqHhuY+sLO4D2bJgoW71nJDwb1tcXT57v7nGMcwRLH7p2f7oLZ
         Ln3ArZPaFBoK5xfsJYsYJpC222UFFG9z5mDgP4FlfhwN4hlleaXFZ9xf0gQFnE51i9bY
         Kv6/dlN3jTE0WS1nqjvQXM4Qlm7oMF1kvL9amLXsjIFPBDW7Jj7dKewSD3Bd2HQsMY8P
         it4okAIO0piiDBdCC36FETFq2u5oq/SAlPt+9c9idqqnILyYUpW5AaC3zAKGI/l9sPLP
         r5wtOGyG7IOy041ihGMpnNyTC+XQklN2JYGjMNv9iSeQsDGQnJnQ/MTeuJRXTVym+YO8
         3PhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L214Ml3yzg5bNWzkvsSdrl1/Ke3TbE7wfxjnrdmaebs=;
        b=ZoVFdpzeClQm7zOyYDsixNfiw/fXxS2WJGSDavPOuBIrb04gbv665GEDAgT1TKY6mf
         2njDDFWD3CPzInYCoIpXtgnZsQHntOo4Ty0DdaMkbStjga33dCt1RaLsGNHfBpOCS0MA
         iHejMwJHmGJ2+HkHoWfCq+wx744abnSjlxutZ+gXjAmoUfnX5A21ztut/cONty0+gdAU
         fZDNhPZjyuz0O+h/RjCum1szNCG2C3/S7U4OdmUVk1vrLpsiEiKwRj5HsjbtngbY2af3
         9lNunPjPz9CWOeZ6ykCqCawgLCxZn8AY5hFmnn/+btdWVovtVpBjeDD0NqSsLbNUjAON
         EJBw==
X-Gm-Message-State: AJIora8fSzh7+0uz3VqZuDpnmf1ofVD1HVl2/tEQH54d1AIKo3dCHpV+
	XYAK3OhhHy3/ksKlu4RlaPlBgYcVDw==
X-Google-Smtp-Source: 
 AGRyM1txbWMa6TNmt1P6j86mELwvRo3F8mBcrNjIpYI+6D2EYugWfCfv8wkpPj9EJUOmUPz2+8kFEw==
X-Received: by 2002:adf:e181:0:b0:213:bbe1:ba66 with SMTP id
 az1-20020adfe181000000b00213bbe1ba66mr5006889wrb.325.1655219475536;
        Tue, 14 Jun 2022 08:11:15 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 h62-20020a1c2141000000b0039c151298b7sm18114522wmh.10.2022.06.14.08.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 08:11:15 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v5 5/7] oeqa/selftest: Test staged .la and .pc files
Date: Tue, 14 Jun 2022 17:11:03 +0200
Message-Id: <20220614151105.1890454-5-ptsneves@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/166899

These files are checked by qa_check_staged but there was no
test cases for whether the tests actually worked. Now there
are.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
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


