Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF4CCDE002
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33410.1782253631427063692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=U8UQp7yM;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so3426675e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253630; x=1782858430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0M1v6M9AN7y0F8rum/iWIFJ8EiM9u40kMzPowt9N4k=;
        b=U8UQp7yMcv6QuMghjdB9X272fmLiqVZFtxoZLzSDjhI8v6eUWXYEy0eDd5wbDGY89W
         kS6/gztlxfSucPAjXVayAbeW6MUMYmuJGyyJOYN+2BAvoEe6jWpSUqm2/Y1Mx781l96K
         X5M5rAY+DvFn+nHJKp9AjJWHR/pXpIEinUOvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253630; x=1782858430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p0M1v6M9AN7y0F8rum/iWIFJ8EiM9u40kMzPowt9N4k=;
        b=g3BNxVfJ/xEwGOTAy6ICufyOKOGvSQGmwwngpq6OohQ8Iazlchbx+0HSlYkgxEGOvg
         iM1TUKDJlOwp4Ur1lX3aBJhEM2S0wsUBuc9tgHmeOYTbKs6Fg4yONBDHGb+x5DXCCe8/
         UP5obfQQOJOxzbILuV7GJUCv9HZ40HyijkGXuP2KY8H0AHB0A11HWEl8+sqt5EK0kb1L
         5DhIHFiGLma2yzy/zMOo5n6NkKpV+b4uAXIFVr+xGzJ18+9WQ3fYLocHK60PCPGfMx6N
         691yiyDQT0XKTpw7WxsuqFx7K89jtq5N+gQmSx5hKiie1X6tG4eLPAWR0JSM+c/RYseM
         Wvtg==
X-Gm-Message-State: AOJu0YxWhUZpnWSpAudhKWlItCkC5jo9+KdSre/W2JRhGFRTtNZ/g8V9
	3EMcQYb7nzbHUq2wSOPPOGiBceT31IP+IZkfrJ1f8xVw+ZXlJslHk3m9yhe2dpUnVPYSoHD4NBl
	c4f3y
X-Gm-Gg: AfdE7ckrP+DZQtpVBxw28K1E0Cb6mITPbwCCIwW6dcNgKR/FJ8FwkuRR18Sj+wIxfNx
	sJ/PyY/rPPagwB8BGyyJAdpbyS3v18PVPQ4ztz0Ltz8XDRqVZ1YcuyGjF4T7FuvvaKDc/j4wOsQ
	hrkpuD7Js/DOMpqskntZXRcEYtdnlBRUkSWktqiZBYb6zAEBkblqD3KofSzzcEYvyuVUCtzmu5Z
	jlKt/bH3sXDMm0EH8SoZBtgNkE2gC9DUs6BVEJVK+7XhyISUmHcCXiC5h8bidX6olXKwsKN0O+h
	yk1kR24nsTH53i6cvesibADYYJYDQVdIQ/EF7gnYqvFnku74lV5ACqbCbDGFWj9wgPogOJ+5CRX
	NK6SIAzxcfCmZbTtOnpOvl/KCHlHLTlbrSO22WpqO0Vgtull6wgtMd18OoqJQRkIrIXrCwLuEVo
	xDbJtRyzUp4RW283wp+3uTicsKlASapipTiunc0bMhk54OzRsUszu6Xk3A54iDSnXmp5/hG455D
	DHh1Qd0ugkuzmrL
X-Received: by 2002:a05:600c:8b77:b0:492:4911:8a with SMTP id 5b1f17b1804b1-4925b35a0f9mr68165585e9.12.1782253629653;
        Tue, 23 Jun 2026 15:27:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 22/41] apr-util: Add CVE_PRODUCT to support product name
Date: Wed, 24 Jun 2026 00:26:21 +0200
Message-ID: <3a157840148e14ec9019a008ab94e7f708baac05.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239444

From: Himanshu Jadon <hjadon@cisco.com>

apr-util is tracked in NVD under apache:apr-util, while a smaller set
of newer CVEs also appears under apache:portable_runtime_utility.
Set CVE_PRODUCT accordingly so cve-check can cover both the historical
and current NVD product identities used for APR-util.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 927b505c982ed7443aed348ca54b0073ac63d938)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/apr/apr-util_1.6.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 1371e262ddb..3a5f52d2501 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -95,3 +95,6 @@ do_install_ptest() {
 	  cp -r ${B}/test/$i $t; \
 	done
 }
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "apache:apr-util apache:portable_runtime_utility"

