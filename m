Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE69CF8DFD4
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:04 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28248.1776378780198097863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1nN2TRgL;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-483487335c2so381595e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378778; x=1776983578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRCl0tVwqYErBK7HJ84GPbGXwrPXvclOxp+FY6afpe0=;
        b=1nN2TRgLRQQVipJodHt1schsF7hp11JE4rMX0REpB99XQvFj6uiJ5doyxDRiKNnlvB
         61CFJ8zfLG0Ws+WoIPmVDCY1/5zoIQL+iBevo2uze6H5Lb5Uc3Nmgoyap9zIwUHgDzii
         JmmZysLuEVkBHZK3d1eGq33MjbUM13fulIXjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378778; x=1776983578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jRCl0tVwqYErBK7HJ84GPbGXwrPXvclOxp+FY6afpe0=;
        b=TcRRZMTGO3k4/KyFyfT6zTBQQ42ROXyKLTuhfKAwdH2pZnZA+R2WjWyZQfBCoRZz7Y
         caZJ+JcGAqrP04hmG9CRBKVf/Mv3InFw6B85oMl7/uVpNsZuWLktF2MZkvUkgDISy6vW
         0/pwp9kPCHg7WHAPJG39XRdKvJv+ROx6dJT1uZJuRNqzuNHIiZUQivXbTeEqSz7ingKK
         /F1b1OXCQKemIzI/q2eGiBn7n2hJCNxujI7gpNj3CUtmwfu8MpLq0EdnobM6UfD1tUP8
         xMGH5z+9a5osI+PFguiLtlObTchkE8cExsKDJNyNRbf0MtV4utXfvJbHaktLkDp//pj/
         HtLg==
X-Gm-Message-State: AOJu0YyfI4tizXgGKJBxh8w9yyOQIfEgvgrRtQU7uahFNLUGlFRp4GvS
	Xs0WiKUUJajBz08HXeHQwGAlYsKF959qyHU+L05iEl7jkO7+GKhhe18AiJ5Fbw3U3CvFcVTyKBz
	FMgiKIbtRg2Eu
X-Gm-Gg: AeBDiet4Za866NRq0tn7rzjT2XLnv2a6Iza60mTQQRS5GYnyYcwpQ/0vQsdUKeEHeYq
	gV2y9W3+KGbfjjavj0xE9QnWAbZQ51k+VZlRM8fGUrpD1ozSyPFrkKaH0lbvxCwVuZFOIH7VMyO
	J7ll3TE/359rk6bhsbmQPNDX/R62wePFvV944mga0B+ZlGztXpWoW7/HoFgtS+O+SQwWbAjqk+V
	6enuNm1036izuR7CoyjlOloYBOA7YoEOLXa3d+dQKu3rHem9hnx0uqUrLUb1gAAGMI7e07LkidL
	OsDTM20x1Ma6pr4mt1gJ106jAAys+IKiyzmeaasQehHyEGbRvPm9EAl71daSgddnZ80m9LztG8O
	02I/brgP/FoB2L5XMBWHZq7KulkhEormO/F67NHvTPwEJtmLmvXASF+4JJsZ7p5PJs+s4+YGbHD
	B+JrcPm10FQpw7FySovVGwETpNGTzJuRFeT2r6CXkBnM+6lj3uTN782urJ1Li8yhSFUo7YxoQ/n
	gtqq/QBWjTVraOkWH8KkKl1l0sToJpyRJNu2Q==
X-Received: by 2002:a05:600c:8b38:b0:485:39b2:a47c with SMTP id 5b1f17b1804b1-488fb796fa0mr4702695e9.25.1776378778202;
        Thu, 16 Apr 2026 15:32:58 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.32.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:32:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 01/51] binutils: mark CVE-2025-69650 and CVE-2025-69651 as disputed
Date: Fri, 17 Apr 2026 00:29:44 +0200
Message-ID: <8c5819cb2464d5dcc5c0812ae1d8c2f1e0db6866.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235430

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Both CVEs are disputed by third parties. The observed behavior
(double free / invalid pointer free in readelf) only occurred in
pre-release code and did not affect any tagged version [1][2].

CVE_STATUS[CVE-2025-69650] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
CVE_STATUS[CVE-2025-69651] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"

[1] https://www.cve.org/CVERecord?id=CVE-2025-69650
[2] https://www.cve.org/CVERecord?id=CVE-2025-69651

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
(cherry picked from commit 9c6df56fe18237880c391798c2083dca595566f4)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/binutils/binutils-2.45.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 16a63cabc5b..5cd4d185ac1 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -20,6 +20,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2025-7545] = "cpe-stable-backport: fix available in used git hash"
 CVE_STATUS[CVE-2025-7546] = "cpe-stable-backport: fix available in used git hash"
+CVE_STATUS[CVE-2025-69650] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
+CVE_STATUS[CVE-2025-69651] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
 
 SRCREV ?= "2f028c6bb163a045db95439fb92e1dcbc919413c"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"

