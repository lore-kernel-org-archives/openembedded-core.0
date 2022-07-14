Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D98C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 11:30:41 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.6502.1657798234264862761
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 04:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=USJa5QTj;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id r10so2166915wrv.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wtuQCYEEKRmL23MO7w0sBiLni6BjJt4H6dOl9MuHbQY=;
        b=USJa5QTjPaoSbHKMtxCeso+ldZx/0pCbhiJ8jTVCS2QNRLAxL6C6akO6FxDxJ7YNs4
         7Yran0kmBq0C1kEGIeiUHfzBB6bkWQ0z2N+Tam92wwhSHQogqfpTpD5XTQqfnmhmuTzX
         0LY8H1xmtkDnbGpu61T/3iGVBNLVf195aXU0dB1j08PW+2SuO0QVkCtfmnJp7tf55027
         r9Y4jFHyBB3aBorg91H+wFmcQ49Kwe8EGQz9QSAs5HBcDMuUzxVMxe0rNS637a+PZ01t
         wIKclF48Oty+s5+EqZsrk8jZ7p3QUx7+jCecETvVjR850aimmo35Pnl/sfdkGy3fguBM
         tXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wtuQCYEEKRmL23MO7w0sBiLni6BjJt4H6dOl9MuHbQY=;
        b=CKbcthMFB8E7JBW76Bn1K7nIrdldI4vF0k4jAYVvbMkjE55999g8HndfrYWxQG7Onh
         CnQzIHsMDpFEZNBOvRzS7BWA+0566xzHkD0gLeSuzF0F9KbKbQ51NJj3d52wHTxYwFmg
         0EuJ6mRSRrBfEkVlIz3YbAvvvTDBkowOcVIPDJRvbdOhxsk3B7MjfwM2oSiuabjJ1X12
         f1SDoDi20NiUtGZe2USOSqGkVIDjIsfejqfPxwRprdUs8lQ6Kkk1Dz9hlRSCJrDTLlzl
         3K/okc5QNPcnLXB9qIP3cvfjYAGdwUr7gQh/c35mWjmIOpeUhC6kpDhbPi3LVwKA6Jk9
         wPkQ==
X-Gm-Message-State: AJIora+GwFfTm71hK3gAU92P6cNJwHNZIJb1zi0+CzBn0RqcggGTjuKB
	pbHmpFxMNJdD+yaG3ufKx6MJq76Novex
X-Google-Smtp-Source: 
 AGRyM1t0wYnI+EQq8a3DCWgqRoS1xtjFtNq1PFC6GlsQlFsQIuyOcnH3Sv+BV0SVC8EuVIcj20NLsA==
X-Received: by 2002:adf:e94c:0:b0:21d:81f4:7de2 with SMTP id
 m12-20020adfe94c000000b0021d81f47de2mr7999544wrn.338.1657798232603;
        Thu, 14 Jul 2022 04:30:32 -0700 (PDT)
Received: from localhost.localdomain (83.11.65.125.ipv4.supernova.orange.pl.
 [83.11.65.125])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a5d4348000000b0021da4b6c6f7sm1252377wrr.40.2022.07.14.04.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 04:30:32 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v2 1/1] oeqa: test_invalid_recipe_src_uri expect parse time
 error
Date: Thu, 14 Jul 2022 13:29:59 +0200
Message-Id: <20220714112959.38583-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 11:30:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168032

Before this commit the test expected a runtime error but the logic of
the fetcher changed so that files not found for checksumming cause a
fatal interruption of the parse, thuse never reaching the runtime error
this test expected. This commit aligns with the bitbake changes to the
fetcher.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index b42bbb651d..89267c7145 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -145,12 +145,10 @@ INHERIT:remove = \"report-error\"
 """)
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
 
-        bitbake('-ccleanall man-db')
         result = bitbake('-c fetch man-db', ignore_status=True)
-        bitbake('-ccleanall man-db')
         self.delete_recipeinc('man-db')
         self.assertEqual(result.status, 1, msg="Command succeded when it should have failed. bitbake output: %s" % result.output)
-        self.assertIn('Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:', result.output)
+        self.assertIn('Unable to get checksum for man-db SRC_URI entry invalid: file could not be found', result.output)
 
     def test_rename_downloaded_file(self):
         # TODO unique dldir instead of using cleanall
-- 
2.25.1


