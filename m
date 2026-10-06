Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DE5CA6001
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:39 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48867.1791301594567795968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=drlBoqnq;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b0584ad71so699314f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301593; x=1791906393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hbnW54CtptI4LyZ0O4OQ/WAglVEER0Un9/uec7fmIEs=;
        b=drlBoqnq9ncUBOypYRqqD7VoLU3I/sTpQ5XGcYrnCfIA2ZoI67UC1JCV9fFr4O1mxk
         2zcHjTuJo0CYsIKfzV/0/d7cWYCPr6NiDbnNp4xEdfpB63BEeeSxq1QeChilVMty0KEx
         k/kpJ8StRD0fjNpGr8/Me6WgMcc5xSStupl2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301593; x=1791906393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hbnW54CtptI4LyZ0O4OQ/WAglVEER0Un9/uec7fmIEs=;
        b=uFNKccneJIV7h4St7XBfsadYU1kx8oU4yJ7Q/EdFoVB4dmnxZO1QnCWCOPOyYASvgD
         DqqkWFVBXU8mjfOeHn2RpReM+vbE0aZNIRI+b58u9XIiFT+s73mL1Vd23oFwszWmJ5Pz
         +hnK3LiNq1kDAMeSyzJxTvyATdktOn2uuz2lIno+E+IhfZcg6GKVbvOgix7jMl2KIjoh
         4c79pOH9vWGd0MkYNzPYp6+xJocmZi1J96hnjYg8HAQh2NQ0n/7MO4uoKP9DwpnEzkBD
         AqPcsmqEMB9tbKdcvreI9P5/O8I8aaVHRe0o4smS7N8afoE1MLYalSg12bQNTyWA7x3Z
         XTdw==
X-Gm-Message-State: AFq9FYKshSK4VlTB/QpXKxpZtiRYqw2rPz6b7j4mKUC27YymaR+HMmQo
	eu7PEHSMUBgl/i/KvkDxoRJUTEUf1HxPbnTs6PPiaovBbL7BUnQaOcIc5zl10/xHDB8WQirgGCl
	8zLerHTE=
X-Gm-Gg: AYBFou0IJ/UVAltScRd6WbLQ49EFRpPaAze4lMiUeP4eubzGJQ6StMMrqYFSu4vUk5d
	Fgljhe26RkrYBmKbSreAcGOlQoeSTkyJ46eDtJKGgbdZrQ0IelmRs/t8e7YNuOz6jWCQPduUp3n
	x1iRDYV+wHZ+sRTKwpUoGdLzB6iSSj4IF1hMx7gKRsHn7v2cO2KEfyf7k06ZSFcEc4J5Opq5eLS
	ShErcGkHmmVFFck9gtTQphURfopBvJoM/oDsj6/sKq3FX24W820311FkoAModELTwRFBmLnx0Ws
	BGmU9vAGI+q5JpM0hlcWBqJSlZ74fFnThHdRS+YWrR4k3VvluZPi/Yf3jf+1DlVJDodPr6S5BYr
	imS3ZL0vPJU8N6+NNSIW8Qi+C/VcAYEwwWrEVRtFgdc40H/F8/yUgQoYa1FzuzW5XKhaHTR2tU3
	/+FY+WrjCR4pR2WVoRha5Jub6shpB5tyqGraJ+RBnc6Xa3+oOgIl9UGuaMGPJIPdSoDJ6lylQJs
	QgvbBTtPRIss5RLDwCGLjdpVnwljWHRoYM6755C5H3SdbT1fCe0xDe+Euk5AWKu11WWmh0RNHiC
	hDLAmA==
X-Received: by 2002:a05:6000:4550:b0:48a:eec1:9ad0 with SMTP id ffacd0b85a97d-48c7188ac40mr378326f8f.9.1791301591911;
        Tue, 06 Oct 2026 08:46:31 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 11/19] opkg: update Upstream-Status for a merged patch
Date: Tue,  6 Oct 2026 17:45:57 +0200
Message-ID: <c022a512adebec2b62ed8834ca24c15a40120f25.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247301

From: Yoann Congal <yoann.congal@smile.fr>

The patch was merged in
https://git.yoctoproject.org/opkg/commit/?id=0682b36c898fb81a40a068481062512bcea9b66b

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c11fe991f05cd8cbb39e4c89e10e28e7a15a220c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...3-CMakeLists-take-the-default-architecture-from-the-ta.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch b/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
index ee7d35e34c4..5142fff7f42 100644
--- a/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
+++ b/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
@@ -14,7 +14,7 @@ cross build doesn't set it.
 
 Fixes Bugzilla: #15784
 
-Upstream-Status: Submitted [https://lists.yoctoproject.org/g/opkg/message/218]
+Upstream-Status: Backport [https://git.yoctoproject.org/opkg/commit/?id=0682b36c898fb81a40a068481062512bcea9b66b]
 
 Suggested-by: Alex Stewart <alex.stewart@emerson.com>
 Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>

