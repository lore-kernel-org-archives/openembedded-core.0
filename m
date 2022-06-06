Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9DACCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 15:58:25 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.9.1654531099233859382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 08:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WsZwAs+q;
 spf=pass (domain: gmail.com, ip: 209.85.208.169,
 mailfrom: ptsneves@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id b7so3715637ljr.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 08:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NRfND8n6zeQEvt6wfaC5qOGgd/dhzG8dytXHSCo9Vyg=;
        b=WsZwAs+qAAUyPSHP9QbcL73b22gsg03pRsfck8yMEniMQ7T5KShU++nqhCGcIARdMx
         T3S/vMpFzsTZgUwJ9VP65Cy3jR9B9nNg+VXC8bl3++01DgrkIVMjjgHroqAKFeezUR46
         wKoVE0mTmDr/eOyHF4fqJhnY1jhfuLP8QU1r6gtTkkgDigo3OJTmZY437OkNHjnIj4hd
         Q48bPSwB9swqBvncYOTraIA2rUNFkcB6dvExXxf5+XwOU8tbdp43lyWaBuVMDsqjPjIG
         KtmGq4+R6XzxTSHSInPHQNeT4iJ0yTSi/leoDUdcMHc5nAKPVNa28ToB2j3sVOmudoY8
         NLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NRfND8n6zeQEvt6wfaC5qOGgd/dhzG8dytXHSCo9Vyg=;
        b=brKoGdW39Yb+M+tSTKk3cNFLMOyFVzGqenVJtfKP9woMsdkQ+jvI+fLNMGQ04PI7at
         q6y6No333EMRM1gsi08gke6XoYn4SoB6CaiV/mBs8ofYGC/sBkWGBqJqE4ftlHW9DsEg
         V5cwM0FuIoObI4n20Y6E/u5MOz3LPUeheoxv2HAO1cjE4ySMhkAtGoTlVe6Ns7ZaSsEa
         SSZEPjlRAhbZet6JBY3kmGTv7IU56MOQuCz7mL05FdSRoa9drFAEGvevxRpygaMP2BBz
         gpVZrpdqEhEH1Da6jSTRfzKtkyVSyOMnlGuoB4cUCBsaqSUte0Cw7ikqLSIM/+yPjQil
         OnoA==
X-Gm-Message-State: AOAM533StDD0YrQaK1w41hAfHN8K1WauoI+N5irzWtTBgl/BGVA9AAjn
	w0R/dsM6F4Tkd7jC3+CLw3essx9CAg==
X-Google-Smtp-Source: 
 ABdhPJzERQ93ktYoSATY/VLf80k60X5gIra2KUDRyt1SKQh3VHEW8pxC7wD/ErkFV6hB43VeP5Tm0w==
X-Received: by 2002:a2e:508:0:b0:255:66fb:9fce with SMTP id
 8-20020a2e0508000000b0025566fb9fcemr16342065ljf.171.1654531097613;
        Mon, 06 Jun 2022 08:58:17 -0700 (PDT)
Received: from pneves-XPS-15-9550.sigma.local
 (85-128-83-172.static.ip.netia.com.pl. [85.128.83.172])
        by smtp.gmail.com with ESMTPSA id
 l10-20020a056512110a00b004791c4858e0sm1595074lfg.114.2022.06.06.08.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:58:17 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH 2/3] oeqa/selftest: Add test for shebang overflow
Date: Mon,  6 Jun 2022 17:58:06 +0200
Message-Id: <20220606155807.1414519-2-ptsneves@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/166652

Make sure we do not stage any executable with a bigger shebang
than 128. Fixes [1]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11053
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


