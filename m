Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72425C3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 12:34:34 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.14095.1721219670262057326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 05:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fbjZlQRc;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4266ea6a488so54555785e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 05:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721219668; x=1721824468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLVnzXr53ERJ0GGQwbWgmjN0CNVHyLJ0GwwZjNcQ5mQ=;
        b=fbjZlQRctF0djX85Psbc7QKUU+Ps1mdAG75/FQgJ5sTQ/kUaEbasA2Xg1Ls+dJ5UmI
         coZ+iJKR7lJZ6I9yYFN/8ZfOFH0/dKxdPA0F9U+vquU5qdg0NHDeqkl9fDhH8Wkkiwm2
         8nwTOmGGTmd8uah2Lfzz/H7KfPS2MHRJiDnRnCZoWMf7eH8QNkwDcfnUUpSiRI5DfWR+
         /2xpFICxy8xYLJLn6brYZMOpzjzuKfFGnu3cVkObQRAtuz9Cuc+ItR3XQppR0qipBmmw
         kbFjmJBzkpwCReLQFwjoASA5RbyAP1/Tiz98kDw4KI9YdJ8e3nMRTfAvLI1tkp3GJ0EP
         gL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721219668; x=1721824468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLVnzXr53ERJ0GGQwbWgmjN0CNVHyLJ0GwwZjNcQ5mQ=;
        b=Xr3Q75PGDLZHBGmn2aBWu3XEyiFtsv0J1XYShEv10+uBAI4XStDLgtfe4fTOruZ4d0
         Zq2tJOSpcbkcURnCFdmJepPfkR7jWO+vVNtT47ImifnQUrA+X8I0pYbB+dVXymM4ws1p
         Vdw9OEqNCvZavJ6OP69AOOZihmcypgjc3IZqaBGP0mvT5ftDTcdiXqFDn1WEzdBRqi9G
         3TD8ZcFGcF8Tl1Dx4kd/P0j4LiLKPc83pALNNYsc4KPpItdXcNXst7A8/KosDuCAcDNH
         ijEFJJx/b2DSujB4GfKDNHgBRa1RbRBBZUfq80x71/ACEVOSrdrZ45EhCQlqFTfwByoO
         5qpg==
X-Gm-Message-State: AOJu0Yymdvaavo4FfRNuYq+r5J2Yj5sSNLMjzXAnxFEJ2U4rOV+jmbFu
	C9FqlcmWwub67RkQf5tbETsWZhyrb11HILR8sal6CxYqxVRY93HayJxlCA==
X-Google-Smtp-Source: AGHT+IH+KPiGCJvu9vJm9v31KXCq09YQdFHDk8tf48fIklE+BW9pIEsh0y6J+VJ+2YaYorLsPzqILA==
X-Received: by 2002:a05:600c:1c81:b0:426:59fe:ac27 with SMTP id 5b1f17b1804b1-427c2d01ceamr12826115e9.26.1721219668158;
        Wed, 17 Jul 2024 05:34:28 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f276b8dsm205105815e9.21.2024.07.17.05.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 05:34:27 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] oeqa/runtime/scp: requires openssh-sftp-server
Date: Wed, 17 Jul 2024 13:34:22 +0100
Message-ID: <20240717123422.2619713-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 12:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202161

The SCP protocol was deprecated in favor of the SFTP.
For the legacy SCP protocol scp should be run with "-O".
Instead of adding "-O" on the scp_options ssh oeqa we can
require the openssh-sftp-server to be instaled on the target.

This way the test will work more deterministic regardless of
the host machine client used.
For the old fashion clients still using legacy SCP protocol
the openssh-sshd server will be used, for the new ones using
the SFTP the openssh-sftp-server will be picked.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/lib/oeqa/runtime/cases/scp.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/scp.py b/meta/lib/oeqa/runtime/cases/scp.py
index ee97b8ef66..364264369a 100644
--- a/meta/lib/oeqa/runtime/cases/scp.py
+++ b/meta/lib/oeqa/runtime/cases/scp.py
@@ -25,7 +25,7 @@ class ScpTest(OERuntimeTestCase):
         os.remove(cls.tmp_path)
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['openssh-scp'])
+    @OEHasPackage({'openssh-scp', 'openssh-sftp-server'})
     def test_scp_file(self):
         dst = '/tmp/test_scp_file'
 
-- 
2.45.2


