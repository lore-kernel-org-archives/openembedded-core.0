Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B00C44521
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 12:54:18 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12718.1784292854817073854
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 05:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iImFRgEW;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1712a04ddaso101956566b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784292853; x=1784897653; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZ1cwqHuTUAkuNU9jnt2I/Zzilq05bwjHRCmQKqjivw=;
        b=iImFRgEW3b3J6ONN+tYkwMY3Ja2U2nRalrV6mjYWNJtyeIGY5hZf4UEev4l52OetLj
         U4DQDM248h/w7wN0+cbpoVEdeoCtnx6d24/SOpT1tXJU3yKGLdc5Ll4A0amwm+0BdClG
         6A8J/K0lVYQMf3kYmc6PhWPVz/E36Q6aR1PcAyReYHUXg5j24xWiXe51Bk8dlYnml09b
         3j66mhAGeJZZEVzO9Viqj+5TfRzIBYKhJ8kdalrGQJFyisMnPEJP0u3ttBGFrX08MRlV
         RCi0ZGfy86A/uAJESvWnUNBtOqqUNNkcUkPQnjpEW2G+IQJD9yLAOgB+DPQUuCvFftrD
         7VPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784292853; x=1784897653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZ1cwqHuTUAkuNU9jnt2I/Zzilq05bwjHRCmQKqjivw=;
        b=FdyKvmJkivGl73YuKNx0qAB0S0S87pywBtrTlnQGLPVlx2e0HpM8zySwlm51cR3B43
         OXnmPbCWMkqYmiHU7jLfvyNKHbEYSdDyDIy6AwymVD8EoxRlYXDT25/jbXsvqUt9IDVO
         qQxRtaAnm7mr/smsQfyYjLh3T5ty9tHcKRe8LUjW/Y1trFFBXbCjMuqx40kF2pOczMzp
         OP/T1scL7RtnWK50rD25xkb8dfRDRPMAeuu+GupIPDzTACLRsRKr8BCmNa6PofC42LCM
         +bXeV8hcHVlqCjRQib32zwFW58hkg0CRjn1ldROUTKsXLcL/3FvSWEO5CeqmHK+Usqp3
         pxzA==
X-Gm-Message-State: AOJu0YyC7E0iBCVmN9UwQozSAm+EzXSUq5pCMDaXagjqGKAzqtWT7fz4
	QfpowZMlGPKe5r0+YpWoj0vBGyLPm91KPYu7L+jf4t7pP5KXegjmM5ZIYxwqMQ==
X-Gm-Gg: AfdE7cn1/z8EdpnsdOYRPgknOoElC9SwAadDS+dCs5yD+o22Txq9d4yq3tpCeSUlCVK
	yXU1auXrh4SuSTgxQk8yITTQ1mlY8Jtx53uEjYZwnop7Ea+YcS+LdsaZ70uEuGzsVGPUlkMgXxi
	bfsvigva8Qa9oBmwiEjsX3z8AR+np9m+Gqug2g0pPfcu1Mr+w+rvJKgCQEVbV1eAe3BoIvjeETb
	Kho7m71qQ7ycCFayWvr87SFN8BpSPKmtbZtaJtKH/sDZmuJKkk6THK5UGX/p0tPrQYunmYOVyhC
	UKMmcyzuKZBWeQAsaLeeMbpHt0HoNJJZLzjw8/BphByfW9pZyx6L9Xgb1fDNtpRPDln/qhAgmwJ
	IIGsxcT4E2P5rs4AFisw9dJINh0Mbu7KjUCSQoZa6l/hGTMESNB0Orsxqq9crKeL/5Qi2igrn2u
	TBVUu/VJ2+WhgujY+fuI1FCLM+d+yRBVphZ5nQMkSL+/HVdEJYCSC+
X-Received: by 2002:a17:907:80b:b0:c12:5e74:ab9e with SMTP id a640c23a62f3a-c16b483ff97mr100462766b.48.1784292852899;
        Fri, 17 Jul 2026 05:54:12 -0700 (PDT)
Received: from [127.0.1.1] (185-164-140-173.cgnat.inetia.pl. [185.164.140.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbbf4dsm618199a12.16.2026.07.17.05.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 05:54:12 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Fri, 17 Jul 2026 14:53:54 +0200
Subject: [PATCH 2/4] quota: Drop gettext-native from DEPENDS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-rpcbind-quota-dep-v1-2-55bc86f09e41@gmail.com>
References: <20260717-rpcbind-quota-dep-v1-0-55bc86f09e41@gmail.com>
In-Reply-To: <20260717-rpcbind-quota-dep-v1-0-55bc86f09e41@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 12:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241173

Already handled by gettext.bbclass

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-extended/quota/quota_4.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/quota/quota_4.11.bb b/meta/recipes-extended/quota/quota_4.11.bb
index 811056f1f7..e120833850 100644
--- a/meta/recipes-extended/quota/quota_4.11.bb
+++ b/meta/recipes-extended/quota/quota_4.11.bb
@@ -15,7 +15,7 @@ CVE_PRODUCT = "linux_diskquota"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/linuxquota/files/quota-tools/"
 UPSTREAM_CHECK_REGEX = "/quota-tools/(?P<pver>(\d+[\.\-_]*)+)/"
 
-DEPENDS = "gettext-native e2fsprogs libnl dbus"
+DEPENDS = "e2fsprogs libnl dbus"
 
 inherit autotools-brokensep gettext pkgconfig
 

-- 
2.43.0


