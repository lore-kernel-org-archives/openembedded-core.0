Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A542CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 04:09:57 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4331.1762488594109221874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 20:09:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RzlxA+Lv;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: nmjain23@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2957850c63bso3396245ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 20:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762488593; x=1763093393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UpNCcvShgxmFT4vJORiVzbpShP0IAN1kr6OkZDZmm7Y=;
        b=RzlxA+LvY6OcAnRHHnEdWzWl0d2KHJTVVqtc1oF9REwUlkCJceRLGIUHJreznqWGNW
         Ltl3kq4STl9odZUkeRKW2oiBupN11kItaN3J/FgdXPwbV1Uapp7qKPD5UpGA6AeyFTrv
         GJe9TIhL5nDvrtLOSfQuPGSs32qq5ozCIzaDd/egqTOLg+sq743nZT1xyCE5B+6sCtxy
         rmh1gZV5UKLkkYDdywq2umnY5mmA21Ni8ZLNeE2NNTDBRVwdAsMhRYVPmLvt6izbw/sB
         spQBqGd5q6dLldOEhpx7WM3QMzXx9CnUEvVFxj/IdZpJmJdsrHvyuLxvJ4PhhZ0m23CN
         giHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762488593; x=1763093393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpNCcvShgxmFT4vJORiVzbpShP0IAN1kr6OkZDZmm7Y=;
        b=j+7X4oZ4NLeCrqUMQtxQhHuq4Oi3twYqxlqGvzC4brQGB2ydcl7SVSm1BH+2uR9OIr
         nad9t8SYKCiHrpM9KqbzaPTym+divYipXYwrViIcgm+AYNwpBo7T17AsKXhcMBPFQwHd
         ntbm/K/oNuFtlp9TzgW6LWiUXJGGClxf4eY8+swXqN9fg03NQk9z0bYN8X1V2K1lBS1c
         Yxd5BulOT2o7wnqXy2PmLAo1d8YVF+DRIjnBCsdcBdwxOdr7HfUMT8rcyXShx2TQQ/tr
         nn6nyD2kBCuFsA28CHaonUiSLOWjdSqHk+GEVkFdMKhsAuo7dPunJM9E8YPYkPTxWIzu
         mTww==
X-Gm-Message-State: AOJu0Ywma9A2jQ0PUwJ26I/zZJn2aq2i0sfOPFO3yuRdnQ/uPXRNnFzl
	EHKjY2mdFHCPno/3cebR/myKwlTrcK68lDgWV+up3Sg+n0JzJk56wyuxXvg0/fU2
X-Gm-Gg: ASbGncu/crfZjzcg3BNcE4pjsTUQGzbwRC4gBV3APx9ZjjEIBLeJ7gyqRlwNNJ5R4Hg
	I/Gk4CaUp2FHGaKfIj0IkJHpAp+f7JLC4LrFaDYn4oUZF8kuxOAz3frSK2xa1KaPuvrxLtJe4Sb
	EgnynNDIGCuVFJk8AFjR1sVABB5qCfXQqTB1Nu2Icuf+bn7T+cvKHF6p7srgdMSfT3uFAtZ+ali
	TBV4a/4p+0KOjULbJaHl0TAgTLtOH0ayYRKo8odnHxiINJcl86FV8N9pEK2IqUQwVbu8sRrYWNr
	7PYDiMEanrC/JSGsLV6eIBP8TSjw0eEjy+x7WSm9n3EUr8anHY/zix+gpv2WJOsSYnWZAGp7IDG
	Pfah0kWtxP9K3DOxQV7iEVhKRPhk7KkK9UbcU7ovqZX2JqhgUGi+lVe6yjGrgSrkkj04jpYLs3a
	ur/PuqI1TqJC5QaySZ
X-Google-Smtp-Source: AGHT+IFTaMFkG3I4s3h+bCgUr9EwY76DpBi+nW7TCVDmpwUqan7H/IwVjnfDKLPAytPy679wyLhqVQ==
X-Received: by 2002:a17:902:cf0b:b0:297:c079:4c32 with SMTP id d9443c01a7336-297c94d8a62mr5836085ad.11.1762488593207;
        Thu, 06 Nov 2025 20:09:53 -0800 (PST)
Received: from LL-3450LLL.kpit.com ([103.133.67.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c6f201sm44486375ad.55.2025.11.06.20.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 20:09:52 -0800 (PST)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Virendra Thakur <virendra.thakur@kpit.com>
Subject: [meta][master][PATCH] socat: Update LICENSE field
Date: Fri,  7 Nov 2025 09:39:23 +0530
Message-Id: <20251107040923.4127069-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 04:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226007

The below reference clearly states that GPL-2.0-with-OpenSSL-exception
is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
Therefore, update the correct license.

Reference:
https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 meta/recipes-connectivity/socat/socat_1.8.0.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb b/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
index ee6ca1fe44..964af9d124 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
@@ -5,9 +5,10 @@ HOMEPAGE = "http://www.dest-unreach.org/socat/"
 
 SECTION = "console/network"
 
-LICENSE = "GPL-2.0-with-OpenSSL-exception"
+LICENSE = "GPL-2.0-only & GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://README;beginline=248;endline=278;md5=338c05eadd013872abb1d6e198e10a3f"
+                    file://README;beginline=248;endline=278;md5=338c05eadd013872abb1d6e198e10a3f \
+                    file://COPYING.OpenSSL;md5=5c9bccc77f67a8328ef4ebaf468116f4"
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
-- 
2.34.1


