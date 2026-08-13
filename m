Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26F7C5DF67
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:33 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21613.1786634547559735767
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ub9H7jF5;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so611881f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634546; x=1787239346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pgKs2uifWMqCkFgbp25F3ek3PtUWIPKnOPbbEDeiPNg=;
        b=Ub9H7jF5EYOkXjSx3opdf2Oz3eG6tzyB3NjFjU+/TVHuvEA+7DDPPX/eiCgYqCX98o
         7JfviwQomS2D6LZnj8/KUQucr0utAUFcPGV9+aFte+LN3tXl/XA3yqDmFIG/9+bu27JQ
         pdfhhjX6n6cHCvxmwmYA0YMmnxBa83B0G2lB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634546; x=1787239346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pgKs2uifWMqCkFgbp25F3ek3PtUWIPKnOPbbEDeiPNg=;
        b=TSwhYyg3LjsyE7OysincoyFrU7+MAZp/KdS4/jW5uLXw+wQJt5z/Gdmm897QqFgib6
         ldH+Mn5ujgPbYAlUoBemRlkR7XRYQBfmdYOsU9VSr2GLKO8p2k6utwxei0GfHw4/aKrV
         VtFIk8VRpqoNWLQCYOW/j7LNx4cFkF6bSuHYv3SNWGUWg4abcxTiGOwKPaeYFbAt5edX
         gg9KITo85DaCISjceKKdg+EiEq/QTAKPtFU0LTJQTSZVuswYc8wXWJikYFJYeYGEkF1k
         pIPf81G+V8tLorB9qrWlRUBli2D+IJ7+DNGAmos1E3hwD9eprPuEhBxRCKjtxzyI7mXL
         rlqA==
X-Gm-Message-State: AOJu0YyQ/1DHmOjtwh36Gci+qtrL9SorKLNAAwGUVujh81w2AXTnLUP2
	cyHaYkuR6+B7wT1hEBQjnJSpSnO2zHl72qRXd9/PpTJO3un2wxprD8ceIvtn+8ts+rOW1u1wRh8
	WWdshYTp2gg==
X-Gm-Gg: AR+sD12+mCdpqL72GyLiDxucbDZta6l9hU1yVbfd3VMD//JiO31gG/8kPzHZ6D0jArf
	BzpfDLsCwmsWSBmIOu5WtKiUzARnktGWojKySmvH8/tRuQ+mhO/431uT9cWS2bNzQnGl07pJjCt
	LR8cmyGN1+zO5LWWQ5ysVtThZP7ACm4qXIQOh49piYGsfGNQNv5pG8NveEqHkSODM9CeAWSWdKs
	+OIqzbJL5jNsBKvUrQA0K9KaOFHfUOhGUvMVQDeuK8AUJ3QdOIPvDpudtWd/er1MH/8BVp6bc1J
	xcwQbCSoXt4Io18Wxt06PkA9g+SANQlEcR8F7xAYqu/rTwaTZOJJ/YYIfIbO8moxaYsv/JEwKC2
	py8E7KMtvKhZ9/yUIjXygbQELjVYDnHm+SZjdjpokUYhe88JC49e+vslAXridVJa4+KfGVEtaDm
	pvxFdpADcUTxgGqf1NiqjkGDKIWcVUkpIiAH4JCfWD8YyRZj/I42DTZC0HqniEpAOrvGiXXTAn5
	76IlrctrQmHGZY4Br+4jQJCcTSBszofrc4CMh3XgXI91ojBTIno7hXSBgX+XjY8WDVyygA0Zjgq
	ywK2acPdL1j8YeED5hPI3VuJDsy+D1XsR9QaBfu3eWly5eF1kI4=
X-Received: by 2002:adf:ed10:0:b0:47f:93b4:2def with SMTP id ffacd0b85a97d-4815a045f04mr7903726f8f.28.1786634545652;
        Thu, 13 Aug 2026 08:22:25 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:25 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/17] python3-pyyaml: set CVE_PRODUCT
Date: Thu, 13 Aug 2026 17:21:55 +0200
Message-ID: <a0ff52f6af3f599eac0598913f84c65c10a4a0fb.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243362

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:pyyaml vendor prefix matches nothing,
so PyYAML CVEs are not evaluated at all. The databases use two
vendor spellings: pyyaml in the NVD CPEs, and "Red Hat" (with a
space, not expressible as a vendor:product pair) in CVE-2020-1747's
CNA record. Use the bare product name to cover both.

All four existing CVEs (CVE-2017-18342, CVE-2019-20477,
CVE-2020-1747, CVE-2020-14343) are fixed by 5.4, so they resolve as
not affected at 6.0.3.

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 89a0ba3c2da2a7755bafb28afbf75dc7112e2549)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
index 7e2b088ca5..849e2c9cc8 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
@@ -21,4 +21,6 @@ RDEPENDS:${PN} += "\
     python3-netclient \
 "
 
+CVE_PRODUCT = "pyyaml"
+
 BBCLASSEXTEND = "native nativesdk"

