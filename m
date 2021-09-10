Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.6240.1631261926904691051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 01:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BRrp/Mmr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id m9so1439023wrb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 01:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BEXqq/00QZuJa+0EGyzB5zQg0oFfCBWV7yDhOiaeghg=;
        b=BRrp/MmrV6Pfn3t1dXROdVdXkXx0NlroXkuic0OiMDIbLd3ESVSJoK7Zf5aAoeF/uF
         KbZoNQl73N/aSqdhNrK8DiJnHS91oMocaubl6T2HccQivtOJHVbzBaYo+g2uVYPaxJt3
         z/C0tqd9UoS7iVL2DxhS5m2qOqJSOt2f87xHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BEXqq/00QZuJa+0EGyzB5zQg0oFfCBWV7yDhOiaeghg=;
        b=XEfkLcOtt/BUMvyNzAhPKDa0xF3KKzAWmQjKhS3aoUZX4mn5V92BbL+eY6tOW3OOVB
         4MyvZC2h7e40PYmE3Lv8vnWa1hsns7yQ9wyYamgaI0mwF538Emy+1Nbr68AyFtLM2+97
         DlQ2Dp3fabCgNvmp0DpxX/Q/HPffVeVu5z5fOQZlEEK9Ahqq5W9ibVA1Y7sw4NruXP/n
         IYdlJerHd5KjxYyyJs5dKmpkQBWDHw6Oml7yPmusxZzKmW2UrIK1yRN/6HQbtBXGwglb
         EZfBWS6If+wMWE/CtuPJtZw7cwN8u647Pl8ZydpH+50z7CJ4HOeAuag30kvKO8EcRVt6
         m6zA==
X-Gm-Message-State: AOAM532vkXc+pM/CuVIrl0C9w1PLmfrf9zjevKK/dHCdr3yS1Vy8MU6Q
	pyZRAlkfXoATLOfF47b8aUg/P72TLfW8qag0
X-Google-Smtp-Source: ABdhPJyJkHGzxQBn90mkDqcCYSVD0riw34Vwoyk0fIo6g/5Hy9uhCL4n9KsIlPvMoW60tYHXts8H2g==
X-Received: by 2002:a5d:53c8:: with SMTP id a8mr8018439wrw.168.1631261924927;
        Fri, 10 Sep 2021 01:18:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:69c:dc1e:bcce:ea45])
        by smtp.gmail.com with ESMTPSA id s14sm3424700wmc.25.2021.09.10.01.18.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:18:44 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update with fcntl and glibc 2.34 fixes
Date: Fri, 10 Sep 2021 09:18:44 +0100
Message-Id: <20210910081844.1246454-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pull in the following changes:

* pseudo_client: Make msg static in pseudo_op_client
* ports/linux/guts: Add close_range wrapper for glibc 2.34
* pseudo_client: Do not pass null argument to pseudo_diag()
* test-openat: Consider device as well as inode number
* test: Add missing test-statx test case
* fcntl: Add support for fcntl F_GETPIPE_SZ and F_SETPIPE_SZ

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 328177c9bf0..a9ea8b4ef66 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "b988b0a6b8afd8d459bc9a2528e834f63a3d59b2"
+SRCREV = "21ff2fb690efbe57e7dd867c39aff36ab72a6ac5"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.32.0

