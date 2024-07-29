Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18E4C3DA7E
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:47 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.55967.1722258824433546856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DUsGVWrl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d2b921c48so2362796b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258824; x=1722863624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pAXDgbUqsvLbvKjqtUSB4yl1qnk+flIBAVyqDqXbqms=;
        b=DUsGVWrlbB15HHRUdl3mWJ59al27j13wSVSmyhmzuTX3MRdg0tzeAQPCcA0v2MHh4+
         FmRCE5+p9L+mNi/uzUVNLMrco3NweOJdwRgg597MyAqe+P+9ZVnjAKGP3pkm9h6s9Xxw
         qk4BV16adLWtYonrphcZ+9RQvg47A4MFryuNNSgkO/OLV2lgicxRvGhxlxG8ixzrU2D/
         bAJbIE2PAniRlWQiv1mkCk7+FlvYQp9Empwl5J04W6l7Pfm+20GyvqM1LmUnPLLJP07C
         E36ESV946EO6J25TVdCLM61ZQuKAZkMebCaurLRbDrs+51RQ+X+Tjn84EJNp9pmUrdad
         62wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258824; x=1722863624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAXDgbUqsvLbvKjqtUSB4yl1qnk+flIBAVyqDqXbqms=;
        b=BH9xW8dH0ZduuXlPEfWkZxLvvtDiGU/g/RMiqtvYtp/IorIG2tmEXypBmsllxAGHxq
         0Czg3yMUaw1s1IaAXzEU/ztTBabwJTbVG2vbWOzi9i+VZkdkfMzm/bzmHsYyE7lTCxxt
         IrnsBOkKIRzdcVkTUpiqiD78QQAP6c5hkpPY3HVUxHaR0rl1Km1Xlflc847mZPcyrMFH
         hT9Moz+HTUmBBNsnTzHmnseXG97chKUUfyZMiE0aGDmF6FVJT2Kq4fgGu8WwtKxOHhAI
         Dhpx1EhCXt3g5lpQiHpUaapfxsDABdIs0LZ0SkLeVza+mMu7u8VpuBUX1ce3OK0WmSvS
         g1wA==
X-Gm-Message-State: AOJu0Yw7nfFUfXME4QdgcwPjWJFb8OKrbXXTrv+OHn5xgqZyAnV7zFww
	pyTV4n4yUWZlFhEvkIEySLYM/wiXwl3QEQ9U19bO03P/WS7qoiJzVUjLVwNAXXqZGsSQl9Tx/F3
	1bgjI9A==
X-Google-Smtp-Source: AGHT+IFoBSNZNUU/ZCCrIv6HPjjDzp2wxegY3R8/xQ8hkkMjzMgnJzt23ShI0WXutX5aCGqaC2W0qQ==
X-Received: by 2002:a05:6a21:3483:b0:1c3:b1e3:eb42 with SMTP id adf61e73a8af0-1c4a129d69amr5519692637.15.1722258823686;
        Mon, 29 Jul 2024 06:13:43 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 34/37] oeqa/runtime/scp: requires openssh-sftp-server
Date: Mon, 29 Jul 2024 06:12:44 -0700
Message-Id: <7629a47d6cac36c78184788010f754175853bb03.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202648

From: Jose Quaresma <quaresma.jose@gmail.com>

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2f43da91ba20d18bc419bca7651bb383a51f20af)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


