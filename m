Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12690C433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 17:49:54 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.617.1636739392791904208
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 09:49:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PIrZgYH+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 133so8432257wme.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 09:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Qn6JfBF2wsDyx1JGFx6KIEb42rLfM2D3cpn8dvrg8M=;
        b=PIrZgYH+Akj73kViCIuSgjFI2kiIc8RefL6+1E2Ib+P+aMRZHTngVWUP7bFHp3JAQv
         0ZD9jUEElnIh1GeiDEowNyNx76kX3ZFXTF0HxCKIbVEQshrpwmjdoTfGc4zWLWltnNg8
         6JlZ8C8uXEn1rA60fhMCmutxHFt7ZKfJQ9nHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Qn6JfBF2wsDyx1JGFx6KIEb42rLfM2D3cpn8dvrg8M=;
        b=joJKOcPW5n4m+kcX5joHmEi92Ej5sJlioXPacb+JM3CHDUaBi49CWjHUpnUy4mqe5O
         Bt6UR4PhYvaxMwjhEgJQtDeeXxnJnkgZlbSaqlJDR6cPIVRAFXPqPVcvPqyFAZmyw8or
         TgtnMItUG2MlYcDsDKRZs9x8glnpBa/3+vxDhU+Al0E8ZADaBdZXtj+Ktqvcrnci6cl6
         tft52ch2VqQnEISHdGrLyV6992eADUlvy8oPEgQVNufgD3iL6I4jxN9OLG96CRuUCzNf
         eBP4Pp6xfcHq5VT4KdDTDWVzJdc1hPkNb1QTdDIY6XdXOUYKycT7pIj498j+Qklwz8Xv
         y+LA==
X-Gm-Message-State: AOAM5334mKbVFgNi/BHX1se0GyOxDoXSmcwUijWPagM3L0YPfJdDgVZz
	wKWRIKxhwSBkfgsw23EpUeZ5QAuTOO8jzQ==
X-Google-Smtp-Source: 
 ABdhPJwtNvBd2BCSz+PgUy8Km4H2yNe2cGIZjCKWIfRE/RavmR/ZgKKclPopiP9JfGe6qO9XCuI1/g==
X-Received: by 2002:a1c:3546:: with SMTP id c67mr18819742wma.43.1636739391097;
        Fri, 12 Nov 2021 09:49:51 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c0bd:72b4:105a:2914])
        by smtp.gmail.com with ESMTPSA id e3sm6336932wrp.8.2021.11.12.09.49.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 09:49:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mirrors: Add kernel.org sources mirror for
 downloads.yoctoproject.org
Date: Fri, 12 Nov 2021 17:49:50 +0000
Message-Id: <20211112174950.3903607-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 17:49:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158231

kernel.org now has a mirror of the downloads.yoctoproject.org sources
archive so include this in our mirrors list.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/mirrors.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index dc95cc1174b..8e7b35d9000 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -62,6 +62,7 @@ npm://.*/?.*    http://sources.openembedded.org/ \
 ${CPAN_MIRROR}  http://cpan.metacpan.org/ \
 ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \
 https?://downloads.yoctoproject.org/releases/uninative/ https://mirrors.kernel.org/yocto/uninative/ \
+https?://downloads.yoctoproject.org/mirror/sources/ https://mirrors.kernel.org/yocto-sources/ \
 "
 
 # Use MIRRORS to provide git repo fallbacks using the https protocol, for cases
-- 
2.32.0


