Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D7CC433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:23 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.32830.1635699502489807730
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=TdUALlzM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so14372488pji.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EMpmrhvB6GiG7hdOf1kjgq3kBX4GDhIzXyir1PxqrsU=;
        b=TdUALlzM61DNFeAQ4iUChmjfrb58AeAGzGhrGP+K6GpzCuGYCDiRT0wokCAuasE0QN
         WJvv7qGyangyi/A9zHz9DMZOLe+P1XnYshwoswxWmbAmsXupzOwy82V4Y2UiT5c1DVtq
         a+HybnnFs+5ArLtrw2qJ2g5HTObJunWqEmDG1xmEb+d8L/oiErzD4D/djkDjUQ9tW9L8
         SAfQxPhG+Jbb97YLeEH2rvRJEKJoT1VhLb+A2hEg2WSTBd7a6tusfaK7FAmwL2+B7qLn
         r29x5af1+gbo4VLS3k73f86fY/Ab8fw7Xe/uqbPpvAtDP7f1FdCy3cRwd9XgWvkCVjaz
         jO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EMpmrhvB6GiG7hdOf1kjgq3kBX4GDhIzXyir1PxqrsU=;
        b=qo6MgZrHujrpr5i7kJ04fdFfZ4vitkNNYEsvriz6HVk6jmsrH9/Xu6SH4K/kraBIth
         kTskTASLIGRuoi0HY+2R3g+RrLRPjne8izIUSfvjUlcx+sDdJtYLihb/2b3kpjAQ4qxU
         DpdsCbSmjbQ0Ba1mVgne4snT28AkNA1+5O55xmcVFlt0qo3BK6rTwDaCH1YxLMHBc3vd
         4tC6cBmJGu2tYy3+jXkEjCIPjXVs4Mmyx4CRa3hBe6oGFdN60Kk0s5PhZRgVaeoIfsrR
         uBcEaQmQDmFYDY4XZRc7sWGt7XJQnL7bPtfbDBtIzUufU7LUcS5lBAtrm0L8cSItlcqh
         NQZw==
X-Gm-Message-State: AOAM530auf/wGbRPWqZtrRX8M7dp6UoImjwA8bFHf49z7DxwUXHGIbzG
	qbNGyIB2KqIUq78JAuYU79o1gk7Uc6pdXAUFQUQ=
X-Google-Smtp-Source: 
 ABdhPJw1Y4LgzRhxTJlwl+or73N1yHz6DbmuO5F6aCsoTMOUGWO0Au3w1hHVT8qSdz8FzeXMJ4NPsg==
X-Received: by 2002:a17:902:db07:b0:141:ea12:218b with SMTP id
 m7-20020a170902db0700b00141ea12218bmr1395658plx.46.1635699501537;
        Sun, 31 Oct 2021 09:58:21 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/29] license.bbclass: implement
 ast.NodeVisitor.visit_Constant
Date: Sun, 31 Oct 2021 06:57:29 -1000
Message-Id: 
 <d91fe6ecb9fbb410b3bab6ced66b7fe5f869cf83.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157668

From: Ross Burton <ross@burtonini.com>

Since Python 3.8 visit_Num(), visit_Str() and so on are all deprecated
and replaced with visit_Constant.  We can't yet remove the deprecated
functions until we require 3.8, but we can implement visit_Constant to
silence the deprecation warnings.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 875a944392a3c93f40081a14af357f70b6b8264f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/license.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 73f99e87a8..6b03221c7f 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -153,6 +153,10 @@ def find_license_files(d):
             find_license(node.s.replace("+", "").replace("*", ""))
             self.generic_visit(node)
 
+        def visit_Constant(self, node):
+            find_license(node.value.replace("+", "").replace("*", ""))
+            self.generic_visit(node)
+
     def find_license(license_type):
         try:
             bb.utils.mkdirhier(gen_lic_dest)
-- 
2.25.1


