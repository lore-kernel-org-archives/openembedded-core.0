Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCD8F30927
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 09:31:52 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40354.1772703102829940219
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 01:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xWZaH2JD;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b2965d4bso3996286f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 01:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772703101; x=1773307901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8cfpthLN8AQY44FQeBuIn2WkgUMMAcjdjGIj7F2MAM=;
        b=xWZaH2JDKm+PjHq8evgvQVamt0qteDImV6IKj/iw+DIvlZ8FwHS512FtG+ulrwdISl
         yAObYBKzW+joY/CiyEJetpbNdq6PhzkptZwmDVjbQ1F+UexkZ+n6u7XeOJU8iCEa/u2f
         UsANbRuiR5xNO1Q6gb8hj+xs8qmS1rgA49YYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772703101; x=1773307901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V8cfpthLN8AQY44FQeBuIn2WkgUMMAcjdjGIj7F2MAM=;
        b=KYIGlNDt1nXC6/O0PPzB0nbrj6gI2W01zIBRIU0k2PxRku+yiUfFg5VhM2pl9LFUmC
         PaPs+u27ccSywJfW4BgvEVn90X14GTp9bcMgIO9bR9Pp7VlreYPiG6OIb4euAAwNAMtZ
         hNK59rIy7JxXYNdyafKHdU7gWwX+/yTWOWGNT8nTpORHQ4Al8xBo71a2aThQ447hNfpq
         mzGZn9yw8tHXdtDMCjEcpVQK+ppCqn9x+2wAED5P7QzElD0GcmeDQfvlK6Hs+tBDypD9
         ByK5if1Ap6rdfpc0ayzaSss2fqg/yKOYy6l9pp0wjZSRAStSYa7slZkPHS3oDcdmGkrL
         575w==
X-Gm-Message-State: AOJu0YzcmejDa+hqfKgsjP83WdJ5wBHws/YGQhjBW5o9Hxh2N0SBOWts
	Zl8Ywp+/gV32lAIfSnlBXFgagPXsaMl67Xc9J+cxH+T99STtKWb+hPhbV7dyYXmdAIfZ2Fs6lKK
	9ofMZ
X-Gm-Gg: ATEYQzwnMYiyWIhFqqqylD76ZXo3Ej1T3XqXr6WBEwA6Z4oTGxBVyZBacpQC71+d+im
	bJ+6OkfTdP07PcRAGXfditDm0y6+VLvejpr13tbCa8Y4QPjcPoDxho3beJJ21saVGh/s0fSQSKj
	TugTmsXgzKiDOTNoeSGxNF7HtFv3/VV35558XziElicVBcgmphLPhf5MuExjiNe3xCBWYcuJ/mX
	Ustc2XS8BEHUWg60Fst0CILFIB6+71WViDYWIwR/TWB0yd2i9Bb5rG1nHbigA6G4hBoIMyozyju
	CLA9vYlPeYQBOgfP8dYAxgi6M30vD/W4FfEqEZn8lcmWFi1Kq+4JDTxzd45ZWqV27dKrJnLYY/1
	/7JJkhFB2/b4GELs2s9pZYjZXjnZI5IbDsw8VQ+TBnp451gcVWWgl4Gyi/zaQK4F4jtEQgyBEyX
	MNasWjJQk0owyqnB0o4d4HOen+Ya4Kh8jsYKpK7epEpzWI3IJVvbMt2lbjGrHgSuOQ6inRNB9IZ
	rn1+0IltG+f4VyZp+/cGYOpVSgX
X-Received: by 2002:a05:600c:a15:b0:47e:e779:36d with SMTP id 5b1f17b1804b1-48519881d19mr92410525e9.23.1772703100712;
        Thu, 05 Mar 2026 01:31:40 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fae473bsm25102635e9.7.2026.03.05.01.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:31:40 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [whinlatter][PATCH 2/2] lz4: Remove a reference to the rejected CVE-2025-62813
Date: Thu,  5 Mar 2026 10:31:27 +0100
Message-ID: <20260305093127.1179651-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305093127.1179651-1-yoann.congal@smile.fr>
References: <20260305093127.1179651-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 09:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232472

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

The CVE-2025-62813 is rejected so do not reference it anymore.
So keep the patch but without referencing the CVE identifier.

The CVE database indicates the following reason:
  This candidate was withdrawn by its CNA. Further investigation
  showed that it was not a security issue.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9c840a69b62a5fdffb3679a44d68dd5630b2916c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../lz4/{CVE-2025-62813.patch => fix-null-error-handling.patch} | 1 -
 meta/recipes-support/lz4/lz4_1.10.0.bb                          | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/lz4/lz4/{CVE-2025-62813.patch => fix-null-error-handling.patch} (99%)

diff --git a/meta/recipes-support/lz4/lz4/CVE-2025-62813.patch b/meta/recipes-support/lz4/lz4/fix-null-error-handling.patch
similarity index 99%
rename from meta/recipes-support/lz4/lz4/CVE-2025-62813.patch
rename to meta/recipes-support/lz4/lz4/fix-null-error-handling.patch
index 4fa0373ff7..1527cc7591 100644
--- a/meta/recipes-support/lz4/lz4/CVE-2025-62813.patch
+++ b/meta/recipes-support/lz4/lz4/fix-null-error-handling.patch
@@ -4,7 +4,6 @@ Date: Mon, 31 Mar 2025 20:48:52 +0200
 Subject: [PATCH] fix(null) : improve error handlings when passing a null
  pointer to some functions from lz4frame
 
-CVE: CVE-2025-62813
 Upstream-Status: Backport [https://github.com/lz4/lz4/commit/f64efec011c058bd70348576438abac222fe6c82]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
diff --git a/meta/recipes-support/lz4/lz4_1.10.0.bb b/meta/recipes-support/lz4/lz4_1.10.0.bb
index f2a86036b5..fae5796c2b 100644
--- a/meta/recipes-support/lz4/lz4_1.10.0.bb
+++ b/meta/recipes-support/lz4/lz4_1.10.0.bb
@@ -15,7 +15,7 @@ SRCREV = "ebb370ca83af193212df4dcbadcc5d87bc0de2f0"
 SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
            file://reproducibility.patch \
            file://run-ptest \
-           file://CVE-2025-62813.patch \
+           file://fix-null-error-handling.patch \
 "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 

