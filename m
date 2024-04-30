Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9253FC19F4F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:28 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.206.1714512266436687005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GnfKOYUW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1e4266673bbso56472005ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512266; x=1715117066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7HVPl4asX4+h0779dE5hN/J0jh1tzofTDFoyyf2qfw=;
        b=GnfKOYUWzQ33rMMk2eVfnkPd8cdYdhNeYw8BuhdDENrS33wCSxFlsc+Gk+F6B6uMjl
         B2Fh4ptgQ4SXL9djHM3RO/zd6Pg2kAFiLFTShUI5APncSu9W7dIL20YV1gIEorEplwog
         VTOCXxnQMnMrpsiib2WptCgHbomXqZytO5917o04bpPl45WdN+SIZ02MRyNYmg6jdLQI
         R21VH078i78lwQfvOR83WSa30bzyQFJMEtDIUDKAlUYnIOQ6YoVJauSNEfBjzETWcPLw
         i4LapZHaqrO9lHnGesoIU5pHyeGCvSbtNCn4e9ysU5kHuUJmSd1QSz1LVCF+Cy6d6jAa
         RkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512266; x=1715117066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7HVPl4asX4+h0779dE5hN/J0jh1tzofTDFoyyf2qfw=;
        b=kIGLbTqBaBdCriI/aQIjAIltc+CjR0tSVF54hw35FsX1ga5rDitcJuR0cJeW1NAtFz
         SJ3HSB8IVNsb0N5XQb49uZ7dXqX7QUFL3Tre/4iIzkp/uc4RAeY1Mr3wrT4Yoa+9j4/F
         clV05sT5y7gvmGCjMA57H3wwcTr5DhxCClrHxqAB5wuMbsyA8mkOnLuXdwQAnIwPswtz
         wJgejTiVGLncKDSzCh83TeEbGlEOL4BT00qZ/6ezmybfoJ/RmLARRFhHRBV1nZ/7qjSE
         I23fyq3wq/+aXVs6bJdS89SKzNJxj0PVFONeAgvpiNml81+5V9cdvAPWmHvuhk6Jy31Q
         toWw==
X-Gm-Message-State: AOJu0Ywi0bArU7ZNtUzDnaa8uNLbAkak9aOqyYoNpQNstY0VJlbxR+Pt
	DhA7ryDSD2+c3zFEgMKu2v+I+OTY2CULKtmqYyS2nWoe6o56B/Pq2T6QylgLlS4hK5g4gQraz+z
	/Srs=
X-Google-Smtp-Source: AGHT+IH91zfCpuRUlwGVuXdu/X6l5RHxFiDNr8TcVJ67uhmeIX3JBnve481wpWamQ4TqTmskhwf9QQ==
X-Received: by 2002:a17:902:efcd:b0:1ea:f7d4:cf2b with SMTP id ja13-20020a170902efcd00b001eaf7d4cf2bmr606259plb.17.1714512265723;
        Tue, 30 Apr 2024 14:24:25 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/17] bind: upgrade 9.18.24 -> 9.18.25
Date: Tue, 30 Apr 2024 14:23:53 -0700
Message-Id: <5b3ba5f021f3bd532238dad57772c8416da61c14.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198772

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Create the pruning task in the dns_cache_flush(), so
 the cache pruning still works after the flush.
-Improve the TTL-based cleaning by removing the expired
 headers from the heap, so they don't block the next
 cleaning round and clean more than a single item for
 each new addition to the RBTDB.
-Revert change 6319 and decrease lock contention during
 RBTDB tree pruning by not cleaning up nodes recursively
 within a single prune_tree() call.
-Address use after free in expire_lru_headers.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 17cecd0d9d0d734d408701d861692ca5987f4ad9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.18.24.bb => bind_9.18.25.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.24.bb => bind_9.18.25.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.24.bb b/meta/recipes-connectivity/bind/bind_9.18.25.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.24.bb
rename to meta/recipes-connectivity/bind/bind_9.18.25.bb
index 2874990320..cc35604aba 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.24.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.25.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "709d73023c9115ddad3bab65b6c8c79a590196d0d114f5d0ca2533dbd52ddf66"
+SRC_URI[sha256sum] = "5a4a70432a33d009f0e6e9dbb328aae7a5e27507e98e28bf3c0c6b250ccb2ab3"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


