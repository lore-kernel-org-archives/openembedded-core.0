Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251F7CF9C74
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 13:14:34 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.36196.1727097267766500869
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 06:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iLPxAy27;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71798a15ce5so3704252b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 06:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727097267; x=1727702067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79R+1EzgvbK1DclnajXzGa8w9hHbpAEmk9amOLvvnQY=;
        b=iLPxAy27F8BYQtBTNeD9kuUkOyK1//sJmwdHDweneScdqbMYG6ksl4NhSZaTTNRXOa
         DDAi+esxzsbqbjWi9y4CMJlSFENFz+GjdtmI7R18/sIrPFSDfx/pd6ZZ5JhkjmHEIBAU
         4VxLRS/hbQnkSil3RZ08CN1I/B9M7IhNnscbvO1gJCjb+PksDtqa9EY2QI8ULh1rQKTu
         wYVQ1vpWQDOQ5PsUgaKSDNO7oYkQ8+rj7a8XP+a0NM4aZxb/nnXZ0i38e8yYGa9HThcf
         GVzo20Rq+HFyMFuj6MvtlhwZMoOdDca1uN1LcW3jW5Mf7JUwULRw974ADS5Q20BM+ank
         V7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097267; x=1727702067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79R+1EzgvbK1DclnajXzGa8w9hHbpAEmk9amOLvvnQY=;
        b=hdGWxn8xaUwMJ2+Sup7tAtiE1HPFkCBe2Ncan+L2FLZzp8rJ/QKG+NXnGuXStOxzU2
         CkRkWdMbb3fynP4acNeBHVhEx8WP0x4awLFx6OUsRQkY7zOcDno0T7bRvkajtLzcJsO5
         VsW3fR9lEC3j5hJk9nlMve1fZPqQZakbsDYCSC3IggyE+1UWs3eNV0KTRrCBSyKOzeiR
         7+HxWR/P/6DEeVMvofiELjbeWMIiqR/2jnmm2U0QfRb6QD14oVp+o2BD5Uv0aVj+Lf/j
         VofeQyrq81Oc5R/KZlS3xlOkOBId177mMlO3mg/xU8yToOSoRqUAkwOrQ1iILX5m07aP
         8ERg==
X-Gm-Message-State: AOJu0YxFw+hOPKTDCf/Xhx7RwZkcwH4lrAEUMKYQNrPuBsfJ5qxzrRLb
	3nu7QkCprKDSEccbVYZChnL63PHRDHJvolNdWAWigMJeK+r87R2PurAXxX5NCfosJksDvR4ZFmB
	Zp+4=
X-Google-Smtp-Source: AGHT+IE/T4RoV7DeoXXXZsshdBiPa5V9jSejau4YDPWehhO580QshecJmY69kerTIXhv1rDwozARpg==
X-Received: by 2002:a05:6a20:c6c2:b0:1d2:fad2:a537 with SMTP id adf61e73a8af0-1d30a9ad0a8mr13487123637.18.1727097266897;
        Mon, 23 Sep 2024 06:14:26 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ee58sm13831391b3a.127.2024.09.23.06.14.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:14:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/15] lib/oeqa: rename assertRaisesRegexp to assertRaisesRegex
Date: Mon, 23 Sep 2024 06:13:56 -0700
Message-Id: <ff720f337e40761c7d4d544c963cf518ad5403ad.1726971209.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726971209.git.steve@sakoman.com>
References: <cover.1726971209.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 13:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204821

From: Ross Burton <ross.burton@arm.com>

TestCase.assertRaisesRegexp was renamed to assertRaisesRegex in Python
3.2, so rename to fix a warning during test execution.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6df44a4b29487bf8ef51bb5ba6467a4056b749cc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runcmd.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
index e9612389fe..e423fe3d3e 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -56,11 +56,11 @@ class RunCmdTests(OESelftestTestCase):
         self.assertEqual(result.status, 0)
 
     def test_result_assertion(self):
-        self.assertRaisesRegexp(AssertionError, "Command 'echo .* false' returned non-zero exit status 1:\nfoobar",
+        self.assertRaisesRegex(AssertionError, "Command 'echo .* false' returned non-zero exit status 1:\nfoobar",
                                 runCmd, "echo foobar >&2; false", shell=True)
 
     def test_result_exception(self):
-        self.assertRaisesRegexp(CommandError, "Command 'echo .* false' returned non-zero exit status 1 with output: foobar",
+        self.assertRaisesRegex(CommandError, "Command 'echo .* false' returned non-zero exit status 1 with output: foobar",
                                 runCmd, "echo foobar >&2; false", shell=True, assert_error=False)
 
     def test_output(self):
-- 
2.34.1


