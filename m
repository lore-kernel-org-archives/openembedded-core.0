Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54807C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 16:59:31 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.24.1743526762622276586
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 09:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JN/cHmbO;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0618746bso40753415e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 09:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743526761; x=1744131561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=obxWJTKj5M93Gnj/oWobHU4mvMKrUq0FPHUPSKkqd84=;
        b=JN/cHmbOSyvO5+kMU6+hGry77zz8qvHIwwrWHevi8TDUxamGkg5eU3lJJciVZMk0KV
         UMM/p6/wRo61YAgxkZf/+TOBlwRFctj4vLrPBCFO6XU8GP9nR5qd9U6WYaSBcH0zeDcX
         hGMe7rfsEuPX04G6n8hSYIEIqLhkNufrKDxA4zydwDn/po1u3Bla4EM2gHVJZh+NUsm+
         ifK8edVq4A1km7IJpBNFZRfOb/R8Ib17+HB7ivi3H0z/V/64CcUWiskCoY1pJfTAblAy
         s3VXi6RZz+ikAAxFuejjF4ndBIS6bEx2JMkFNa7Kq2XTa0LLRNlfDn3bB4kdqoa99X4X
         kW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526761; x=1744131561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obxWJTKj5M93Gnj/oWobHU4mvMKrUq0FPHUPSKkqd84=;
        b=rcAxkm28dfAd/24ybtcwJVCufENzExEqnt+iNpeUOJJU85C1XARGGuT63JUCd5l7kV
         xbT9N0bNgQeGeP0SrR+fmx28RZiNhqfkAfsKaetsBDVZDDrNFMqgGJI3wnGQjPF/N93O
         C3tuixK0Hn9LD42wB3D4UMux5jk2nhjF1TwqsuNbQhKwQ/NKZtRqQQSMFeUORUPlxxQc
         yYt5Kr0vI+vap0WQSyen/ul7AZUcQWt1utrwt+JzMKlbopAlmHuMcvzFIz9DahGOyx6P
         q1U7LHVUJMbZy+fwhJjv7VGXxvYbxeOAMHDfQtFxnDhGO3SImG2mc5s2OzxK7JD+BNuX
         RsbQ==
X-Gm-Message-State: AOJu0YzIx0ingne3ndxeAeMu39TLAqkyygLXd2Duw+V6FsgR/J50Udxe
	Uwea22jVo/jHrWtUYHJ+PEQ4Q1Gsak0CIo70uKFHh/28Sir47LpVEemquIb/
X-Gm-Gg: ASbGncvpDUE7iJa+2gvCvyM5DWCMQPr7gN7lhwceLYiJ4toXyhmuYGXo72bKyzUKBuC
	EzMH36lSDGUGwMVWtSDs6VXN7rRANu3PA8EKFAqn5yZXTfnWKmOtjbzGXMDZKuu/kC4C0Abxwmd
	++ar6FZrKe4Mwl6s28WWjYgHt1v52a9KRcWnKE4OVGJRMRB4XZPcIglLX0vHXMl5IcDuIK5YRl0
	vKes07rNppafcMgRaDzLR2+HijC6WFHPIdn+1/B7bUq0NHwHAhgYqnKwjjqN0xFL2L7sX03wcSh
	lpwffoUeJ4x6vyqe/KeCP6ZKmsKU0292BZ1vs35+Grs/TQQXsEdO
X-Google-Smtp-Source: AGHT+IFIeFCux/Z+pSSOuGaknQgn60WkJsyEVIdAGCXDG1OLDrOwaP0qDqXIeziZbJ7rloZZU/uDCg==
X-Received: by 2002:a05:600c:811b:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-43e8f73a9bcmr115148415e9.14.1743526760582;
        Tue, 01 Apr 2025 09:59:20 -0700 (PDT)
Received: from toster.lan ([185.228.163.64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe389sm203188835e9.19.2025.04.01.09.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:59:20 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] sstate-cache-management: add dry-run argument
Date: Tue,  1 Apr 2025 17:59:12 +0100
Message-ID: <20250401165912.1603-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 16:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214142

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 scripts/sstate-cache-management.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/sstate-cache-management.py b/scripts/sstate-cache-management.py
index d3f600bd28..303b8f13a3 100755
--- a/scripts/sstate-cache-management.py
+++ b/scripts/sstate-cache-management.py
@@ -267,6 +267,10 @@ def parse_arguments():
     #     help="Remove both the symbol link and the destination file, default: no.",
     # )
 
+    parser.add_argument(
+        "-n", "--dry-run", action="store_true", help="Don't execute, just go through the motions."
+    )
+
     parser.add_argument(
         "-y",
         "--yes",
@@ -314,6 +318,9 @@ def main():
     if args.debug >= 1:
         print("\n".join([str(p.path) for p in remove]))
     print(f"{len(remove)} out of {len(paths)} files will be removed!")
+    if args.dry_run:
+        return 0
+
     if not args.yes:
         print("Do you want to continue (y/n)?")
         confirm = input() in ("y", "Y")
-- 
2.49.0


