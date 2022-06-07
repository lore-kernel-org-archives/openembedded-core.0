Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2098CCA47C
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 15:11:51 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.13499.1654614702373657478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 08:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OVkt1bAo;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id w20so7160059lfa.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 08:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L214Ml3yzg5bNWzkvsSdrl1/Ke3TbE7wfxjnrdmaebs=;
        b=OVkt1bAozN1A68huMJBCod+aS6p9cE7mTjuG1eAiAP7Z+VvSeJ2zOlk7/wHddIXhh/
         WG+JCiofNeABvoGKt96YB3MnrYSg3sJFhATyS/XN6Lsbw2uovjFISEWv8U5iurJqqw7w
         jurnULKTHN8gF5tB/tO+hG5+TMyXANIdCL0fNE87fJU3tefV9ZwmXDwJcsUh4+0rO8sH
         a+7JynBQX4sv599mej/0Elxtu9MsPX1GZRhyAIG6Mk6Oswcm4zQ8KfdNkhfqbmV1mcuj
         uaQlvcYjQvH1wm1VJW9UtVAe91ytzvn/gu7UlhxinifSHH4aVtFZPnshaFbhmpoO7dwk
         ndrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L214Ml3yzg5bNWzkvsSdrl1/Ke3TbE7wfxjnrdmaebs=;
        b=c7RD5XIGDvJKO/AMEVs351vlYtW1EF/ySPxdg3QtiupFxaA+b0aCxN8p+iW9SL9IkX
         N2zx3E+S/IZsySX6DybFiX+pt+1X5j18/h7fJmOj6CXmsNd5UeRfWqOVw0PS1V6Vxx0u
         a0GCG4PjuYekAAT4UbHa1X4wJ8bEEifOgdTEQ5KSy6+Hlhk+35wtaiOthcVtE3iCHzxk
         jA+U//a0ob6dG9W7CPCss/uqZnJ9gRLMCZRL83DlhPDBdyiUIPrdz2mppMA/KX8JNumK
         eigC50z9jZFbPkoOH5oYy1CLOeWv5/bCF5AyDtrx3qRVckfukoLyCkOKh28pYClhBKcG
         rb3w==
X-Gm-Message-State: AOAM531SgfdV4AATJC1ASTCpKCrPuzJE1RAI9T3Rib2Q2bRXtbgyXdJl
	BGs6M0/NPQVWOsETCi5bBcf8zH0+uw==
X-Google-Smtp-Source: 
 ABdhPJws4Tt+L33g+vPHD/9ltmcRdihF3hOX6gGoEkOQ+oWlur4cCpq4vKQTbZtukGaoPHaIb26vag==
X-Received: by 2002:a05:6512:3284:b0:479:d2:4792 with SMTP id
 p4-20020a056512328400b0047900d24792mr21435450lfe.357.1654614705414;
        Tue, 07 Jun 2022 08:11:45 -0700 (PDT)
Received: from pneves-XPS-15-9550.sigma.local
 (85-128-83-172.static.ip.netia.com.pl. [85.128.83.172])
        by smtp.gmail.com with ESMTPSA id
 i8-20020a05651c120800b002556e0248dbsm2831089lja.124.2022.06.07.08.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 08:11:44 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v2 5/5] oeqa/selftest: Test staged .la and .pc files
Date: Tue,  7 Jun 2022 17:11:23 +0200
Message-Id: <20220607151123.3588947-5-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220607151123.3588947-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220607151123.3588947-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 15:11:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166674

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


