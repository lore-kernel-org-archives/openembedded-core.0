Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B17DCD37B2
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:18 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8219.1778224329793766196
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JSx4brMH;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891b0786beso11458665e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224328; x=1778829128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPXUjhs4tYiRyraGmKPgkF0ZgqlbmkoObJrlURW1bGc=;
        b=JSx4brMHzhTLKeQJ72OA/97VhR8Qa6TsSsW196XhnFzrpjEqHRnfQKaSAGXvFFkQVM
         L/rOS+Fs9Kj0Y0HHY/Jm0s+c8YQ566Wm/T8bkvzWC3b/2jR3RbQD7G7xR3kvyg5O494h
         GQoYWsEiujILOeNfiAboEzaZq3JxwZbJ8seXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224328; x=1778829128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BPXUjhs4tYiRyraGmKPgkF0ZgqlbmkoObJrlURW1bGc=;
        b=pzj8rZIP8vGEgS+mKS5QPKDpXEa7ReD5idpMPgiO+7Bdy7b/KNy56tmxFvsrSKzw3J
         zhgM2twINhVPa2Pfpyojohk5o5x6EAnRtawgspvo/B8vDPu1+g1JL/iNekj4ABfI3kIp
         ltiHyVPDokafg7nzCS4zAUxpznMoRkmZTmh9v2fjZXp7uVOdSEwYzbsxdNHTrR1GvdFL
         kkpdzevBQH0wpd+nnCYP55C8v0yCCIx96RfMDHT1N8LIraDHJAsj/ruLb7s9PlxeSav+
         Igpaw1mlWovoW9eQysENf2D5cbV59cO3Bgcr4ipu06Jt9t1kf7j7grkaNoF4a/cWrErO
         FvfQ==
X-Gm-Message-State: AOJu0Yw8OElb3xJXZLTlbucvtIBEo0w3Fn0cWUAjzGhlfaAP4GrSo4T9
	uu4e+cs+NfZTNkM9/5oAUHplSuVut5vxzuXQMylm3JQy1lCMAmE4sC27p3GKco610raSdQd3eI8
	mXCDTL9g=
X-Gm-Gg: AeBDievT40Tf2DxwPaivq6ulC51rkbfhHNBOEYBIHgiQZ+fPOokcauLoCKk/cOOy+Xs
	HYAGjoJDEGYPanDeWPOxppaSaMBW0at4hSGlAJX6KOHYLgg8hqpPaZ/ZP5H64pSr/hTlPkBZ3rg
	NgqExaKOEAwtFpnkMrH7bJcQ/LN7dsodTVsRiyImL/NbaBNhEWy9nSpFV548NACqy6T47Dm8F48
	I+LOYAQDZKipnrenzEwNhg98QAzAHfqSOwcas7jHIOCNrGE/lgc4C+UIstHInmsVw5zBVMDGYiM
	/SXCpDuaa72pFgOr4QHbDakHSLzMvCwPB+tP8SYAITf8P9v5NN0DM8Fk+zwGXsWsKJy5gY8dHYp
	HzOGonSrgDAeXv44xplsLcijyq9DPQaKQy8kesrXFZ8hLY5+MEshpEh7qPo2hclgmepvG+4XlqQ
	LIpoCLRhDdvQD3tFpAYFLIy7S851rFuVs46LyyfmqSV/uQKRu92ZQmhTFDkehY+SIv8BxVmG5PH
	EVAGhIpxSAbaAXJyXDPtQlTH+A=
X-Received: by 2002:a05:600c:4e0c:b0:48d:46a:6e5b with SMTP id 5b1f17b1804b1-48e51e19110mr192315015e9.7.1778224327781;
        Fri, 08 May 2026 00:12:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/52] shadow: set CVE_PRODUCT
Date: Fri,  8 May 2026 09:10:54 +0200
Message-ID: <402718fdfb77d4ce0e1eb018ce17cfa162599645.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236643

From: Peter Marko <peter.marko@siemens.com>

This will remove CVE-2016-15024 from open cve reports.
This CVE for is for "doomsider:shadow" [1].

It will also remove
* CVE-2018-16588 (suse:shadow, [2])
* CVE-2019-16110 (blade-group:shadow [3])
which can be verified that they don't affect Yocto shadow.

[1] https://security-tracker.debian.org/tracker/CVE-2016-15024
[2] https://security-tracker.debian.org/tracker/CVE-2018-16588
[3] https://security-tracker.debian.org/tracker/CVE-2019-16110

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2946e238d2a3947c1a51c4ac1c86c8284f68e4cf)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/shadow/shadow_4.19.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow_4.19.4.bb b/meta/recipes-extended/shadow/shadow_4.19.4.bb
index 94f155641cc..f70d1ca5f38 100644
--- a/meta/recipes-extended/shadow/shadow_4.19.4.bb
+++ b/meta/recipes-extended/shadow/shadow_4.19.4.bb
@@ -38,6 +38,8 @@ PAM_SRC_URI = "file://pam.d/chfn \
                file://pam.d/passwd \
                file://pam.d/su"
 
+CVE_PRODUCT = "debian:shadow shadow_project:shadow"
+
 inherit autotools gettext github-releases pkgconfig
 
 export CONFIG_SHELL = "/bin/sh"

