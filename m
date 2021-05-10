Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.33875.1620662188215921031
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 08:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z3/3Fc/L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id n205so9504037wmf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 08:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mjuy1q8J4AXvhkPwsM4ZDq7glylnBpu4OVjjWPiLfAI=;
        b=Z3/3Fc/L0SwIZLyzBi3j/pA+ZX4+hOvrbhu+OmFoFaJYPoohdeOs2Ta72v2oliESuY
         BWp4m1L0cJ8pnrkxpYDo1SEqQSUBcBw9AAF/YxnxXtVdz88aqeiCVZIPmE5P00dJ2frA
         Nviq0BYeUCYmUgSx/rnHLHzjrYiQGpecgxr6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mjuy1q8J4AXvhkPwsM4ZDq7glylnBpu4OVjjWPiLfAI=;
        b=XATjCcNA6MtpwBhqVqhAbocEGrDnbrsGaFS5BtZDRBRIqtnBc8NpKTRvgeKroZSDfU
         8KYhzbeH/MHhsJ4ujelEuASQv6JhJP1LkhtAq+AqQ4vVFdFoYfWqTQGyJNZN5VPJRNWK
         qosvjh96L1m8M0RSlB7CK37vjPbo1VWAmfaLQf/r8VuMhDUU0yFqSszxxZNyPMxsDI6x
         4i0scmhHbMMKpdGZXAN8KBOw7gk3W/CIeOS643b9y4+XC8qwjiAVruoWwnMA0jASn/je
         qcw2oVtdq1iPENTof7Ji0ciiVK4FJKFTxm/1Sa/6/0bvo+wOGCBGkA56fw7/qMgeh7ep
         Mb/w==
X-Gm-Message-State: AOAM532S05dgge1WHLyfsK4F6CSdn/+nHWZDnC1TPHUz4mc4boOe1CWW
	jXUkxzSvNO8JsrDqu7unPezDWVFufdes0Q==
X-Google-Smtp-Source: ABdhPJyJniS/ysX3toisWvWnYS76JDm0tomBxnfH74kfJ9VS7ep8zByc1vGLozfwoiV4oO2q0uikUQ==
X-Received: by 2002:a1c:1bca:: with SMTP id b193mr27709333wmb.28.1620662186495;
        Mon, 10 May 2021 08:56:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id k15sm24911471wro.87.2021.05.10.08.56.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 08:56:26 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssh: Exclude CVE-2007-2768 from cve-check
Date: Mon, 10 May 2021 16:56:25 +0100
Message-Id: <20210510155625.2169407-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't build/use the OPIE PAM module, exclude the CVE from this recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssh/openssh_8.6p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.6p1.bb b/meta/recipes-connectivity/openssh/openssh_8.6p1.bb
index be56fe43b9e..57ad5e841ca 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.6p1.bb
@@ -27,6 +27,9 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            "
 SRC_URI[sha256sum] = "c3e6e4da1621762c850d03b47eed1e48dff4cc9608ddeb547202a234df8ed7ae"
 
+# This CVE is specific to OpenSSH with the pam opie which we don't build/use here
+CVE_CHECK_WHITELIST += "CVE-2007-2768"
+
 # This CVE is specific to OpenSSH server, as used in Fedora and Red Hat Enterprise Linux 7
 # and when running in a Kerberos environment. As such it is not relevant to OpenEmbedded
 CVE_CHECK_WHITELIST += "CVE-2014-9278"
-- 
2.30.2

