Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21BBCCA481
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:20:57 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.21876.1655666450103501973
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZGDXVKnu;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: ptsneves@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id c30so9756359ljr.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=392+RXmZfikf1YBZaZ0odEAyz2CKeDAcxq+2kA5zL4s=;
        b=ZGDXVKnuJMlnzdFZ9WEBspEjrXMo/FNxIYheIb9ue3OhWxzK//rPX6q39ap99FOsen
         cmCK2dDt8v5WoAf0nn9Y/UKpqyrbGjITHS/BYKDo/JepHKg37pk55RFM5VTTSNg7FsX0
         7TiH8xpzJ94lJ38kyO82cToP7iNOlrDt6VbdP2f8rzX5JKGpp8WuqQbLcGC72vylmiV9
         Qjxg2iJRmz9BgRYPGFrqF+YG4HajBr345Ot5uryov8mdNkizcQQRkgO3VxD6TbQBfVQZ
         Yky2natBtxebHNP1aUi3cD9bNDtZiiDO0ZFTX4W38vBxNkokLBRGtQbtWbBGuCFSIKAk
         JGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=392+RXmZfikf1YBZaZ0odEAyz2CKeDAcxq+2kA5zL4s=;
        b=u+5Vx1xNu2n2V2uhsJT6MKt/se4+a3lTNZu+46e2EO2ffdCkcwj6PmdguBqb8fXupc
         F9gPPW2ShoHRJT7AhKlIGDLyph3BxDDpKzJWF6ZU6O3u11oOC+lXrZOrlR7ZaBqD6CTf
         eBTlf/7+Qu9CN9UpPvz12PUevSKxcD4gYsnM8QzH020nFpkwxyOKNKEOyqNhswCaM7G8
         DCseFUQ1of6CKQcEy//L5/UK4QGt2qAtdHTj0mgkJ51jtTySj1I0oa8rUHJZsZP9GV/J
         mA8a+Lw8tW1b9uuI1icOd9rSHRRmiOB518mzYOjIitRlo2gt8gyw2OdzPefycIhsUgD0
         +aFw==
X-Gm-Message-State: AJIora+wfWAF3YODmd8c6COSGmOHlSRSGdFvXNRuJl2wOX4TJcXropzV
	nhQID0KvEcRUEuPA7oHdxzIc3XhQPg==
X-Google-Smtp-Source: 
 AGRyM1sMfndiMNjGc0pKJE7JURJR88k++ATgwOllPaKdsl2VJRtrXMjPJpTmyuvdgCcLgaHeUtP0nA==
X-Received: by 2002:a05:651c:1a1f:b0:25a:6389:6135 with SMTP id
 by31-20020a05651c1a1f00b0025a63896135mr3601437ljb.253.1655666448368;
        Sun, 19 Jun 2022 12:20:48 -0700 (PDT)
Received: from pneves-XPS-15-9550.home (83.11.57.73.ipv4.supernova.orange.pl.
 [83.11.57.73])
        by smtp.gmail.com with ESMTPSA id
 k1-20020a2eb741000000b0025a59470621sm817020ljo.26.2022.06.19.12.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:20:48 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v6 4/7] oeqa/selftest: Add test for shebang overflow
Date: Sun, 19 Jun 2022 21:20:38 +0200
Message-Id: <20220619192041.1113263-4-ptsneves@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/167042

Make sure we do not stage any executable with a bigger shebang
than 128. Fixes [1]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11053

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 .../sysroot-test/sysroot-shebang-test_1.0.bb         | 12 ++++++++++++
 meta/lib/oeqa/selftest/cases/sysroot.py              | 11 +++++++++++
 2 files changed, 23 insertions(+)
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
index 315d1a61c2..a17fd1818a 100644
--- a/meta/lib/oeqa/selftest/cases/sysroot.py
+++ b/meta/lib/oeqa/selftest/cases/sysroot.py
@@ -35,3 +35,14 @@ TESTSTRING:pn-sysroot-test-arch1 = "%s"
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
+        self.assertTrue(res.status != 0)
-- 
2.25.1


