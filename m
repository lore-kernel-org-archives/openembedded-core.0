Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B27E909D8
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 16:34:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16409.1771346088082182822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 08:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=W6FV2NNg;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4837907f535so31241285e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 08:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771346086; x=1771950886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wXxS0hj3HDE3u73Uw1WGwCib/4mocMDIXeWPjk4ccrY=;
        b=W6FV2NNgj3CIZQyoake4eBqd81wGrjy42RMN/OUPt6u1Nu5cgttMQwvGWr2CpK/rQI
         YwpoW5YqAV9Ru0BCSqle6TOCqhph0VTd3H9KEhvjuzlktP9gf/C2HmsdsazD7EvIlr4q
         L9A4RTrF0WfzHQxhuBqOPJVkF9yO5VLVZJeag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771346086; x=1771950886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXxS0hj3HDE3u73Uw1WGwCib/4mocMDIXeWPjk4ccrY=;
        b=Hmgm3DF143QmteJCyf/a4mxcBfo7l1C3/RVrBPH1ONq08ZOoH9Iw2bBowsetRURuVW
         Lg39ZsqAaHT/CprwbSIDbWv4sbX7XwMgY5JftS/z7HHJ7W5Lk+5g6nHfyeSEhWCMHQIX
         8eicDpn3+h86nTgUGYjldBBqoDl8kGZ+yY9GsnRABYpCyOgbjeo4w8RW/RzFdSdPhoHd
         fOJTObeZfE0JgiEhnmZ3jn7N8YlIn0FRVuACr6JKbxuhSH3Wu9dKu5jmwvbtE15uEKBd
         sNNarXcHIcsDdHGhsDD2h3E3EXiu+fJS32TV/UIXDkUZwukS8z1PhBdE0BlkchdjEPP9
         Ectw==
X-Gm-Message-State: AOJu0YyD1Dw6uYfFKbe1F+yW1OPpNZ5TNUT+0Mwct6gXZQ/5f1z0XNMe
	E+m8bE/u4QVmijRwXORQ0rRSKD9NPfqnS5HQsLGntc3Lc6dv7RmUc0A++FzYl67Ig31UgOke+Qt
	R0Kzx
X-Gm-Gg: AZuq6aII9ucvJ91ugt1rqJtKpUs5aHRkAr0OQeVx2tQsNIpHQxyUj6Sj/P9K4pnXspl
	cpeQl3zAx2rGQ6yNLikjf55Vur8Damkssvs9RVVnCQwvmUVpSHmqNken/3sdYrQnpyp1P9fgde8
	EtNJkjDitwJaJQ1Hi2/2SFAumcrjUicJQn1AIk/zJVSlecHdcDuVUYRW8GTaMZyY384FYq3DWC1
	0JvHS2J08MkIcNBy5hnu+yedkYq+qUlZvw+I/ySdjYQkJ3mOCFWLpAlNsPMIToVQPHMjjFOdGCF
	tv0pEVpmFpluYij5n6Al7vP2wxuZLJ2/dpW366oZJXHD1htll4B5sObho5K6CRcFf5Lc6w1H/vw
	dxJahlJSShhh79HjIVg9t0sRsjBWAkAB9FrlkPpdy7i1pQb+3mkbKVFxcJs1rgzv12d0qzgx4Ov
	ocRN/eUk5ryStvzhli6IapSy/qMHbaDQIKelMktDdtQaK2AieaMqOctMsNilj0oTFuHeKCJssvc
	bW1wbI4G0oOAjLmnC64P1AgdHre5zIsGg==
X-Received: by 2002:a05:600c:c095:b0:483:7f4e:fef6 with SMTP id 5b1f17b1804b1-4837f4f00f8mr148761075e9.26.1771346085937;
        Tue, 17 Feb 2026 08:34:45 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4837a5d562esm236053455e9.15.2026.02.17.08.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 08:34:45 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] pseudo: Update to include a fix for systems with kernel <5.6
Date: Tue, 17 Feb 2026 17:34:25 +0100
Message-ID: <20260217163426.490075-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 16:34:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231262

From: Yoann Congal <yoann.congal@smile.fr>

 $ git log --oneline --no-decorate  9ab513512d8b5180a430ae4fa738cb531154cdef..43cbd8fb4914328094ccdb4bb827d74b1bac2046
43cbd8f ports/linux: define __NR_openat2 if missing

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 2dc5eabf2c..a26a205a16 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "9ab513512d8b5180a430ae4fa738cb531154cdef"
+SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"
 PV = "1.9.3+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally

