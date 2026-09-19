Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A065C982D7
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 19:39:20 +0000 (UTC)
Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18154.1789846754539710892
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 12:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=K93CXKh+;
 spf=pass (domain: konsulko.com, ip: 74.125.227.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so1824306a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 12:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789846754; x=1790451554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mFvAj5C9G+nwtHH7zmAV19b2t+8fF5u0s0ib74P95mc=;
        b=K93CXKh+qwcKfWpHJAhkhp1F91RVJ2hGA2hiDilidEeVI6ELcEC5YhZAvlld9EQDSm
         nqEfs42w+X4c+Kcl/3DTRIVfj1GbQFwoxOaYokZhBbI483pmbpuV8+zsBQd7mLXyFRnM
         mzV7O7jxi9OLFVExOv0HLYVsHfVrBBagorvwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789846754; x=1790451554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFvAj5C9G+nwtHH7zmAV19b2t+8fF5u0s0ib74P95mc=;
        b=i91a3652WWWfCi3nrPPYFNCgf8UpRKdiyA1AB7/G6/0tZx7hsDdIQsjRnhgvrxyM31
         dCva5Wc4T4nAgd27RjRsi3//H3rEiHw0YE40c7wySwyST/XO4R0jDE7NJd6bA10RVg7N
         vgSCkHGE3gvAMfizuNWPSG1ipLfyqCXkZjoh2W63d/epfyloL3KjnQIJOHnBiixmYd5R
         xaSxgCe/s+scgovHdwPuIcyf/VSltT/b1LhX0sLMjbrj6APdeCH4D1xxU79nG3HqFaEd
         0RQj/50mjushFQhAiCR3U2ILgI+p3LrQ/AX7GL+cgDWvqmpyqeAmNr84SZM/1ZU7lJQi
         705A==
X-Gm-Message-State: AFuF++nfGvpE0vVYxjrGHfjIqExLqla1nSX5qASeLgh7rs7LIbUH7Agx
	NhyQCHVuIQ1o/nTzjT3DcwTE9DPbJjvzYb1jonrmGDC0WsfhygVN7EPnDJNk9TYMLiNkmuOoyLl
	9xQoN
X-Gm-Gg: AYBFou0FUUDHe+QE9rPpfAAutqXbeg6CA7eoCfwzxwajDj4jihgTVPqeHiL7nROjszi
	XrY9gaVEZhJWjWUM4iuPgbKfchXLQVmm+m2yZl+rt4fXbGcfmGMldSGVR/ph6WGoxE70s4qB9Jk
	TMeUm4SQ/WqlagL4MSttSo3GeG+tcbTSb8PsesZWuY+mzmgRvbp96CtlSurBlxnr9hg0YP76G3f
	Lwv3ZJqg7TeXXsAOjF0Thw2REq1ic75bXW02CApBofKDYSA5PpQ54mFcFO0XnttiEMWEFPluDJv
	OWGNd5Gc4PnDf7yaiwOUepbE2REYU7hb10OQ41PJnRSZPMJW1LknhLLpEBJCzI+6LfiaPwRJ9GH
	cj3lth85OGvRW3odMhNGUmokXC3nd6UDTSX4kGaBJZaDMJUNC7Ua31H6f+3G0mnplITKwlx5mmq
	D4jI0teNXb9y3GD7mtv0BYIGUNNvLUNEcs9QLSZBL8mXRYoIJQzxCxDzvnm3eJItURpehqMvTHG
	3jtCPiQ0aoSu5bS
X-Received: by 2002:a17:90b:56c5:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39e549787b4mr12163473a91.0.1789846753828;
        Sat, 19 Sep 2026 12:39:13 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6254:c727:61b4:dbb5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm5843038a91.4.2026.09.19.12.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 12:39:13 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-pytz: upgrade 2026.3 -> 2026.3.post1
Date: Sat, 19 Sep 2026 12:38:20 -0700
Message-ID: <20260919193819.1161800-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 19:39:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246245

From: Tim Orling <tim.orling@konsulko.com>

For full comparison of changes, see:
https://github.com/stub42/pytz/compare/release_2026.3...release_2026.3.post1

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---

All ptests pass for core-image-ptest-python3-pytz on qemux86-64

Testsuite summary
TOTAL: 234
PASS: 234
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 1
END: /usr/lib/python3-pytz/ptest

 .../{python3-pytz_2026.3.bb => python3-pytz_2026.3.post1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2026.3.bb => python3-pytz_2026.3.post1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2026.3.bb b/meta/recipes-devtools/python/python3-pytz_2026.3.post1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pytz_2026.3.bb
rename to meta/recipes-devtools/python/python3-pytz_2026.3.post1.bb
index 11d5c22c07..72a74db357 100644
--- a/meta/recipes-devtools/python/python3-pytz_2026.3.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2026.3.post1.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "3a30feb7a1a04cf0fa0be1624415930843b02f012eb800380f36f906a723e4ae"
+SRC_URI[sha256sum] = "2211d3fcf9a797d3405cac96ac7f61d80e6a644f72a3309607282fe8a2010c5d"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \
-- 
2.47.3


