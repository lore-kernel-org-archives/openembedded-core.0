Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65968C433F5
	for <webhook@archiver.kernel.org>; Sat, 14 May 2022 01:07:57 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.1690.1652490474807223611
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 18:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bEzbRI9t;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id y41so9071218pfw.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 18:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uLrYdi2wOUQt4Mo23PR5FoihB+UXIfv9ftCXI1NPF0Y=;
        b=bEzbRI9tsJeQ3F0Smxx7hZ2gbCEXOD7OUYVqNkm7H23+xJ8sfD22II7iEj5ByiwII+
         zqxbXSAu16jH2RrwgATiXz8QSkQu5GgSxag0X7E1jLtF/iWrb3YWf+Q9ZDSbe66yx46J
         fn5jBa5wNFUeLDpI17LvCVVEISyr5np9h0mTl04KDo+vrz0P+ctEIA3rzdilGordPVp1
         S0OQ+XvG7ZvwmaeZE4cHs739U3oVhR/WBas25RuG6+7mAkGjjM0DIfkdhCT44xdQ5h1E
         6+bExzZZMmAFNWDXd/RzQHYiW9YdmQg5omHpFwSmV6eNQbRGyoYMIVA8ekuhSeY0TNE2
         jiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uLrYdi2wOUQt4Mo23PR5FoihB+UXIfv9ftCXI1NPF0Y=;
        b=QKts+G7zaPNaDcis9txojgP8H4ygll18ZlHPIj7I8mwxe2oKgHn6uTxe74b8WfiSRM
         7jnw7pkuQWuXcWAyakOIoQUmn4VnF4T6oZ6NJd8K+/QLqPY9XjW8y2f8qT39yGcUP+rX
         uMwoZmzv5shp3ofv1PyKN3VULBjONYMixwpRyNZwukZwJVEfKwFXBV+L7IHuxta/P9/h
         rWC6VHKrpgKk9/F8TvPRhsXEVxcUwg5trh3/mcKbTFlWPgfQqr/139L4VELsyd6dYkey
         TKN4ElxoUzS8yuIKUUYjtiUEoKkk8hfrov8OnHm+TX0giSqZQmBtqZFMbzxuNQh7lbqU
         lk/Q==
X-Gm-Message-State: AOAM530yWNFqSA/SLHBqOfmoVV1ji1coc2TdDHq4uu1emtp3iEB8A86a
	fcQjjd+yRhK3hqmJrr0109OL1bn7mLW5Hw==
X-Google-Smtp-Source: 
 ABdhPJyubEfYqy3d4JQAujgRjpz1O+P46KR6W60OhuJSoxsZZlWvcbOse82VDfX6E+hwbi1AIofA8A==
X-Received: by 2002:a63:8a43:0:b0:3c2:2b52:848a with SMTP id
 y64-20020a638a43000000b003c22b52848amr6083475pgd.1.1652490473966;
        Fri, 13 May 2022 18:07:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 j23-20020a170902759700b0015e8d4eb2c2sm2411905pll.268.2022.05.13.18.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 18:07:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] bash: build with bash_cv_getcwd_malloc=yes on musl too
Date: Fri, 13 May 2022 18:07:50 -0700
Message-Id: <20220514010750.4005247-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 May 2022 01:07:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165587

This fixes bash using its own broken getcwd() during cross compiling
The configure script assumes that your getcwd() function is broken.
Which then makes bash use it's own getcwd() implementation, which
doesn't work if the path to the current directory
contains bind mounts in its paths. This shows up as:

Fixes errors on musl images like
shell-init: error retrieving current directory: getcwd: cannot access parent directories: Bad file descriptor

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/common-musl | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/site/common-musl b/meta/site/common-musl
index d990c4e0720..86aed4a38cd 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -28,6 +28,9 @@ glib_cv_have_qsort_r=${glib_cv_have_qsort_r=yes}
 #dbus-glib
 ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
 
+# bash
+bash_cv_getcwd_malloc=${bash_cv_getcwd_malloc=yes}
+
 # coreutils
 fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
 gl_cv_func_getcwd_abort_bug=${gl_cv_func_getcwd_abort_bug=no}
-- 
2.36.1


