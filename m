Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD257C5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:33 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21615.1786634548597485775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rW6ILy/d;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4994c49f588so10690335e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634547; x=1787239347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b+lEHtEV6PTO9pYYyJfBmZxhfMHzpqEvcpu0Ng0VDJE=;
        b=rW6ILy/dM2fXc51MceFx7HifQEIfN/ianf7LKV7OgJtzDIpmdfD9Y5/oWdc/hhumO4
         LqqDJ21cv/n2aiIPTfybvo/WVCJmAtA3JzXI1oZ++1p9BRZrlIvZuXe6S9GkAnF95M/q
         socDHO3ZMZRURIqIuR+m3ACoSeaV1kxHQ90f0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634547; x=1787239347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b+lEHtEV6PTO9pYYyJfBmZxhfMHzpqEvcpu0Ng0VDJE=;
        b=BWB6IHqC1vlXKbnFZqAlvuNIUhFQ3PI71CCXl7u7ZkPsoWhytJVAZ/ix+yC5KHtlyD
         N+tDCr2eOF9sG6TXnmWv8/19DIv9k0oy1AeWNtr/dda+8dKkXpQmssEr2Yd7Xj3Kae2z
         uJwC9D/VIpl6KOKTLFw4CrMHmL3vh9FpCzo0wQuRwIHpYmTZ5MYfJHRDaMlblspwz6fk
         x+Kxfz5lCQQSTw9MeUdAi8Zp4ODODOKjo2RJcNCGXjgmd7kE8kLIsKiQ8OJzumPJu35d
         da4zjz4pvrY5hBkfaYgv6NmTSCErokdthqY2mNXG8SLx7EC1T6JnSeVd7wchOa/l5z7z
         B24Q==
X-Gm-Message-State: AOJu0YwBT0vIJ2o/AAwC2bxXTssSB3Q93hSy6U6h1HTZUwTbcOeeUZnM
	qJeFQlBB3iNw1Z+Bw6XhBxFl2CqnITUQcnNg1eSqV+NmGC+onmg30FYyPovxWDiDKzVq4i+/95k
	vRo2W6pn0qQ==
X-Gm-Gg: AR+sD12cw3HerOu8QHz5szYyHZxsS17HRKC4de6EEt6ifRywpOtOz48CISDTVDVNVBL
	dPe0Rjn7mfbyZjqC5b8gpw4UR60pSg9cS6tai35/dajkFslAuI+NnnK9XpaNbUm5E2wRvLzic49
	5ga2P09YIs8T64+FyI1Mh+We2I3lRTkuw5rGHKgIMFGARurU1qdOFdFWBCMxcPSAiAR3PEICd3A
	mR+Fy4vgLn8rtO+r7t2Orc6K23neIlDU/9m+1tmg9uVvXtEAXTK/8r/q9F31h0j0l1RGtu5clbM
	02khqJaIfi1zMkUqbsy0lPtIs3KGJQg25EXbILH1/vk4NOdnmfXS3fyCDMDLkqCCxqMUIRv0YoY
	rajcBEQ04m46Gure8fFpWkKca46n0jpU6krL4sNEPssif7jkQLb7dlLVg4PCTS8jTe6J6jIVsyv
	Nb9f9FBhqaNToHL0K4V7bweg2bOGsogC5kitTV0/1N5MHIX8YWdG7Cuog8fjJngDJ0WZ4iUDUcG
	LNdYIZVej4739pqHp7u7ZrKLApmak8JkA8/4xolAmtGZqAq1ZnD4odZxj4C6Veh16Kuu6k6pDvc
	J9FDEGLiMJYuKLMHoYGX1E80RswBtVLoA3DRirWU
X-Received: by 2002:a05:600c:231a:b0:495:58fe:88e5 with SMTP id 5b1f17b1804b1-4998215464cmr70229795e9.2.1786634546836;
        Thu, 13 Aug 2026 08:22:26 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:26 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/17] python3-xmltodict: set CVE_PRODUCT
Date: Thu, 13 Aug 2026 17:21:56 +0200
Message-ID: <197a3a9b94a14865fe34645ee7ca8251ba500124.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243363

From: "mark.yang" <mark.yang@lge.com>

The CVE databases track xmltodict as xmltodict:xmltodict, so the
default python:xmltodict vendor prefix never matches and its CVEs
are not evaluated at all. Use the exact vendor:product pair.

The only existing CVE (CVE-2025-9375, disputed by upstream) affects
0.14.2 before 0.15.1, so it resolves as not affected at 1.0.4.

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2229426b729adf85780c23d38c85fc3cf090f6ba)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb b/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb
index e622c00dae..04632de099 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "6d94c9f834dd9e44514162799d344d815a3a4faec913717a9ecbfa5be1
 
 PYPI_PACKAGE = "xmltodict"
 
+CVE_PRODUCT = "xmltodict:xmltodict"
+
 BBCLASSEXTEND = "native nativesdk"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest

