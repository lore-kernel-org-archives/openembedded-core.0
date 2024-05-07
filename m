Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27305C25B5F
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 01:15:01 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.1086.1715044500571513430
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 18:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BYvxmucN;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ee12baa01cso11669575ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 18:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715044499; x=1715649299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rve0p/dv1eWGMVSE2ePGJ4SUsfDOksStX6udeTx1rYU=;
        b=BYvxmucNnLu8fixVtgFHZzy1aw09Zt+o4wTedLEaHum7dA6Y1Uh6symSCon0JSWp7C
         rkOK27rltO6cupo2NmcZb7HucB7xZF8m8WKVy4l46yUJI5HqjiyeoNw+2veazuj61dcs
         gY0TO/ib1pX26EvntQ3aPw2CGRlvo5LVzV187K9ayu7cCEbOqng/itaB8sIh5XxUO6aL
         sZjovmXtKYVrgCFdO/qoAa26vt96jKtHedxVyqpwgHOa5K2d4qWMyfHB59iBVNpsfdId
         0dZByC/KMManOiZOtMxxHFhfmPxslQd+zY38SSUsF4s5xah3CbwsE6FK9BzgpWH/5aYV
         3GOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715044499; x=1715649299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rve0p/dv1eWGMVSE2ePGJ4SUsfDOksStX6udeTx1rYU=;
        b=oIgoe8ycs7RSHjcQiaSaKH0TnX6V6+Tnj9FII9fl6YroVPwjo9P/XxTh8hppy4e2rb
         K0z6W8q8o+gC2MSclzAqe2MG0Pgt+/BOl/f9en1xq39eji/17DTNl4tuLQ3DPEnSR3VL
         4iKWnP5WbpZdYcwMdp3va65AgP9ZK1b+ksgPGvW0MOZ4b7vhWJQ6NlX8pfMz6125cycC
         wZ8BPPUDyprtCJ8wHQMHM04hsiTTQo4GrZ8GOsFF24zSVMmturzqMgs0LTgJZVXiGNmW
         1/hNG50CjiVzr/bycE9GN00aynKAXGsO/Wa5fApSgRr8CEphLB46zkXq1XBAqPPkmG9P
         QMSw==
X-Gm-Message-State: AOJu0YxKodiZsiNcXiJtFxzhbySxIdG2OFUmPSCGbo3x2841QpTErnJ0
	zXs9OImk5JdmzQ6t5PY+smqXv7dkOcTl8KYLMPj28C9j1iYG7XQ3AVtdQAKt
X-Google-Smtp-Source: AGHT+IEIvoZXopuYhpAKefgy1v3TnALiAhzyMUSoPZAxp5lw5JZo4qGlo4569rBcxA7WD1pqzIukAQ==
X-Received: by 2002:a17:902:d50c:b0:1e5:d0e3:b960 with SMTP id b12-20020a170902d50c00b001e5d0e3b960mr14422486plg.11.1715044499409;
        Mon, 06 May 2024 18:14:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902d50b00b001eb2f4648d3sm8830898plg.228.2024.05.06.18.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:14:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 02/10] expect: ignore various issues now fatal with gcc-14
Date: Mon,  6 May 2024 18:14:47 -0700
Message-ID: <20240507011455.313230-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507011455.313230-1-raj.khem@gmail.com>
References: <20240507011455.313230-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 01:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199049

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 7b610b1ff2f..18904ebc10a 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -81,3 +81,7 @@ FILES:${PN} += "${libdir}/libexpect${PV}.so \
                "
 
 BBCLASSEXTEND = "native nativesdk"
+
+# http://errors.yoctoproject.org/Errors/Details/766950/
+# expect5.45.4/exp_chan.c:62:5: error: initialization of 'struct Tcl_ChannelTypeVersion_ *' from incompatible pointer type 'int (*)(void *, int)' [-Wincompatible-pointer-types]
+CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.45.0


