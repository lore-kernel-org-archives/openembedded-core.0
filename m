Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2563BC3DA63
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 06:23:17 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.55795.1721974988259408709
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jul 2024 23:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=br37KrGj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-367963ea053so1226867f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 23:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721974986; x=1722579786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mv0Io0B+tSJBs91N+HDvy6+wUsynpzWmFDAq12rERro=;
        b=br37KrGjyDevkiVXItSWdgvxQS6I1Z9cZi//qSwlw7R867lH80qtg87oWtMMbfBADA
         /wSqDU2J2xmdXo1uL2G1G+Z/fy0idBgbwaoR6zrQNCZ3n3PoXF2YOk3jLZ1O0QdRvWhf
         oAz6R192Ibzn9ZLHTvEYtTzmpPZA9PZnPTXGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721974986; x=1722579786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mv0Io0B+tSJBs91N+HDvy6+wUsynpzWmFDAq12rERro=;
        b=L4yojgJ/y/OxoJqK9pECuHxKeDSu8v8zir5kZt2XpAhE8rpn+mO/7XdjXtr+TjlOXo
         LbXf8XNGd8Fm93IJRzmQVeNjFPczgu3Lj9de98xGuBx57WNovV++qDW92cXeVoHRz1qJ
         aM6SF5ycR/X2v+aeB96seJQPbet77tlap+puadaCTT0AzgOUFjeYheYNshvEZL8Q3Vc8
         WHM5dvaKRJ8d2C1xnvnWBF2g3gYwKcYegArmugdKs0aQs8H6loBqqQJEhYlzn2u5wVzb
         H0Qft0VkwFemGsu9y88XrLaByaZjpOvrb48ObeS9U7JxZHbSQRc0xluQ3YTIJENc94xD
         YW8g==
X-Gm-Message-State: AOJu0YyLMDDeMexQQ5Fm9YetLRjK1bAKGD5GNn/kGBcj/TFLABTwe66O
	1LbiN48YdmyO3RUF6/2PH+csiLI74dOlkuF+ThDEqzgeBObSeg9phqJbF2kpNzwh8XV33M7LxD7
	jG8w=
X-Google-Smtp-Source: AGHT+IFNYAxrzqLnfSppcSpTXxvaVxT96gGJZQPpHod8tpnhnLO0VFFIVcwJWDOcl8KT1gT2+Gwclw==
X-Received: by 2002:a05:6000:b87:b0:368:7943:8b1f with SMTP id ffacd0b85a97d-36b3643c8cemr3468092f8f.43.1721974985870;
        Thu, 25 Jul 2024 23:23:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:661a:1cbf:cf5:d3ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b368618cesm4065514f8f.91.2024.07.25.23.23.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 23:23:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update to include open symlink handling bugfix
Date: Fri, 26 Jul 2024 07:23:04 +0100
Message-ID: <20240726062304.2646264-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 06:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202514

Update to a new revision which includes "Bugfix for Linux open(O_CREAT|O_EXCL)"

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 5f32b3777ab..7d8f71f65d4 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "e11ae91da7d0711f5e33ea9dfbf1875dde3c1734"
+SRCREV = "374089f2ed83da4d0d4e58df067142ff99c7eb12"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 

