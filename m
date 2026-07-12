Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703ABC4450B
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:59 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9508.1783835511042959152
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=R+2NR4SG;
 spf=pass (domain: underview.tech, ip: 74.125.224.48, mailfrom: vince@underview.tech)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66780d9d901so3044687d50.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835510; x=1784440310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbFY+D1ZBUrfgvpTYCBvCMbZbwi6J3rhxyQH4S9VS/s=;
        b=R+2NR4SGVPDJLDLgaqcg7/lyzv+xMjuKoDIiXq7yONU+5vz7t/PuTOnFgjzeHVrtBd
         KJqWQYA3/uFy8q+kLgRfS+imSOosCGc3pbDup/1Ud6+ZsfduJS9eD0mBGLzH82/VDJUf
         mwZWJ/MhkuO8ynhnJ9xAG1aHfIsBUmh1apUiz14Pf8AKshXE9JDsYgiaY8NVYDZMyC59
         hqHuQ1a9poZ0QpUkUmVmB7BS1lEXoLsGo8E6KmiBlH1Ck8hjM8mNwJruAZpO2BsKWe06
         Tizx30ShxCfnH+WRIaQWY78ZUaWOo0miMYvskJJKpgAzPlQlxC6uzWpfjGR+hamLl/M3
         7+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835510; x=1784440310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbFY+D1ZBUrfgvpTYCBvCMbZbwi6J3rhxyQH4S9VS/s=;
        b=mY1N95BtSqMFQst+tnR4SEclndGxs6QhWXG4ZDcV6pLDfWZq0p9XBKfDXKEH2O+wIt
         vIAGUhNwkbLIB5cxomVDUYL+bacmX0ndNOpvnyIZgpSvZIY+JNdHmZP0r9yMvJ/JdXXA
         stqCn+jXcDwyb6AVs3OQWNpoC+t1GrlY+awspABSFQAgG4ic691aEbRQaIhJPFwzp/OF
         bsJeC3FKkLUuz4M5vXRD9h+z3glLzti8yHPHw5D7DWy3Um4Vul5cFfBakzzBPI1YP48x
         KvZBi88Kt4nxfi2FoumhtC1qEanQpO0NLANFlnHb+UXGaq/UU0AA8m7Ha9lgMx3e1KYX
         6t8A==
X-Gm-Message-State: AOJu0YxG8omR7WAxuq8gr0nvIUHvMnbiVTSnHt7CEipJ/MqAqQGDNodT
	YCWiW+oM8TwTQAQtRVw7znh1F8YOiV4UfNc8NOihrPgceyRhfdWijrH7any9n09HBc7hX/E18bh
	GU64N8og=
X-Gm-Gg: AfdE7ckPSDxWQ6hz+ED9cZoElqlsYHx3WT/jc28i2bLjF0m7Rwd9Ae+k4ZPm+deknx7
	KC6W8i26wuMw1HK0GfywverpCvgYTEHAPg4Nlr+r9tcvQh1FI0nFRWXSYgzQMNC/oS65RqPzfGX
	qdjySk8OUpMYqXBUC8Gmgq9FZdk/mKIVqezHP4ZSu5NgKlz0BrJ4UDWLkIAOuqcatMnqfY94B8e
	I4ZALW5kH1sMBExqviWoQcLJ7mpZrBMxM2fmQiFzI6I3X7oWreIKll6PHCO9s8szvv3wu1Q6Auy
	3zjJ694jvrpENCsznpp9q+HBAoNUiImatONIqqTLuYozqmnNw26Pw42++2aGzQelusFvr+gN1/Y
	updXb5+gfG9D5gy+ldjdoIGHoeJZ/tlwaChFYM4J+hQyDjqul0eok6qkW+XOnPehuAgnd8lr4Hw
	wv5xmXDtKJCqt3fwFgxpT+xh90
X-Received: by 2002:a05:690e:c4f:b0:667:a12c:8230 with SMTP id 956f58d0204a3-667dcb97185mr2860785d50.9.1783835510150;
        Sat, 11 Jul 2026 22:51:50 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:49 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 20/26] parted: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:48 -0400
Message-ID: <20260712054954.4063745-20-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240745

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/parted/parted_3.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/parted/parted_3.7.bb b/meta/recipes-extended/parted/parted_3.7.bb
index a669919dd7..4215cbf4a7 100644
--- a/meta/recipes-extended/parted/parted_3.7.bb
+++ b/meta/recipes-extended/parted/parted_3.7.bb
@@ -52,7 +52,7 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN}-ptest = "bash coreutils perl util-linux-losetup util-linux-mkswap python3 make gawk e2fsprogs-mke2fs e2fsprogs-tune2fs python3-core dosfstools"
-RRECOMMENDS:${PN}-ptest += "kernel-module-scsi-debug kernel-module-loop kernel-module-vfat"
+RRECOMMENDS:${PN}-ptest += "${KERNEL_PACKAGE_NAME}-module-scsi-debug ${KERNEL_PACKAGE_NAME}-module-loop ${KERNEL_PACKAGE_NAME}-module-vfat"
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
         glibc-utils \
         locale-base-en-us \
-- 
2.43.0


