Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B76C54E49
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 10:06:59 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.19896.1709806018659325621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 02:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EUKtvPEg;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51320ca689aso707008e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 02:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709806016; x=1710410816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g4A0y2NNPXaZW4jdjlgWECP+mzJztqNfkSrKg6aBf1M=;
        b=EUKtvPEgaiPkWeYCqGw+wvWosvptJvFQyv1kqRrH73veHhPiXEi37ea2QcXnQFOtXC
         uFndsefzrrMIEtop1oZTKA9kYPMnpEwR8aguNXIieXI8/B7ReUby2FO6olH0/MYNYvEO
         u/Ja9vH3DBm2ccJ4rhhkhg/nXtZW/+AMKP8uL+8AO247EFe6VE18xtXDqRUf+sAPNjEt
         KF76lHs+SoXXDN5t4LLcz8Uu31U+Yh6XuwnczPXHn1B1zE6+6FXSH2eTvANiieEctOHK
         RoK46Sy6P7qSz8H7KPEJoTLVXeXBjF+Y0HMMGENthF5dN9KCSriUqI4JTDXqfI+U5qFt
         E6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709806016; x=1710410816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4A0y2NNPXaZW4jdjlgWECP+mzJztqNfkSrKg6aBf1M=;
        b=NOs3UmnY42MV+/rsClzIEjUKNr/XeisoFXhuuBxrbYTB3lE4yurD6zAO957EDiVhgZ
         MBtgvWQ0zxzHu3y3cdcsHh0uYed6yMrsJriBCM97A1xN7Rtrx3zc2+5bjZ0P1RP9E5Jy
         2RZGmpIlMn4YdOac4EdkpFBYngZ29GcKEmXCOXHcPZ0I+/n4Y42PT8vvfm7Xb2P1+i98
         7l2YzU63srXo26kEbjv3WkijQQVE4aP77coiv4En7i/UE3Rp7FhbBDv9pdl6V73grgwA
         Zg3/zUBO58NGjEsrW+c4767gySprJkjrWESEelOKomITbsYVwAZ6jijSiG6gHJOKWalk
         xM3g==
X-Gm-Message-State: AOJu0Yx6WwTJ/cR/GnyO+HvOmxeoxtTgBBpC1Vk/55/C9ci8qyI9OVeR
	SDwiY40AgTUcGcABlfRJrzw7Qkm1pFTQ3vRG6OYECskMSxXWiNgB8SjohHrs
X-Google-Smtp-Source: AGHT+IGaKJvm9NM1/+8Kb5cP7i77vwzMYVGW6L02RD6GoPrOZjRNLOWlTVBd0x0k1av8sUr6goJIYA==
X-Received: by 2002:ac2:511b:0:b0:513:116d:4d9b with SMTP id q27-20020ac2511b000000b00513116d4d9bmr1015208lfb.60.1709806015735;
        Thu, 07 Mar 2024 02:06:55 -0800 (PST)
Received: from toster.lan (bl23-106-114.dsl.telepac.pt. [144.64.106.114])
        by smtp.gmail.com with ESMTPSA id n12-20020a05600c3b8c00b00412f698af9esm2275889wms.17.2024.03.07.02.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 02:06:55 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] go.bbclass: set GOPROXY
Date: Thu,  7 Mar 2024 10:06:29 +0000
Message-ID: <20240307100629.105263-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 10:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196783

The GOPROXY is already correctly defined on the native sys root
and this can be checked using the bitbake devshell:

| $ go env GOPROXY
| https://proxy.golang.org,direct

The go_do_compile task calls the compiler directly so the
GOPROXY env is not seen because it's not defined in the shell.
Defining it explicitly solves this problem and was to avoid
setting it in the recipes itself.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-recipe/go.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index 39bfaa5156..cc3564c36a 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -78,6 +78,7 @@ GO_INSTALL_FILTEROUT ?= "${GO_IMPORT}/vendor/"
 B = "${WORKDIR}/build"
 export GOPATH = "${B}"
 export GOENV = "off"
+export GOPROXY ??= "https://proxy.golang.org,direct"
 export GOTMPDIR ?= "${WORKDIR}/build-tmp"
 GOTMPDIR[vardepvalue] = ""
 
-- 
2.44.0


