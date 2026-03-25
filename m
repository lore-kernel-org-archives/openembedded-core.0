Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBB5103A98E
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:19:49 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13721.1774405179292780933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qyWCPh7b;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c73c990a96dso1952488a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774405178; x=1775009978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSAzoWoCeigJtlrQr27eZJ6DEKbpDOpzSwpyAaebhyI=;
        b=qyWCPh7bbLVVjU4bWgt+E69bLfq/7GABlN1b0h8OICzDquTsmGB5k06M8eIiPTLX8G
         SzRWOa0gp+QVhahBD5H1cFg54h2g/DZLtOvYfBOAUNZajBmzGViUDqV5Pv6GoG+n0CHh
         ra31xWIc2b9Yi3AQeYYhKxeAEI2RqLEpqyHF5KNO1XVq3KFw8Kh09MWXwi++/kjKgA2P
         7Ox2zMWsezWSYTYFJRAiEvTGjgBXtKs6UF3opqZ5CEDSzYKAcWhetETO6y0D5HAufLXc
         8Q63w5yXvd0FZ3CXMQa2kjOn7wROV4NGHh3y26kxahCTwdnW3pn16K3hJ1vA6KPTDAKR
         OKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405178; x=1775009978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JSAzoWoCeigJtlrQr27eZJ6DEKbpDOpzSwpyAaebhyI=;
        b=CQTuAJ2tzXVggEXWT+ZQGQ/01aXRnCJFk7jt78y9lL1GTz4Aj7URwW6PwedClE+CBe
         mMYo344pa3q+uyXE4qOYNnYSF7MmBD/ebPCTFPlSfTX/d6KSVszVofM2J5TFHQLx9Sh+
         SaBFRaBLoyZUxIUlzPzfTcPTb2zwaqgy2UlviiSE56vxgtTB4sHhn0SQteZqVdoCoDMK
         LRpL8MVBwXSp2pe51PPn5LyB7z0U/U8Kqk4EDCx1/0BDXxDhcrlxJBccgQBGi5AJdO72
         oDHEG1JksiAapHla6gcG4sJKZiChms6uE+mYm9bTt9tI8UdYGgHYVmxd3+993L79dkFY
         8QZA==
X-Gm-Message-State: AOJu0YzOaUsMQturrTnBb5mYs93CnwwjzJJEHqGfUkNclnOBvx/1q+CH
	yCJZUuohMZkH46F+BI/pipXabKcYUqLCx8cFUkUMdY+/yUIF4M42WFwqwAPlYshF
X-Gm-Gg: ATEYQzzl/0eQZxryAkByMW1sqaiE7uQiMBw8ezw+7aRu2W05h3we7/X61Roz/+W4Qck
	hhzY0um5rLxEdFeA99ruxMAv2WSRLbu0GMs9a3NIeiSz0QNnZoomIfIP+fjEiI6dfrMFcw+Vxxr
	B0l3I01jkYrPzSLqcPyy8cPeim4E83W+n2NNMDoNU6E9fViL2GqtD8fiIHgSXXVhCfWkCeXFL5f
	ko0M29xsKt524RvWD7BAy1bJwT9TklDkW9H0M3QsIbrLHuXibqDNzR6yfKPL63de1nj2FAmoy+k
	kUFFaLABdzTkXGesjiHOvGrr56HRVvkQAUnd7YALsboTDwNMuGPw5kHxmd/Sw/U+SqBpY/abyV5
	KhDIjkNkGLhRTxSr42CD/I/I3q3ZqyWTBGAKf0w9sT+R9NmpaaKJ/ZF3PHvlACKQPgKMMjEZ3ra
	KcwtZTT6DYAf2bWGTbC9vxHdMkJesIsT6GscLYTSO4GxCHyg==
X-Received: by 2002:a05:6a20:7490:b0:398:7769:f869 with SMTP id adf61e73a8af0-39c4ac23423mr1983084637.20.1774405178395;
        Tue, 24 Mar 2026 19:19:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm13581235b3a.31.2026.03.24.19.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:19:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 05/12] ca-certificates: upgrade 20250419 -> 20260223
Date: Wed, 25 Mar 2026 15:18:49 +1300
Message-ID: <20260325021856.4053666-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233843

From: Andrej Kozemcak <andrej.kozemcak@siemens.com>

Changelog:
 * Update Mozilla certificate authority bundle to version 2.82
    The following certificate authorities were added (+):
    + TrustAsia TLS ECC Root CA
    + TrustAsia TLS RSA Root CA
    + SwissSign RSA TLS Root CA 2022 - 1
    + OISTE Server Root ECC G1
    +  OISTE Server Root RSA G1
    The following certificate authorities were removed (-):
    - GlobalSign Root CA
    - Entrust.net Premium 2048 Secure Server CA
    - Baltimore CyberTrust Root (closes: #1121936)
    - Comodo AAA Services root
    - XRamp Global CA Root
    - Go Daddy Class 2 CA
    - Starfield Class 2 CA
    - CommScope Public Trust ECC Root-01
    - CommScope Public Trust ECC Root-02
    - CommScope Public Trust RSA Root-01
    - CommScope Public Trust RSA Root-02
  * Use dh_usrlocal to create /usr/local/share/ca-certificates

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 738e08718e31de19c1c8db5e162a4a00e2b0c0e6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...{ca-certificates_20250419.bb => ca-certificates_20260223.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20250419.bb => ca-certificates_20260223.bb} (97%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb b/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
similarity index 97%
rename from meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
index a11433c9da..41690d1d08 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "33b44ef78653ecd3f0f2f13e5bba6be466be2e7da72182f737912b81798ba5d2"
+SRC_URI[sha256sum] = "2fa2b00d4360f0d14ec51640ae8aea9e563956b95ea786e3c3c01c4eead42b56"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \

