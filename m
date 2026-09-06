Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00ACC79F99
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 08:06:11 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9864.1788681965736781617
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 01:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OoY5K11W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso31115115e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 01:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788681964; x=1789286764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dG3n7Q7ycWwS9oBampmN8wKU4W61djxWNm5W2vjNFHE=;
        b=OoY5K11WmEdMgd9XQNG2sUFMSgye2lYfOOXQDqrLrvVJZQJds0DjIEq4IWl1wL3YlH
         qrGjDGvFwxOOLGjYJ69F5aZiLQnGxhCgoBVnZIBCbDrh6iQig9sjOIKbB3IDu8ejhIPi
         RLncCWPPvfaAHoPtlDhjGZvH70bKME/f+rWTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788681964; x=1789286764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dG3n7Q7ycWwS9oBampmN8wKU4W61djxWNm5W2vjNFHE=;
        b=D4FtwjMtfpTa72XAr6fxgAXl7Qr1rF0LVErF/g0HQFz/ZWKlirgNZBwKjNwiVUnE3B
         2QSax+z8BZJXdSANNimBA5JBeBVqXlM3o8/RR2AinfCHSk2PE7YY6EAOA6b/8T2Uivsk
         /ikW31Ayi6fY+5c0IgDPOICJdA+sEeFiEe1krTvH+pEYo0YrAV57sFObGGYV9HKbHhjz
         Y1SYP7v5GlEp+GAq3J2/QcKNRZo/hke6ktQkcDMfM50oOfpxpY3SRErQM6W56PWbi69u
         7OoqinpWE8cH7dUua2n3VJ85GvHDynbTvWI8YYb7df7YZvsNw92HWqn5PN7DvfbThF02
         2apw==
X-Gm-Message-State: AFuF++nwMKPVdxKjaiP8h0mCH4O/TZ/NJ8PqxR62TbDocRrBuCxetJLg
	0U53Es3hmW74toB9Zvn92m6uYFTYDhMAeJtGK5tqZnDCs4UM4ROrHD+6cN/E1KlTYzMEeZ5uTFZ
	NeYryyt8=
X-Gm-Gg: AYBFou1V8AbS5nGQwjhMpa1DOWJH/eJKzvJmV1DkvOQ1BAblso+RnwzQZjchXuxOQ5n
	eLJHu7EtyzIqcr+0iqw2ZiSo56TDoN/osjDeX/tXuABQX9DXW+PSV6ySgLHKHJYK2UUijbsWzQP
	c89xn9TSsgR77LM2J6EET/m4tvizXI3zpII1qJUzLkbBFwJTR3IHt0x41+hiQi4jO8c1kGkELXH
	qyFHJHX85OGuZpGXFP5lEpFhefV0+gxVLR3n9PJCfAqNZ6BXiDf/c9SIstMUOgGOsIl5Bw4ql9S
	4cVssb/w0zNTqPMZoI2qisIw8/IKkVVtpR06y454GfNxbRzPRe/3ASZtOazoQuaUtC36+gZNc+a
	5gdhZb7SgsDlJ/PHEQNF2uGtRBymjRbmdlhqum2j8E4XPwxIk71f/XXx3gBpfw0RN3bOasJUjfJ
	u6k3yNVGGygTQO4+QzsgiONvGNjLEi/c9rdPGh6erUsCJ17pUftTmwrfRUfaEQtSbfZepxga5wf
	eVyw62Vw+VdCJ62Qg==
X-Received: by 2002:a05:600c:1914:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-49cf8269fdfmr157068515e9.13.1788681963049;
        Sun, 06 Sep 2026 01:06:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a7e4:ecad:c000:9c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm183691545e9.11.2026.09.06.01.06.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 01:06:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] python3-uv-build: upgrade 0.12.9 -> 0.12.10
Date: Sun,  6 Sep 2026 09:05:51 +0100
Message-ID: <20260906080553.3151802-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906080553.3151802-1-richard.purdie@linuxfoundation.org>
References: <20260906080553.3151802-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 08:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245205

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-uv-build_0.12.9.bb => python3-uv-build_0.12.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.9.bb => python3-uv-build_0.12.10.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.9.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.10.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.9.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.10.bb
index db313f57578..12cf5c7cc33 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.9.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.10.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "5811820c072a3f7489133594028f451eea7d65ad94e97f58bff70da1b1a5970d"
+SRC_URI[sha256sum] = "c83c0f1dd2c921091d1974f56d64221c010e173d9e6d52ec2a2582650c2d5197"
 
 require ${BPN}-crates.inc
 

