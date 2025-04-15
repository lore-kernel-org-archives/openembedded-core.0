Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE62C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 19:19:17 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.2608.1744744753508062640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 12:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QmKEfYjB;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-703cd93820fso58682367b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 12:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744744752; x=1745349552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtA1ELs09eM/OmJJHLLVAUtvxONkmBnmjhkxOC0HE2Y=;
        b=QmKEfYjBKyZKkD/sIJwaciUni6PRE5vaLlkPNqWIt/gpD7zBbNKay82HFkMrJjSjmZ
         0TICWTK4ei2VVkkQRV0+ODfDExteXOqb7tpJ/p8oGfONdPZFRJUz3P3gapmXUGwKDy2+
         Q2dUm9nCA06Zf/VVy6xDA6elrnRaPbfvSVO+DPFJ7sRkxro4HbziTggjdBOSslRcbNw9
         q4DpH2Y607owmorNT8SS8X0+8dQ6VOMfAm6xx/rnAa+TV47RDS4f7eu6PBTmtXt4agcF
         JCcIBVo5kGymDBpjQBQnBuk51m8tv0iXR0NEvhlKVVwTRJt2vlIK3HdCJ1Ei3d6SmpQL
         jYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744744752; x=1745349552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtA1ELs09eM/OmJJHLLVAUtvxONkmBnmjhkxOC0HE2Y=;
        b=o33zz9odcn9aye+1Z9VPrEF311e2Drmc1J9HJZDtTn5ebAONzdzpiBRzXlViM7z3B8
         zwx7GFwDnoTNTEBWUaIpjNTafvM1XfwcYKH6Mr2X4Q5AeDHS/UMuG/59uNgfjeMT/CRE
         65qKRzqVE+1LS0+XvP4AeaW3UULWjgJUrTByEB3JsAFuVW3eJiZY8+9AoRRrrr0c92IS
         8rYgTIDnd3tixMNzNzmfsR+FtqkuCzd406CzwJ0ZNgK7O53pnh2+iBTuihSM+p4J1pLW
         sQzvcrohZX9nkmn075d0B+/FtO5xR5zZpxFed6XFs5aihumJ0sY2W6MZcRaHfG2+4OOM
         eH2Q==
X-Gm-Message-State: AOJu0Yz4BhWcyxTZKOAVPQhmecHrmtQL4CwXVaT5SXD4E4zixblOKJnX
	3y8xrEuKnoDHZR6iDx3e2io4GwUIvcpxidaPKHtk3yj/16HLOUNMVGAUXkVR
X-Gm-Gg: ASbGncvNlpHQ1r6kvOjoHeRifsdUc9//5xqOSXvkDTnG6oyTxmhnmSBBVwYYyDJgU0Y
	1nbGH23EvbhBdVOPGN7Cs0ZbhHACsjHZUqjA1HRr41de3ApxTUtzR8vcmkoRxgOVmiQKDtlR+qF
	Njx//lE5zIKPdOMUqD7UdD5Nk/K1xWhifEvpz0a36V1hb2wi74NVp4H9jGaIdXyyLDEKfPjeZDq
	TnQ2+4XLUOAbGa6bxgB3l1NcQF72kdUwJt/cPiiQgnejej/mv/m5GU5vtyBpeEBoqnIO9pTzwcj
	re+XqASwBNQXe/y5ZL/qgXmyhxTj2Xy/bnY0Pb6+NR5mng==
X-Google-Smtp-Source: AGHT+IHwNfFTM/7NAczlpTuDyVIktmstifmRYCBaSaPkeclpVcQ9nHglmHNN+5TIawWym1J0oiMCYw==
X-Received: by 2002:a05:690c:6f08:b0:6ff:1d6f:38af with SMTP id 00721157ae682-706acd9b415mr9281807b3.4.1744744751998;
        Tue, 15 Apr 2025 12:19:11 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7053e39d38csm37909077b3.116.2025.04.15.12.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 12:19:11 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [PATCH 2/2] perl: upgrade 5.40.1 -> 5.40.2
Date: Tue, 15 Apr 2025 15:18:09 -0400
Message-ID: <20250415191809.1332553-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415191809.1332553-1-schonm@gmail.com>
References: <20250415191809.1332553-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 19:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214964

From https://metacpan.org/pod/perldelta :

This provides a fix for CVE-2024-56406 - Heap buffer overflow vulnerability with tr//

There are no changes intentionally incompatible with 5.40.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta/recipes-devtools/perl/{perl_5.40.1.bb => perl_5.40.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{perl_5.40.1.bb => perl_5.40.2.bb} (99%)

diff --git a/meta/recipes-devtools/perl/perl_5.40.1.bb b/meta/recipes-devtools/perl/perl_5.40.2.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.40.1.bb
rename to meta/recipes-devtools/perl/perl_5.40.2.bb
index 448fd52ed6..95c230060d 100644
--- a/meta/recipes-devtools/perl/perl_5.40.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.2.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "02f8c45bb379ed0c3de7514fad48c714fd46be8f0b536bfd5320050165a1ee26"
+SRC_URI[perl.sha256sum] = "10d4647cfbb543a7f9ae3e5f6851ec49305232ea7621aed24c7cfbb0bef4b70d"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.43.0


