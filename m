Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7173C77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 20:41:38 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.5225.1685479289064681865
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 13:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=J/3jLi0F;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-557ca32515eso2426092eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 13:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685479287; x=1688071287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hS2MqYlpQhYEvd0ufZJTAR8OPsuk4BprDn7bu9uArAY=;
        b=J/3jLi0FIdnADvZw/7Tj6muLU1RxLxx0MQ5gw7JR8+GK+WLG7E95Gl3H4OGgjGOyp+
         tZHMglNLoLwxP+5KqQhL6qrT0hmCTXkLflq69I+WBDzMwlqqA2bhSH8/vofNpL2ctWX+
         4Jc6WlMDEU48hsFwJXQXLjDy6o1jJ4h4iEs7dzRvAt2O2bQYMHPvo3uciVFUi8kZfa0X
         Mp9htD6bzcGYR9lDGkwn5hlKtVNOTQO5Ao0b2gLGRN3V8G6O8M8DFJQrk+lfCdI3SH6p
         j3Q2gKf7ZIArc+sVIg7Ybev+EvJP+yC5uMDpyndz19eeUNADYqbLOWeJ+23wErTvYgZH
         4T6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685479287; x=1688071287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hS2MqYlpQhYEvd0ufZJTAR8OPsuk4BprDn7bu9uArAY=;
        b=IQvh/Egq099BNVZHElTIykMbikkCluEvtUGqFg+B4S4+RiovoVxKXRE/3BcKNhF+/a
         oeGfMMgAW+mCAoWy+Oj0W5vvmJ9MHtyyKPp3LL8OZ9mDyWe4LdZaSbFk/IKCiglW1UQb
         2GAfZVI1bJM+wd7ZQ18tyWQTSkIih+iZCH0SrvrU1XI6xvpZYcQ2nTHrj2o7pq/AKlbS
         spzc7vyWeapRHbs3BfcY0DtS1GztWqJ73n7W/9Nv5ZWdlf8bzotyz9v4Uhe9GZW2br8w
         p7RqdzlL1Nuz3hjsuOdpsgugppqRJ2EsXJxl6Nt9rqUKxUQGZB15tlqcpThKMzWhFCqj
         W2ug==
X-Gm-Message-State: AC+VfDx6pRwNKFvbUXtMu4BRlh1b7pW5qaxPZQoOQrvzvo0tBd3Cthc3
	I7NTYkxFxKFqywxYVQptzgEPUAF/xqY=
X-Google-Smtp-Source: ACHHUZ6jxjjVpUxEw31QzIXKywc6unJPQpp9+MeD6it1OxV3r4qwhyHtwfmawmLpq+XUNdyjgNdVww==
X-Received: by 2002:a4a:4910:0:b0:555:9fb4:4eab with SMTP id z16-20020a4a4910000000b005559fb44eabmr1610918ooa.5.1685479287670;
        Tue, 30 May 2023 13:41:27 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id y66-20020a4a4545000000b00541fbbbcd31sm6075048ooa.5.2023.05.30.13.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 13:41:27 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/package: mark PKGDATA_VARS as a dependency of emit_pkgdata
Date: Tue, 30 May 2023 15:41:17 -0500
Message-Id: <20230530204117.949199-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 20:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181950

emit_pkgdata needs to re-run when PKGDATA_VARS changes, but bitbake is
unaware of this because the code that uses it is in a python library.
Fix this by explicitly marking PKGDATA_VARS as a dependency

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/package.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index e8055a9cdc5..c466601266e 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -381,6 +381,7 @@ python emit_pkgdata() {
     import oe.packagedata
     oe.packagedata.emit_pkgdata(pkgfiles, d)
 }
+emit_pkgdata[vardeps] += "PKGDATA_VARS"
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides ${PKGDESTWORK}/extended"
 
 ldconfig_postinst_fragment() {
-- 
2.33.0


