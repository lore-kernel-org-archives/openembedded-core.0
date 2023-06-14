Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DDCC00528
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:44 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.7481.1686734981647314634
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rBGnHkC7;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-977e7d6945aso88203766b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734980; x=1689326980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXhe3nLze5mN3sqMhW0eHfI4XmIhi8tYlY8ncD4+PmE=;
        b=rBGnHkC7X3RJbOHctQwa44MJSx1JtXCXMoP05GIB0DDhABv1ecrMXoIG14DC5E1tvm
         bphQSdapJ+WxH96/eMMLQxd9bGMfY652OFl9sYWbKEtRv2ff1BtOE1Ing69rkCWK7iUX
         IRu/wgzfs9Fq4ezzeiD8LuWlzXLvlp8aVZxT7XRWuWCO+vGwMpZv8cgeSMHL0L0mNoVg
         9P9gIAoBMZiIA4WZsFMFNR+dJT6+QObSZew7CZ0vvu0bLpwb9ZiKQlmbth2dl3ZNLCNb
         zbzkBcpOUq1YfO1c6+l3F1WYHN3/uWlhttUVASXpDMq5VfCZrl0hEKrNRDFaxHbrkWMo
         ERpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734980; x=1689326980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXhe3nLze5mN3sqMhW0eHfI4XmIhi8tYlY8ncD4+PmE=;
        b=d7ePQeUWEzgzIGQQUWmkC8oGnoTBp9/gMllnCj+LJG03LIW6OcgUrU/zIAi9R1Ejfo
         PXisVo+89HKNic8C5YuVSdrVqUIShyXNe6O0QsF3uZQOTcoYWfZElZGSVIeRC8Od9tg2
         g99X0B1pECVPquYAKajp/B4JPpag+ogPf3YF2qfqWNViMLN37HQRTTHRkOFmJ2MGiuxZ
         lNfj0gpTmYJqFIpiV3yxBPwi0P1Z/2Hdn1v9jKeQQj5douyXKdCKUeKc7HcFICkMUC0r
         rMLG3P+4A+9xeDLluvTcIp5Y2oGmVRbrtCgYfed5arq28A3pzIr+iRfx+HzZ07bEg2ov
         3wkw==
X-Gm-Message-State: AC+VfDzKTgOAkxbRXEdflchh8FEQoVaDlRYYAzanT0UB2ePJVWRNSv6d
	/CrfMjrGEKKvy49rKXWhaXHsXZEBO/c=
X-Google-Smtp-Source: ACHHUZ4zr8eW2cUCNAtHGjngL7Dvm1WWm5x7psiQjX66qM4mYdwKef1XGDjdGAwtklEzpGWKGQOl6Q==
X-Received: by 2002:a17:907:970a:b0:961:69a2:c8d6 with SMTP id jg10-20020a170907970a00b0096169a2c8d6mr17528813ejc.69.1686734980085;
        Wed, 14 Jun 2023 02:29:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/55] libmodulemd: upgrade 2.14.0 -> 2.15.0
Date: Wed, 14 Jun 2023 11:28:46 +0200
Message-Id: <20230614092918.4065570-23-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182768

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 9e321346284..d3bef833062 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 
 SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main"
 
-PV = "2.14.0"
-SRCREV = "ee80309bc766d781a144e6879419b29f444d94eb"
+PV = "2.15.0"
+SRCREV = "bfde7f2d04fbb22e26c9eb843e4ccc478762dd8d"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


