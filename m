Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131D8CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:40:24 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.3229.1760733614616040642
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0RBMxU7k;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7a213c3c3f5so3206788b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733614; x=1761338414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZnT3VMV/cl24rvKsZaGn0KVD8IOtWc/esVaK/k+g3g=;
        b=0RBMxU7kpzxL818QwQqkLfdv4d8CHz0l55q9nT4sniyqD1f/EP3BIV6DyULEdRwuTx
         Aah1hvln1CKfxPse6MgN6s5uDxb/+MxnTlPGXRb3pGaEwnH/DEn1MImufoRFrIzLtCCF
         PCPUvcLcxJbrWSL+CZWF0g/xtqGmSyHyZSX+NPtquN2XAh0W1kYMsTyw9BXVYbVfV1hm
         nczrr/e1IAOh8ajQxTcxvZw8Mdy2vQjqugsZYvtDX2i5hfWnTcmLLQfuLm3B5+rCOvee
         ZfDa3M2RG8af2e8joG5gHLIYk0LlUKrr8je96j9txZkyPOMo13jvOAwbQ3oeV0nL0xbd
         c0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733614; x=1761338414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZnT3VMV/cl24rvKsZaGn0KVD8IOtWc/esVaK/k+g3g=;
        b=gzSHXvDplLUAJDgu+TH9zyp8ACbNyhwqoE/dCjsVNU2wHbhIPCQsntwu0NRL7taVn7
         soycyfYfxMsv5l5MYRYbntMTsrs03A1mIr+sPHcGLDkDqc8rU4lG1P1b2FpY/cgdFjp/
         SUj+2M0ua8kLVISOYc40YmzE6itp6xvesZ3XFjt7p9XDi9yF+Hm8R6aFTSrczZP5+ZrT
         EhzVwIlatAdRH+2Iy+wAsE13yHm1PRlPo/fZDz4L5BTknSfLNpxc1BHXvOua2ZNCCxTs
         5egYSfOgHWSq+Dl5W6bls7LUPoKVMvXOjfPz+6dM4B7S055C8A6dL+JHjY4bK2m3CCRg
         i+cw==
X-Gm-Message-State: AOJu0YybMuPtMvIOfYIenPtU3Nae6eZzFAFxc3+9bRPMu3MZFQfgmU+I
	BBB/WZq/mb09Lx9M5xWz/1iWUh+yXnk4ZIxplHiyFf5YhS/Z+xG+UJ9oY4vhTEdZZ9U0JQJjvA7
	8a0kBS8o=
X-Gm-Gg: ASbGncvMgebMW0SVmQFnRravZfSA64u/a3/EtPbmTbC4lCAhnAQtlP4gWEr1K45PhXG
	WWNZRMiZHu3yY75mNIq7hVNT3gbZXFGj9D0OmEPda1Xr9Qt7fIxeWbswzF1JHsSL7O769h+lYrK
	NdT4sWN9MfV7I0NkNxZ9J0D+WlHsX6nDgPXIayQ80nCYjzsNTOX6t1Z8i2UQBuRELyvrOECTl6s
	3UUBheNP7ZwvHd+TedjHVlbTRaM+HozTiA+s9f0sFLIHEHfD7AnfJGQTtXqQ4LE0jUWNrcrowSo
	5RoKKrzN7og3jqOzEawEVWg35Q31JKBrQg3l8/SW/3LGdkWTI/Zyf7kfYI1t6qMY8DHm1xd9ucI
	scAt9f8QppBZ1eN5aJNO55mMYIvLFifJ3s6eVZAnJLkmUn8cys1UpaTBGs9B5q3Q9TyFEEq8PS9
	rh
X-Google-Smtp-Source: AGHT+IEseG2BDwHxFkdNJnxvDfHHlW4eQpvwF79fWx12+G+oaE6gscf+HQ0il+TGTgWlaJVT5bz/WQ==
X-Received: by 2002:a05:6a00:a95:b0:781:2538:bf95 with SMTP id d2e1a72fcca58-7a220aaaa4amr6078487b3a.10.1760733613720;
        Fri, 17 Oct 2025 13:40:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.40.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:40:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/26] oeqa/runtime/ping: don't bother trying to ping localhost
Date: Fri, 17 Oct 2025 13:39:09 -0700
Message-ID: <649147913e89cd8f7390cb17cd0be94c9710ffa6.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225060

From: Michael Haener <michael.haener@siemens.com>

If SLIRP is being used instead of TAP for networking to the guest then
the target IP will be localhost.  There's no point in pinging localhost
to see if the target is up but whilst you'd think it is harmless, in
some containers ping doesn't actually have enough rights to work:

  ping: socktype: SOCK_RAW
  ping: socket: Operation not permitted
  ping: => missing cap_net_raw+p capability or setuid?

Look at the target address and if it's localhost or 127.0.0.* return
immediately.

(Backport from OE-Core rev: a06ef43d2a50e16c32bd6edbdc7b32c3528687d5)

Signed-off-by: Michael Haener <michael.haener@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/ping.py | 7 +++++++
 test                                | 0
 2 files changed, 7 insertions(+)
 create mode 100644 test

diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index f72460e7f3..bc543f6c41 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -18,6 +18,13 @@ class PingTest(OERuntimeTestCase):
         output = ''
         count = 0
         self.assertNotEqual(len(self.target.ip), 0, msg="No target IP address set")
+
+        # If the target IP is localhost (because user-space networking is being used),
+        # then there's no point in pinging it.
+        if self.target.ip.startswith("127.0.0.") or self.target.ip in ("localhost", "::1"):
+            print("runtime/ping: localhost detected, not pinging")
+            return
+
         try:
             while count < 5:
                 cmd = 'ping -c 1 %s' % self.target.ip
diff --git a/test b/test
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.43.0


