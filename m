Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95089C5DF64
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:33 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21616.1786634552286149514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iyfP98Tr;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f84023916so1981634f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634550; x=1787239350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jirj9i/9CbzsOpJD809WUiqTW2/NP6bHVcmn37Ce83I=;
        b=iyfP98TraHDNHGQBWizO/2jAx/0MvndMWYpQ9hlwE66Nl01rGK0oMM0rinUV0r+Bas
         CPGpggb3qOpIDqHU7cwMA0sJT6YHThX3UVyLUM+x5ZH5tCMhl1D81KkbrhJw24c6xOQD
         o9IWIG6E5b3pScqX4dN4hZXxdV4T5no4iD2Zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634550; x=1787239350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jirj9i/9CbzsOpJD809WUiqTW2/NP6bHVcmn37Ce83I=;
        b=eLp14VhRbes2H0fu/7YCT4Sr2G5VMcxlkfpaXomcPISG0z6nR8xnOxQkVQE/QTMZ22
         QZ3R3kSnPTfDHBN92K3QwXeM+gNt2CIglN2Nv0/AWNdKabo5Rvq9nWmVjlm0Q2g39gRU
         7KZ/iF3c9l3PXo/19QJaTzz+uzdVPTKqMbTkRo7ps6E8eJThNnfKLqCTYOKCzFx9BmuD
         WVUvZ0O3GsnDBf4QYcV8UNfKPRDYCm6lRy3GP8Fjs+hjfwWmi0MOsF43mG/5RHyDm2qv
         dDqTu4auY833qdzeGYXMu1sINxrdFGr2z4ZtPIAEdWdgiLQmoXUQhTIkk2KKVdyzKn5b
         /Xfw==
X-Gm-Message-State: AOJu0YwP96WKUlLP0J6qc4fg6F5+1pCa2PWNrXyACJ/Vhko0frl6o7cU
	xPkbi4RpjCaTOYNuZIGfOC/uGiuBoko0TVAoI4nv5Hs7tsuPFpX5JPkziSNa8mkcCtaNVlraHNI
	DK9GIT+KfGA==
X-Gm-Gg: AR+sD13gq9MIphADu40i+DmXtSW1nHHFeod1NjW3EzV/Hd2g6DSkzDIskEoqz+qPlde
	kmqw2EzawjwMpx/XkA6/bghSpqxDDiLP4V8Ul6HNMtKMMANiEQlAWYpJvrKOlj+y1aKODxzOYsY
	iMfdNZTQuQZaysHsJl3EPRaRDwTeAGRLqr05BAyP9DPb0XP8KALMMINyDaxruuEC5rcKnyolJtG
	UA2dggw37rR1R74vFizQltHbneUSYBYRTgGpadNRyoqRNoXPdQzpRIJ/y5ZRkERiG1Vckbxv4Ig
	N/ABwRDJ0L1f6P5tbe1Q/GCT5ff0dzzeUzHeUZcsmPQdll8U70egfwd+FhEtjR/qnD4itULnBbq
	uBBE0dxXkDSuCcr9RAFQ5ZVT5f2vDBt4tDYP7zsOelKYx9fiDDG/HRFoIGXSzJrVo2OmE072+W3
	3Q9MUc7x5IpUnxXw2zltGsHYLUYhUcpQNv+8e59uSyE3Tb92KYeGrfNzsn4nVaq8gEG74rOLLle
	RmU6qTJVcBR84riTcJLqzTvmcV61YaUkDXCLuJSW+7Z0jOblB1FKdF4yK86qgp5mMskSwOPV0kc
	wG3eIuJqTTRUv30oCewaD3ulZCebTAz/cXemdZC+ZTPX3aDHauA=
X-Received: by 2002:a5d:4152:0:b0:481:4f7a:f685 with SMTP id ffacd0b85a97d-4815a0128afmr8807464f8f.29.1786634550242;
        Thu, 13 Aug 2026 08:22:30 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:29 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/17] glibc: CVE-2026-5358 add CVE_STATUS
Date: Thu, 13 Aug 2026 17:22:00 +0200
Message-ID: <75d7aa9f43395c673a5a41511cee34c5bb62d199.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243367

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

CVE-2026-5358 has been marked rejected.
https://sourceware.org/bugzilla/show_bug.cgi?id=34067#c6

https://inbox.sourceware.org/libc-alpha/20260421164416.4031726-1-carlos@redhat.com/T/#mf76c27025e603294611196b90e428769c9fc5a4e

Add CVE-2026-5358 to CVE_STATUS_RECIPE group as the CVE is disputed
by upstream glibc maintainers.

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-core/glibc/glibc_2.43.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index b84c55ca17..a856554782 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -5,7 +5,7 @@ require glibc-version.inc
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024
 CVE_STATUS_GROUPS = "CVE_STATUS_RECIPE"
-CVE_STATUS_RECIPE = "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024"
+CVE_STATUS_RECIPE = "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024 CVE-2026-5358"
 CVE_STATUS_RECIPE[status] = "disputed: \
 Upstream glibc maintainers dispute there is any issue and have no plans to address it further. \
 this is being treated as a non-security bug and no real threat."

