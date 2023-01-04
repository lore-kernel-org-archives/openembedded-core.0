Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC21C54EF0
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:32 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.9366.1672830360745063970
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YbHNtqzi;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id d9so3992767wrp.10
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfWQYsejGKjX8Cqnp14RsaC0E38lPVLY0MTUnyCxf6s=;
        b=YbHNtqziLDGZiA9V1dtK+LyLtMNgqL4TmOfTjTbEaDZHGASWLp1ChBbAwlGqFJTj1O
         7eP0NLc+wXOcWWDB/1cIel4J3nTccjzZw8j5nVCOh0nLNzw4TAO66XBUZGYkTJ1Tk8ii
         gbOzejrTCo/37cFUROSbiULAQIwWbv6utRWvdMm/ZZqbuLOwuKghJszfVA9fP3huFV5J
         m5C7suvBKUy+4Od1o9bsUSEB6/UqC94dD/DX0ol3YBldlV6LLLVGRACONUtcNdmIEw6S
         XtYxJuuc5Q7BwTxfB0tzRSluOFMEwtt19qX/NTt/CdFWXsda4tRxTPvMIHrVWfQ+0JH3
         Vjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfWQYsejGKjX8Cqnp14RsaC0E38lPVLY0MTUnyCxf6s=;
        b=XwPynoDZCRyfCgFU0GAEELWzbPLH7ey11vFIIXKmFTFN+z1UspDYfTpBYrNlKNEgSa
         evt9XuRNftV7SbDzWUW6MhP3Ao8zNtP0QOWBXCa9nGjxJM+qm12npXdvcuGwgmKEqJ3M
         w9ZL2Ir7SCbznEXbDyo0nU0N/YaHqBrA4likK7qHBF+xYnVuT+lhfqwny7SKGO+b0dm0
         zkrmDY59sHczzwUURrxY4fTEMVmKZ9i+W/Vapvl/3tvxULUIwn9+d68Bn/KZ13NMgdnC
         np+35OnNK96TGvC6rdFq/wZujn+JY7xCDM0bUWKDoz3GQ0h7qOtccBg9KTycetQpuAQs
         ZWrw==
X-Gm-Message-State: AFqh2kr8gScW/ErXtz2jd1TG+4ugGxIqT5TsWDkhi6sQKOTzQ0A5L02K
	pYJt1au0AFzQTsec8yjvd3h4z1siQmM=
X-Google-Smtp-Source: AMrXdXuo85OoX5ln29iTnbXLXgeSVeXqb3GAGNoked3pEOJDwe4VLnYf59x5QTKsk1rjyZJw3q+7lA==
X-Received: by 2002:a5d:4150:0:b0:286:2b9e:f549 with SMTP id c16-20020a5d4150000000b002862b9ef549mr16080542wrq.66.1672830390494;
        Wed, 04 Jan 2023 03:06:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 50/77] python3-sphinx: upgrade 5.3.0 -> 6.0.0
Date: Wed,  4 Jan 2023 12:05:21 +0100
Message-Id: <20230104110548.2537259-50-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175435

License-Update: jquery/underscore are no longer bundled

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-sphinx_5.3.0.bb => python3-sphinx_6.0.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_5.3.0.bb => python3-sphinx_6.0.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb b/meta/recipes-devtools/python/python3-sphinx_6.0.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-sphinx_5.3.0.bb
rename to meta/recipes-devtools/python/python3-sphinx_6.0.0.bb
index 70b4e23def..5e565e745d 100644
--- a/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_6.0.0.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=72c536e78c21c567311b193fe00cd253"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2214a89317448c7f792f5b75dd6726e4"
 
 PYPI_PACKAGE = "Sphinx"
 
-SRC_URI[sha256sum] = "51026de0a9ff9fc13c05d74913ad66047e104f56a129ff73e174eb5c3ee794b5"
+SRC_URI[sha256sum] = "58c140ecd9aa0abbc8ff6da48a266648eac9e5bfc8e49576efd2979bf46f5961"
 
 inherit python_flit_core pypi
 
-- 
2.30.2


