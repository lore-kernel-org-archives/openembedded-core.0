Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F918CCA47A
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 13:17:05 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.5972.1655212623753104710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m59Yphms;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id h19so8028405wrc.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L214Ml3yzg5bNWzkvsSdrl1/Ke3TbE7wfxjnrdmaebs=;
        b=m59YphmsvSyQoLGlMVSWgOv2w9QB3k1vDIlKNpbX39ybolizhshhDr9l+y8WPy5uGQ
         B83LqEDfQapW9iI/gpqbzoH8kimyV6sUHgyVMYdlnMpC3Bw8qzOLD0RZrEbZtFLh4yTP
         CcQnBOaIpJeMTxzSMvnUPDLthybEACLwjdakjl/BqKm/Bakaum2SKHeOi4UYOPa7zYkE
         N5WudFg7qMzvBskzpxg9AnvgvB4zzsjArfBXZnZHADcTzfP49diU+Q2GsY1POrJTgreM
         jPH+9qmVlVx2xIDBYD7tzw0oM4SPVBBq0399TPzFrketUL5SIJjWe97YHlOrkl6l/INI
         AjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L214Ml3yzg5bNWzkvsSdrl1/Ke3TbE7wfxjnrdmaebs=;
        b=PpOjVkdCd7MIHmsCdtbTMu2WJVGpwkjt87hsnIV+4DdGNAPkS572jmP9upKvp8eOjd
         e79TK9WoXm//qTKzEvSesQtydQOqdxnDR4yBOCpsfmkYDUuWtC/44MLiQDA//dmYCvfU
         W1Wn20mtnlNKUw8Ipm2GdNfP29JghNQUMuXNu4+WATMx/37Y6ue3ryXt0VQ1oHqauAxM
         BdG1Gm0D2jMYCyq429HiKGrJxhex4JWjjGb+EIIlHrf+oM4ZYe20V3U6tFoROBSnA42e
         ydRJB4k/qmCej4AFUA6YYwDrZhqlE94Q5B1TCeybpInhDieZ2o+J/Dzw/F9Zbkqka8AX
         cQDA==
X-Gm-Message-State: AJIora8T0xL6onWjFEs0re+kOaCvKsuq1t+NrfHA1ckKcrlJrNwJe3jH
	y6sfjUcIfX1i3jJ96adTc8EcMO97QA==
X-Google-Smtp-Source: 
 AGRyM1vudOo0wNBqjGbxvUogcF9jy3b+wO9K7PsfmArb01vkr/tO8+gc7pbEtIaNoXDc/plLAPhvkQ==
X-Received: by 2002:a5d:4289:0:b0:219:fd71:a9f7 with SMTP id
 k9-20020a5d4289000000b00219fd71a9f7mr4742197wrq.9.1655212622082;
        Tue, 14 Jun 2022 06:17:02 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a5d6f0f000000b002183cf9cd69sm12161092wrb.15.2022.06.14.06.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 06:17:01 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v4 5/7] oeqa/selftest: Test staged .la and .pc files
Date: Tue, 14 Jun 2022 15:16:50 +0200
Message-Id: <20220614131652.566471-5-ptsneves@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/166886

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


