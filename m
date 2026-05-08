Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339F8CD37B4
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:29 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8160.1778224340749550136
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=E6PgRxbZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso12172195e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224339; x=1778829139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYRKdPc8QWrFSOpN/WHFyT2QXFt7tGH3YFmCNqJ6zzg=;
        b=E6PgRxbZXQHbKfzhwU+ysNa7qXxLD7bPJuYhsBtqbvqea0rNNb1VO8WEuNtfKwptjB
         4eo3jOL/BbojG71kHmsLFFHYVVv5ZmI1GzHguZf2lO8N8o35wZHeqWpAr7RMhTfpdOvG
         IcyBs5y0sbNPFg+zUhp5hyIp2mBxI77ODdW5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224339; x=1778829139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XYRKdPc8QWrFSOpN/WHFyT2QXFt7tGH3YFmCNqJ6zzg=;
        b=jY9IL6iJMaikcL2TpbLuR4W2FKo9WGIcGU/om44b7vAziKiCD/CzmzBprPcCW3cUBW
         iwYdglwerlby02sJiZGBaHWVcQW8DmYieVVsz1WDAG5T2xb6zPyTzG5fWQGCXu3df3CD
         mqi7DZJ/A/TwyrhV6n1ugWnktdQ9t3Ax8gO5fw7v6MuRz2GbbzYzymlMwBZ3d+ExWMar
         mIYADRGmYrKKv9wyTRKIJVEVws4iIhpZv82eEzU5YQ7PC/ypQwGi7t+xdE2FTKC8FPpt
         vVTfFhSaqM6GlQd/Z20omwCLvLDvRlTedQFcC1vqQAIt6oOjD5QQRYMQ7CkfwEy34bBt
         aNfw==
X-Gm-Message-State: AOJu0YwTyDVk1GAmi0/rkfcYbfSJ5A9NS/Hn0yNwGoh9k4h/pkUKbiF6
	/+BOL2SORxwWBCqUw5xhLHA8KOqLLH2SWDnvukOljhfr/vGTrSiimXXy6GHuR4VPJMtkxBNt3Dc
	GY2qbXeI=
X-Gm-Gg: AeBDievMs7QH/60fxlaMuh9kHJivl3pacSmpvUzwX9i8OWXPYvKHZOsZDyXrDPw/mJ2
	FmtVmdjLV5nuk11NdypviBzeP92o7OjBlf4KleuGhropoEzNKRp3vZtCOSsjZ17faS+iGzupj7j
	U/FyWRPYZpj9IWPilnr6lQWrABqHgGLHVSomvWXSyc9OB6DW1KevQNSePYhwVc3UK/GH/+CN95I
	m/dadIHKfmuC+hM9zaBpLjb7mNpKuPxgQhu0nmNHZJq3CKU6ipnTC7BdKmg1sDajYKSLuTn0FGw
	vKXqe/6oTvtVvr3lSbspmk0woILjvGotyOC/p6zCIb+UFFds2b7mPKy8DrXc77hPmhT6eHYVdJV
	jGVgsVe9gRGG0G2S4ChsbswgNKuXfMiYLZtCWV7LVdatBL1mC4G0lQNZG9H+EiGRFgwnkgJo/dN
	BsdGOjj/x+ZG65W5bSzsY9ilHL0JkSymqBhRtgI0UIiViZkYUWhl2jD9BFLEURdDrLxrJD03YJk
	JgVhQ7D4AGF2C7VBI3wbzkiyW8=
X-Received: by 2002:a05:600c:4617:b0:48a:5970:1fe1 with SMTP id 5b1f17b1804b1-48e51e0bb17mr100337145e9.4.1778224338697;
        Fri, 08 May 2026 00:12:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/52] python3-requests: set status for CVE-2024-47081
Date: Fri,  8 May 2026 09:11:06 +0200
Message-ID: <f534348f30f8e0ca931d001850b8c8fba14e91db.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236655

From: Peter Marko <peter.marko@siemens.com>

NVD [1] does not have CPE set.
Debian [2] shows comit from v2.32.4 as fix.

cvelistV5 [3] also says "< 2.32.4" however for cpe psf:requests.
Not sure why this is shown in CVE metrics.

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-47081
[2] https://security-tracker.debian.org/tracker/CVE-2024-47081
[3] https://github.com/CVEProject/cvelistV5/blob/main/cves/2024/47xxx/CVE-2024-47081.json

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 19ffb4d9d759ff100f92f20770f3b68eecc289a7)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-requests_2.32.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.5.bb b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
index afcf1a99b36..3477a5d83e9 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.5.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
@@ -34,3 +34,4 @@ CVE_PRODUCT = "requests"
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2024-35195] = "fixed-version: fixed since 2.32.0"
+CVE_STATUS[CVE-2024-47081] = "fixed-version: fixed since 2.32.4"

