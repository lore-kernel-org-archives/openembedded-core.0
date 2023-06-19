Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F38EB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 14:06:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.8359.1687183566111462631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 07:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=JMpP3edA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f9b258f3d8so6958535e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687183564; x=1689775564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nlr2C2LJc4+21pZ4Jsj6QmT1r6U7c81Z6Et1hD45jww=;
        b=JMpP3edAsD6bpr41KCJhl+LPvWcycv3ljkCBk86u3bfPTtJM67QcNeGShC8Q/uKKqh
         ENHiI0cbbgfh3jKlnjnaDke4LwM+9pYWng0xNbKJYhqIhi4lA6oNrdB4TTjehWdUEep5
         l3JFTgcAvaH33O19E94UrA+C4dz7qbKXZdY3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687183564; x=1689775564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nlr2C2LJc4+21pZ4Jsj6QmT1r6U7c81Z6Et1hD45jww=;
        b=UrowekQUrEbAf/UhPrx3G2irzehKUTiL+kZyWWYjkX9Snk7Fd5BZIEYH0zBzur58B+
         YjYHvxv/6KIKE8lmIUN/rnf98d7GMIo6L3gvVe+tNOMa72jowDRtMYUUMNJYYOeCXcfD
         hp0IPno81U0cS+RTVuUmMzQwUg6ev+EVd1o2Km8gnc98B+B3yjSIoe8N1eORcxzsxlUG
         5AENiAmW1VCsUP37d9z+PqMZkgafGqAFWHw0B4Sch8hq5DEVvYPwQMi6VWWdT91TrcUh
         2Y6gvlrZiHY4bSigncHtw0Q4y16dgIglhWh2MT6Ocqya31r9K3D7T8+jmZwr6m7k2IBH
         wLmg==
X-Gm-Message-State: AC+VfDxNxY7jBOqNm7QI+kK/fS1rUiD7vTP3k5dtFnd3d/rGNchqXFKk
	cFzpH0Iirfwk3cJGtRJ5tlwH79Zvp/5LebT3q5U=
X-Google-Smtp-Source: ACHHUZ7l60N6Iov8WhTEInMgmguzsDPl/kjF1mp660wk0oHXVTfRTLCBoB1n4x1kK1aucoMhUfcZcQ==
X-Received: by 2002:a05:600c:3b0e:b0:3f8:fc5b:b34 with SMTP id m14-20020a05600c3b0e00b003f8fc5b0b34mr6426177wms.7.1687183564184;
        Mon, 19 Jun 2023 07:06:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f105:ba55:87cc:dc34])
        by smtp.gmail.com with ESMTPSA id s3-20020a7bc383000000b003f6132f95e6sm10911209wmj.35.2023.06.19.07.06.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:06:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] insane: Improve patch-status layer filtering
Date: Mon, 19 Jun 2023 15:06:02 +0100
Message-Id: <20230619140602.2669368-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619140602.2669368-1-richard.purdie@linuxfoundation.org>
References: <20230619140602.2669368-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 14:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183115

Now that we have layer overrides, we can easily enable patch-status in
ERROR_QA without the hardcoded code making it easier for other layers
to opt into the checks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index f391fa80538..114781c7803 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -45,10 +45,11 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             already-stripped installed-vs-shipped ldflags compile-host-path \
             install-host-path pn-overrides unknown-configure-option \
             useless-rpaths rpaths staticdev empty-dirs \
-            patch-fuzz patch-status-core\
+            patch-fuzz \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
+ERROR_QA:append:layer-core = " patch-status"
 
 FAKEROOT_QA = "host-user-contaminated"
 FAKEROOT_QA[doc] = "QA tests which need to run under fakeroot. If any \
@@ -1340,24 +1341,13 @@ python do_qa_patch() {
     import re
     from oe import patch
 
-    allpatches = False
-    if bb.utils.filter('ERROR_QA', 'patch-status-noncore', d) or bb.utils.filter('WARN_QA', 'patch-status-noncore', d):
-        allpatches = True
-
     coremeta_path = os.path.join(d.getVar('COREBASE'), 'meta', '')
     for url in patch.src_patches(d):
         (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
 
-        # skip patches not in oe-core
-        patchtype = "patch-status-core"
-        if not os.path.abspath(fullpath).startswith(coremeta_path):
-            patchtype = "patch-status-noncore"
-            if not allpatches:
-                continue
-
         msg = oe.qa.check_upstream_status(fullpath)
         if msg:
-            oe.qa.handle_error(patchtype, msg, d)
+            oe.qa.handle_error("patch-status", msg, d)
 
     oe.qa.exit_if_errors(d)
 }
-- 
2.39.2


