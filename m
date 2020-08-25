Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web12.5417.1598321287670559944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 19:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sPCf7xZ4;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id t4so9132694iln.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 19:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EO6HFP9GXyotmuuxXtlhyApEdJ7FzdpWk2d+ZUn3KMg=;
        b=sPCf7xZ437ANHzSv/Rq7t6FO9QOkI9SmjbrK2yOnPBUQUHi/BEm2+HPdbD9T7T9kCc
         YNz5b+cPesUPVkFd+o61Ar23+kxrI4/zaqG+lfzu9yiKP4rA4at3Q6Mnx3yDje4nGSTb
         jaw2ZYorq6SY4RGaN6a657Xj1Rb9XXxIJvD0hITUd9bOPyBzzy+jljaFz76Ev/jE2tB5
         UagE6BFRNf/94YvUfbyJRcrvSO6oKaM0p1BQaXbVMIRRR2BIew9S/pWbXrbkEHMvd7B/
         KV528Agun7MeEJ0Crn3/BcxHw8tgwqZYWnxul2bJRaWaJQvzd94H8toMCn/bInzKXHvl
         vdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EO6HFP9GXyotmuuxXtlhyApEdJ7FzdpWk2d+ZUn3KMg=;
        b=Ytn5iQsEtpkkKRQqc4o1yA4BTft9iWk2aAUpRdcd49nLkucMsztTWZ95w90Tf2OwFz
         6cP/SyW6CrqKNNhyevnIOMcwREch/HN81P6ecWMbMi2L2K8YIVv7sZmHHXxAZmGyqApo
         pBFD7LgxTLwp2qVqW1bEtc3u3ugsKTf9nQluJoyH7+ehW/Yg1rYbE8Oic44/zyHSY2Ai
         l27bVm9rJh//hn74JthF2eajx5NWHl7hy/PnMpQKpa/SLIeyxKLmPMnvkHSJsIpsFqwC
         UINumJlVewTvSFm6UppEJdCISjjIBzkb4U5v8Ygm9WPWIB/EihyKwrNX5I1RMi43dTog
         FSjg==
X-Gm-Message-State: AOAM532oOQ+zfoURxxfPkakEN0pEUoPAVtJpnuH8WeNDGp2iC6wdvAqK
	YQhAPh/sAcM+ZhwYUEpA8Npwn+PPki8=
X-Google-Smtp-Source: ABdhPJxW0CNgGHqRcLgSNearfogogo7MF9bRsmFKHj4y1U+GGxEMTJ/BKjK0YZYBrNDG2wQ/jSLLPQ==
X-Received: by 2002:a92:9f92:: with SMTP id z18mr7097788ilk.244.1598321286755;
        Mon, 24 Aug 2020 19:08:06 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:5db1:6b17:9d39:142])
        by smtp.gmail.com with ESMTPSA id c2sm7866231iow.6.2020.08.24.19.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 19:08:06 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	steve@sakoman.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] oeqa: runtime_tests: Extra GPG debugging
Date: Mon, 24 Aug 2020 21:08:01 -0500
Message-Id: <20200825020801.8879-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch enables extra debugging for gpg to try and get more debugging
information when [YOCTO #14003] occurs

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 793c98a335..d89731c692 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -156,7 +156,7 @@ class TestImage(OESelftestTestCase):
         self.gpg_home = tempfile.mkdtemp(prefix="oeqa-feed-sign-")
         self.track_for_cleanup(self.gpg_home)
         signing_key_dir = os.path.join(self.testlayer_path, 'files', 'signing')
-        runCmd('gpg --batch --homedir %s --import %s' % (self.gpg_home, os.path.join(signing_key_dir, 'key.secret')), native_sysroot=get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native"))
+        runCmd('gpgconf --list-dirs --homedir %s; gpg -v --batch --homedir %s --import %s' % (self.gpg_home, self.gpg_home, os.path.join(signing_key_dir, 'key.secret')), native_sysroot=get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native"), shell=True)
         features += 'INHERIT += "sign_package_feed"\n'
         features += 'PACKAGE_FEED_GPG_NAME = "testuser"\n'
         features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
-- 
2.28.0

