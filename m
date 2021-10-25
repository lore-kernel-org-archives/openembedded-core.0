Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422F5C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 22:44:16 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.4507.1635201854890631206
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jpoknMsg;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so102462pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D9r6lnC+G0myV/2QImr/P3CpT9UZuGMt6X0sgvbIPxE=;
        b=jpoknMsgzTL87vbCWzEOUEDVDrkXM+4boizmHqmbzR8AnTXB1/0P8eVcmDFxkAxsmz
         CKJ1OFr3lqmvZ/XXlIpyguB5/b22igfWF0Uli5QpfQBvYBbwAL982Jw+Uu1Hzvbhocw9
         EZ7lZhzVnmlVUv/BV7VDza29jKJ3Gc6CGIpbBdB3XJdwKiW6Wr89n8RBPExtwL6H8nhc
         +swXInysQThIzoKNht0JDOiv9AOWIk+lh1bEHXHIT8DmMvgquzHWSKYvKO5dQC3107Gs
         hYaTw6djr880S0CGWRJWTqk1xCCYK8ua+86/GUD2hxEJwrPCcoFeOm3OIAjtYxBq1jDN
         yXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D9r6lnC+G0myV/2QImr/P3CpT9UZuGMt6X0sgvbIPxE=;
        b=yvR2gPPsSgtzZ+QbIAdMA5Js4/HGKGqeaw88HQq7xG/h+aaNnqbKFyYFH/Hii2UhEX
         2Ke2jtxOqiK/Ul35AqH1P4bjTUb5uzUdRK7Rna4xxupRG4dIqbi2WJRNrqeqLfJXnmr8
         fMzpLXLdA8wJhHY1NxPAzt4VMF7nu8P9R/6GZ8jcb+2eSEeWLfWwaPWChH/6ElGgIriY
         FwIbMWAKvYmcQM8iZ9MtTQl104D9laJ+132wCU6NUjbCSGYzfmBvsdZVYUu7H9J1a9ke
         J1DiJqqUWWeE1OHcyAe+wWXQCy1+TSGXTdvgWH3SI7jrA3XjINNjovQWtvRs3JsbZJ2Y
         9tfQ==
X-Gm-Message-State: AOAM532GLeH1SkoXYbRgseqyUpfZXAd++nlT3dI183lTxXkAWtS6Nw3M
	cw/tZoJKWdzENJwpsmmsUzmzsxxYZgM=
X-Google-Smtp-Source: 
 ABdhPJylTr4lCsvMsahoJpkg2/zjO3clahZiimzoXfD3YPdU23EN0sc7DfqOTgbM6ecaRnwq1yZ4NA==
X-Received: by 2002:a17:902:8a97:b0:13e:6e77:af59 with SMTP id
 p23-20020a1709028a9700b0013e6e77af59mr18832999plo.4.1635201854197;
        Mon, 25 Oct 2021 15:44:14 -0700 (PDT)
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::17e1])
        by smtp.gmail.com with ESMTPSA id
 k3sm22160363pjg.43.2021.10.25.15.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 15:44:13 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 1/3] python3-manifest: -pprint RDEPENDS on -profile
Date: Mon, 25 Oct 2021 22:44:02 +0000
Message-Id: <20211025224404.508616-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 22:44:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157365

python3-profile includes dataclasses.

pprint imports dataclasses:
https://github.com/python/cpython/blob/3.10/Lib/pprint.py#L38

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index d65cf49cb8..2f5dad6486 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -980,7 +980,8 @@
     "pprint": {
         "summary": "Python pretty-print support",
         "rdepends": [
-            "core"
+            "core",
+	    "profile"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/pprint.py"
-- 
2.30.2


