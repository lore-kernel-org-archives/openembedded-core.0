Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AE5FF511D
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:16:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85465.1775578579545024535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Z6U3r5PW;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ad135063so21392605e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775578578; x=1776183378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZXJksZ6cDyZy+zz8rFNmc7ug59d92x1hFHDvQgME1M=;
        b=Z6U3r5PWx4exQDcHNdu1cd4Wr5CcYk3FM+G2p6V83OuScUpsxIIae9DXt1t0nUXymK
         hUIrYRtw9fa3yCz5DNByNXZqj0t0/HxnkhHHckqjCMNGr43QUDAoTQkand9gRdb2H5WB
         Dj/yf99RvcJdXbXcpNVagiREIwwcA6823wERc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578578; x=1776183378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aZXJksZ6cDyZy+zz8rFNmc7ug59d92x1hFHDvQgME1M=;
        b=X6AFUgMDDrWktxTalEdHWn1AQb01fDatJUgWy5Ahqr6IKUbQanhCUrLRoBCPLiBD64
         q8vM0ztVsoiuRXsGz4JB8JgNzUimrKCAya0uKmKSqU3ZMyV6ZS2azZHz8evYGFdVD5NS
         2zxTbj7FoKpeZNJy2/VXp2aUl7HlVZ7b1O1etpvae2kVfRP0WXMrTkKu2QW1yCBpws79
         5FMdlPHOg0SER6r0cuYJjBGAJcdG6giGgxnGGxWbZs/PupM5vbiohLRQ+yiFVxA8jH+5
         3cUgxJJnNisupRVAGjWOKLdIpsIrNE7eO7WaD1UIr2rtWK8B9PpBciBSEGGyIR2Orr0E
         BcCQ==
X-Gm-Message-State: AOJu0YzuUSkgN6Gcfp+g9J6Tdd36vSMeaCWsGW/Zt5rSn4YVlGkHLSIb
	TAl5y6NcjrIYQ5Iz9vVAhjYlSRx0ompLx8vi+zJKEAPgvCfa31pZqiMmU95DsSpqN5zsoKWJjJk
	fNSALliQ=
X-Gm-Gg: AeBDieu+kx4RV/YoxH9A0RsYtdeYrohcMqkJeoaUubtu3TE2n5XqHVHOb18l2CBzgHN
	V+LgNuj1aOJyw8/IfOC6Mto2+hYDI1KuaLt/kxlXTL40E4b1/P9fO7CpZLkSvHScCy6eRgx1SR7
	fXB6uiniDGSnbeXx5wTrS+HrSJZw/LLUFfIa6mI46mecgGhPCs0nPwu+HiQcOlOhzQ2Qotdfgf7
	GqwzMZ/EpGU4gHhN/+W3hrb36HxMPsmHkTR77wrnkqDbRTFyC7Xy2wuYvonAyhflWauBVj7hwH4
	Z73fSyH7SFitsvknISwSLtchyQXbWP0cmDCsgnmMF6SwnxcEwzUjTmthG8LPZzoU3b/M/Q9Od4N
	Ca3tMrL6tqR7btgVBS/pFY33dC1yySjI+KmJ8jtg1chLAXLfdgOQCTPTCDa+tsXOflSPQDLL+v8
	zBFaGAt+7Ha4y6MCoAx2Ydkl0v+BjKEs5lmNST+8ce7OP7dBaaoDL/JY11iwk0GgQRb561lffow
	NfZh9sSqLu88oT4yCP8C1X2EITX
X-Received: by 2002:a05:600c:c10b:b0:488:b043:5efd with SMTP id 5b1f17b1804b1-488b0436356mr92752655e9.13.1775578577658;
        Tue, 07 Apr 2026 09:16:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003bbe8013556e3516.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3bbe:8013:556e:3516])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c4b57febsm1195665e9.4.2026.04.07.09.16.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:16:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v3 04/19] README.OE-Core: update contributor links and add kirkstone prefix
Date: Tue,  7 Apr 2026 18:15:41 +0200
Message-ID: <2e04debcb02caa9121a8f933c59fd69666a44fd8.1775578386.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775578386.git.yoann.congal@smile.fr>
References: <cover.1775578386.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234757

From: Fabien Thomas <fabien.thomas@smile.fr>

The current README points to an old Wiki page. Update this to the
Yocto documentation.

Additionally, add a helper command for git-send-email that includes
the 'kirkstone' subject prefix to ensure patches are correctly
identified by the maintainers and CI.

Suggested-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 README.OE-Core.md | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 2f2127fb03a..8a724dd6d0a 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -16,9 +16,13 @@ which can be found at:
 Contributing
 ------------
 
-Please refer to
-https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
-for guidelines on how to submit patches.
+Please refer to our contributor guide here: https://docs.yoctoproject.org/dev/contributor-guide/
+for full details on how to submit changes.
+
+As a quick guide, patches should be sent to openembedded-core@lists.openembedded.org
+The git command to do that would be:
+
+     git send-email -M -1 --to openembedded-core@lists.openembedded.org --subject-prefix='kirkstone][PATCH'
 
 Mailing list:
 

