Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE13C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.11411.1634657710136405323
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hwTpEtI6;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 n40-20020a05600c3ba800b0030da2439b21so3399835wms.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=plmQrGoKBMvqCd6t/HOPp4dzgcRppP3HQhgqWweCaTE=;
        b=hwTpEtI66cZoseLtM7fD+G7PfhLVfREzWa09FpaRaOZw0V3v+dMrT+Vzok6+PMbA6y
         jpvlvSxtkYsQXX0ZqwdNb5mcnMpHJsAe2XvIKB6D8fqPCfvPMOE5OJ64fCG21PLfIznJ
         aZj341gBa0y1RMdTkW7uPkmNrTfvPqJ7u7QxyVHvaI/oQfwtXIfGEgDQXArOO0iDJJca
         WlNshs1grzn/6HAJy5DAW9TNnO12SCRdeFDQakDDbGVVBwz6bawIpiC0ijYpsUYiRClx
         MWRN08ZCR48C7zm6uk7iPHgk13UBCB2oPDVW7/NOnzbwkYo0g3QQHx71qyTUSfz5GvyJ
         h/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=plmQrGoKBMvqCd6t/HOPp4dzgcRppP3HQhgqWweCaTE=;
        b=cDg2fUtAvywpCBL28K4TyWw1xiA1S4phpRY2eJ/4OVLX5qS6ecAn7k7JDFwZ306cCF
         2h7If3eVF69Yak6HzyRdm29OCpUF87p9ODfKhs42DDqJmS2NAy/trQmr+JuisvJlM6Yy
         DPvF/JlUugGt4dWJHU9IMzOQ6KFsUo1CUa7GGU6KDwp/AN+TrMd3SAojbG2OvfHt8ayF
         j7atCdLg6X+AusWT+wRdMrwbJ/FLa5HVdWcgX5cu8XmTYCHmA6Ug6y5ox3unR1MRVwlo
         hEBQiUHD70hhU2y4EiTV4P3OCo8KTDS4tKRk6q/vdDiLK7Su1MbluJhObhyXOSeRNaDQ
         3Kyg==
X-Gm-Message-State: AOAM531WXsvQWFo0kxjGgOr9VoDkgmpnHhYZQ4v3qBFqRdEhgZHQzH9b
	U7EFHtfo7PgK/z+H20bZUBUypXvpTd4=
X-Google-Smtp-Source: 
 ABdhPJzlfs/PHvcNaTJUgPwdSSoVM+t8vlYSxMRo4VqIubRXzDHm/+Xxj7E53FsYJhurJaRvWgISQA==
X-Received: by 2002:a5d:4c90:: with SMTP id z16mr20761626wrs.67.1634657708797;
        Tue, 19 Oct 2021 08:35:08 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:35:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 64/65] libssh2: skip one of the ptests until openssh 8.8
 compatibility is fixed
Date: Tue, 19 Oct 2021 17:34:18 +0200
Message-Id: <20211019153419.3319802-64-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157183

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/libssh2/files/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libssh2/files/run-ptest b/meta/recipes-support/libssh2/files/run-ptest
index 5fd7ec65f6..9e2fce2d24 100644
--- a/meta/recipes-support/libssh2/files/run-ptest
+++ b/meta/recipes-support/libssh2/files/run-ptest
@@ -2,7 +2,8 @@
 
 ptestdir=$(dirname "$(readlink -f "$0")")
 cd tests
-for test in simple ssh2.sh mansyntax.sh
+# omit ssh2.sh until https://github.com/libssh2/libssh2/issues/630 is fixed
+for test in simple mansyntax.sh
 do
 	./../test-driver --test-name $test --log-file ../$test.log --trs-file ../$test.trs --color-tests no --enable-hard-errors yes --expect-failure no -- ./$test
 done
-- 
2.20.1


