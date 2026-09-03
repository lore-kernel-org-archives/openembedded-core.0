Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE12C624D7
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 21:22:09 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.284.1788470520143576972
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 14:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Sh2Dbw0Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so8453625e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 14:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788470518; x=1789075318; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TlTWTqlmKp8Fu886qImhzVw2+qies1kH6XDcn6w3NWg=;
        b=Sh2Dbw0QynUXKK7U66fsR2SEdtL7aGw4GVadWQJsw4yvZp+mj1HBxWcQoI3zNLRbtu
         HKkEINUo3io+95u6HHyCgQe3Byk5KWlW+eDSVPIBDilvdrub3WrrgHcDgKEvaseS2HQp
         TM6HWAsVtKgPwfezUjvupOAWuHLs7oBScbPa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788470518; x=1789075318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TlTWTqlmKp8Fu886qImhzVw2+qies1kH6XDcn6w3NWg=;
        b=QteC3vxYF4b4sFW6DxA3SwxTLr+7hkCft5UTIsCzPg2TiQvTUIkMPvv8yLbdMi4aF4
         0B2WCSyMaNeF5XrPBUsFeGZKImghWWprkVICMxK1SAwmgyBiMcGsbMVrBpu256GpufQ3
         gpXTHyTpDiF4RWJ/s/4QGrGmOSo3w38lbYMRio/rH75yMrUFB7fqTJGR9niE8BJiOakM
         6gQ1O4gxYryevJZBbi9K1KXccpkLDV3wnDFrB0kZzKIK973/khlZDysDYq6eKN8GFVFg
         vM6IsT+8E5Nxvb9HVZzV9FffHrZG2634JKbF/5eT90FRsyImOEaYXFMPDDneeJ/63vsz
         Bxqg==
X-Gm-Message-State: AFuF++kxA+Q6OjUgzSDK328ajuMGcQuz5TtGkQfZA/JX/VabSxYRlR4G
	vhuQAkGbjIsGh/AHprmk+fQLFey5Ctj4BqM9ahY2BzvHvorBWt08t5Uze1nCSrOdJ4H1MNAbIpl
	hkNafwEg=
X-Gm-Gg: AYBFou0FOB0eLE53OpC47vZB639PkvteGKpOqzAPQvaF74AVb0giTHAUlKIhhXiSpME
	Dda1D0eWq5Gp7H7j9u5ki6uIGxLAkF7pvoQkDGYRy/QNWyEbyk5WJWslDboRZpr+R4T6AM+Qvwx
	XAKqlIzE2FOjhPnM1tLDI0+vkJA39xEv+C4OETq79ZTsotNagALifTRc7d4fQt4GG4KtoxLn9GV
	4oAewe//lEVGF5wuuvfz9eawwK+EseNN0CfkXcCR8rQ8IimfsVrL8O8OYPOvGOxP9ZggXLIuStK
	GVHcbM34IiN2u9LWoULMZWFtZobiL/egzZVFUV/Af7/nlto9Zk6cVPNJj+4yT9z7tK2hegG47Cm
	BVWZYtS/YctplFeDL+El+1Z8AVjCHkfzYdMPM+YxFrWjmSmvYPA3/poaaeW31RF/hy+kSkIvSQ9
	iVF+svnssfm5M4XHiuq88h6GXMe9dAr/tVtFFtuasazY5vJzc9hgUofHm7Ybxv3jzzKUgqk9htf
	ZOcpfYwGY7Qw8ug
X-Received: by 2002:a05:600c:5247:b0:49c:ee3b:723d with SMTP id 5b1f17b1804b1-49cf81f69ddmr6039115e9.0.1788470518418;
        Thu, 03 Sep 2026 14:21:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3f77:7f7:7ec1:8841])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f914bsm118566385e9.3.2026.09.03.14.21.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 14:21:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sanity.conf: Require bitbake 1.19.1 for bb.fetch changes
Date: Thu,  3 Sep 2026 22:21:55 +0100
Message-ID: <20260903212155.632078-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903212155.632078-1-richard.purdie@linuxfoundation.org>
References: <20260903212155.632078-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 21:22:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245045

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index f80763bbe97..ea39170c709 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.18.0"
+BB_MIN_VERSION = "2.19.1"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 

