Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7EFBCC6B35
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:24 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32856.1792040657578679204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iBEf05CG;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-487049569b6so3292042f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040656; x=1792645456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=icRBYlCaQ/qWBUOLdhuUp/7k6huOAaiSaCF1Edw0fmA=;
        b=iBEf05CGe89Egd42i5cfDZIoom8H7cN2UJ7w1fj9/xjiaNvb1/8Dw0tTrGQIOBdJKQ
         9IhPagL+GN8TicxuQ5EKRL+gJ7G4pxKEspLr6pzoTs//Ddni0zm6zuR7aIiVmQzIvr3J
         ijKF45nzS6kn4MrsKJuC+QQi/06iVLKGB6ay4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040656; x=1792645456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=icRBYlCaQ/qWBUOLdhuUp/7k6huOAaiSaCF1Edw0fmA=;
        b=n0QOoiNNCzW2uEwYZLLqWclSmM7tyPw0W+QYhKTVSx/bdivfOCf+nlxjX/52J5IRaB
         QQ7aB70qxpNHU/gy//qZ6+WmY3TbP7/tfaBOVmLSb6p3Y30cDP9dJWkRD/pc4iNPixVN
         P/DPW/gSeVcCI0d7LRFm7PqETYTnvILUV8HrOp46YTtWk4goP/uHRi8CZgWTx1caluQK
         8fGBNraXbUMaj+XwVhZ0fg3Tj1AHxXpgKsFTjGGgNOiTeqENyp9s3mfDyErxW8ovP2Rk
         gyobZUxHOXR8SrpzsuPlELoqKgRV6LbrNtVXw78mUnS5kaMNkRsZ1mGle8BAAMA9jAdx
         A8aA==
X-Gm-Message-State: AFq9FYKJgKn4LU/egs3azuUM0jJmg1BJfQGkhDCLfWJLX7C9BtKOEjMx
	pZ67ZPx/uIaETmLUaPxP9MndHoeGcscXWoNks7AGYvK1h7IKxx3ZrDy6wpC5hB8YdtP0hVbve0Y
	qSs+n5qo=
X-Gm-Gg: AYBFou2hG4ixTIas6dtjQdFivyU4AlcMP93rA9gZ4qtRcmWvD7vpR/87lcEH51rQxiQ
	Fdc2gHu8XiH8wvab2oUZJCjjI5Pfx+bBnkXaihppAjyOjB4upa0FC+GuPd/ZmaNDoQKPIiB9g+w
	vqGa+ITBmzdcm6tBcT190TTHig4+yy3QMCgkVQ8rweWQLYgChEInU6xEyvcHXtBqwXvUt8U4bZW
	nErtwKBnXd2bkeZMuihuxE2ZxdDQ4G/L5hNvZ5+644l/RCPvjt8+jVJJiAIQI/VgLdJKpsV0uQi
	Dz8pM3bSpdxrsbF7KP8GpF5jkS8b/pbZOXE+Jfl9pXqwQ3emQ5cz/uB0P6/TnD0AlAfoJ/wF7jY
	jbPgY+mkER3bqUtblJBF55HeJyMEgxQ/uTSINQqyW1gI9b/kQt1jjhEnQ46RgBwIx1J7sELC8+x
	C+xe1YsMfaJZU3YzpIgkTlKEX678C45Py10+fAUx4oqlXPdzNMw7Cu2+HHotNCbCxbncJYaDSws
	r70witV3ATIWA38S8LuJBKUHHPkRxvbGgUqJ8HezijzcuIG6/IoeBNStPCTzHr1MRZHdoeeY0Hh
	FLwhsCjq
X-Received: by 2002:a05:600c:e549:20b0:4a1:96cd:2f6d with SMTP id 5b1f17b1804b1-4a196cd3280mr188840085e9.1.1792040655772;
        Wed, 14 Oct 2026 22:04:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 54/55] python3-py: ignore CVE-2022-42969
Date: Thu, 15 Oct 2026 07:03:17 +0200
Message-ID: <5281b17760632d24f650703854bbbaa540aa598d.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247852

From: Darsh Kelaiya <dkelaiya@cisco.com>

Analysis:
- NVD marks CVE-2022-42969 as disputed because multiple parties could
  not reproduce it and argue that it is not a valid vulnerability [1].
- GitHub withdrew the advisory because the available evidence does not
  show a valid, reproducible vulnerability [2].
- Wrynose and master use the same python3-py version and carry the same
  disputed CVE status, so that disposition applies to Scarthgap [3].
- Hence ignoring the CVE for now.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2022-42969
[2] https://github.com/advisories/GHSA-w596-4wvx-j9j6
[3] https://git.openembedded.org/meta-openembedded/commit/?id=91f6b85b36316d5940ee194b1d195caf3ac040b1

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-py_1.11.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.bb b/meta/recipes-devtools/python/python3-py_1.11.0.bb
index 906410e9bb9..f850be1163c 100644
--- a/meta/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719"
 
 CVE_PRODUCT = "pytest:py"
+CVE_STATUS[CVE-2022-42969] = "disputed: upstream could not reproduce it and GitHub withdrew the advisory"
 
 DEPENDS += "python3-setuptools-scm-native"
 

