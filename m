Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1389DCCA47F
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 21:43:32 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.32766.1654897406672966664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 14:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TH9Z4y/r;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id o16so196863wra.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 14:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L214Ml3yzg5bNWzkvsSdrl1/Ke3TbE7wfxjnrdmaebs=;
        b=TH9Z4y/rJIKYF5uV6hispDItl/mFPO4AUBAAvQd1UEaZmM2du1Kjm/OYJh0aZhb84L
         lrg1i3i1tAuwc/WRvsEdlSHq2HR/LchNv33QcXVcX+6fZAKZrSAR6XEC/14SfE2mV9ci
         f/JOw4y711Gj6l01KpO5ejiV1FunwZYwRUNwpFWTZOs7eUMxex4XhSl7v5J+L8Bu5M2Z
         fETHM0lRPF3SYWyaqnzNJGod1lo2fpy+/DL8HX8jHBp45Ub+G3x7vaXrzQpQS44AFaAF
         01eBKcAOgeiMknhDsRMIN2GqJlSETm0F4pIANhqmbvMViYM4rxnJZoKf0nbj8IOkHEeG
         aYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L214Ml3yzg5bNWzkvsSdrl1/Ke3TbE7wfxjnrdmaebs=;
        b=AWJrUYVgqDt+Wf/xUpTjBoZx+8a+UDQsNU8WFBUBd3qQDXvoo6gpu/uU7a+u4UaxNk
         rY7RVTwkhBq9qx+zKKFx83Z+/IZN/fenC6sgOBxIhFOy/iVBZHXy6wPoeHdPO2fmzb3D
         gg3L2gMZpiGxWXyA2NyiqGg9JDNV4toodsFp+X70GsC3solN6upR6fOvUz/x3rV2raZA
         iHRgGCX+vPUAqbDthS68FEU0rPLwnaXkGFxoR/asH7rylttSyc/yNFIU6PyCjzfXDa+k
         j7NTIvnm3Yd4f+tzycuJ8QmXJ2BzWZpxdmJx8/pD6E7hmgVRDHd5Vjq1f2jKRDbQWFXQ
         EtGg==
X-Gm-Message-State: AOAM530nOtEuy77pgayd09CcAXtjI48QC9IFxdCwuDVE+6o3+dH+Us+B
	wjdfOIDGgD2qG8XLNP/dt6ssOBkCUA==
X-Google-Smtp-Source: 
 ABdhPJzCDou6Asw1n3pLqsOU72o2C5KWG0JjzASzIZdlz5gn9gGj9FM6e6DLxQh7MmlH8E0jVoRqRQ==
X-Received: by 2002:a05:6000:1841:b0:218:be20:a1b7 with SMTP id
 c1-20020a056000184100b00218be20a1b7mr14745025wri.390.1654897405186;
        Fri, 10 Jun 2022 14:43:25 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 e15-20020adfe7cf000000b0020feb9c44c2sm579309wrn.20.2022.06.10.14.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 14:43:24 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v3 5/7] oeqa/selftest: Test staged .la and .pc files
Date: Fri, 10 Jun 2022 23:43:12 +0200
Message-Id: <20220610214314.2754247-5-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610214314.2754247-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220610214314.2754247-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 21:43:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166817

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


