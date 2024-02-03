Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56584C4829A
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 19:15:03 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.23469.1706987697673815924
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 11:14:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nLCqNSwB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2907a17fa34so2648431a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 11:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706987696; x=1707592496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgED+MD27zsILWn7H7/tDtTPtulCtTTnNeP7i/B8f5c=;
        b=nLCqNSwBeoblRUsotCRsW55P4nYHUmr6rSYHfq9U5VNgKyPNlWDnkmnpR/h2SjM7IC
         N0dQEcrtQNM2GkpbPIksGLXzxbg2/t6HRnMBlU1zD/xhu219jvKpkYXOWHcKL6iBhSFm
         UI/b99W7fT5yyWfHWaFSJkB1j22qc0CgM8vcluNqyhShW3fP+WgXqwG0WxOBhfqtlUUG
         cpuVuKFMNDOg5dU01aep3GGuYD3DAAQ/5UhBF22DZy6uYveKzIgucnPEyWSoj/XCWQ5J
         bp1XUfIoKNUwZkGd+ChJry47tS5fbeJorBl2uSswwm04cdd5iMUu3UEsznj07GCANXsf
         qUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706987696; x=1707592496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LgED+MD27zsILWn7H7/tDtTPtulCtTTnNeP7i/B8f5c=;
        b=STBV8aypkOVzs3W6op9f3tb4IWOoOd0SxaGNDgLErmRYhpmTtFoADNGv1zXo7P01Ff
         4G0SLQGECiIbQrDK9RV5NAwF5+D2P9UfwLAQjrItx85ev6H8/mId6birHLtcprxJKLae
         xzE2Rh7Pe184Rlh3t2FWTZ1j+xBOxn6ZKAo4DmKNxC8bJrBNiJblP14iBQBO9Rmv8wlx
         ausaeeEoxnAh2J5ZUPJpIxtnn6VJqh4RQbyBVO9L8gjdMtzJQ4kTEqYY8aoqrEAQ4+P7
         Dfzr+FjXZXaE4yaWxFVCuZC7rbNHxTXcogbxA1RHrGWB6DmRKRm3t3SvgRlP6+A4TSi0
         cGIg==
X-Gm-Message-State: AOJu0Yzu6eqlxF4Gj2RMIh1onRv5Ss7pZ7z3m3gCAD0lD1LxGCpD27T+
	5/P2Dq2xn4qYk09TC41F9vOVThpKtpvoIwHMeMPenQ9icsUJmAcZ7BPUYnvkkiyYaWOE0HINw2c
	Yaqk=
X-Google-Smtp-Source: AGHT+IFp6VGPiNAEARN7OgZdZ07OipzWFsYNorBIcr160tNlN3fz9Q0QVOA2RXX+CTV2MZGDSQrxqQ==
X-Received: by 2002:a17:90a:fa0e:b0:290:6b49:e6b6 with SMTP id cm14-20020a17090afa0e00b002906b49e6b6mr9036525pjb.25.1706987696419;
        Sat, 03 Feb 2024 11:14:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w63-20020a17090a6bc500b00296443780d7sm2376863pjj.47.2024.02.03.11.14.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 11:14:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 04/15] sqlite3: upgrade 3.43.1 -> 3.43.2
Date: Sat,  3 Feb 2024 09:14:31 -1000
Message-Id: <748c18468cc7de0173ab4796805704b9376cd391.1706987549.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706987549.git.steve@sakoman.com>
References: <cover.1706987549.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194848

From: Peter Marko <peter.marko@siemens.com>

This fixes CVE-2024-0232

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/{sqlite3_3.43.1.bb => sqlite3_3.43.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.43.1.bb => sqlite3_3.43.2.bb} (78%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.43.1.bb b/meta/recipes-support/sqlite/sqlite3_3.43.2.bb
similarity index 78%
rename from meta/recipes-support/sqlite/sqlite3_3.43.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.43.2.bb
index 93146358c7..64c1013625 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.43.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.43.2.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "39116c94e76630f22d54cd82c3cea308565f1715f716d1b2527f1c9c969ba4d9"
+SRC_URI[sha256sum] = "6d422b6f62c4de2ca80d61860e3a3fb693554d2f75bb1aaca743ccc4d6f609f0"
 
 CVE_STATUS[CVE-2023-36191] = "disputed: The error is a bug. It has been fixed upstream. But it is not a vulnerability"
 
-- 
2.34.1


