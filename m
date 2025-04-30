Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572B2C369DC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 02:54:27 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.8292.1745981660824556462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 19:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wcuGbNOg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30820167b47so529433a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 19:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745981660; x=1746586460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BC9K8tEDNqYU7YZVfAOGDKfx2Pxk0m2wofLc/fASmg=;
        b=wcuGbNOguAiXVXvuuLXWMkwnYwGgCrH8muNOWZP0p22XEs0c6dP3oFzh+rz2egj8Mn
         hl90wiKUYYjW3NE4M+Wzety/aKICY6p2AvCKoSGHkMXKyt8kUdRKynPec7KKd47K4Ek5
         cghmnmjQqAkX5sKZ9yqYosPVQWwXeZiXbzf+WrU9bx3JqgEtfhS+jWiSCx5yJwKM+wLk
         CINX22Ibb9tWdQ6hPmUAuf6vejDdoSbZV/4cOt/LAuO6Tke7Pyw3vEFfwiYNeFM6yJAN
         /6fjiOlap3mnH2WrTDs0LjLCdLoZyKBpTzcxxN8gStgC48GZpmyYOfwnKfqAqdaEJ39i
         v+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745981660; x=1746586460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BC9K8tEDNqYU7YZVfAOGDKfx2Pxk0m2wofLc/fASmg=;
        b=PNRG0RmWWjcgLUpYtojwh6kEauYI2xjBYGbL/PAIcDEs5gsh9baeBzu8V7ax8wOWAh
         DmUPpYlFSiiFstZp3SwDEcy9oIewu7/G+narFiVXcM8n/ajKacLS5uDvhvcm2sT7GzVR
         sn0HNmaPx7ElhmWYRsilYt6O9mfysk2nxNV4tMTfiqvqav6jYyiwO3rZGssEHxqzC6lY
         mnbov4YrisU5SWSr3yPZjM54wHFNv41YVucDGizl+yzar4tCiqyErptXU3X/XWLOKGYE
         bQPBQTE2Q+Wkz0ozggcCr1mvA6YiaFPA/kVHwDJCZjew3eBVlyMtlgl+RNruKhuPCyjL
         0s4Q==
X-Gm-Message-State: AOJu0YzSJYzg/8Zkh+2Ei/OwtDRqB2pMLBUcItGRmhdqxgIyu2gj/8YY
	Pad+2ZlaWj9daFyjw9nUn4DxadX9J8EXn4V0TpLNZ8XWf5PAXuGEdKj6gMyXhtXZ+5hQ1//0un8
	2
X-Gm-Gg: ASbGnctZFMfh6eXS9BbUWhSYed4Qmu4mbElAhfayAlFD4dpdxznUcRYRfyXSHbqrwLa
	pwAwd4wL7laQ+hb3JgC2DbZrv711uoHYu2GmJNA7PY9/0RkThvuoAM6wTCsoZnKw78SZx9x5KTZ
	1ZNxXWsBrG0bytIB6kjjJ2Yv1Gt89CfYPjwbtXELtBPOLg3175AJX/MSDUEORXI3dJrioXsy6IQ
	0K18wjxE8A4EcXFZF03zs9uKJ4q5Nbmsoox4O/PNB8tmHE3UskRd462CR0gqCdEQYUVJ4F5smYs
	xqrJ1SR4e2qIVD2WrTg9HFYUatINnBk=
X-Google-Smtp-Source: AGHT+IFywAwZ/eNoJEaJxb2OiofzWc+4gkAmzlmX0++wwlbTQKalQHJjFYzHVTc4SWQnY7PkfTXoRA==
X-Received: by 2002:a17:90b:2e44:b0:2fa:1d9f:c80 with SMTP id 98e67ed59e1d1-30a33d5b51amr1933537a91.17.1745981660073;
        Tue, 29 Apr 2025 19:54:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a2ea46sm347852a91.31.2025.04.29.19.54.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:54:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/14] Revert "cve-update-nvd2-native: Tweak to work better with NFS DL_DIR"
Date: Tue, 29 Apr 2025 19:53:39 -0700
Message-ID: <25ba9895b98715adb66a06e50f644aea2e2c9eb6.1745981510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981510.git.steve@sakoman.com>
References: <cover.1745981510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215705

From: Peter Marko <peter.marko@siemens.com>

This reverts commit 7adaec468d3a61d88c990b1b319b34850bee7e44.

It does not seem to fix the issue it was supposed to fix.
Additionally it breaks code which decides in full/partial update,
because it manipulates timestamp that code is relying on.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ebc65fdddd7ce51f0f1008baa30d0ae7918ae0bb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 9808120cab..d50d9a2cea 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -85,8 +85,6 @@ python do_fetch() {
     if update_db_file(db_tmp_file, d, database_time) == True:
         # Update downloaded correctly, can swap files
         shutil.move(db_tmp_file, db_file)
-        # Need to 'touch' the file to ensure NFS sees the data
-        os.utime(db_file)
     else:
         # Update failed, do not modify the database
         bb.warn("CVE database update failed")
-- 
2.43.0


