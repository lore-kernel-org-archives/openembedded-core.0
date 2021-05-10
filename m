Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.31177.1620651678185395735
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 06:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CCyGblHy;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id zg3so24386347ejb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 06:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W6P7c7eNXNrETWhNt2r3VZTEkQK0iYdthKowcbAUCoA=;
        b=CCyGblHyfgvp2jmGB5IhENFItsNbGpbVVEYk8UIkU04YYcJcHP8uVFsZxwLkFRhrOy
         rVfG+zuZ+FcTJfPfVxbCcQvGBbsndiERvkApUfKxYf6UgW3NTjUqpkzua5hUTBv6/mnj
         MszaDXVPa1ZWljXH0xPLJbvam+E9hqK123TZgQptF2kpY2Zs9h4TA5/f69WZRqHyTZ66
         lxZeE/O0sxMPQ+ov6pea1vJq/iI9oaaif/bQv8CqUYZqi5ysCR9YXxD23dF7zT9uUDxj
         jSPH+V6Oq97jOc3f+fRPHSNpMlWYdAlxjIxlN3SdfRQDYFW9/pP+hUgUzjNJHbNA4cAl
         QHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W6P7c7eNXNrETWhNt2r3VZTEkQK0iYdthKowcbAUCoA=;
        b=StkKk335Ugjpno7WEPT9vhpwqNfaEKtmup3TYY0q/CrbdQrjZvhPAZACFdO3Kh5bqY
         IOGUipz/n7jCSj9PesdS46NTxh6Gar6Ztk46IQ76FJ2azs6KQM1soR71rFstD140faaj
         WnxlZRllJ1478YjqrgITpJggTCGtq4XBC9NAehS/nSca9DVnxt6WisHHhtHVhjCPb0UJ
         BWXzL4Tr39fLN9xbfgug7GZbtGiTCZpnznHXGiarXsmtT8Qr3+KMLrXQ9Pgta0ZTEwc0
         hydc6zVr05iH1h8qOd28LE83vrvwAXOPu0TvKN3KOkHqjddLixkdpOPl5yK14M2sAVfp
         KGoA==
X-Gm-Message-State: AOAM533y6/fihVvrsyACLmFslEGD9/esD7LB3ue9iFpv2PGQ9Wsgre/7
	TMnrmuKvdXWA4OWm4bQSxEQW1BlTK98=
X-Google-Smtp-Source: ABdhPJy9BYjoXEh88PwHzYSxKdn/Ce1mqk3nMqbPDi61T7PjDo6Yi+1nlIYL6Wp2hWTHgVmCSlsyJA==
X-Received: by 2002:a17:906:55c5:: with SMTP id z5mr25153188ejp.306.1620651676662;
        Mon, 10 May 2021 06:01:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id pw11sm9057361ejb.88.2021.05.10.06.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 06:01:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/8] Revert "go: Use dl.google.com for SRC_URI"
Date: Mon, 10 May 2021 15:01:03 +0200
Message-Id: <20210510130110.939820-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 4118415d4bc6243c98a1440195826be7cbad24f1.

This was found to be unnecessary, and broke upstream version checks.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/go/go-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index c368b95b69..39a681a712 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -14,7 +14,7 @@ LICENSE = "BSD-3-Clause"
 
 inherit goarch
 
-SRC_URI = "https://dl.google.com/go/go${PV}.src.tar.gz;name=main"
+SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main"
 S = "${WORKDIR}/go"
 B = "${S}"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
-- 
2.31.1

