Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CB4CA5FFC
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:39 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48821.1791301590812622968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0oDSOwTl;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso552526f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301589; x=1791906389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NClo3ZxwUhRh72JWEe/3HSd4Nsp5zNodkUT05ok58Nc=;
        b=0oDSOwTlnedDj7if64znd140mGv/PeTQb5ROB4sRKmGXd19jjAR6cAf2qXKSGwTtSw
         OlMalQxXWEA/ZMAIzcIrC5m2ithYsHLv08UjLMHeriqu6F9t1ZlN6mMWHEEzJyzbDZbS
         Dn5VBAqnC26kBPbOXcyw3qwCN6vPCCUIYpd/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301589; x=1791906389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NClo3ZxwUhRh72JWEe/3HSd4Nsp5zNodkUT05ok58Nc=;
        b=ITRIYSP3fVeTBU6kH78B44xZ5dwd0g+JnqmiIumYcSR3ZvP/f5AAJIkbbj/EKu+a6V
         XHS6xHSJ23NnOqNE7iu6nn/GYfnlwWOVNlmxZoH8aYVEGDtaQxr0yx7H0JKt75QwU51z
         UoTB8Qz0BDqkIBIICXVu5eZg/SriYD0QVdaa7Ua6e1bUPx2RzBvuY9b99L00kPty34/j
         4+adnbqJ/B1FT1SOuPrw0eSdKM/Kc215INp5sK0Nnj/zUUoyxfO1FfdNBB3KxsjgWlZ2
         7FOy+ISyVGXdbQiNPu5hYNufTYz5/ZKgdJiuIboMVDuDgtfEFIO4cIgMDeAPgKezUCLl
         o9sg==
X-Gm-Message-State: AFq9FYKtgysuH2lLNyxYrnf/qTBo+LENqi0pZ5NLNpOdPJAVmy7IRdLn
	XcsUlompM3vhP8NRXFv2AiKKD2g2jOzcC5iSQ1TnvIlhB9EO0XMuclIN9QPZv+upGtdQhLOgrJ9
	oqaPQwbw=
X-Gm-Gg: AYBFou3MS+zG+4glqjcLngjy/57Q1wXsE8pagjpwgRFoA+NCMwfawgPMbZBhBBBFoLT
	ebhjSmzNILc6R7cu2tvI3JodOaaF0HTtWzUfMWZJe+I17Dx6lUll26IsuslIQ2veeuU07kuh0Df
	cMz5o0MPP34DZwpa2VZDRTK0DhNMS1jRqkFvCITzbMSVQGPP6P7FeHliDtNceg9GDU7Q6oFrA+c
	y5epGKOx5yTUUfB8lrcaZaGUyDAELuMCuop62hKkfyguNgUymfeYwluqMJgcVHl4ba25dPP6NZ7
	kQLjY5NXqwVaFbiRWI70z4Q15zaCdiY0ams9jOg6izu525r8dEgqVQeBt1TL+jGd1blqsl/SVfu
	/E5EtP2fMa2eaX85jUTvuwomEvaXEys0pDyZnPQ5HFIke0T0ZM4e4jz7LzjzOZzIUq860Y6pwHo
	1f0KW815nXDxseAKc5qg0RTwgiH7eisP/AbpuBp0P8RVI2fH1lrsBj5RyEpKuEEysszfEYNztOH
	Co0MTQj73lJOHBwkPYwOfAhjO+qJngAA0GX5U4yAPzLyyr1uqDKNAI0C/bMYbVigjqefNAxamW6
	QvLyTA==
X-Received: by 2002:a05:6000:384:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-48c6d1df8b8mr3290061f8f.50.1791301588918;
        Tue, 06 Oct 2026 08:46:28 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 07/19] libpcre2: upgrade 10.48 -> 10.49
Date: Tue,  6 Oct 2026 17:45:53 +0200
Message-ID: <b87070e1fd10efb8f12d724faebf391ba1fd5a35.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247296

From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Version 10.49 28-September-2026
-------------------------------

This is a security-only release, to address GHSA-r9hj-j2rw-4q3m.

Compared to 10.48, this release has only a minimal code change to prevent an
out-of-bounds write with arbitrary data. An attacker-controlled regex pattern
is required, and applications are only affected if using the
pcre2_jit_stack_create() and pcre2_jit_stack_assign() APIs to provide a growable
JIT stack, and then matching against a pattern with unusually high JIT stack
usage, such as a large number of capturing groups.

The implications of an out-of-bounds write could include arbitrary code
execution.

The issue is not a regression and affects releases 10.48 and earlier.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fd7f3e10c98a1dc75473efae8ab14ea5bcfb1819)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: See: https://github.com/PCRE2Project/pcre2/compare/pcre2-10.48...pcre2-10.49 ]
---
 .../libpcre/{libpcre2_10.48.bb => libpcre2_10.49.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.48.bb => libpcre2_10.49.bb} (96%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.48.bb b/meta/recipes-support/libpcre/libpcre2_10.49.bb
similarity index 96%
rename from meta/recipes-support/libpcre/libpcre2_10.48.bb
rename to meta/recipes-support/libpcre/libpcre2_10.49.bb
index 56791171c23..5fa7c3db3b4 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.48.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.49.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b5146491d12003f2c8ed"
+SRC_URI[sha256sum] = "53c156e1ba416a20da8e65395daa132da0d80e76910424caca3fcdae7831d384"
 
 CVE_PRODUCT = "pcre2"
 

