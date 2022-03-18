Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D793C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 05:20:33 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.6495.1647580832047108538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 22:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TXd8yVv1;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id h2so8601005pfh.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 22:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=08khYNittlzJz+P3qijviNUG5y/PkI/jHb+Sk3RMKjk=;
        b=TXd8yVv1W2JqZuROGFhQB9cuQ1yH7YwAVPXuwlH8/66cGhR3ZfHMK5FqaFv43JkWc3
         KrdcN8xfAAMQsQKkEwRqtA6s323L12X1GVuPM6NH4U9brHHjzF2/2/HdcdK0h0UEUQ8v
         o3noix/208XtSzc7gt73FkA0nVQhBUlpe5ccU2Cap3if5RlaT2Xt5FQyEhdfhDjQ/21l
         OwUWgYk7idVhjhR9t07n+uKCLEfyw9timTLd+S2C74q+hZpJOviCdjbB3N7HME8JY6uN
         zyhrbSXHph9HK5t0Bvt6nx5HcMtR8PpI3c0s0t/H+HkCDKggLFAmIqBiIBFbGhC+G+FA
         yVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=08khYNittlzJz+P3qijviNUG5y/PkI/jHb+Sk3RMKjk=;
        b=Hgd0POTPzbTthl7uxx/FS/LiBgHGVCfv0/r3qBWFyyglCidDKJu2Aib7YUYOLqCeOu
         C2pr/i+iV5q3B+Fkzu0Y5NkGOSYMluSRscCXp+CoZVzITEnfrPlD0/I5r6DWgp22wXoQ
         FxEqKo9tIlr1Q3ZTHZ/flY3KXArrftHfU7OjwJTZ7ZAid7j++Uw12euxCB6/QP5F77Y0
         epnAUaVGnESKhPApTlFheTr7b71EuXjYiThUIfr673PNO8ZfBqgFjbvO9P/W2TVrcWnP
         3Qh/fZhIIHVXPr3ZgsOk0eCEry0mKp8Ep1D+8j3VtmFi5pie0Rfq1e/RQrkLyv4jJRVY
         FgEA==
X-Gm-Message-State: AOAM5327F4IvBwORHOF5Nznh4+TjYD6sEjfarkJnQ43r+i7A8i5CVZfa
	KqGBjjp2PF+ePGNxCoW4BajwwaNwpeOBkA==
X-Google-Smtp-Source: 
 ABdhPJyZEUFlGVUgkjLwrTEIEpA2znPUlSZ9MO3IkhD2t23HRHSaq+vR3V6LBcfKnI9IyfSTAyCZZA==
X-Received: by 2002:a05:6a00:130e:b0:4f3:9654:266d with SMTP id
 j14-20020a056a00130e00b004f39654266dmr8210969pfu.59.1647580831298;
        Thu, 17 Mar 2022 22:20:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 h16-20020a056a001a5000b004fa343c2d0csm5024304pfv.136.2022.03.17.22.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 22:20:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] weston-init: Use pixman rendering for qemuppc64
Date: Thu, 17 Mar 2022 22:20:28 -0700
Message-Id: <20220318052028.3453097-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Mar 2022 05:20:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163439

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 20698b1020d..89fa1ac738b 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -16,6 +16,7 @@ S = "${WORKDIR}"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG:append:qemuriscv64 = " use-pixman"
+PACKAGECONFIG:append:qemuppc64 = " use-pixman"
 
 PACKAGECONFIG[no-idle-timeout] = ",,"
 PACKAGECONFIG[use-pixman] = ",,"
-- 
2.35.1


