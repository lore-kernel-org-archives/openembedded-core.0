Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9219C282E7
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 10:45:25 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.9219.1660301118072566030
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 03:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ai/kdFPW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 s11-20020a1cf20b000000b003a52a0945e8so350538wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 03:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=ILzJPQkJQwoZf4NtJR13usooeGpW27kleZ1JZIYDOzA=;
        b=Ai/kdFPW0+/a113N3F0W1P8BUooD/91ke8IQtE6rpFBRke9jgDg0EzS0Lf1hMLZ1aa
         EJ58qlecgNG+uOEmGVo550qtWFXIxThomvemjC8QosmPYf/7LjVYSMPZbFUGxzQ+wbQ3
         nebIDFf1u+exxpvJzaQnyXsIjRDg3hRLSiU8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=ILzJPQkJQwoZf4NtJR13usooeGpW27kleZ1JZIYDOzA=;
        b=wwAGdfWBuXeKWq/rpMsspvtzYtK1TLislQb4lcnY9EnxffyxvTpk9FtKg/HES2ZGRg
         3FyDMH/nfwmbvU4ObzS82JznAwrCQfOKPM34ok45fkgpaMhwFeGU62Bd4cAkzoig7W4t
         yu/5HTUH1m/kVQwGd6Om33P0vBhxYRkwWLsHN4zGYxfHAKKsBIyO7oyGil2AsU1d38Sm
         vsmlS4UfrfSueqF85mci0LmUS+3PsEmNxwi+LhWFXsMtDwYPGjFgWmZEohekdlAU6UM6
         7DPTSHf7xKH6FxkjwqJq/n5MAjPeg0ex4VG5OD+IwzeZxX2X0gSk2+LK0QHht61delhm
         428g==
X-Gm-Message-State: ACgBeo2Y2lnqLf7B0+zPPAQfQXLKAT2RpbIwtF0np2bMvHdO17j0vz9F
	QBNIrknRuOQeRxPZE304K8bz82zwevNTsg==
X-Google-Smtp-Source: 
 AA6agR5mB0hz52cZDYj0mz+BS7JajZldhaKriAGpl2nChD9geoq/sGln/p5yXYrmkw6qXs5hN2oNJw==
X-Received: by 2002:a05:600c:3b1a:b0:3a5:51d8:afce with SMTP id
 m26-20020a05600c3b1a00b003a551d8afcemr8506036wms.129.1660301116413;
        Fri, 12 Aug 2022 03:45:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c425:95a5:4141:7147])
        by smtp.gmail.com with ESMTPSA id
 s11-20020a5d69cb000000b00220628ef654sm1587732wrw.24.2022.08.12.03.45.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 03:45:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] testexport: Use IMAGE_CLASSES for testimage
Date: Fri, 12 Aug 2022 11:45:12 +0100
Message-Id: <20220812104514.825820-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812104514.825820-1-richard.purdie@linuxfoundation.org>
References: <20220812104514.825820-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 10:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169278

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testexport.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 1b0fb44a4a8..01656455e84 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -179,4 +179,4 @@ def testexport_create_tarball(d, tar_name, src_dir):
     tar.close()
     os.chdir(current_dir)
 
-inherit testimage
+IMAGE_CLASSES += "testimage"
-- 
2.34.1


