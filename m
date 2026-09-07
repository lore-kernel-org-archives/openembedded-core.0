Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E461C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:16 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34946.1788788171072130481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QsPYcqzZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482dbe4d247so2024684f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788169; x=1789392969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LIwIqKdBsZiPxSu/Vjl8VWgjBW58eSHx7XZb+ki9teU=;
        b=QsPYcqzZ58dLM6tHTIVeqSEbD9SfJg2igRTQgj0ND7YcgtFxlhQU3xAQa4CI23Mb0T
         IshihYgUAr4/xudFPMoZr++yAgQ79omPvpeTkUOou077CUS1R8vLaNHb1naFZpQG2PkY
         31KDM9+CkoTyWiZ0DtGDYRIHR+gv4uq0wK4Uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788169; x=1789392969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LIwIqKdBsZiPxSu/Vjl8VWgjBW58eSHx7XZb+ki9teU=;
        b=B5XlQiKumomD/ewTBhpXSwKGvtyDUASBoCV24RRbQf7JHazz9UnykQGCXpRzQGRZtI
         gHHryMKcGr+lJICeY6lqKzaU+6CrZk7Xz5ldaRfAUsiX6kyz8YTO8tL/GnLGRQGr6OIC
         lurKZMu+JdZGQGWnsY8fQK6C+7KZvMOPjSKxxribNfvpvJ0QrX9Qvs+g07mhpJjNuErH
         m7epWxQLdWeBDDL1XG6Wyxr2ZufVriXJAFz2zItS55tnUdUHXil0AE5Pa5DOpAvcCAmF
         cb9tfU7Y9/cRSOuvf+7tNvi0ca2piescPB21Nfund/e2YfDuV1S6uppzLT19M3lZKKod
         iIEw==
X-Gm-Message-State: AFuF++lPfOL6gBI8ZNU7CjisJfHk9NswzxkSBzaVi5tYhiMs8bMCBoD4
	i4EoK+rv2qDjyRWgIOV9W1cSSFn0L+R+E0hBvllohEy6tz4qySKnGkvq/6TZOGxcGPiYq2ETsq3
	PK5iVTTE=
X-Gm-Gg: AYBFou0CJlal6pD6Tu4jzkO7akGJGH3uldaaEyu/2ayeGQLHSd5R33Nq0WwGS9f/lg4
	AceY5sELvkeQrsMZ9aaRuesXOgugoLjE7iGSiDzf0Sl9dRcjItvvws2yhKhru2eCVogcyqzSdpt
	xgybWRcF5S+SJP4KtOYkr/nmpgYvzqgPZWynWg3GHMt4ibUrmMzZpcYgiNOMewT5+WzJPvKnVuU
	7u5SMyJ4Dbp3Msy9pduUBO3X38UK1appkanwAjkgK0i/UTCQEirhn08CzAM6HmEgJwGBrne0fGg
	qn4ZnRoBKEFagrHl/G071Hzn4OY0JZXzIprRo5eDlJDoNNMoPmZOzT06wXWSFNL5bw01m2KeDyY
	A+fgdU+8SfViBKcvMLnOMBoGuqGry2ZvFAGYyhUkURT8Ps3rPpQEP3YTpxnpDw3QkWKV13gXvfT
	ekaw6f6oAWBxUM2cJkb87InTfr5+WbY8c8Ce06l12olGPvcGoIDpPiYPGhLLvdaOGhggr06ywaU
	qqbSJEYjwBSCR4QAh22ml2rY0jHJK2WACfAOBI7R7obLeX9LFOXNXUbBNff+NCR
X-Received: by 2002:a05:6000:491a:b0:47f:9254:d453 with SMTP id ffacd0b85a97d-4858704a9d7mr47051700f8f.8.1788788169386;
        Mon, 07 Sep 2026 06:36:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 33/35] python3-git: fix CVE_PRODUCT
Date: Mon,  7 Sep 2026 15:35:29 +0200
Message-ID: <0c9e81e2b248c15054c8a847f043aea994b8adbe.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245290

From: Tim Orling <tim.orling@konsulko.com>

Using the pypi.bbclass default CPE of python:GitPython detects no CVEs.
With CVE_PRODUCT = "gitpython_project:gitpython" we properly detect
9 CVEs, with 4 unpatched.

WARNING: python3-git-3.1.42-r0 do_cve_check:
Found unpatched CVEs: CVE-2026-42215, CVE-2026-42284,
CVE-2026-44243, CVE-2026-44244

Note: The original commit targeted python3-git_3.1.43.bb. This is
adjusted for Scarthgap, where the recipe version is 3.1.42.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a6af75a33b4e007f0d3a247b6a149e32d51e510)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-git_3.1.42.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index e728e8bfa4c..8c130cf63b4 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5279a7ab369ba336989dcf2a107e5c8e"
 
 PYPI_PACKAGE = "GitPython"
 
+CVE_PRODUCT = "gitpython_project:gitpython"
+
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://CVE-2026-42284.patch \

