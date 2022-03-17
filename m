Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B73CC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:36 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.9112.1647518255190304661
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YJO5xfB5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 k8-20020a05600c1c8800b003899c7ac55dso3369412wms.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZngwFuYv9qND6xOBP3tuJ0ttO6CFJQBkleC6wwdhgXY=;
        b=YJO5xfB5YWoDd11s/Q4wLX79/8HIYfO+tIXWYwH0DH6nKxaL0WX070x/CqWIS2XioO
         QPj/HM8amFII+ovaziaIGLMYMAR3Qy3TiE+igXEii3aqHQ75Mlg7WJI6VWW3y7Q3wDYs
         cHAvR5b3TNuMBnE4q/maT6Q67+qoEaOW3k99s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZngwFuYv9qND6xOBP3tuJ0ttO6CFJQBkleC6wwdhgXY=;
        b=IcTNdn8LQKfd1zeuQ2MP/7J9eh+HdGvdbYA7hnxAutXWVwdGmgIQ/12sjailR7Dgdb
         u/sGkn8IVFGMa/DJ+HHqccCEUx6OJet06CQJKuYI6iODqI1FcmzDVOAsvq21KxgzsN+t
         Gm3gpMTO8LaEVWpVWIzUdjhsJj6krhrwO2NOJSGQJBUi/297ppRvEtvP+cPOSwnNpiRs
         XKDJT7CKtDkXxREiimV3LnQL9rRWY0QTmDjbaP6InimCO5Ix7yGjCC96nu2UtQzR3yD0
         xj7YNORtLMUmdqdZLlQIYIh1TallSSpfMuYHvH2Q4pv5ybgO8gMQXLHZ71RXyvDnBzU4
         m4Jw==
X-Gm-Message-State: AOAM533McxNLgC4us+wPqy/n5tFIMSiCl+ysNM2G8A7YkLeKWUDyAI1y
	ss+OYJO6wnP7bVNP3PW7O7uGQvd0KAJdKKr8
X-Google-Smtp-Source: 
 ABdhPJz8rlh9lL2Q2kVBUibGN+aJulRYDxpnh61F4Gnd/Lbn5f58YDFhXMvKJgRrFqz0GIOe91BQ2g==
X-Received: by 2002:a05:600c:4f42:b0:38c:21:fffe with SMTP id
 m2-20020a05600c4f4200b0038c0021fffemr9420983wmq.63.1647518253318;
        Thu, 17 Mar 2022 04:57:33 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 26/26] buildtools-docs-tarball: Add test for building
 documentation using sphinx
Date: Thu, 17 Mar 2022 11:57:00 +0000
Message-Id: <20220317115700.993924-27-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163412

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdk/buildtools-docs-cases/README  |  2 ++
 .../lib/oeqa/sdk/buildtools-docs-cases/build.py | 17 +++++++++++++++++
 .../meta/buildtools-docs-tarball.bb             |  4 +++-
 meta/recipes-core/meta/buildtools-tarball.bb    |  5 ++++-
 4 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta/lib/oeqa/sdk/buildtools-docs-cases/README
 create mode 100644 meta/lib/oeqa/sdk/buildtools-docs-cases/build.py

diff --git a/meta/lib/oeqa/sdk/buildtools-docs-cases/README b/meta/lib/oeqa/sdk/buildtools-docs-cases/README
new file mode 100644
index 00000000000..f8edbc7dad7
--- /dev/null
+++ b/meta/lib/oeqa/sdk/buildtools-docs-cases/README
@@ -0,0 +1,2 @@
+These test cases are used by build-docs-tarball, and are not used by the testsdk
+class.
diff --git a/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py b/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
new file mode 100644
index 00000000000..5b0eca046fa
--- /dev/null
+++ b/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
@@ -0,0 +1,17 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+import tempfile
+from oeqa.sdk.case import OESDKTestCase
+from oeqa.utils.subprocesstweak import errors_have_output
+errors_have_output()
+
+class BuildTests(OESDKTestCase):
+    """
+    Verify that our docs can build using our docs tools tarball.
+    """
+    def test_docs_build(self):
+        with tempfile.TemporaryDirectory(prefix='docs-tarball-build-', dir=self.tc.sdk_dir) as testdir:
+            self._run('git clone git://git.yoctoproject.org/yocto-docs %s' % testdir)
+            self._run('cd %s/documentation && make html' % testdir)
diff --git a/meta/recipes-core/meta/buildtools-docs-tarball.bb b/meta/recipes-core/meta/buildtools-docs-tarball.bb
index 72a256cf04a..72648e3b1cd 100644
--- a/meta/recipes-core/meta/buildtools-docs-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-docs-tarball.bb
@@ -13,4 +13,6 @@ TOOLCHAIN_HOST_TASK += "\
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-docs-nativesdk-standalone-${DISTRO_VERSION}"
 
-SDK_TITLE = "Docs Build tools tarball"
\ No newline at end of file
+SDK_TITLE = "Docs Build tools tarball"
+
+TESTSDK_CASES = "buildtools-docs-cases"
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 60f6aac837a..fac91cfc3cf 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -99,11 +99,14 @@ TOOLCHAIN_NEED_CONFIGSITE_CACHE = ""
 # The recipe doesn't need any default deps
 INHIBIT_DEFAULT_DEPS = "1"
 
+# Directory in testsdk that contains testcases
+TESTSDK_CASES = "buildtools-cases"
+
 python do_testsdk() {
     import oeqa.sdk.testsdk
     testsdk = oeqa.sdk.testsdk.TestSDK()
 
-    cases_path = os.path.join(os.path.abspath(os.path.dirname(oeqa.sdk.testsdk.__file__)), "buildtools-cases")
+    cases_path = os.path.join(os.path.abspath(os.path.dirname(oeqa.sdk.testsdk.__file__)), d.getVar("TESTSDK_CASES"))
     testsdk.context_executor_class.default_cases = cases_path
 
     testsdk.run(d)
-- 
2.32.0


