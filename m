Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9BFCAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 16:48:10 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.1265.1758300488231164506
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 09:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=MFXh+RFa;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-80bdff6d1e4so231894685a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 09:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758300487; x=1758905287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=S0y5AfCPi//FjTp3XSgFfqOjHMdRQoNSc6UbHvwsxAo=;
        b=MFXh+RFaMi3P0p/a/XiWn6eZrJZWCw9t0X88rwkXAIrj9Nuvg1ohGIYWOwB8vLVHnx
         dbHs0b6gSiNw/Uindy6CU/Mew3ZNd2co430k6Sa6duFAU/C9CvzWW3GJBlKONh3ox09R
         wloil/k+ySS8DjG2xaFFpVHtM3hHt+/9Unlw8PJrNy4QJIqFeGgQsa7SIa4dA9wmHx9t
         6rnyREFevNESwbhGwmELOmDbUh87iv8tRyawCo08Ytvb38XJ9cIqAXP1WxByHnsGh0nP
         B9U34C8Qsx50mE0jPddqVKNWwD7zoe6FHmBag8I0nXFICroRW+lBZZcimI7EuxXrtD4z
         oYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758300487; x=1758905287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0y5AfCPi//FjTp3XSgFfqOjHMdRQoNSc6UbHvwsxAo=;
        b=BdlYQBO6Eyiqw+gLJowT2WNNja6xojuF5wnV8Y7yqjOVCsVpCHWNiQy8YtQ5j/3wbP
         TeYAFtDVv6DrWQ5JT+UjhSrrB8uKXk43Rd3QzHNMeycIPBqYMZkQF2AmnqAlvVGMOBlJ
         bdoYm422mVs9EIcq/tI0OMnr6e3N7TqK1Z1Pt9BPaQJC5w0zA2eAVw0lZRat/EpG5SJY
         8Km1hPQZwSflwaO93VceEnTjxknxrru9GK5Jk9+0sj0l2FRQD2sgAu8vx8uYhrkqjcDp
         5HmxdpbNwf7Ojj5z3rmVqjcvN1GnOq0xrCCQguBEn9g2wHEGqF+K7C11dD9gmHqOKBCJ
         cz+g==
X-Gm-Message-State: AOJu0YxteJGtixlr4s/tup5HWN5GODya83wzf3XXQLECo6SkKs/1lqzq
	XkXUS+FgxIBi77pPXndSOXnjVVzD8y11WH/+3urtqZxQwVf5CwsJTpjWAWPLsMv+dF0aMGnTr1o
	b0HeCMyc=
X-Gm-Gg: ASbGncvkUC1Mdqu/9ho/BWpgkiNwoZOmFvAKl+cjlEYuFsP4PPdULy3fTU3HQ1iOzYR
	UE5gGGBj8HMhjYS6mX9ku0HLBFsS/gcMDaPM4jbNniUTEOc1Ikgj9HHmbR6iMqtffPyE0fcia6l
	MxgHhQvNSdu6MDirxFsw+EcV03xYoqc26kLhxWYGlffir73YCTFPda4n5dTiPXuw8GRmUbVlQt2
	/TQocj5e1U//8OlELIaDdVIEAWddZtx57TE/sxT7a4flabPEir2u5QUcshwW9nIYrWaJsBo6Wj4
	eINFCudzoX4UQ6Ei16CYrsXqVUXNSfrQvFpv1QiIDrjXgBr3WtsIQwX/EzM80Yqo+LUbN5gLRkc
	tj33wEV/tZCT4PCd9W15hnDBE3JDCF1zrJmBcZeL1KvrWXeyZZSgyX8oZrQ==
X-Google-Smtp-Source: AGHT+IGvn10grIQnjp9IWGJP+GD+mo2XpZA9I2u7mRtB02ZjjL6WV3HmVaPBX13bOPro+Q3UMtaFdQ==
X-Received: by 2002:a05:620a:26ee:b0:827:e9b0:273e with SMTP id af79cd13be357-83babdfd4f5mr388043585a.68.1758300486358;
        Fri, 19 Sep 2025 09:48:06 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-83627e71fd0sm373303085a.26.2025.09.19.09.48.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 09:48:05 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/6] maintainers.inc: add self for python recipes
Date: Fri, 19 Sep 2025 12:47:58 -0400
Message-ID: <20250919164803.3174518-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 16:48:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223760

Add myself as maintainer for some newly-unassigned Python recipes.
That'll allow them to be picked up on my upgrade checker.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e80959749e..0988bf50a7 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -636,7 +636,7 @@ RECIPE_MAINTAINER:pn-python3-colorama = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography-vectors = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cython = "Trevor Gamblin <tgamblin@baylibre.com>"
-RECIPE_MAINTAINER:pn-python3-dbus = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-dbus = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-dbusmock = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-docutils = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-dtc = "Trevor Gamblin <tgamblin@baylibre.com>"
@@ -673,25 +673,25 @@ RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <tim.orling@konsulko.c
 RECIPE_MAINTAINER:pn-python3-numpy = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-packaging = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pathspec = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-python3-pbr = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-pbr = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pdm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pdm-backend = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pdm-build-locked = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pefile = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-pip = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-pip = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pluggy = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ply = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-poetry-core = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pretend = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-psutil = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyasn1 = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-pycairo = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-pycairo = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pycparser = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pygments = "Trevor Gamblin <tgamblin@baylibre.com>"
-RECIPE_MAINTAINER:pn-python3-pygobject = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-pygobject = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pyopenssl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyparsing = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pyproject-hooks = "Ross Burton <ross.burton@arm.com>"
@@ -715,7 +715,7 @@ RECIPE_MAINTAINER:pn-python3-semantic-version = "Tim Orling <tim.orling@konsulko
 RECIPE_MAINTAINER:pn-python3-setuptools = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-rust = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Trevor Gamblin <tgamblin@baylibre.com>"
-RECIPE_MAINTAINER:pn-python3-six = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-six = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-smartypants = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-smmap = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-snowballstemmer = "Tim Orling <tim.orling@konsulko.com>"
-- 
2.51.0


