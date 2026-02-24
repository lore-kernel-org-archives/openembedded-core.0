Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67817F357D1
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:12 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21684.1771943590901108702
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nBbEgKd7;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-483770e0b25so50472275e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943589; x=1772548389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObfVx3yNX68SgTyXkEUqKEGGNcxres/i24gdjqf7bNg=;
        b=nBbEgKd7vE6jlq3pmYTohgzvui1/dREqnu2oUryMJm7PjTIfrgw9mYOa8yNjkHtf4W
         Qf82bIQzZKQpEPhUaBmvzOJFxw529bbovh0ixTrvLVFpE3/TN2Ra91lVgcBeb3pZ2I+Y
         Rp48FlTW7qwNWMG1atEQiFKmFT9nHRJs+x3Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943589; x=1772548389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ObfVx3yNX68SgTyXkEUqKEGGNcxres/i24gdjqf7bNg=;
        b=X+fe5seIBx0XMzDJSj/zq/iBwQ6zXGHZ5bilJBO1IJpCPAY8kdQ2xA58V/zJ5UpjVk
         fziK7CtwPhVzq++eOMrzMv2yXvTMU8DZszC5xT5mkFq8cqxOVcafO8Wt6UFMSJtxW7ym
         CoTAu3I5MFK7GPLBxg/aRSF2FDmsJuPogbnLgAbegA5G9dYBWKFj0JxhobFqz85ibf3f
         NRrdye8aCxsCN70wgaBJUqA7/q10g13WD1J9unPy2XQXNNBl2Qq6omdBBOkDrtdG6WCA
         jSxKaXbMXt3ECaochY94OdNYXMxRAd2e5IKFcVbgQ359cuMClUO/S7ddHpxyFkNXPyb1
         d1PQ==
X-Gm-Message-State: AOJu0Yx9R0bfC4AAJiKm33fpvmgTfPVDZbXkVEQttMvKN45GvquG90Lq
	qtvVuF9LHZa27inKtl9JES1r1TJ6tCbuN/Af/bnewD4qEIcpmc+HAeV2hIcWtbsl0CwG4xx/a/J
	ZcwvfT3U=
X-Gm-Gg: AZuq6aImPB5NYdM4aj03O7FSQYNvHzBELj/PKJ8GGrE6fjE9XboOgRye/5aCjjpRzsW
	Gxz6FTH3x2mUusk/471HdIGPH9nKF0jK1oGO+YXFDgV1aZ1VdoMnqEgX1Pd0FROeVqe64h3xex4
	9AKC4tlx4HiXm437dFYmykaVhCTHp0mCumaqTLnS8jjwo+meRvGM1HG1UFwKu0UYhB1GFua7Tf0
	dJnah80jgHY9ebSPG22bvIC0QEI4wcJzsL5AEemrW3fxV+7Qx3cAGMUontFoFatYb462dNbDv/0
	dsag34dSbiikQbncXCHLFhMQBvZwxlK+4Y5wSEfj1BH2cqxy2+f/1HX5MjGYTzWDwFQIHFbLGUu
	lgIpTDZFkitFFMJ6HPbChzlFCh1UH9eOZUW/1aTxeTbxVKQCCJspT6sxXS7KKEUShV08S9MoaIL
	S9g9CpsNWoHnTcIYtppyW8BfuDtY95EacBnWzV94AnAd+T2bVdYwZkMMFfUeuCacuIdm9IIitNR
	Jdts2WcDB8R//COVLtyubQmL8Rw6NNSDg==
X-Received: by 2002:a05:600c:3148:b0:483:456a:5146 with SMTP id 5b1f17b1804b1-483a96379e7mr205774325e9.25.1771943588974;
        Tue, 24 Feb 2026 06:33:08 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:08 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 28/44] spdx30_tasks: Exclude 'doc' when exporting PACKAGECONFIG to SPDX
Date: Tue, 24 Feb 2026 15:31:56 +0100
Message-ID: <4be220ef9af2a533d1b7ecebd63c8b1922ea5188.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231835

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

Currently when generating an SBOM, all packages have the 'doc' feature
indicated as disabled. This is in fact *not* a feature that was
declared in the recipe, but instead the documentation of the
PACKAGECONFIG variable.

But to be safe, if somehow a feature is named 'doc' and enabled, do
not exclude it when exporting PACKAGECONFIG features to SPDX.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 933394adcb0d2db66ef7e0656a464241e58ec2e7)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/spdx30_tasks.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index a3d848ceb1f..a8970dcca0f 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -811,12 +811,14 @@ def create_spdx(d):
 
     if d.getVar("SPDX_INCLUDE_PACKAGECONFIG", True) != "0":
         packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
-        all_features = (d.getVarFlags("PACKAGECONFIG") or {}).keys()
+        all_features = set((d.getVarFlags("PACKAGECONFIG") or {}).keys())
+        blacklisted_features = {"doc"}
 
         if all_features:
             enabled = set(packageconfig)
-            all_features_set = set(all_features)
-            disabled = all_features_set - enabled
+            disabled = all_features - enabled
+            all_features -= disabled & blacklisted_features
+            disabled -= blacklisted_features
 
             for feature in sorted(all_features):
                 status = "enabled" if feature in enabled else "disabled"

