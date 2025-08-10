Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D672CC87FDA
	for <webhook@archiver.kernel.org>; Sun, 10 Aug 2025 19:19:40 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.32144.1754853574377394265
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 12:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JeKiIQyL;
 spf=pass (domain: konsulko.com, ip: 209.85.214.176, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2405c0c431cso34567545ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 12:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1754853573; x=1755458373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RmGGDRPYm2XAmmX8YuZoSPqYvnX2iXG4PDwP0HQysm4=;
        b=JeKiIQyL7az/lUf8BNgZpbv2tDy9ESkgHd4i/FITIOCIcjR9mErpotpd/QhzHP6l7M
         2YL3aEFyPoK4VhtzjatE/owHJiUx3KThwS3yS5I0gfGnwIRKig87gLAX1HliUHRoS7Vy
         gezC0deklUhPs+AeTjJckGGWFQ10GncK5UdCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754853573; x=1755458373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmGGDRPYm2XAmmX8YuZoSPqYvnX2iXG4PDwP0HQysm4=;
        b=jxuZFnoTqMD5lVjBkXs4R7+VuBXyv4XBQGesrn0QB63fkmsb5SDM/MJ3npf+odMOc5
         BU2ch4RvHD9cdp3C5BZuMloj/JffWVU33288/hI7BgOstTJSTb+p/xezLFd9clKq5bDQ
         ZoEGH11//t3v0YmsXlPJ8z4nSKbPi/L04WxBrSGwR6oxHqNJhi6N5VHPP1sZo8PZ2v/6
         YVaBSgWWe9kSCQMdTo83TK0WL7dzXjyvQPU3PnTEr5I6Teafcl9nRWMSHfNySXaDi2bQ
         AxELOL3uIdt+84JLIrDulupq+qoWTQDMG57N03UCevbJYsviy8l0iayxeHCpAxyNBJp6
         KvvQ==
X-Gm-Message-State: AOJu0YylZSF9RcY5ILT0pBpdVYWmhzZ/ZRhBDrp+oxkK4LrEudp2BfDB
	gJjG3Auuj4MReYZUiE+xJS8fd1MD4TbhtmKkiJr/FIQB7hbnHFiuAdI9dL2yK5rLPvUBL69Nm/Z
	ku/zvODs=
X-Gm-Gg: ASbGnctWp3dr3kXextqnzBgX/06WzoPVOYGBqfLsyAkvJX4fUHTyZiPUlgcgg+3FblC
	iBKIAiq0bmIradZRvJVzoDkn/E9re95OfojeVybVxGddbWLDcQXnbDFWetUFx7e0O/1ZEXFMlQI
	c+ALCdrJAhGtykFCEELmC5gfK64SCNgYGo64wZUBJdCHIY76ysvNxJxIH1cj1a34EJbW/WW622I
	tGDxG/fWcQ3ZheWZwu8dTrRPydDS41bRkAbcMFtNkxkqLR7FZNrzCf8IlPpkBPjuY7OK6039+V8
	Y1Yt+ni9MJdpkpjYqG4K5qhAG5MWfHdTifri6QjTrnhOmo3oNWJckutGxrB+qpl5fvtuDEFgy12
	Q0o8R6CurqbguMOAd42So1Zsxpj9zBoIjjBFXrDsbge4yOdedfRqQghB5d6niAhdV/X4I752B
X-Google-Smtp-Source: AGHT+IFAVrFQo6v6V2dooEIi2Jo5qzkWJS1OwxscpxRHfFxGfwhm6kIVLmHh09yWCQgnCVHpUbqw+g==
X-Received: by 2002:a17:902:f544:b0:242:9bcb:7b95 with SMTP id d9443c01a7336-242c2297044mr138417455ad.57.1754853573257;
        Sun, 10 Aug 2025 12:19:33 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63f0b4b9sm30034835a91.27.2025.08.10.12.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 12:19:32 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/2] python3-coherent-licensed: add at 0.5.2
Date: Sun, 10 Aug 2025 12:18:49 -0700
Message-ID: <20250810191918.78773-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 19:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221702

From: Tim Orling <tim.orling@konsulko.com>

License management tooling for Coherent System and skeleton projects

https://pypi.org/project/coherent.licensed/
https://github.com/coherent-oss/coherent.licensed

*Dependency for latest python3-zipp
*Add self as maintainer

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc          |  1 +
 .../python/python3-coherent-licensed_0.5.2.bb     | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-coherent-licensed_0.5.2.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 96d5a0819c8..4a86c759edf 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -632,6 +632,7 @@ RECIPE_MAINTAINER:pn-python3-certifi = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cffi = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-chardet = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-click = "Wang Mingyu <wangmy@fujitsu.com>"
+RECIPE_MAINTAINER:pn-python3-coherent-licensed = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-colorama = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography-vectors = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-coherent-licensed_0.5.2.bb b/meta/recipes-devtools/python/python3-coherent-licensed_0.5.2.bb
new file mode 100644
index 00000000000..9148fe4e36a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-coherent-licensed_0.5.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "License management tooling for Coherent System and skeleton projects"
+DESCRIPTION = "This library was built for coherent.build and skeleton projects \
+to inject a license file at build time to reflect the license declared in the \
+License Expression."
+HOMEPAGE = "https://github.com/coherent-oss/coherent.licensed"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1aeae65f25a15b1e46d4381f2f094e0a"
+
+SRC_URI[sha256sum] = "d8071403ce742d3ac3592ddc4fb7057a46caffb415b928b4d52802e5f208416d"
+
+inherit pypi python_flit_core
+
+PYPI_PACKAGE = "coherent_licensed"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


