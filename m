Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823D0C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 08:36:48 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.29863.1679906200679216733
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 01:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=eoOmYBMd;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id z19so7715949plo.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 01:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1679906200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7tWeGZGawSyocJo7wsYeYKpzQVR/08u7Q83VlQ4T4Qc=;
        b=eoOmYBMdTCPv1bbYCrHbSdm+YDbt/VgEm4c8uD+3Jg27c+LzuUF+EIAmoOxn7gg4ay
         rg//iNaJpHFnoYdxyD/jV8zYGygPzI5HJLBiefq+FCeswgNMCUySEbvSVHr+EklGq0Vn
         qd30uvQ51YVVwI9OeMah0xbhol+3Y0ewzscjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679906200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tWeGZGawSyocJo7wsYeYKpzQVR/08u7Q83VlQ4T4Qc=;
        b=1BFght9cRVQT0RYVBGtd+XZZ+LgZPb9xsVLXTpKummvnb/06ssKdZl7cTrNMEnIMhp
         a75M1SRBY4Ewjg6LyPGFCMVNgPMijLcP8bcsJN0F3/WzcOxTHEej2XLdXyDtc4VpfBqi
         hWI1KnPzw6QoF5xFTzerR53WL9haIcZ+7DSVInN4fThXBo6NWCAIA6KSGdHlbX42J/vV
         w+MIvQl6Axq+CI8zZkkoFyRN3xXNhQlEPc1KFvQVvZsX7pvi7fyOos3S+vn8PEZZwDVm
         sRID7RFzTBE/r3Ap8Y2Cv60DoQgGu5wiNxhWDBgF8r0fOw8XA6Zmqw6RXVrNeZk5ONtY
         K3oQ==
X-Gm-Message-State: AAQBX9d+vZ6PmmlltTdSQBmcMKQcQFcxcen3VFa0BwTSMMBx1MC9uNGY
	6U3+wrRbJQx7nhO2Mj1tsXfM929Z+uwvKXvvCBo=
X-Google-Smtp-Source: AKy350ZX4YAYdtX7QTf9GLT99es6Hyc1XiEF1prxlHphh2X3Ul5O5zSjSgHeAJuGg1mVUxH4CIUA8w==
X-Received: by 2002:a17:902:d04b:b0:1a1:dd05:39fa with SMTP id l11-20020a170902d04b00b001a1dd0539famr8083549pll.48.1679906199693;
        Mon, 27 Mar 2023 01:36:39 -0700 (PDT)
Received: from localhost.localdomain ([157.32.7.87])
        by smtp.gmail.com with ESMTPSA id w4-20020a1709029a8400b0019a773419a6sm18609302plp.170.2023.03.27.01.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:36:39 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCH] openssh: upgrade 9.2p1 -> 9.3p1
Date: Mon, 27 Mar 2023 14:06:20 +0530
Message-Id: <20230327083620.106257-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 08:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179147

From: Siddharth Doshi <sdoshi@mvista.com>

OpenSSH 9.3p1 fixes 1 HIGH level security vulnerability.

Upgrade the recipe to point to 9.3p1.

CVEs Fixed:
1) CVE-2023-28531
- ssh-add in OpenSSH before 9.3 adds smartcard keys to ssh-agent without the intended per-hop destination constraints.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../openssh/{openssh_9.2p1.bb => openssh_9.3p1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.2p1.bb => openssh_9.3p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.2p1.bb b/meta/recipes-connectivity/openssh/openssh_9.3p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_9.2p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.3p1.bb
index 4666237d68..d3dedd1a5a 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.3p1.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            "
-SRC_URI[sha256sum] = "3f66dbf1655fb45f50e1c56da62ab01218c228807b21338d634ebcdf9d71cf46"
+SRC_URI[sha256sum] = "e9baba7701a76a51f3d85a62c383a3c9dcd97fa900b859bc7db114c1868af8a8"
 
 # This CVE is specific to OpenSSH with the pam opie which we don't build/use here
 CVE_CHECK_IGNORE += "CVE-2007-2768"
-- 
2.25.1


