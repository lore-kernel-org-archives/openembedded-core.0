Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BE1C98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 07:20:50 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1760.1790148046511405794
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 00:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gurZ9N6o;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so467718f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 00:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790148045; x=1790752845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=51e6YuJ5/2gQXtm3aUMASJQ96pbAYqSWb9az74ih4bU=;
        b=gurZ9N6oB7q9Dq+XvFLxdtbZU30euAPBWb0nSI0PoUOXr3HmsqOcHgqGkvA0GoiNTi
         vOL+I2gs4Na0tfysZZvcGjjZDKFAkXbZbLDlERdi8XvfTvp+OBB317dK0ZBQnGTRM8Yr
         CWwtnrRuUsQTt+nPMe7+ElYstNF9Zanc0Xu30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148045; x=1790752845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=51e6YuJ5/2gQXtm3aUMASJQ96pbAYqSWb9az74ih4bU=;
        b=su0yGGbG7D4tmbgEHbaSRmCQAgzeGOeXYfOCOcXLTX1A7tCacYzY6kBL5QN7kzFd+a
         V2sI3jebam3pIa1GsNyaY8zEce2dcKpftJTsKZnjIe8wdOV45YjtoKsygu9dc+yoxxmn
         vCQuNgBYtCZmmMawuLLzaUfdSF3+Tv00Btp+rkmse6yWtRTO9ZiaylgKu2eLLUeuZgfB
         lCOAwTtksTJhaxBDP5L5SgaTHra5bie/gJq51ymaeDdNh3V8gM+twLo3mp3NItCm5lhW
         wNoyWBPneAsyyjOpfYj/E4uPpDJWcfRAJg8jML66zYbYfKHG9fMrtSHT7C/SOlJ4Fg+Q
         ZQrg==
X-Gm-Message-State: AFuF++nSAoSt75vo+jAB3jyLTmIsDo0kOYI/YT37EWSDILluNuFuoMNM
	jtCRTvV2wSR6zo2RkR70yWrY6ZnSGskKQsC3W4R8alNnNuARzEi4hForGhU/QdAj+kQPssJigwa
	jimBi2Cs=
X-Gm-Gg: AYBFou0Pti6hsM1X1miFid3c3ZMdgCZqz1lVC4BrOK9xgOK2e9X8S14ZL7hagWr7ZnT
	wNsxaAHbQ+26G+fdDxBipXFicAvDVaRK3frlo9AnWij1mOFUtjDqlfYQxgGu+odggX7N5PyFTP9
	cy2Ni3iIuo6PS5ZzbnlKg7aRdAzy0negB/lSE6MCgmvVxCDVQyUh4TbW5o0Hvj/s+rf8aAageBX
	nYpPh+UmIDX43eWgWLwJ9zeI7V2b+0i7iGih+RLhc+h4bmVdPSCrcoFZ+dvqkN43u2xGNtpUP+H
	X+Gor2MfH9A52GjkBWQ53oNYYbP2h/VlQrDGzocJ1j71d76fvnGjJ5cQioYW2hAysJO5bcCWwqj
	laWIeJ0aKe8Ir46mtfKleCjyk/O9FMWxF2BRFPua0YjhawsdYgyVzs7ld2Rnahh/4C26GcPbRDZ
	BpPSWzu7cL4/g7tn64xP1KHwtxQxTjtvDEOD5GQ/40Fh2hcl7Vpmp8ebD5FJF+cGKMeGcXWUOXz
	Pu0BgKEO+e6lv+MYipIYwcgOtk=
X-Received: by 2002:a05:6000:4a1d:b0:485:8c16:5ef5 with SMTP id ffacd0b85a97d-488670b34d5mr2724967f8f.47.1790148044582;
        Wed, 23 Sep 2026 00:20:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f510:706d:14a9:45ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c1fdsm5427800f8f.14.2026.09.23.00.20.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:20:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] python3-trove-classifiers: upgrade 2026.6.1.19 -> 2026.9.21.13
Date: Wed, 23 Sep 2026 08:20:37 +0100
Message-ID: <20260923072039.3153452-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923072039.3153452-1-richard.purdie@linuxfoundation.org>
References: <20260923072039.3153452-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 07:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246456

Changes:
  - Add support for Odoo 20.0 in classifiers (#259)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...2026.6.1.19.bb => python3-trove-classifiers_2026.9.21.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2026.6.1.19.bb => python3-trove-classifiers_2026.9.21.13.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2026.9.21.13.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2026.9.21.13.bb
index 99282cf3dc6..b24753e381b 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2026.9.21.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "c5132b4b61a829d11cfbd2d72e97f20a45ed6edb95e45c5efdeb5e00836b2745"
+SRC_URI[sha256sum] = "0a9ebc8d4e2f3e8a22848c5258033035bec17a3012ac3fea16dbaa764489eb71"
 
 PYPI_PACKAGE = "trove_classifiers"
 

