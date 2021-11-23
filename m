Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43878C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 13:59:23 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.11497.1637675962565192503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 05:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YqZ8NgBe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 ay10-20020a05600c1e0a00b0033aa12cdd33so1991313wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 05:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KxyubPKmxLx/3andUv8+7WTg7TjI1OTLow9ZBRg6GrA=;
        b=YqZ8NgBepNoJzyQL2L6JswnyctlU9zeDaY4sHUa4reZu+yF42VpopnKsLpqy+kI/kY
         cJUpe2bEJ2+gPRZfZ8eU48PS6uZjquqjH31w0b+czdS15lsIyDpp6MqlGSn4dTfOIWaR
         9/67D2X6D5RTPkO4HmS5vCnJobnM0EGY8ZqSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KxyubPKmxLx/3andUv8+7WTg7TjI1OTLow9ZBRg6GrA=;
        b=67bgXyTdDbqSPZY2gF6hnxFXnJE12mh3I0kW35JkFWVdh2sqvpaeaAK8DGnmRyuA5j
         hJGfgC7TFezH5HKtlJEuapIM1ZYrEhhzHPnA7AHkqu9YsIsg3cH6Agu7kyl8paSKkD9/
         /rl2IWwGcAWnoD7nWLrhA80RkAYUl7sjkmXXQRfgfOkueh7WUeFfSVTImy5XAyiCtPWD
         EgNVoxinZwHnNJC8jxfepQBNXIPtPpvfX4TR3yjjy6kHyV08eDlKd8OEoAmSsmAZgKLB
         gfGLD51VqO+kw/xsp6OLga1fMIfNBcvg1TrSx/HKThXbYQ0H2aldzZv30f3+O43GaINB
         0lNw==
X-Gm-Message-State: AOAM533wmtUNCEWd5giePK0aQPRPtFkT35ISOcMsTWngAdUdCwtgsIAV
	W3zhRnAtHJaRfy4h1N6vocz6YX4aa2601A==
X-Google-Smtp-Source: 
 ABdhPJwnIckdOeHWTM/dxm+VF39ZvKm4eJ7uwVnVP+n0z3bLKr6Spxy4t2BBIkEIWEgH0dOdr0KHfw==
X-Received: by 2002:a1c:208b:: with SMTP id
 g133mr3412004wmg.128.1637675960872;
        Tue, 23 Nov 2021 05:59:20 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e990:5f99:797d:8988])
        by smtp.gmail.com with ESMTPSA id
 r17sm1545498wmq.11.2021.11.23.05.59.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 05:59:20 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildhistory: Fix do_package race issues
Date: Tue, 23 Nov 2021 13:59:19 +0000
Message-Id: <20211123135919.26315-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 13:59:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158603

The buildhistory_list_pkg_files function uses data from do_package, not
do_packagedata. Usally the two are restored together but it may see
a half complete directory or other races issues depending on timing.

Rework the function so that it uses the correct task dependencies. This
should avoid races but means the data is only restored to buildhistory
if the do_package or do_package_setscene tasks are restored.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildhistory.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 64df432f136..daa96f3b63b 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -91,13 +91,19 @@ buildhistory_emit_sysroot() {
 python buildhistory_emit_pkghistory() {
     if d.getVar('BB_CURRENTTASK') in ['populate_sysroot', 'populate_sysroot_setscene']:
         bb.build.exec_func("buildhistory_emit_sysroot", d)
-
-    if not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_setscene']:
         return 0
 
     if not "package" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
         return 0
 
+    if d.getVar('BB_CURRENTTASK') in ['package', 'package_setscene']:
+        # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
+        bb.build.exec_func("buildhistory_list_pkg_files", d)
+        return 0
+
+    if not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_setscene']:
+        return 0
+
     import re
     import json
     import shlex
@@ -319,8 +325,6 @@ python buildhistory_emit_pkghistory() {
 
         write_pkghistory(pkginfo, d)
 
-    # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
-    bb.build.exec_func("buildhistory_list_pkg_files", d)
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.32.0


