Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3B6C4332F
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:40:05 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.10895.1652193603815477161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Q5JbwLsr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 j10-20020a17090a94ca00b001dd2131159aso2230363pjw.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/FKrYanfinEY0c/9AnXUC3WxWot4gA2U1+HD80/IIoA=;
        b=Q5JbwLsranYO/k1R1mBy3Bo/zdTMFSb26niR0vm8oYNf1rYXAube9LNjh6svqdQq6y
         MzvVTedy2uI5Iuc5mMwXOzO9q3ZvaGyG/0uhhsHOpn43qVFRUxokfTfJs8bKUfdCP1iQ
         ELqUATRuqw9AeHEos6PFkkYaSnPu7lSHor5jzpemt3FkjYKKgZByfyzsjbZ3qWlaONk5
         ++PVLlyqreRKt1a72BGiJLPgkkfRtieynAZkiMXAPXxckf/FZ4dwIwzk/t/9bnlkAnni
         V5z8R/wX73GB5Nt4OjwPaDetFOPyIl7pf/8KSyYCij+2ajs47AiKVhMLoCOZ9SBfz6ae
         oAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/FKrYanfinEY0c/9AnXUC3WxWot4gA2U1+HD80/IIoA=;
        b=qGFMOwMjXET4K2KGix//yCHudyjOthkBd5Z85JE5ZOKK30/41vWbrQkXXKTnsspX5n
         rQ5xckn8EK8TaUr5pnlZFP4OYJzWI4dhJsUJcb8LpkqZsQj1+S0bYA4NTFo9GKKfWOW3
         vPUofl9qIl8qUYq7sVAsKwAaQmUNJvCmyOcTCXSEl0Hlq3Zv/Jfdhd2cbcKrzK+dG075
         VIzoo2M+SUcSB+jWnkeUZBIhheoI/+ueLFkdtNlVX4wmSQVyT93hpWFX+wOqfIWFPFDa
         nYkoKOJgl0eiGwkO/NyfqhD6OiBpuBNK1/1tZ71X8d8Nijm8wc5wlPdd4O8RnNdjURwJ
         Miig==
X-Gm-Message-State: AOAM530fkzpUyu/BIPrYaeEU3hxKf8ePDEld7fMwepjniACR7GAInYFE
	Pokc4KQtT0f4s9YZegcR8kod5JCcEPja70bz
X-Google-Smtp-Source: 
 ABdhPJyi4ThaEcLcQLUq6ab2mtFB/py8cgGOnPsynzbMgad0jY/PDfORfetnO0mVGRDGBAL106tfqw==
X-Received: by 2002:a17:90b:3889:b0:1dc:cac6:f03e with SMTP id
 mu9-20020a17090b388900b001dccac6f03emr317111pjb.23.1652193602653;
        Tue, 10 May 2022 07:40:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.40.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:40:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 34/40] oeqa/selftest: add test for git working
 correctly inside pseudo
Date: Tue, 10 May 2022 04:37:13 -1000
Message-Id: 
 <3fafd22233be8961801fa541969383b5b8444dee.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:40:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165451

From: Ross Burton <ross.burton@arm.com>

The fix for CVE-2022-24765 in git[1] breaks any use of git inside
pseudo. Add a simple test case to oe-selftest to verify that at least
basic uses of git work fine under pseudo.

[1] https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb7e7d9

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 46822268040a23dbb81f71fe35aee8c2663a31f6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../git-submodule-test/git-submodule-test.bb      | 15 +++++++++++++++
 meta/lib/oeqa/selftest/cases/git.py               | 15 +++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/git.py

diff --git a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
index cc5d7eae5a..fa3041b7d8 100644
--- a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
+++ b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
@@ -7,3 +7,18 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
 SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
+
+S = "${WORKDIR}/git"
+
+do_test_git_as_user() {
+    cd ${S}
+    git status
+}
+addtask test_git_as_user after do_unpack
+
+fakeroot do_test_git_as_root() {
+    cd ${S}
+    git status
+}
+do_test_git_as_root[depends] += "virtual/fakeroot-native:do_populate_sysroot"
+addtask test_git_as_root after do_unpack
diff --git a/meta/lib/oeqa/selftest/cases/git.py b/meta/lib/oeqa/selftest/cases/git.py
new file mode 100644
index 0000000000..f12874dc7d
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/git.py
@@ -0,0 +1,15 @@
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
+
+class GitCheck(OESelftestTestCase):
+    def test_git_intercept(self):
+        """
+        Git binaries with CVE-2022-24765 fixed will refuse to operate on a
+        repository which is owned by a different user. This breaks our
+        do_install task as that runs inside pseudo, so the git repository is
+        owned by the build user but git is running as (fake)root.
+
+        We have an intercept which disables pseudo, so verify that it works.
+        """
+        bitbake("git-submodule-test -c test_git_as_user")
+        bitbake("git-submodule-test -c test_git_as_root")
-- 
2.25.1


