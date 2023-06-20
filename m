Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B3EEB64DD
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 15:40:05 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.719.1687275603855702437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 08:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=PyFf8JVe;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1b52bf6e659so21848765ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 08:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687275603; x=1689867603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxuCSPIjXcCFA6VE9io5o3mAshrjpiul3fIpp2+ZIOk=;
        b=PyFf8JVeymYmtZKI3Fe1D6xYX454yHanxh91ya0xR4P1g9jg7nXi0OxOdCA/ofLVp4
         B6M9u3fpIgA71XgWdcjRs7z3jBFF7dTYL93MZG9z1V9cphIwzGzIiNXMjDsYJEwMxh05
         RXkmOt68IuDvtSUd1SWQ3852NSjW/VyJbUr0pR3xTL1dAUKPlIkiDd87VUWtCNjKc0TU
         1RHKkV5UCU7YWPr6//u9di6L/2HPfDLPx9mZgfFfrW6zku+kPnz/qEOR2aZhvesRYcQi
         X3tl4Hx4saqs7NLIhW8bvmAwVrwKk4hIpSUDVJ8ov1R6R5nOkueoA/6RLRbzOGQe4zA1
         osKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687275603; x=1689867603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxuCSPIjXcCFA6VE9io5o3mAshrjpiul3fIpp2+ZIOk=;
        b=JpIaP47AaKs44PAm51q07CXz/T8sN64c4AOGRxccR4JYXfzmzLCys9/+G9o1jTJrov
         nqGFdXBL2kbJ0DM+PU9aq5yCtIADfIDXKTTQ8Ll8v2LcbM68L1iEeA7h0ZgtyTCC0f7L
         hweTVH/pEZIiMz0Z9e7V6gZffgo6Ib6cBTd4/09rInF/ZCDgi3jDBZXtPIUDGTb6SQqv
         ZNUKsCciYX8natNs2/fTFiOgqDMbfH2HYFNg8bY+6Yxzs7jaH6zOAwFnjBJY8/3s/zbZ
         P3LdYRzfJC0CiXzTS+aZxL6U8EM68fail27r5zVtECi1t5gPV0v6YrJhWyx1Bp/7mfUB
         n0+A==
X-Gm-Message-State: AC+VfDx+VF6MXzTblz4+jnVk2cIsult/F8y+FQfd5aogSFd/56ZnEW3J
	aDZH7vwWCW36+EfVsKk9kxPY5TZ6W+8THUjW/rw=
X-Google-Smtp-Source: ACHHUZ6vK1oaqcgBIC1KVb/6cFwigcqOjZhe7hqpBMV3VNe3e75W3WvdDLoxpz3lCGqwULGIEa6zvQ==
X-Received: by 2002:a17:902:8ec8:b0:1b3:c578:c3e9 with SMTP id x8-20020a1709028ec800b001b3c578c3e9mr7175037plo.62.1687275602875;
        Tue, 20 Jun 2023 08:40:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902b68e00b001ab2592ed33sm1792119pls.171.2023.06.20.08.40.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:40:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/9] go.bbclass: don't use test to check output from ls
Date: Tue, 20 Jun 2023 05:37:22 -1000
Message-Id: <f9b1a56c50a96ad6300a48bf74a540579b352411.1687274724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687274724.git.steve@sakoman.com>
References: <cover.1687274724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 15:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183146

From: Martin Jansa <Martin.Jansa@gmail.com>

* avoids possibly confusing error message in log.do_install like:
  ls: cannot access 'etcd/3.5.7-r0/build/bin/linux_arm64/': No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2f1777e6ac5269a71203b6a2c562a43503be95ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index f3d83febbf..d944722309 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -122,7 +122,7 @@ go_do_install() {
 	tar -C ${B} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' pkg | \
 		tar -C ${D}${libdir}/go --no-same-owner -xf -
 
-	if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
+	if ls ${B}/${GO_BUILD_BINDIR}/* >/dev/null 2>/dev/null ; then
 		install -d ${D}${bindir}
 		install -m 0755 ${B}/${GO_BUILD_BINDIR}/* ${D}${bindir}/
 	fi
-- 
2.34.1


