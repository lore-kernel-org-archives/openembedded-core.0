Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54624EB491A
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 12:31:04 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43978.1770899461302711173
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 04:31:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BfKn8lYC;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2aaecf9c325so13682845ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 04:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1770899460; x=1771504260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CK5EnkekGzG67XcbbFu3DBFEVcAm2m6yVBhhkXe2PL4=;
        b=BfKn8lYCoDf9dycsJAdWj6ORt1iBfOzSyRcNS+6I4yWGXQePVHxU1Nymep9A9+cPAZ
         5edshiBVoAu2cHilBnEeSPLR0qQjw6XE19XD6+mWiMmyqfBe51Xk/qAk65r8k+0rGxsV
         h/W8hLGY6gUigAAxD3S6ewhWRbGBnsVIcfxCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770899460; x=1771504260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CK5EnkekGzG67XcbbFu3DBFEVcAm2m6yVBhhkXe2PL4=;
        b=pSi5jOnZcDq9x2X3RVwzIPpn/0NL850IvyGY4an9friJZTn6egOiANw/VnImfKXMJ2
         ErdIM7WXY1YzrdgsaQ6qwCRv/bUyoAgaQHJgPPWGMHc7TMKojdmBVW83koZ/UbxMptFm
         ZRl3IbTjlj8sd1QPpAycYE6KF5C/PvWPvAaJkOioEPBN/FX0JbkQGbDzhyPQnnGvVh55
         DI5DUMjswIEyp0uplM2fwnoaB86uIQKu6INvUMhmQn323f00PjYleMlgbN4o/QZN4TKL
         HDzrmwKi/pO5gocygJBB6JlyzU34sSW24MXqJDvxrxAiMmyM5J3YTpep7UKIIAJs9uHO
         ca3g==
X-Gm-Message-State: AOJu0YxNJSEOgSky76CV4ga7fz/hoievDlA4+6y4fX9ZXlVlmFwOORhE
	Ax1ZhYKioWULdKr1X797IytgDHE5CEgQQRhL9expHq0teLSDKcOyehSY94QMGZVLelvlVoNcWUc
	9e5gRd9I=
X-Gm-Gg: AZuq6aKII3xXGF7DNW8n0DV6azorbwmuSyWRddpFoNxbciEb0h49kDQJ8LDBhjBk0n9
	otrlGiVr1qYS6KKf/iAOxrQL1Rx3QfG7R9mDu5r7PiC9CrOvFcaM8yXEczT6coc1zvGLkGmYstI
	LkthW04k1beqLzonpTNSTMkWyWdYCDLApyw19M9nAR3O3hTe9f5dMDE2LqmmhN6evAOwZap3WWp
	I2yizJ0F2ryTcOkzu/C+DXOqNMV8nmmr7EWKriyrlCm8NmnuIxITSYCIPg+X9Wy2y2vi/fBE35d
	0vLmRgLs9PkQ35NhJ6DDISzp3W7spaMLs/VgRHSh2yWdz2gA26spJU8Yxd0oTj/HmBuue9diNlw
	J+157zAP3/Pt/9Fn4+kqxitlNwWWyx7DhONzpqhDGPjQfu7mVyfGgH5ngBB04u8wW1jnMQh9fLE
	1eLmEl7KJMnjEt6M7Rj3RwW55K6pci98j5ZrdetNE+OhZB1g==
X-Received: by 2002:a17:902:da89:b0:2aa:d320:e965 with SMTP id d9443c01a7336-2ab3abe40d7mr23208875ad.21.1770899460074;
        Thu, 12 Feb 2026 04:31:00 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:54:f9ef:c02c:80a8:c3a:3ad2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2984ad4asm52150725ad.6.2026.02.12.04.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 04:30:59 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] bind: Upgrade 9.18.41 -> 9.18.44
Date: Thu, 12 Feb 2026 18:00:50 +0530
Message-Id: <20260212123050.59590-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 12:31:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231027

From: Vijay Anusuri <vanusuri@mvista.com>

This upgrade fixes CVE-2025-13878

Changelog
==========
https://downloads.isc.org/isc/bind9/9.18.44/doc/arm/html/notes.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../bind/{bind_9.18.41.bb => bind_9.18.44.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.41.bb => bind_9.18.44.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.41.bb b/meta/recipes-connectivity/bind/bind_9.18.44.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.41.bb
rename to meta/recipes-connectivity/bind/bind_9.18.44.bb
index 0e557163d5..64dbdf890a 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.41.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.44.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "6ddc1d981511c4da0b203b0513af131e5d15e5f1c261145736fe1f35dd1fe79d"
+SRC_URI[sha256sum] = "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


