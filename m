Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C39C43334
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:20:57 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web08.22171.1655666450791947789
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mugu7U+F;
 spf=pass (domain: gmail.com, ip: 209.85.208.174,
 mailfrom: ptsneves@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id s10so9743255ljh.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vlqA5dxz2imy3ZEoQfzVrOYZGick1Bh7QMLhND6Ie7s=;
        b=Mugu7U+FRbR5fEOkWWXmFl2jDEuZI5kC0ShCVmWRFEwHXhvFo1O8COZ3xswE7cmIEe
         uq7+nUULLRDatveBRXFItLem88+FGc6/4BP0uE7zZkMZb2FX42xP/LOM5KPCxBT+2rse
         SUCxDLEhK+8xiGLcOe/EHGgPZNsoMzCdXv094ouVSEW+LzoWRj3gZoj5y6T5HMvrzvnW
         2eK9OJrxPZXtt9Jg61rIrdBElXtnWLOOs/g/sOoyfEo29M+YEXEOR6D8gqXhYF6yRZqH
         QlC22BSTQaLYVvxuPpMLPz9jqPr57L0Zjaqb5T+8E3Lru1xfguo1YbkW1V9+kp7lIjxq
         z9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vlqA5dxz2imy3ZEoQfzVrOYZGick1Bh7QMLhND6Ie7s=;
        b=tFbwZCODg0oO8nu02a4KAswnrS+lkjjfOU2NA6t3X29xJup3MFXkNv0TMZuYcpBMjD
         0G8AIOKWuoPsU4GqY5kh/relU5TUjsZoXZJKqqZCvyVLhK866ZR9cvBZUiZh/wRdHxiy
         f20Eqihx6rlDgxlEewBbZ+ii/2LFRm61Pklmz9+bigICefBk5QIIDme2hIa6QfDYuveu
         57+iQlZssBfV7Re4uD5P3JuP5UdfLGzs1yVpi1EL5Xy+860DlDUIHIGSpBm4/xtiXoon
         OBAqV5Kb6QITpBkMvPQPsCqZDE2tYCWyTLbvv6D7xHNKm5ONSHz4RVs2i51UfIJlVMQH
         zF9g==
X-Gm-Message-State: AJIora8pr71qawORj0Vvi0IYczn8JP8oeDxziGmqoCDZUedCfdyj9S5M
	iThpKTYUKzRnKC4zRlccS5ZuYvjTyw==
X-Google-Smtp-Source: 
 AGRyM1t81hSTuzG4eSDY4vfA+qCHmiaRvzzXEYq8uagMvXYzfXcl1EwkZaGB3Ie0wvxmA4fd8YGYAA==
X-Received: by 2002:a05:651c:1417:b0:258:df6a:731e with SMTP id
 u23-20020a05651c141700b00258df6a731emr10152338lje.129.1655666449146;
        Sun, 19 Jun 2022 12:20:49 -0700 (PDT)
Received: from pneves-XPS-15-9550.home (83.11.57.73.ipv4.supernova.orange.pl.
 [83.11.57.73])
        by smtp.gmail.com with ESMTPSA id
 k1-20020a2eb741000000b0025a59470621sm817020ljo.26.2022.06.19.12.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:20:48 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v6 5/7] oeqa/selftest: Test staged .la and .pc files
Date: Sun, 19 Jun 2022 21:20:39 +0200
Message-Id: <20220619192041.1113263-5-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220619192041.1113263-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220619192041.1113263-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:20:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167043

These files are checked by qa_check_staged but there was no
test cases for whether the tests actually worked. Now there
are.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 .../sysroot-test/sysroot-la-test_1.0.bb       | 16 +++++++++
 .../sysroot-test/sysroot-pc-test_1.0.bb       | 12 +++++++
 meta/lib/oeqa/selftest/cases/sysroot.py       | 36 +++++++++++++++++++
 3 files changed, 64 insertions(+)
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
index a17fd1818a..294ba4a4a0 100644
--- a/meta/lib/oeqa/selftest/cases/sysroot.py
+++ b/meta/lib/oeqa/selftest/cases/sysroot.py
@@ -46,3 +46,39 @@ TESTSTRING:pn-sysroot-test-arch2 = "%s"
         res = bitbake("sysroot-shebang-test-native -c populate_sysroot", ignore_status=True)
         self.assertTrue(expected in res.output, msg=res.output)
         self.assertTrue(res.status != 0)
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
+        self.assertTrue(res.status != 0)
+
+        res = bitbake("sysroot-la-test-native -c populate_sysroot", ignore_status=True)
+        self.assertTrue(expected in res.output, msg=res.output)
+        self.assertTrue('[la]' in res.output, msg=res.output)
+        self.assertTrue(res.status != 0)
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
+        self.assertTrue(res.status != 0)
+
+        res = bitbake("sysroot-pc-test-native -c populate_sysroot", ignore_status=True)
+        self.assertTrue(expected in res.output, msg=res.output)
+        self.assertTrue('[pkgconfig]' in res.output, msg=res.output)
+        self.assertTrue(res.status != 0)
-- 
2.25.1


