Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36CBC433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 09:32:17 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.3620.1664530332528121096
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 02:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZHjMacob;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id s14so5971998wro.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 02:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=xBlWC60iG9UYcAOB+VxpWoXBNQ3cRTNWdRcFhnXl9Ls=;
        b=ZHjMacobhbtoPGGQS4/3afo5TLWdf77pNdKkD25WR6yAqjsnJbtbjTsrLWO5JHRZQB
         vssJfn33l3nyTAfDmkqqtUuPcOVA6ge8IirnvLn0BHbocXp5CWmXzoK3fUu6No18NbGn
         Al/+GxMenq8J2Zrdj6L7Mgtg7zz4y5eBJexPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=xBlWC60iG9UYcAOB+VxpWoXBNQ3cRTNWdRcFhnXl9Ls=;
        b=VkmB4C1Ck80xqvo/LQ7RcPqWXIcVWj1VriCRdVXb2n2d+/VNYG2yp9Zm8Kj+ZaARoc
         LMvLb+lPrDitVmLr2Qqv8jsCc1B1v+QhaatQ9vhge1mqaoqJCTiKsePrd3LqWEirPDgz
         pzDDNPXzLvrweOakqPp/6KR8I3gKGyl1m5GV39lIX5HMWO/OLy4bAiRIlN9GYCyf7G+4
         QkHLJu250dH2cAFIZao8mePtQhGD2plv+r1wIOwEKEQKmBWEqdY1CkTt9c4LbJfuOfP8
         6jyne/HyGCkraOZFnrNfh623Ua4IjnnHAUKLCUats1qlivyw4JA2rT7BVXVKq/wopysz
         OCvw==
X-Gm-Message-State: ACrzQf0rTghG6+Ra77kz7dW8neZo+Z14TqMcCYF/a+Px+EsLIefDKPLX
	2wr1XkUi7HCgfYC61immst3GjNi7oqJRLg==
X-Google-Smtp-Source: 
 AMsMyM5CVXYaWBxdUDEKqlALTjpTdecTXARbE6w/jqIfIv5OVjPcrsjUeJTDirrUXD711BQuYZ/zFg==
X-Received: by 2002:adf:fb87:0:b0:22c:d34a:385 with SMTP id
 a7-20020adffb87000000b0022cd34a0385mr450049wrr.213.1664530330240;
        Fri, 30 Sep 2022 02:32:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bfa:f678:7e20:8850])
        by smtp.gmail.com with ESMTPSA id
 l22-20020a056000023600b00225239d9265sm1560035wrz.74.2022.09.30.02.32.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 02:32:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] go: Fix reproducibility failures
Date: Fri, 30 Sep 2022 10:32:07 +0100
Message-Id: <20220930093207.2115781-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 09:32:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171216

We're seeing "cmd" static libs being sometimes present and sometimes not.
The issue depends whether BUILD == TARGET so they're present for qemux86-64
on x86-64 hosts but not for qemux86-64 on an aarch64 system.

Add an extra deletion to make the files consistent between the different
hosts.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/go/go-runtime.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index e18339cddb0..02601f79925 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -50,6 +50,8 @@ do_install() {
 	rm -rf ${D}${libdir}/go/pkg/tool
 	rm -rf ${D}${libdir}/go/pkg/obj
 	rm -rf ${D}${libdir}/go/pkg/bootstrap
+	# the cmd directory is built for the native arch so if BUILD == TARGET
+	rm -rf ${D}${libdir}/go/pkg/${BUILD_GOTUPLE}/cmd
 	find src -mindepth 1 -maxdepth 1 -type d | while read srcdir; do
 		cp --preserve=mode,timestamps -R $srcdir ${D}${libdir}/go/src/
 	done
-- 
2.34.1


