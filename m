Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F4EC79F9E
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:23 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2585.1788641120755201210
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1yHUtZXy;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so16520055e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641119; x=1789245919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k2/svhinbBKAnJ/CikKl+Yz3TriGeCDvZpHs3CAyBGA=;
        b=1yHUtZXygCZGoRN7OzOGIlMDc+1mpxyalA9SPc2Dlc9tmoDiebG2GxPxq8XNcoIyXx
         X0i1OM9pkM/ecaS60FBPp9qddvSaLMBylfUnXv1SWxcKPrtgeblqEn/K7TZCI1vTIt1+
         sOQlE9/6v6R9KNkswwFwnZHAfxtyUjxepsUUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641119; x=1789245919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k2/svhinbBKAnJ/CikKl+Yz3TriGeCDvZpHs3CAyBGA=;
        b=ey3sj6ocndkQLzIaGCXx1jTbiRQ6SeZB9eMuHDtExqGHnrTIl9v63n+Lyjq3C5HVDO
         eyfvF6sMLm9BXvGhoFP5Lm8bALMNux6lkOlzcuBVNrgnUO11EyaWt9CafvdcicDV6ghe
         bInkCIJ+EpDNpm1JUyDz5qMJzoV5X9pL9AwS3VaJdfzP4zPzxVhs3aN4rsRvBkQTbwUK
         4sIavrHUy2qlNVqw0vUUm4PVI0+l/Z4B71PIs5Hxa9ds7kf940R/VmWYNcwNUy14yTYx
         BlrUB3XVnZ/J41+7BI3npgNVJV5h1p4O6wXBX+EfOOxSjl950sFPhT9eDJJZUBr0sd3M
         wCQQ==
X-Gm-Message-State: AFuF++lOd6DRfWELD7iWdYYp07+RDPeLYjnBJqdlTuhXvd+eULI7mXCg
	KVAQGa9I7tFDyYl7sgfl0ryXtuIFY9MPILDEnmigPr0Ss4rT0gLQ8H+h/3twxjcggPsuCzTSs2j
	qY5LhL/Y=
X-Gm-Gg: AYBFou2sgx54oyLdaoUnQn6ra0EDTXcZ5vzPljo08x1q8lMyv2YV8Ae2GpCSwFZDnk/
	OekilLEaLm3P31MhJYBREaL0SXtP8O9Y4U1yU1TtJA3zHpLxWJH1RSIjCJfebcwFRv46WxjeALm
	D67iVX1N1E/eFEL0emP+NQEVntI97QzCYkz1ZarxIPvyxwccTSWYvQbajzXsl9mT6aGmjJ6aIWp
	LiFhTnPafqT8unWfnMIu+3hfi5XsrbsnlNfnDnJXFH98CH9mSJah601Mhbal9g62qAiz/nzLKEr
	UQtEUVk1ud+vogVTM0YVtQY2rW1OD57g2R8i4auDfU+onxQ3aAorxzKYecG2MXhw9UhRsKoTZcX
	vG56GbXD+F7SjUMx+JwLSGvBF62hB5KmQHXEx91PWyehpAsVBQetqNoXGzRfffReZo1ESr5RnsI
	ap2VwAH8U/gvYU/crPXIr16G4L2N6LXUaaQRWvqJJgOWQMAjhqdPiGM7wA9oqrJgaV5kbtMMvvF
	nWlDSLy2Ef1ttnI+WyIYWzqSX8BEWnRDrFNU0phx2SYjAz9JK1Ni2lu5arKWQGGJ+bwQIbLoR8K
X-Received: by 2002:a05:600c:3ba5:b0:49c:dada:f581 with SMTP id 5b1f17b1804b1-49cf7f39c8bmr169968845e9.0.1788641118984;
        Sat, 05 Sep 2026 13:45:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/40] python3-mako: upgrade 1.3.10 -> 1.3.12
Date: Sat,  5 Sep 2026 22:44:16 +0200
Message-ID: <b57b8f3d4c1d83aee26c8a42e2eac5508439b0d3.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245167

From: Richard Purdie <richard.purdie@linuxfoundation.org>

ChangeLog:https://docs.makotemplates.org/en/latest/changelog.html#change-1.3.12

(cherry picked from commit 439b05aa55a7d4d71b81ca93025de1b28d79b311)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/{python3-mako_1.3.10.bb => python3-mako_1.3.12.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.10.bb => python3-mako_1.3.12.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.10.bb b/meta/recipes-devtools/python/python3-mako_1.3.12.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-mako_1.3.10.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.12.bb
index 2d937dc184e..b2c1a8dad8d 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.10.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.12.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "mako"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "99579a6f39583fa7e5630a28c3c1f440e4e97a414b80372649c0ce338da2ea28"
+SRC_URI[sha256sum] = "9f778e93289bd410bb35daadeb4fc66d95a746f0b75777b942088b7fd7af550a"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \

