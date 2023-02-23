Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2CAC64ED6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 23:31:35 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.5119.1677195083288952247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 15:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=U1OfdYze;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id bo30so11702678wrb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 15:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/1Jv31KbQpxOMi3mTePBHC9S8ZvmVwZasvbGfXSt2Q=;
        b=U1OfdYzegV9O+AaXpnH3bnpB0oZRqWrOsjaVgcDDGWs0GoFqzP2XxRypkVMap8DaDv
         u1izhvN3CIiFB5K12ZmnJHiB5mMMicY06HODum0sU0jVlVAaeLl+z+RVh8uHSu1BaxpZ
         nd2S6bOb3ZXQcMQWeLEWxd/J5eYdI5N+mH21EdGwxY//klkl330ANI09nWYXmQxx79hS
         I28L/6O2fF+/tTy6WqtswPSvfeA2g5yIdOohUsXsrh1aXRAeTntLev3Uk6tMvhsXcgBt
         6ix/dbcDx7Jec1yWiu20fVj6v6XpeyyitOMZBVlzM/ogK8CeH+gHq+fVltS22hTyqylr
         kV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/1Jv31KbQpxOMi3mTePBHC9S8ZvmVwZasvbGfXSt2Q=;
        b=OXOBCCRSWuxHvV9FYH7C7g8a0c/mFrXReLXqAYHVvigll+tKyJxRB0Sk2QYMhtW2Jg
         isMtzVZETYapq84TIAG4tJUAagv+CcbOor83LZeh1OUvcThbWAiRSxXYhVHqw4Uffd9e
         XUIlC9nb1cFmwghjga7ulsOtItbR4U0ILciln/pBNusuY1LpwA7Za35rLMurpVIzcAPc
         8gt94FCzjvsqOAuavUDPGsCPQ5jJymfVNNEBuz/C2OjgQQl83Hum3k4fVEfn09wjlpqP
         yjNphZiMHQbmCo9/vFib02tt+xcF98D9USObUWFKpzJ6cUCZnOcUXohVKtaA4jmHiT6Z
         A3AA==
X-Gm-Message-State: AO0yUKWZCMVTWFDNv7njrFQ7+7757+sdD99LN/qAYBjwSAvmvIF0NzHZ
	fMUprVLqrX2izXAQn4EOZqn8EGXkoFCg8LnV
X-Google-Smtp-Source: AK7set9Fcq3ITZLAieC5485CKBsM529lcxRZpk+N9OQoqGcHC1dR8Kf0Pw6cN+82NQeXBAy8CfomPQ==
X-Received: by 2002:adf:dfd0:0:b0:2c5:54a7:3646 with SMTP id q16-20020adfdfd0000000b002c554a73646mr10969939wrn.5.1677195091523;
        Thu, 23 Feb 2023 15:31:31 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.mpl.intranet (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id i18-20020adfe492000000b002c56287bd2csm11899277wrm.114.2023.02.23.15.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 15:31:31 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Fawzi KHABER <fawzi.khaber@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/2] insane: Add QA check for RRECOMMENDS on non-existent packages
Date: Fri, 24 Feb 2023 00:29:40 +0100
Message-Id: <20230223232939.3932270-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230223232939.3932270-1-yoann.congal@smile.fr>
References: <20230223232939.3932270-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 23:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177641

From: Fawzi KHABER <fawzi.khaber@smile.fr>

Add a package QA check for when a package RRECOMMENDS another that won't
be built because it is empty and ALLOW_EMPTY is not set. This happens
usually when ${PN}-dev RRECOMMENDS ${PN} but ${PN} is empty. This is not
an error but might be something to look into.

Example of a generated warning:
WARNING: python3-3.11.2-r0 do_package_qa:
QA Issue: python3-dev -> python3 but won't be build [rrecommends-non-existant]

This will make [YOCTO #8222] appears in the QA logs.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
---
 meta/classes-global/insane.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index ee34d5208d..a3e8c57955 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -34,6 +34,7 @@ WARN_QA ?= " libdir xorg-driver-abi buildpaths \
             missing-update-alternatives native-last missing-ptest \
             license-exists license-no-generic license-syntax license-format \
             license-incompatible license-file-missing obsolete-license \
+            rrecommends-non-existant \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -1089,6 +1090,16 @@ def package_qa_check_empty_dirs(pkg, d, messages):
             msg = "%s installs files in %s, %s" % (pkg, dir, recommendation)
             oe.qa.add_message(messages, "empty-dirs", msg)
 
+QAPKGTEST[rrecommends-non-existant] = "package_qa_check_rrecommends_non_existant"
+def package_qa_check_rrecommends_non_existant(pkg, d, messages):
+    localdata = bb.data.createCopy(d)
+    localdata.setVar('OVERRIDES', pkg)
+    for rec in bb.utils.explode_dep_versions2(localdata.getVar("RRECOMMENDS") or ""):
+        if rec in (d.getVar("PACKAGES") or "").split() and not os.listdir(os.path.join(d.getVar("PKGDEST"), rec)):
+            localdata.setVar("OVERRIDES", rec)
+            if not bb.utils.to_boolean(localdata.getVar("ALLOW_EMPTY"), False):
+                oe.qa.add_message(messages, "rrecommends-non-existant", "{0} -> {1} but won't be build".format(pkg, rec))
+
 def package_qa_check_encoding(keys, encode, d):
     def check_encoding(key, enc):
         sane = True
-- 
2.30.2


