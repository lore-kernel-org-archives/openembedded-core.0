Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14B3C25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 09:03:59 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.16974.1717491828795026800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 02:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VugLEml0;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57a31d63b6bso945726a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 02:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717491827; x=1718096627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+sBweymBIUnPePy0c9LkKNtTALhB3mxARoo+liLnSM=;
        b=VugLEml03xeiRlD0pumRz1+pP9f4v9htErfkfwFsaAFPMUBRwxttYsZLOTPMNnMncA
         YfoDgw7EhGqat8+rbOyBYtxvg7FY/JgjMPV18sFGuFOm916uGdkCEcaG3peoTsIcmCYY
         jM6KWF7bydP6hjMI918YGdPUhYcK1L3fJuJ7QAVYjqQ/9lYvY/tsv2R1O8NPFl4xV4p3
         BJi27Nrz9fOjCWbTOXiAS0wbflai9E7x/La1NT2WEnZkJ9NKJJk7u87d47hrIg76kpII
         3FK5+KTPedIu79gR6eYL7+q978EyPnWnx2VOmBoQ05B7gbVVbS0A3T5fVPDExiF4I0yJ
         YttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717491827; x=1718096627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+sBweymBIUnPePy0c9LkKNtTALhB3mxARoo+liLnSM=;
        b=xFsAXWGkGNRNigY/2cfVq9ms2ZM3lx5bhDnI4QGX2L0hdhXf3wEQbyAo48OKGDVqny
         xQfgV5j0IyqskYCcM7VvEeEM1927JAEbtnJYfZ8Yb0t/2KZG4lBmmINHAY6PEY0GJb4I
         PuKbt+zT23PM6wAnkKDleMXdT62SlWNO+aaXGzZXHJX3bGy6AM4+MDZxZ4d31kR+BXTw
         nvmvg6WG8zphOB+rlrg4P+MIYTx7uHSDdLvKQ3dqM9sPSecp9MVIKHuvp6WxYHIU5FCO
         eOn/cosqW82NC2OEhswbwrujFydHtaNmoHDE+nxArRWl8pMtEsRfal7grWE+WibnsMSx
         LNTQ==
X-Gm-Message-State: AOJu0YxNO2ylnj74fiwpuZUl/V2/3pNdHObLSoasnJYEUlOB/c0f7sIG
	JN00PFu2bufLwOXRlu8NJzrHU57uiHv5Yvyz7SFPxKvmm4oyIYRkdiKlPA==
X-Google-Smtp-Source: AGHT+IH332xXPI7GfHW3lsCikqzxpi6OyY+KGg40YW7c4uD7ewtAHoe6n4KleV0b7OsdG4wEX7Yi9Q==
X-Received: by 2002:a17:906:a293:b0:a68:e58b:2c35 with SMTP id a640c23a62f3a-a68e58b2c64mr436000766b.31.1717491827041;
        Tue, 04 Jun 2024 02:03:47 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a691cd07c72sm213476166b.170.2024.06.04.02.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:03:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RESENDv4][PATCH 4/4] insane: add patch-status to default ERROR_QA
Date: Tue,  4 Jun 2024 11:03:41 +0200
Message-ID: <20240604090341.45444-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240604090341.45444-1-martin.jansa@gmail.com>
References: <20240604090341.45444-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 09:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200319

* it's enabled for patches in oe-core for very long time and I was using
  it for many other layers as well, so most layers should be in good
  shape

* it's also possible to disable it for individual layer as shown
  by oe-core in:
  https://git.openembedded.org/openembedded-core/commit/meta/classes-global/insane.bbclass?h=scarthgap&id=61a881fdbe8b5a21c6276b8a5d06cc30486b1eb3

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-global/insane.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 151cf0c4ea..e3d592fa5d 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -45,11 +45,10 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             already-stripped installed-vs-shipped ldflags compile-host-path \
             install-host-path pn-overrides unknown-configure-option \
             useless-rpaths rpaths staticdev empty-dirs \
-            patch-fuzz \
+            patch-fuzz patch-status \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
-ERROR_QA:append:layer-core = " patch-status"
 WARN_QA:append:layer-core = " missing-metadata missing-maintainer"
 
 FAKEROOT_QA = "host-user-contaminated"
-- 
2.45.2


