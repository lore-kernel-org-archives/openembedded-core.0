Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7185CEE01EF
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 17:01:01 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.2342.1694624453980665222
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 10:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=kONI68NE;
 spf=pass (domain: baylibre.com, ip: 209.85.219.43, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-64c5f5d6f04so231606d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 10:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694624453; x=1695229253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ld8Jvo5H2j2ojHjFe2GmGl020+zjPm0CpRFfEfD5E9c=;
        b=kONI68NEcCT2hwlKBNA4IzJpLTkZJ+tPO5BJShSE47LVHBdJQBBmHjlga+eOsJH5PS
         RsQ9SiIO+NFwc7t3sZPhjvT/wtrWxbCxfTOQuWaXHpK3FyM1Qyelpzwbf95pjHvb6PiE
         +hOePfYYx3VckFU+qFOKdlsjvcxqx5UnrLK4lWc+mP3Ez7intNYTETrTSSP64TQHrbuQ
         /UzzUjFwiB7T+2KCSnDI+KoPnBx9y2x9bbsZ9cTG98YvS2lIvVpxKHVH52gk2O2IxZmg
         i8lqWiSYmq50c2lhU0sxdJ901/sT8XoBtNgxcUjWaKvp2+63CPeMumtM0MJ6aO6RYvU+
         Korg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694624453; x=1695229253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ld8Jvo5H2j2ojHjFe2GmGl020+zjPm0CpRFfEfD5E9c=;
        b=wq7wRiIsmBkm15gEE1wcpu+BvJE/kUFp2C4IXnjBjF38HvMUWCOkbjKbP7NLLu4SRp
         ymwCFhHEG50dp+6p2Dr7xFEPfEzrdGYtqqFgzD2xv6soSKiuqKfAZHLiShANtgpGKIWz
         C/g2teAgxTyDiyxqKqRB5+1kXVWnC0/yAuymmxyNCou/Qve+0hruFySwV25vJg1+wI0P
         Cqx6DCw+8Qdk19w1KivdMUHQEZbFp1X6RTs2i9Mf8GgVfqNCoPZ9ofIEvVqSpafk34xF
         YfoR0ZuP0kQ4fxlRIvVjlDp4OGz/Hhn18MtZ8K7XPry7QGZPCc8qrY5rDFyfBmL5o7k1
         lX+w==
X-Gm-Message-State: AOJu0YxWmO8CShmt5JNEhr5A0YQC2kmSY8kPr4d338O6V85M2KF0b1Nn
	dbas+7ZF1k0enyUWXIy6H+Xp7rhRHQjLpyf7VR9T0A==
X-Google-Smtp-Source: AGHT+IE4up23cVYr3MmeSicvE2IxK/oECBMPgN5dKK9HO6a42v6is9csoM0io7VoF9aFmkIqczNtpA==
X-Received: by 2002:a0c:8cc1:0:b0:64f:455f:7cc6 with SMTP id q1-20020a0c8cc1000000b0064f455f7cc6mr3110424qvb.33.1694624452791;
        Wed, 13 Sep 2023 10:00:52 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id l4-20020a0ce504000000b0064a5de64668sm4512014qvm.141.2023.09.13.10.00.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 10:00:52 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/4] patchtest/selftest: remove configurable target
Date: Wed, 13 Sep 2023 13:00:47 -0400
Message-ID: <20230913170049.1622451-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913170049.1622451-1-tgamblin@baylibre.com>
References: <20230913170049.1622451-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 17:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187614

The ability to pass the target (i.e. oe-core) as an argument was a
testing mechanism and isn't needed when the tests are part of the repo,
so remove it and use os.path.dirname to get it instead.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 is a simple update to the patch diff reflecting the other changes to
the selftest script.

 meta/lib/patchtest/selftest/selftest | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index c2e6b4863d..ba8e1623ee 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -15,6 +15,9 @@ patchesdir = os.path.join(currentdir, 'files')
 topdir     = os.path.dirname(currentdir)
 parentdir  = os.path.dirname(topdir)
 
+# path to the repo root
+repodir = os.path.dirname(os.path.dirname(parentdir))
+
 def print_results(passcount, skipcount, failcount, xpasscount, xfailcount, errorcount):
     total = passcount + skipcount + failcount + xpasscount + xfailcount + errorcount
     print("============================================================================")
@@ -30,21 +33,16 @@ def print_results(passcount, skipcount, failcount, xpasscount, xfailcount, error
     print("============================================================================")
 
 # Once the tests are in oe-core, we can remove the testdir param and use os.path.dirname to get relative paths
-def test(root, patch, testdir):
+def test(root, patch):
     res = True
     patchpath = os.path.abspath(os.path.join(root, patch))
-
     
-    cmd     = 'patchtest %s %s/tests --patch %s' % (testdir, topdir, patchpath)
+    cmd     = 'patchtest %s %s/tests --patch %s' % (repodir, topdir, patchpath)
     results = subprocess.check_output(cmd, stderr=subprocess.STDOUT, universal_newlines=True, shell=True)
 
     return results
 
 if __name__ == '__main__':
-    # sys.argv[1] should be the repo to target for selftest, i.e. oe-core
-    if len(sys.argv) == 1:
-        sys.exit("Error: Must provide the path to openembedded-core, e.g. \"selftest /workspace/yocto/openembedded-core\"")
-
     passcount = 0
     failcount = 0
     skipcount = 0
@@ -56,7 +54,7 @@ if __name__ == '__main__':
         
     for root, dirs, patches in os.walk(patchesdir):
         for patch in patches:
-            results = test(root, patch, sys.argv[1])
+            results = test(root, patch)
 
             a = patch.split('.')
             klass, testname = a[0], a[1]
-- 
2.41.0


