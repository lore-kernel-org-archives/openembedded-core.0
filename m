Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD75C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 17:54:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.13864.1644515661872821287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 09:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B+dJikOk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 l67-20020a1c2546000000b00353951c3f62so4509493wml.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 09:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1rrRpUsohzzCUZ7ivP1Ke0rpR9/tyHcMFp78ol4YqJE=;
        b=B+dJikOkn4uMoX3hBLlbgmzGC4AO2zvVEKjI0fnLR2mlhHLUXvn/788X9YZ0rDCPEF
         TJ3ddfcEQ40qvzSA9EN1Kc3R9R2E4tc84xlm8w0JqQ/33xvxjS4Tlq81nvDZ4dNi/yxr
         VGmMeGMyHrBVHqBXdwV9NJFG+LeIyGBSgr7Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1rrRpUsohzzCUZ7ivP1Ke0rpR9/tyHcMFp78ol4YqJE=;
        b=icOkacQo6oCMbpH3MqZzcjpW79JnlDjDeqsZnMhvGWqts3Wh3yf+n3lmyZFZYbVuAE
         Dp+h+HioQ7xOfVx4p9775rOcFotJU0SCMHxC37hajESBRps5AeP3KFVvHUNKjJl4KPNW
         Uf1M+tgMh/ekvr4sFbpgVEexo6u/FihW+dN1FGUBjiMpTTzOX8PEISBzeJFMGkHgbY1T
         LITYTJQscXj8JdusaQyNzdtyK6gaQac7UM4NJbL2MtAxMigVSm3MaibKzlQiiHF4xNYV
         CboXWAn/vsxODqgG6x1YfV4J3jazu7LzKUy8t8OeBCAEdnyn3fVLhXOHo94LSzVwFV0v
         Yhlw==
X-Gm-Message-State: AOAM530vyWh4BXXJsaIO/0nycT92MPmE1p0N9v6ZP67yZn/5pKHMitUu
	lpNgSw+mXEWSGu0rOnV9038RqMAgPzEKvw==
X-Google-Smtp-Source: 
 ABdhPJxqqg7qytt/9hcEqvy+9/P1lewr9OR+GKFIsP+Xz+ii2uvnnNrjc7D2fciBq4sOXwQzZTtuNw==
X-Received: by 2002:a05:600c:d0:: with SMTP id
 u16mr3191666wmm.102.1644515659944;
        Thu, 10 Feb 2022 09:54:19 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7dcb:9837:5409:449e])
        by smtp.gmail.com with ESMTPSA id
 n126sm2178461wmn.27.2022.02.10.09.54.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 09:54:19 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] selftest/bbtests: Add tests for git floating tag
 resolution
Date: Thu, 10 Feb 2022 17:54:17 +0000
Message-Id: <20220210175417.2695557-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220210175417.2695557-1-richard.purdie@linuxfoundation.org>
References: <20220210175417.2695557-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 17:54:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161624

This test ensures that where a floating tag is used for a git url, there
aren't a number of different bugs such as inconsistent source revisions
for the tag within a given build and that the recipe is reparsed at each
run to ensure the tag is checked.

A test is also added to ensure that the build fails if SRCPV (get_srcrev())
isn't used yet there is a floating tag.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gitunpackoffline/gitunpackoffline-fail.bb         | 11 +++++++++++
 .../recipes-test/gitunpackoffline/gitunpackoffline.bb |  6 ++++++
 meta/lib/oeqa/selftest/cases/bbtests.py               |  8 ++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline-fail.bb
 create mode 100644 meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb

diff --git a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline-fail.bb b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline-fail.bb
new file mode 100644
index 00000000000..dbf1ef35a57
--- /dev/null
+++ b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline-fail.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Test recipe for fetching git submodules"
+HOMEPAGE = "https://git.yoctoproject.org/git/matchbox-panel-2"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+# Deliberately have a tag which has to be resolved but ensure do_unpack doesn't access the network again.
+SRC_URI = "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;protocol=https;tag=2.10"
+
+S = "${WORKDIR}/git"
\ No newline at end of file
diff --git a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb
new file mode 100644
index 00000000000..73bc2181591
--- /dev/null
+++ b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb
@@ -0,0 +1,6 @@
+require gitunpackoffline-fail.bb
+
+# Deliberately have a tag which has to be resolved but ensure do_unpack doesn't access the network again.
+SRC_URI = "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;protocol=https;tag=2.11"
+
+PV = "0.0+git${SRCPV}"
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 246cb032bfb..8dd069b2977 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -312,3 +312,11 @@ INHERIT:remove = \"report-error\"
         self.assertFalse(fatal, "Failed to patch using PATCHTOOL=\"git\"")
         self.delete_recipeinc(test_recipe)
         bitbake('-cclean man-db')
+
+    def test_git_unpack_nonetwork(self):
+        bitbake('gitunpackoffline -c fetch')
+        bitbake('gitunpackoffline -c patch')
+
+    def test_git_unpack_nonetwork_fail(self):
+        result = bitbake('gitunpackoffline-fail -c fetch', ignore_status=True)
+        self.assertTrue("Recipe uses a floating tag/branch without a fixed SRCREV" in result.output, msg = "Recipe without PV set to SRCPV should have failed: %s" % result.output)
-- 
2.32.0


