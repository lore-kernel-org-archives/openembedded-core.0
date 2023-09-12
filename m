Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE7BCA0EFC
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 17:20:12 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.229.1694539203068927885
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 10:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Fp5m02xH;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-770627a7316so374287985a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 10:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694539202; x=1695144002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XRaPIK+vhPg+j8U1JwQw5MxgpryNR0BVsi6wim7j3M=;
        b=Fp5m02xHguyV8aE0FXTMFR+ZpMCb5kx8B+8LbiLsTMYhryRneUWuWlP28T5yLy1W1i
         Ne1yEEXl9mlSyy9r6ATNhMU8eEwl5eTico2FaPyWHSqpIxG0YLXUXpFV787A850KSOtW
         VRW9E+pUN4NR17bZB2mBjaBgCjkdnCRwC+HgdQ5lDbW9SAmdEnuLlNvj4nc9DDjoFfHU
         JNYegRTkaLMpMzuMHGVJdi4mrTJW6f1GvTpAlFDonZqS7h/ZdQR/8eRKivbABPmkyEfx
         8ZgNUoSRzQdAUMo9bpgBlJlI9RKinGWHKxLOac+38oL/ABx64cnYWk79cYjeiQSvpeuY
         /CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694539202; x=1695144002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XRaPIK+vhPg+j8U1JwQw5MxgpryNR0BVsi6wim7j3M=;
        b=Jc27gh3IT63PolfsKlVtaSsXiRobUhc7Rm/9PzrjU+xs5Pz0eA7b6ilELthpj7jaEX
         6d4m5IhtFQdUUCPlOr5QU+KG3hTi6sZSXuYqkyBs1Ax6XOyn4Zkh7YMNddswPH/KZTb8
         oiVdbVlzUp1ySGHA/3xFUxjraUOr6d4odCjPAwQcyyyTyd1AGXDnFgrURSRhcve4GLu0
         tG0tl9D95NcgI/36aUTlNz9JinifUwNWrrDky488zJhzBQqMLc+PGJvf1+RoyxZStaB5
         9b2lvFFiGDcGfwGvighc317k5pAhQe18Yiship54jxBYwgqXUx2JU6jZrzEGyfUarQNp
         NGdw==
X-Gm-Message-State: AOJu0Ywvf+4d+VUMUV88a2KO/9JytfPDeubutdoVKBlSTnFiz/3nAL2R
	dS80H6yod/ckR6GjyPsaU0lr2jrFcZ9Y5Ib6nt8flw==
X-Google-Smtp-Source: AGHT+IEWrXfQcmNN3ZYVSkB3hYflfqnkloTJdShGyJaM41hd/PAr+h6/OnH1CRAJa6hXb7dcr52qlw==
X-Received: by 2002:a05:620a:1271:b0:76f:382:b551 with SMTP id b17-20020a05620a127100b0076f0382b551mr39445qkl.35.1694539202060;
        Tue, 12 Sep 2023 10:20:02 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id n3-20020ae9c303000000b0076d25b11b62sm3356726qkg.38.2023.09.12.10.20.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 10:20:01 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] selftest: remove configurable target
Date: Tue, 12 Sep 2023 13:19:56 -0400
Message-ID: <20230912171958.1575518-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912171958.1575518-1-tgamblin@baylibre.com>
References: <20230912171958.1575518-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 17:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187536

The ability to pass the target (i.e. oe-core) as an argument was a
testing mechanism and isn't needed when the tests are part of the repo,
so remove it and use os.path.dirname to get it instead.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/selftest/selftest | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index eb65c530aa..d1407649a2 100755
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
     
-    cmd     = 'patchtest %s %s %s/tests' % (patchpath, testdir, topdir)
+    cmd     = 'patchtest %s %s %s/tests' % (patchpath, repodir, topdir)
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


