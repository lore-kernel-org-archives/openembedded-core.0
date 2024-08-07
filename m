Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDFBC52D7D
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 15:43:50 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.36793.1723045422005160803
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 08:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=EhHK1TbC;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a1d7a544e7so2129185a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 08:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723045421; x=1723650221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFzCMKIVC03GK6LkE2Yw5hfE3i3vCvfXCu3oaxzPr8o=;
        b=EhHK1TbCsts2bIK4U06Wz5MKGCN2YwJ37Oe+/mlkfgLYdE9YA/1XYOh3UJyTiEKqz5
         SLI1x50tZwBJBYAkOo6vPbmBMkCfCUujloOvGR+zd6YvhPliO8fa3B7E2yL+7IKsurPq
         oMeeaqojqH7n7SJxIhMiSGJNhY1If7dQl5rkc2nSAphxT6LxHX4lhHVl99jcKdKrCfQk
         VhAcANXyZetKIR2fWzPE7/W7fb5nWSTNi0IwuISxsZx/jnKI5TgPxxue6rkl5WOskNzG
         AZTad8ZjFykO2F2l/JeHhr202kp1lC6BIRTLL2q0JS1f/eEg0m1wSlMA/V3bpsKwgjAP
         L06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723045421; x=1723650221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFzCMKIVC03GK6LkE2Yw5hfE3i3vCvfXCu3oaxzPr8o=;
        b=D+uF1Bxj9Je3+4nuF1jm0BEzxQVfvq95dSxLhe4lQjLQ7jMeydW2AxI4n5pOtzslap
         HgRT0dMxw98+QRtL833zQCNAoqiuEpEB6CIIdqyqhWOwPcOSEryyySvu7R19gdOUp4Xr
         h6e2QldtAe5rO30adx61Gl7C4KWgjJgI26KJG0L1Gwj+91eXlALtidLh2Qd4ftkAJiQx
         IgSUiAnsMF7qlT4A7p9jH8hRbDtkxrenAz0v9AX5tpT7yx7xxKtcwkkMooZ79D5NdL7j
         C9RieQ9y1ff8XpdUqojbtPMXMRbtMFiuLwonwyBXxEOBLUVZyH/xmgscv0/oa8i5xMyb
         /q4w==
X-Gm-Message-State: AOJu0YxdXnz0qiKE/0L/4WdSNsXTxPq8UM86X/hw1WJeqInHVKkAQFd+
	bXnycWdzM+mGQExBORkqqtAGb+flawvG8HeEY7sSZKTR3uwEJRILJ1324bT4iQ6c1WIYmi6BM3Q
	O
X-Google-Smtp-Source: AGHT+IEVCYE4xaEJ/FaFW2+InZhVy79IlxM/e9cRCxpI34p+NUaZ9r4IQC5KmvuIqqqIWtJdHd0VIg==
X-Received: by 2002:a05:620a:4690:b0:79f:176f:747a with SMTP id af79cd13be357-7a34efdd06dmr2190413385a.66.1723045420786;
        Wed, 07 Aug 2024 08:43:40 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c86ffe9asm5770661cf.3.2024.08.07.08.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:43:40 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 5/9] python3-sphinxcontrib-devhelp: upgrade 1.0.6 -> 2.0.0
Date: Wed,  7 Aug 2024 11:43:29 -0400
Message-Id: <20240807154333.533180-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240807154333.533180-1-tgamblin@baylibre.com>
References: <20240807154333.533180-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 15:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203084

License-Update: Rename LICENSE to LICENCE.rst

Changelog (https://github.com/sphinx-doc/sphinxcontrib-devhelp/blob/master/CHANGES.rst):

Release 2.0.0 (2024-07-28)

- Adopt Ruff
- Tighten MyPy settings
- Update GitHub actions versions
- Avoid storing build time in gzip headers

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...evhelp_1.0.6.bb => python3-sphinxcontrib-devhelp_2.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-devhelp_1.0.6.bb => python3-sphinxcontrib-devhelp_2.0.0.bb} (61%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb
similarity index 61%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb
index 31f77a0a14..9f53973708 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "sphinxcontrib-devhelp is a sphinx extension which outputs Devhelp document."
 HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fd30d9972a142c857a80c9f312e92b93"
+LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=fd30d9972a142c857a80c9f312e92b93"
 
-SRC_URI[sha256sum] = "9893fd3f90506bc4b97bdb977ceb8fbd823989f4316b28c3841ec128544372d3"
+SRC_URI[sha256sum] = "411f5d96d445d1d73bb5d52133377b4248ec79db5c793ce7dbe59e074b4dd1ad"
 
 PYPI_PACKAGE = "sphinxcontrib_devhelp"
 
-- 
2.39.2


