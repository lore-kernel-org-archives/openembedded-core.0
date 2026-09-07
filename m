Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E32C79FB6
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:05 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34933.1788788163484207661
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=H4QIQPvE;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so42257445e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788162; x=1789392962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SAskPluaM8odMofqN25Egv6+LhpJZ8/Ov4RxtL79v/o=;
        b=H4QIQPvE/0StUr/CQTrxpVTzofgvWRk/3F7Veg1VfCLAodcOjGkdBCh/f0O69zzHm2
         9kEuoocSOc3zm0qa/Lhb46koRcplir66esxSngU7qxWFKdBqfiut9vLQtuG+suX7bDdY
         pQT0+KfyRT+rRNDua20qZardYDPrt9TNT6P8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788162; x=1789392962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SAskPluaM8odMofqN25Egv6+LhpJZ8/Ov4RxtL79v/o=;
        b=bn9whNSuPk7lMd3akhNfYZEECaIko4Gw0yvuqIiqaFEXrERIhxGHwx3AuG7BXtsS63
         v3Gt0xfWrxz1euJg2v4FXjAPnDPiJkPAMgKNHZWl7rZQCqJhiBOzbtgw179VkvZDdNm9
         3puHT8OdDoL0d+QyYeHuTk05GxSxVK9Vd+1uugkv8TIRDZjPkz+seXw4Z1NZOF64PLM2
         qeGrJAQnqYbOxGz3EXxnkq4WEoqAygcBSKhWujNbcAMWjVxpedAe+VVe/9XyIO9g7Zmq
         zM7wPN5asLmzwWEKOVj+U/vXF/XL6Rj0HCZ/aeW2gar5yBMDYzKidqhpzxQXWpJm0RTY
         nFsw==
X-Gm-Message-State: AFuF++msvuK9Nj8yk7PuhrfW2lLlFXtoEBCAGaYLL1fXracCLexFVfvT
	tmdU3nWYiC9/qDcDsi9XlMgsxdF4QZFTLCE+r4DFjXDDnU5TCA5J5NUV5WuV+KOsnSR2rJXCf7+
	IS1rfd4k=
X-Gm-Gg: AYBFou2+nDxIVxLyVURF0bFX+OwMHoyQQA+bcqnr9LiEs7XPlP+LVDo+E4F8utOEqCu
	U+4cmJKz6VxBWkoYb3kD9kOqyBL54ENN0Zwk1wFbR4q5IEuMdAVhkbyucgV9l+qgFsLtUdj5YnC
	Rm4XQiIsAUDayz+6yxJKPH1Idf9SasG10iBk+E0i41fCQ6+cmR54CHSbcGM3v6bYV9qNswpF9/l
	YuInzXajBVl/jKTkI9ZSGvY1ZFjygZSE/UCAX4ipZhumuKrT2PrvwB4Ec3aTrpX/EfOrizFbBvZ
	wM+gL+td5ovHtN0YIw7K5ceBwkSKYrSSAiP0imKr+QZP4Rit+DGN1mh9K5OS2qMghb/nf7AwJ2H
	WPuVOLWN0aWv0AX5FdBcBXU4sVjWaaWrtFlsugylONsfMBCNTZPLJg/knHZu5TDFtmm9bNKq4Ng
	8x8RCJDf/KUUpl5rjEzYJtivuLWbiEKhhCCoFtPa8IclbyFJcboMvKQuj5kbiN67cd3RmAHofyu
	E0yz3q1quCbQ28lFRGZphGqRc7Rz7RM0b6cQqgK7xrpN3mjgzJjtHN+QmthJ8y8
X-Received: by 2002:a05:600c:19d1:b0:49c:fc6e:8cbb with SMTP id 5b1f17b1804b1-49cfc6e8e05mr232009335e9.31.1788788161695;
        Mon, 07 Sep 2026 06:36:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/35] python3-pycryptodome: fix CVE_PRODUCT
Date: Mon,  7 Sep 2026 15:35:16 +0200
Message-ID: <e33fa15f9e6c73de3d6ca11d0ebd98c600d24d2e.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245278

From: Tim Orling <tim.orling@konsulko.com>

With this change, 2 Patched CVEs are properly reported:
* CVE-2018-15560
* CVE-2023-52323

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8a88010edc6edbb168cbc31aa5df847a328661c)
The current pypi default "python:pycryptodome" is deprecated and does
not match current NVD configuration criteria. Use
"pycryptodome:pycryptodome", the active NVD dictionary CPE and
configuration identity for the packaged source, so two patched CVE
records are reported.

Note: The original commit targeted python3-pycryptodome_3.23.0.bb. This
is adjusted for Scarthgap, where the recipe version is 3.20.0.
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
index 6c93c205ac8..69bb6da44ef 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
@@ -3,3 +3,4 @@ inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "09609209ed7de61c2b560cc5c8c4fbf892f8b15b1faf7e4cbffac97db1fffda7"
 
+CVE_PRODUCT = "pycryptodome:pycryptodome"

