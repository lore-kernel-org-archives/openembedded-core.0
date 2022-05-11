Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627B9C4332F
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 18:20:32 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.428.1652293223976031255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4k0r/Iiy;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso2827245pjg.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=caP9KL3caIjJQI1OZxPm2p/LApv8WN6k8t8vn3LQrbY=;
        b=4k0r/IiytY8TQbbDGrmO1lTotTdeH9lCgW1SW2NQKXc+nj7W0MCE5Tu3NtHgr/3djX
         fU1zLj+C2kfGTl3YoqPdFHPVNU7EctsVjCJ4sZnjiNrCErLEM9QsfGVLZo+OCR9hw9+m
         3Z3A1YvNGGJoQZQFhmDVV0v+qjSLJnSr6qAz0y0E9LVLrNFoB9+Y71NBS3ReM4ZyhaxH
         HosTf8Lvki3rZYHz1qTzCnSbFGowTeTZMBzdt0dUUOH6982ZEjab+Jk/cJMi2Y06Xh94
         i8SjbjwtoqqcfdqMV9BAsDmocgDDRGa1i7rg00ptRder7dY4q/a3UofZYPKnkA1Gim5u
         K4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=caP9KL3caIjJQI1OZxPm2p/LApv8WN6k8t8vn3LQrbY=;
        b=YZU+HegkeRVEOiCjGZME44CPvw/8nLv7iKnHcCG+x6MEx/kfOm+edTxCLfFvi/HRnu
         2OJwyTqOIWdcWzEE6bDiC0dr05996M2HHcZsk6c1wqUuLt3ZSYzsjqVpefWMD2I3ZbnD
         4b2cCucM56BsaWRFOT7fTcEzk3F/eD3gP0MQHTpTChtF3UYkr7FXOsuLsHwL8T6uuXAW
         GI8oNtQODjdZLsu4haAcmSoK30hZeoPvt0wI18SuwqceLijVieo31dCZduAU4Ov7Oafz
         cKO+cR0etTATpFmAn2KJ30RBRUHEyPpg8AIheZQdjr44wcl07hjmT2MAD3SWyYBpdpVz
         MfXQ==
X-Gm-Message-State: AOAM5319OgIjh6q3VZOmFhnQYV8lqDDDUX4zuJ+SWD8gW67LOD5iNFFS
	W7E0ggCkZ+QQXkjMsY1PzqrsML/rp9htlT5L
X-Google-Smtp-Source: 
 ABdhPJys7f063HCEGolYW3E2WsTzL/8fxvJjKuz7PSSikjC5KDN99JaP63IUSlN9P3uimqMozQZQjw==
X-Received: by 2002:a17:902:ecc7:b0:15e:8685:77d with SMTP id
 a7-20020a170902ecc700b0015e8685077dmr27161975plh.20.1652293222865;
        Wed, 11 May 2022 11:20:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b0050dc76281bbsm2126132pfo.149.2022.05.11.11.20.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 11:20:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/14] base: Avoid circular references to our own
 scripts
Date: Wed, 11 May 2022 08:19:31 -1000
Message-Id: 
 <1567b7cec5ccbe198bfd0cca9ee8a2b1cf6dbf42.1652292852.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652292852.git.steve@sakoman.com>
References: <cover.1652292852.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 18:20:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165518

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We'd like to intercept git calls but we don't want circular references
and HOSTTOOLS currently sets them up. Tweak to avoid them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 52c37e133fa55846aca2248ffcf3a10648dbb8d7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 9ed736b0e1..19604a4646 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -122,6 +122,10 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
     tools = d.getVar(toolsvar).split()
     origbbenv = d.getVar("BB_ORIGENV", False)
     path = origbbenv.getVar("PATH")
+    # Need to ignore our own scripts directories to avoid circular links
+    for p in path.split(":"):
+        if p.endswith("/scripts"):
+            path = path.replace(p, "/ignoreme")
     bb.utils.mkdirhier(dest)
     notfound = []
     for tool in tools:
-- 
2.25.1


