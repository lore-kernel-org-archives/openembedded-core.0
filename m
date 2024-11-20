Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD9ED743DB
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 21:33:37 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.52.1732138412900830774
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 13:33:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QaoKGHfj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43193678216so1537395e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732138411; x=1732743211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KCkzg5Ne+s2HERxTyW8/hlHVYH0DabRAnOT0D/4Q9TA=;
        b=QaoKGHfjTtIwIRRTc8PU6/WRwBa6psgu2rZw59sW69+XzGTFFztPhv3W/rbh0HsCxe
         d+fnEKlxL93f+mpozafryjaa5jE5pU4+8NhsxIkrV0XAZolz3g/kH0OCQoKvsgKEbplN
         9tiP1YztLwvgf9vEoUlpVUEI8qZStOS3QO3aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732138411; x=1732743211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCkzg5Ne+s2HERxTyW8/hlHVYH0DabRAnOT0D/4Q9TA=;
        b=TOzZwD8vk85dZqR9VSuECXm3/wQC1F/xadfTKYlNYt2w6TlEnGtNsy7sNNUWWM44LI
         cbXcDqiVxyAZBaE3Htb3g9bdbSU5OZnnx0sbC19sPH0J7DMu7Wb/hK/2o3fN8ixgjO9F
         ed9K0nhmxhjWN931bpL+Ya5WfwdVF8iZaq7mC7A1qYM4TuY5wHPFdRsMc1iUgk3h1QhL
         KePBs1Xj/OgZY33tHmaIjIHHBfUU4oLawxytnvtjZN2uBS06tUHWKt3gS+LdeGCm3VL/
         IcPRzCoreJhr4domMgaguFhbVKfWhGlfsdupBNe6IPuBUmwQnhd/mXeI243erB3ZayR4
         JK7w==
X-Gm-Message-State: AOJu0Yym79KwGH/evfw2imaUGBYywrQkyWKXBwaqYaz1xTMGrlStvKyG
	xgwaYDvwmsTVPkEosJH74Fk1FwW82A96DhHkLYE5VHWUNkhmC6iJL0pLHlKJY6+M5jNNPQQgLTu
	YGa0=
X-Gm-Gg: ASbGncut4CFqiIIp00RM/ttsI4Efgn3ajUFcdqWI+li1FSQ0M0/RSMSZiQU1JyQ+OrF
	v9T5XheUzLCE+FPdkk1I9Qm4jJ0m0UzR/UxEAyfkoP9Q3nP0loWy583G56ZujiXk8OfLnDLWnr3
	vvGCyNJ/+VJQ9j/zOXJygJYlxBGPC1eNWHIrP4f5C0OvQnLqYXyMRbxuYw0Kkd8cxJnixKMMYXw
	IdqgO3FYGnM5/ZJmar6ATgySMV4HV+ZhKgCTu01RqyoO3JMgBqguneglfQRMr8OZOAJb91TxI90
	DFI=
X-Google-Smtp-Source: AGHT+IEsjHIWX1Kx8JsIDUUgwxFMDYUlQsr09/nQDPQRGWfJWCygM7DF1/kkUTlBCERN469srDDg6A==
X-Received: by 2002:a5d:6486:0:b0:374:cd3e:7d98 with SMTP id ffacd0b85a97d-38254ae56f9mr2611928f8f.19.1732138410639;
        Wed, 20 Nov 2024 13:33:30 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5abf:50dd:d6fd:8415])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825493ee59sm3071911f8f.103.2024.11.20.13.33.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 13:33:29 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] qemu/testimage: Ensure GNU tar is in test images
Date: Wed, 20 Nov 2024 21:33:29 +0000
Message-ID: <20241120213329.2482150-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 21:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207484

We've seen cases where a ptest (strace) has a 43GB sparse file in the test
directory. busybox tar doesn't work well with this. The resulting 1.4GB archive
takes hours to extract too.

Ensure tar is added to our full images and use the sparse option to collect
files for debugging. This stops crazy build hangs.

Since tar is GPLv3, we have to exclude it from that test code. We don't boot
any of those images so the debug collection code is safe there, at least for now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/no-gplv3.inc            | 2 ++
 meta/conf/machine/include/qemu.inc               | 3 +++
 meta/lib/oeqa/selftest/cases/incompatible_lic.py | 1 +
 meta/lib/oeqa/utils/postactions.py               | 3 ++-
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/no-gplv3.inc b/meta/conf/distro/include/no-gplv3.inc
index b3eb936d94f..705e05319af 100644
--- a/meta/conf/distro/include/no-gplv3.inc
+++ b/meta/conf/distro/include/no-gplv3.inc
@@ -28,3 +28,5 @@ CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston = "matchbox-terminal"
 # Some python-tests use bash outside of ptest
 RDEPENDS:${PN}-tests:remove:class-target:pn-python3 = "${MLPREFIX}bash"
 INSANE_SKIP:${PN}-tests:pn-python3 = "file-rdeps"
+
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS:remove = "tar"
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index bb7aec76750..d7392d47623 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -28,3 +28,6 @@ KERNEL_FEATURES:append:pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
 KERNEL_FEATURES:append:pn-linux-yocto-rt = " features/nfsd/nfsd-enable.scc"
 
 IMAGE_CLASSES += "qemuboot"
+
+# Use gnu tar so we can handle sparse files in testimage debug archives
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "tar"
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index be5484bca49..e6b871ebc82 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -102,6 +102,7 @@ class IncompatibleLicensePerImageTests(OESelftestTestCase):
         return """
 IMAGE_INSTALL:append = " bash"
 INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0* LGPL-3.0*"
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS:remove = "tar"
 """
 
     def test_bash_default(self):
diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index 8f787838b9d..c69481db6cb 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -64,7 +64,8 @@ def list_and_fetch_failed_tests_artifacts(d, tc, artifacts_list, outputdir):
         bb.warn("Could not load artifacts list, skip artifacts retrieval")
         return
     try:
-        cmd = "tar zcf - " + " ".join(artifacts_list)
+        # We need gnu tar for sparse files, not busybox
+        cmd = "tar --sparse -zcf - " + " ".join(artifacts_list)
         (status, output) = tc.target.run(cmd, raw = True)
         if status != 0 or not output:
             raise Exception("Error while fetching compressed artifacts")

