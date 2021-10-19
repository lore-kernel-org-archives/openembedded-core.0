Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572FFC4332F
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.11486.1634657695129203669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ex+aikhx;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so3324220wmd.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CEGVcBKerhbm6lDFDdJid1p+fqsb/J7MGsFjQCK8Oe4=;
        b=Ex+aikhxXOi+uz5vr+K0CCUABZsuSYax+Wxb45NKT1w+E4FTO60uSUc71sBazwiyo3
         S7HZPOW3ZIgr+H7/S6ufY252KYAx+Ruy5D+EmiQlY7JvNlGCyHZif0zrGhgh/ujbsXtz
         4LaSI1vxXTsDgihXuz45b9OaKw8u2AYnO2NYT5afbEVp2KTI+CqAQjGu0B0/q8LnTRS/
         wqGjkjD6WiobWSL4vIGpaMiqqRd3nicHv4sIUY6CnbVRk02ArQb+a7LT/IkjdnH21nW0
         6Ew/+Y/2QcgWRDqBydYtbJawYuyJAvFS0H2fjzKTmFtwnK3Eu5HR8xsoCPZmiUhLtxz+
         6BQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CEGVcBKerhbm6lDFDdJid1p+fqsb/J7MGsFjQCK8Oe4=;
        b=0z318SqFVZ8scPevVDNuGpcfPVBtuqHuLzSym4xDdmMf9XWl484PCb63hXU6BZNcn+
         geqGU8vbRweMhcj6w07XACUMCMm2oDFGGfTwMKSUiYsy38grAohim4YoX0yTJG7Ju7iU
         vcCektw2KdEseewPOPq0+rawblE2CJULM2pyKEid9vT3fWSeUD2I9DVMi/uUWUqLlZyq
         t83yCCcyOahuk6SZa0hsUtKo4TxJBtwC9qVba0ivSVwq+DS2K/20DS30xCL3wu+Upbn/
         vVBgmvG2GF7Qm1Jscsw0jpP+AYu7nlSqSLdJ+gkBiUqcTQa8TCIFdWmN/XwcWOdPIqX0
         1olQ==
X-Gm-Message-State: AOAM530SmJOOADtCjIxqDY0xIbzDU8bmgCZKXlDn17+vpQRMQRGCEQ30
	GHsCpO+wGkYyU2eOA4Qw3Vtt9JSAzKw=
X-Google-Smtp-Source: 
 ABdhPJzJ+I65BpbHkw6Tek+Y/ujcjcwy3pIElR8rCTOt7JDzAthdecDMqJ7cZ3EDpLSw4n8LP40AFQ==
X-Received: by 2002:adf:fd4d:: with SMTP id
 h13mr43743764wrs.391.1634657693760;
        Tue, 19 Oct 2021 08:34:53 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 42/65] sudo: upgrade 1.9.8p1 -> 1.9.8p2
Date: Tue, 19 Oct 2021 17:33:56 +0200
Message-Id: <20211019153419.3319802-42-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157161

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/sudo/{sudo_1.9.8p1.bb => sudo_1.9.8p2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.8p1.bb => sudo_1.9.8p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.8p1.bb b/meta/recipes-extended/sudo/sudo_1.9.8p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.8p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.8p2.bb
index 4545d8766e..b2afd1f98c 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.8p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.8p2.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "0939ee24df7095a92e0ca4aa3bd53b2a10965a7b921d51a26ab70cdd24388d69"
+SRC_URI[sha256sum] = "9e3b8b8da7def43b6e60c257abe80467205670fd0f7c081de1423c414b680f2d"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.20.1


