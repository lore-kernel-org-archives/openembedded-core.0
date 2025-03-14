Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC78C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 14:10:25 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.15431.1741961417682250990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 07:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ys93pI6W;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-225b5448519so39911365ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 07:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741961417; x=1742566217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1cL9xEB4QBVHa8hthGfEFLuSDPDAgE4icp8+1fYgwY=;
        b=ys93pI6WCpkibrWf8zRTCyZNH6S4TDcNWiA1HLpxht0DpC5kTzXceVdDceljnCVwR7
         5qkC8uc9/4Zgse3L7LeybWdJetEKg149J3TxqD0TiNX8Fu0CBJ+GQE92aPg50lO/EHNI
         /SJZXxPCWJ7iMDTPD3ZPR5gACIKxiGXROJ2jbgxPWUmYlgIncXIBsEM3/mcqCnWOUD9x
         Ojh3WKzggWlbu2oTMreNaRtuXukfcQtefoOi5waNavJOitJC37CvyK1pY9p8cGJvT8m+
         A9q0H3ZceBDwEacZ4uy+ixeXDxSHddEuWlDJwkiPjLvlipmaxUu2Ry07y3SuwXIKYdU/
         0VQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741961417; x=1742566217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1cL9xEB4QBVHa8hthGfEFLuSDPDAgE4icp8+1fYgwY=;
        b=ofoHXqLWREcAoHULcy9Lvs5aaURuMIAwREJD2ImL0FGDaJlbkqJaswZ9FsKhIy1gTu
         k3YUFO6aSAbpEb5rrO7T7oQTxHsAm39LbJKzk04qion9VppmtkG7f70cZtEUPJuaLpQb
         nLkUq+bzPBVF0PjbwQ6BdaNBxslVsZbKZZAPXEmhRT8xHvng7YIKAs2EHakFsictA7e2
         lFEhL4TKIfuH5AOBEUO9nmrmTSZ+xxmRINwK5qz4m9eDRwbEnlJ1CnOsLGKaB3ULGhkP
         FvKnhTC7TnF0hki0AOlMZBksUBWWlc4i6lBPNYbQBjBFTSdmnXGpr5dkpEa5OgxDj4xM
         +p2w==
X-Gm-Message-State: AOJu0Yx9WNaV64lrdBB5EIyIVXj64d2SiVzSCza0RwP3exfPUHTOuy9/
	+tM0IHOmEVSI2UVDmU20JyrbDzqF95jxHkTeA0Zl3SYASXTD10AXa7LuDOseB3tQ59A42SCjTyc
	M
X-Gm-Gg: ASbGncu2/K0udoflqeHxG7FKurL/jJ8RB2li2zC1IvkC/5vc/3wYxYS7aJn8pWw5zxQ
	iKVHTC7y5AHzYSJOSiQitqzBTRVTeZEX6TN+0BOOihmFYzXPfS5d3e/rv7dWyNMHi+/L0DlpDPH
	7KAzr8PTGgNWlosK/3z6w8U8WEVWmGt8qmib/4D4l/FrrE4mKMVQSZE0krfRtOk4p/6Bo+Ofpc2
	75GVIEYSEX6Ju5tAdcoCL8wMCBE+zsDCbVNp+6ySwIaaBe2MF7sDKrw+to4AaRb/vHWTJvH7Vnw
	umBLlwmocGk2fewjzB+KDyzmDJq0oq4HQq68
X-Google-Smtp-Source: AGHT+IGwr2dBwjzNNcPRllzW/CacxxMwuj1xA+iXu1I3J6u7dy/CRKNKZfUPM0oWMvk378XCsFOnQA==
X-Received: by 2002:aa7:88c8:0:b0:736:64b7:f104 with SMTP id d2e1a72fcca58-73722338721mr3207572b3a.5.1741961416673;
        Fri, 14 Mar 2025 07:10:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f60d:ac2a:8f85:c2ab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711559269sm3000774b3a.65.2025.03.14.07.10.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:10:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/7] puzzles: ignore three new CVEs for a different puzzles
Date: Fri, 14 Mar 2025 07:10:03 -0700
Message-ID: <48791ba2329ee930285e5ed8eff0f2535c70bec7.1741961309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741961309.git.steve@sakoman.com>
References: <cover.1741961309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 14:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212847

From: Peter Marko <peter.marko@siemens.com>

As we just match on product by default, ignore three CVEs which are
for the "Puzzles" WordPress theme by ThemeREX (CPE themerex:puzzles).

(From OE-Core rev: 87326573c82ac1e8dc335319442236ef2341501e)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Adapted to different kirkstone CVE_STATUS format.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 0104f2672a..436d444896 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -47,3 +47,5 @@ STOP
     done
 }
 
+# cpe-incorrect: issue in ThemeREX's Wordpress theme Puzzles
+CVE_CHECK_IGNORE += "CVE-2024-13769 CVE-2024-13770 CVE-2025-0837"
-- 
2.43.0


