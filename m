Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6450AE7719F
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:31:38 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.20159.1736256688705521887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=R/T/dTHc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-215770613dbso169538075ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736256688; x=1736861488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lqqme70HuquJi1+Xd4SskF0LlgfqfzzdirmzrwXZIb4=;
        b=R/T/dTHcvynmqvHvjdUVaJMZuxkB8o1W8OTU6HSi4ROl56+JYjuhSk/Vd6ezb2NLpZ
         v/xo9L5/JsmM8hLDRNfAqNqli4eQ7dGkHEa/3LjfxaAePgieQJG7ElUOE8Z5qukzhYhj
         bfy503Ubl1z6b3CBNryMRJW/ota8N5BvES/Xpq949fzOuIwpM5ci7T8W1eW/Q8d+LEGC
         VbU6DGMndvzNxcGqPP0gBbH4H6f2qfhekeBajX8Q4hcDs0Uq4gMe3gOyR030KcgoyNq/
         17WAcvMcYPsSvkIFwX/7qqMp21NziTHAmTKjz6LfyojNP7TO6jyBTmUpJAI+Ta/Mt4CH
         nlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736256688; x=1736861488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lqqme70HuquJi1+Xd4SskF0LlgfqfzzdirmzrwXZIb4=;
        b=BXb8hcoxfD3lrJ7VRRYYcu3PmS4YmwERB/icHnCLjoPrR2H+ghWegahJ0vZJ8a5LPf
         hsaNYcX2M9LTCL+aHI1otYpPj6M23PpUnfad2AX2I0ZoiWxv47mVsn+lpU9C3q59H5hr
         bpE1gxQeo3SFBSLbYvk7mQcoRHTSY2tDY4CysHIuj8RYEdSsDGafxwmUxBfdTweJdqhv
         BcVBbAAawMqpbohPIdPTdA626JLoTFQsjSgZONgnmbBR1xbnoQ+oM1QvZxiOhkB/6L79
         R6/kVHu6tnJMo46En7++Ke+cHPBiYyF6Ku1s/ynnpyztRiKFa8OBwzFwHj2TP43Avkis
         pwjg==
X-Gm-Message-State: AOJu0YyrXFd9ejBP4FSdixelEm4kWCaJo1MvWZc3ijjoneFX3sxpPMVP
	KCI8o+ejVopHQsK5hwfiTHCxzlp371kSzQ2jabSGyLrdJUWvD97G/LOBim3LYqxUYAPd34N9/Oc
	1
X-Gm-Gg: ASbGncvw5OmVWeWP+0NZfrnVBygAsnoKpAF+mqgjsib1ntdpZ1MTsFZcJUQIfIzd2de
	ZfYxH2eUQu8Ejyz5/0gnfYS0OgNK3+0RCyIcVII1vd4LsFBU6c8J0sB218+GJGTkxzG86E1xzIJ
	w9+4lGnJpCSsuVumjE0FLNWz/uK4nDER7RLMNCm5b2cFM455SsvjnM6CCIPSfuNpWLmEHnkgRxS
	Sy1UoUMQh0gAEAIcoKB4fRZSOJq93NcN8+/pNOwEP1DAA==
X-Google-Smtp-Source: AGHT+IFRjiH0dViERHvb408JMChZqaxzQ1otNi/ywApTIzWDxA/CSWPDluPx6HCUd7t78d0kWuqbDw==
X-Received: by 2002:a05:6a20:9c9a:b0:1e1:b062:f403 with SMTP id adf61e73a8af0-1e5e07ffc53mr98944351637.34.1736256687921;
        Tue, 07 Jan 2025 05:31:27 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbae4sm33340197b3a.96.2025.01.07.05.31.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:31:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/13] ghostscript: ignore CVE-2024-46954
Date: Tue,  7 Jan 2025 05:31:06 -0800
Message-ID: <7f1b174b8f12fcf377c45c27022bac99b6652823.1736256495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736256495.git.steve@sakoman.com>
References: <cover.1736256495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209455

From: Peter Marko <peter.marko@siemens.com>

Issue in the GhostPCL. GhostPCL not part of this GhostScript recipe.

[1] points to [2] as patch, while file base/gp_utf8.c is not part of
ghostscript source tarball.

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-46954
[2] https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=55f587dd039282316f512e1bea64218fd991f934

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index cd0a7de70e..6d425710b5 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 CVE_CHECK_IGNORE += "CVE-2013-6629"
 
 # Issue in the GhostPCL. GhostPCL not part of this GhostScript recipe.
-CVE_CHECK_IGNORE += "CVE-2023-38560"
+CVE_CHECK_IGNORE += "CVE-2023-38560 CVE-2024-46954"
 
 def gs_verdir(v):
     return "".join(v.split("."))
-- 
2.43.0


