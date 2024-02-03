Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49577C48299
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 19:15:03 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.23472.1706987699340188924
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 11:14:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=p9/b1i/Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5c229dabbb6so2083610a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 11:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706987698; x=1707592498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xp4Ch8Y4RPJXokOmZAc8lxp8lLx/Xa2XTps1io4Jso=;
        b=p9/b1i/YsO/GEQJ8PZnNEA2ZrZ9SF1okzXZDi62ddaxR6CVifXDil8lkQKG9EoWXKq
         Q0uM+GiWCd9+PYRAxENCWkSaUpsycV30oAV1ZPAtOkWUqBeN3KwrY1VWN05ZBhfQ5wlv
         zpITj4YE/Q5b5IwskSO6M88OZ3da9GKWYgeYtm3IEOQv1huSd4nFlS0bLMI0ekRpJSYv
         TPjji1ibqn1GBwgNx1q+9hcovyxZ5+SOIzwi7lsMOg31NuljjDZqA+VLDHfY37IzcF9M
         QDtw6EluHcXotzQQzolVkjf9XXR43ngjzL1J8oMC2zPKNhVy0WbXZKk915DBKIjyIze3
         FZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706987698; x=1707592498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xp4Ch8Y4RPJXokOmZAc8lxp8lLx/Xa2XTps1io4Jso=;
        b=G16M6HKJmOqE4izXTcUh0MK6YIJala3Mw3pCbrWBQXYovMGSXoq7NnFnU6Y/P23Kkh
         +lAFDzWAkBunijQ3RevXIE4RhU6qh+pyyCFLXC/Y5FDN3Q4Q8ih5kkhU+IbkgAsbwm1V
         a9kM7BUEBmc4Gt+0/ZnPh+inklO1pbJSW6DsT0i4GFDqxhTqo3gPXg15LVS8RDwsJamK
         q2xFeO+q1jPsbavcP1amvkaZyl/i7In4wCcdOXLXyOgz587lP/Q87r5uLhvqAT86mCnx
         FSn1utXyQa8KDKX9gNDzR2Vya6P7KQQ83avEXTogmr0zGnnFQp7bIXxfODK5qPDp+cmc
         lnTg==
X-Gm-Message-State: AOJu0YwRbBjvJu19qdMI+dBBX+rLr6W6Dwo6to7bTx7i+p7qDjUphwTN
	HeCSGoo3v87VFVV0GXMT/m8HheBpJJWM5KzhXzyrubS/F0lQF7Qw3c+57V9tqm7LdbiNT6448l1
	oA9c=
X-Google-Smtp-Source: AGHT+IFPa9X8EV9SXudaCTUENBlg77Zh4UQfEWrMem9x4W5LeBoUTwNoI5Bx/8v5Jrxa3HeoQhyLCg==
X-Received: by 2002:a17:90b:11c8:b0:295:ef33:49af with SMTP id gv8-20020a17090b11c800b00295ef3349afmr11084893pjb.9.1706987698129;
        Sat, 03 Feb 2024 11:14:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w63-20020a17090a6bc500b00296443780d7sm2376863pjj.47.2024.02.03.11.14.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 11:14:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 05/15] sqlite: drop obsolete CVE ignore
Date: Sat,  3 Feb 2024 09:14:32 -1000
Message-Id: <362a77ea331124ae4c84553c0dceb06b05150804.1706987549.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706987549.git.steve@sakoman.com>
References: <cover.1706987549.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194849

From: Peter Marko <peter.marko@siemens.com>

CVE-2023-36191 is now rejected in NVD DB so it won't shoup up in
cve-check report anymore.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/sqlite/sqlite3_3.43.2.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.43.2.bb b/meta/recipes-support/sqlite/sqlite3_3.43.2.bb
index 64c1013625..66d6255ac0 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.43.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.43.2.bb
@@ -5,6 +5,3 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 
 SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 SRC_URI[sha256sum] = "6d422b6f62c4de2ca80d61860e3a3fb693554d2f75bb1aaca743ccc4d6f609f0"
-
-CVE_STATUS[CVE-2023-36191] = "disputed: The error is a bug. It has been fixed upstream. But it is not a vulnerability"
-
-- 
2.34.1


