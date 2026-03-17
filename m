Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37650FD8754
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 12:10:08 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74303.1773749404951981640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 05:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EwI2KlEE;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4856cd3f1ffso15398035e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 05:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773749402; x=1774354202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V8YyYwdMJSKcgcZvwpPgPz7J+0/IIpo/jlfEf+55H7c=;
        b=EwI2KlEE1730txZdh0qEu2JPNgSTPP/FsLsXOxzy8bW9n2FKKtP7od1q1uBGc1Mkm3
         BujWL4yC5bzmLZXcCnN3upaIJsuz2jHzCFMjST5c4o6brDaY1JShkBXn7p1plfSO/swB
         JUbKG5BatDRIDqHQ/dvJLJmlz0xk5kydVNkxP+LIi3+uWR91oFYVe9weaz/XUZyWiRXU
         YE9viPMC9z6vV1EltCdIHz+ZnCZQyvvJsifdo8FZ/eqN8rpV+aZuI/6xO8wIRSLaSiM9
         YiKHoJw4dlTgv5fPVptRL8aUYYL50iy1njT61LKh1cVdyt57MpH4SCBUT+eKxF8rzOIN
         AlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773749402; x=1774354202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8YyYwdMJSKcgcZvwpPgPz7J+0/IIpo/jlfEf+55H7c=;
        b=V4j6w8n3bCJEyAigqkiz9bSjzbcRU3FOIv7YQo3sURFFj6efCy6hcwBquq/d6lcDnu
         M7cvcx+ipo7cJpFXuVCPt124Wfpksrdz99/PrQ6qhD51nYNzPXwJLwIxsDKm5tWVvUOc
         vHIyeZKGeJATTJUo2HqEcTtpBIXW8b0MZK98d2XyZdF5lpqFWXTs8MyM7mAyaTl6uNMG
         WZt23D9ZKlkqbbw8/EcKAyDcAGBNUWFJt9Q4aYsNaNXXXW83cDd1LK1lLrVsOzdx9x3d
         vB8EbAfHra6nxHwlLTjo0IoFZD2KB8sdvwYEeN85q3wb6rPfj0OgqfUQ96gkwkQCg0nC
         8/JQ==
X-Gm-Message-State: AOJu0YxuEg8bjnoHB3ruPbf0BFXS8PtrJjxK4DIZdY7dujEr8YsXciJd
	4gzo49VPE8YBQ5voBt9hBemmriRPdwQvZcnUdsgpmpc8nN38eUKL4vAoThwqvA==
X-Gm-Gg: ATEYQzxDaVnZ6CQ/IYeCevUbh8+Jg+CbdJxM8WPQ2UGmeZ5ra0fYvf+uxS5TtBfp7/l
	a6SF+IO13irNNyPQ9+HaZPSNx+cY8JyULfgSivzicrSVvGIEQr/xsXWcf9xE79L7iRmLOkY0rZd
	xE6zIZgQtxmdwLBuG0mXt+VUGGjM/YvE+fQI3tesU7yHm/jsWJYIDepGNeog0ooTU9mcY2JkeOQ
	IO2Ojta32oTlrocU9im1qVJ12F6Pdp8n2lUCdPW5T4WlPtWpROHXHxdHV1P4itor1tMnhLor2Sl
	V+xQ1jByXHTgJpAioMJyFY7eCD1hpA5mw4VFunpUK0rwPHWLm2rCALIf/oMS3cm6T0eMT20cjIh
	sP14HcZBVfHDWge1R0TB+T8qhp7raboShYXtvBnXfP2H9IiIeNFtpoPSDmu8lzBcfJvE3WwNMNt
	1MBmvns4fvuPEqT39MGWlLe81L8IWeMFqYI8FRUyqPLEE=
X-Received: by 2002:a05:600c:4583:b0:485:3983:aba8 with SMTP id 5b1f17b1804b1-4855670530dmr254720795e9.27.1773749402026;
        Tue, 17 Mar 2026 05:10:02 -0700 (PDT)
Received: from toster.lan ([185.228.162.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaee510sm59098415e9.14.2026.03.17.05.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:09:59 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>,
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH] sanity: condition hash equivalence warnings to when it is in use.
Date: Tue, 17 Mar 2026 12:09:00 +0000
Message-ID: <20260317120859.317294-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 12:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233319

From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>

The warnings about the hash equivalence are only valid when it the hash equivalence
signature is being used, and for that we have to check the BB_SIGNATURE_HANDLER variable.
We also have to consider the case where the variable BB_HASHSERVE is not defined.

This fix the warning that is displayed when using the basic signature hash, OEBasicHash.

| WARNING:
| You are using a local hash equivalence server but have configured an sstate mirror.
| This will likely mean no sstate will match from the mirror.
| You may wish to disable the hash equivalence use (BB_HASHSERVE),
| or use a hash equivalence server alongside the sstate mirror.

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 meta/classes-global/sanity.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index a170c3f5f5..e8eab1cdfe 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -1007,8 +1007,8 @@ def check_sanity_everybuild(status, d):
                     check_symlink(mirror_base, d)
 
     # Check sstate mirrors aren't being used with a local hash server and no remote
-    hashserv = d.getVar("BB_HASHSERVE")
-    if d.getVar("SSTATE_MIRRORS") and hashserv and hashserv.startswith("unix://") and not d.getVar("BB_HASHSERVE_UPSTREAM"):
+    hashserv = "" if d.getVar("BB_SIGNATURE_HANDLER") != "OEEquivHash" else d.getVar("BB_HASHSERVE") or ""
+    if d.getVar("SSTATE_MIRRORS") and hashserv.startswith("unix://") and not d.getVar("BB_HASHSERVE_UPSTREAM"):
         bb.warn("You are using a local hash equivalence server but have configured an sstate mirror. This will likely mean no sstate will match from the mirror. You may wish to disable the hash equivalence use (BB_HASHSERVE), or use a hash equivalence server alongside the sstate mirror.")
 
     # Check that when SSTATE_DIR is shared between builds, hashserve database is not private to a build
-- 
2.53.0


