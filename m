Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C7AC43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 09:42:09 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.4650.1654162912321520820
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 02:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pt5dzier;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id u8so1382006wrm.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 02:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6UtIZASGBaBY2tuHK/gkCXxcQbm934Fp5aGbLPV+UGU=;
        b=Pt5dzierHSU2mcLefh0GyigiGKAQ9KHRtlryiNWiWyb9mckYRvGvndBrv43q/09OQP
         IxymiWgtvEfjOK3Yr2gZo50e1/F7emFN0qHozvVxk1ntbV4CG8tSqw+jHiAjl0u/nt7h
         Ahtvbnl8L6nQikhjWfdc1sd4MqMaiLOAD6GNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6UtIZASGBaBY2tuHK/gkCXxcQbm934Fp5aGbLPV+UGU=;
        b=nHt3BSAzJ4DWtohv+3y2WgHwiad9KAd6cnstbZVwumNQgVgm34u+KZWiVTgVx0oWNm
         XKURb9tkULSLeLvAxloyWU138rEA5bCOuoqCDWwTprXFgReS9zwHVGw2O7EXhyk92UgN
         YwWHffgL2Njy9UlM5HB5bZdf/t7SsSa8qIjBPOH021SSddrR5b+5lk0QUlDmI7uVLD+1
         QZTZIqDE3G74FA/i0Onw0flFI0ekuoCXGxkChlvTgMlDFYymO6SipBnFOQUnux4SBzb2
         8pm+hoz+I805KqbOz1dTsOge4kJVk0//MZkveBgpaTx+TJwZJenaUbIx+H3RYZYoejVs
         ORMw==
X-Gm-Message-State: AOAM531l+QRHpK4ApBi8/aBlf0RaBUolyWZyDBacHx9e+vOBTnSQKPWT
	hdL9TpR5YeVcQBDwLOnKVVofPzvBGY9xjbMr
X-Google-Smtp-Source: 
 ABdhPJwz35FtzFOtdaVS1ZTbnkorH9KAMHHIwgkycxWnorlwPSV4dAUDc7p0gEBqFTv+6x/cpV1GBQ==
X-Received: by 2002:adf:f38f:0:b0:210:30cf:6e4a with SMTP id
 m15-20020adff38f000000b0021030cf6e4amr2991338wro.676.1654162910435;
        Thu, 02 Jun 2022 02:41:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:171c:95a:9d1d:26d3])
        by smtp.gmail.com with ESMTPSA id
 k7-20020a056000004700b002102f986b0esm3889613wrx.98.2022.06.02.02.41.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 02:41:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] populate_sdk_ext: Fix race condition on bb_unihashes.dat
Date: Thu,  2 Jun 2022 10:41:49 +0100
Message-Id: <20220602094149.131564-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 09:42:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166467

There is a race were the bb_unihashes.dat file may end up zero sized due to
concurrent builds. Use recently added API within bitbake to copy the file
safely. Also use the opportunity to remove hardcoded filepaths internal to
bitbake from OE-Core.

Bump the minimum bitbake version to match the API being used.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

v2 - ensure mkdir is present

 meta/classes/populate_sdk_ext.bbclass | 7 +++----
 meta/conf/sanity.conf                 | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index e2019f9bbf7..3ddbb46eda4 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -401,10 +401,9 @@ python copy_buildsystem () {
             if os.path.exists(builddir + dest_stub):
                 shutil.copyfile(builddir + dest_stub, baseoutpath + dest_stub)
 
-    if os.path.exists(builddir + '/cache/bb_unihashes.dat'):
-        bb.parse.siggen.save_unitaskhashes()
-        bb.utils.mkdirhier(os.path.join(baseoutpath, 'cache'))
-        shutil.copyfile(builddir + '/cache/bb_unihashes.dat', baseoutpath + '/cache/bb_unihashes.dat')
+    cachedir = os.path.join(baseoutpath, 'cache')
+    bb.utils.mkdirhier(cachedir)
+    bb.parse.siggen.copy_unitaskhashes(cachedir)
 
     # If PR Service is in use, we need to export this as well
     bb.note('Do we have a pr database?')
diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index e6cb2b45fe2..fff1ad8246b 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "1.53.1"
+BB_MIN_VERSION = "2.0.1"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
-- 
2.34.1


