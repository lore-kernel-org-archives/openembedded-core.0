Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9348C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 20:41:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.18691.1743280864003176810
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 13:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JfCiehJX;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso14922345e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 13:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743280862; x=1743885662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PJs/H1X4bWevyB/hPo+lsZNxYgrituaIpZAzne8fwQk=;
        b=JfCiehJXePc7pRz+C2/HINqB5REY61ZCwAOGJbYvWwRmJ7RZx9S+f+hGvSKtSrss4p
         LtlN3leqNnX+pox0E3LnKDH/DrbMZD7xx05RLJJcf8b1U+GQ0l/xOJW+eFRrLL/sdFYl
         rWSdZVKPXCTI2X/k79ElEUijGROonN6S8MpTz0hhsBMQqX7lTCuCstG11q0R8fXiMnZj
         egmf4ewyicMew60nO7e0yUjqPFzUYGN748hQSVLwyhBpwZGEueaIanyJNnrcuNVoLzQF
         mAvOw5ciDGkXyxMdsMMtfcmg5t5vez507l6NcM4tVdckVhAqdCNZOkYFBEUIC5i3wpMa
         CXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743280862; x=1743885662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJs/H1X4bWevyB/hPo+lsZNxYgrituaIpZAzne8fwQk=;
        b=RMvoUEf3TzT7UouenCKBv8gi5BsmVz65uqSSCfSla5GULGcg2zZq76jkxB6RJZwbII
         6qJSHxmDwMzr4aY/kY5e9x1/nczlhSVNHc43/IWbz+R8uYsldlhuZdq3Elgbr5s+gAcJ
         SD/aRT2jtgYwiuwjIUaDyhmd5+IY1hCH9IV2FpmtgO2Dx21d7EhAjKKGIGW3hvV51ybN
         yRHXWJ5UAUwAt5EcEqZj7zSP4rm6cDr2nPNy36qJH/QZR1MwcAPvdpp4zGKwSA1WHBQz
         Ov9ZBmere3zQT0jaJHf3PeHX9T8oTtW88tSdxdLteXKGXEe+DfNx+FM6G5RTwldvPNOz
         mJBQ==
X-Gm-Message-State: AOJu0YypoFagbIsUJoblGd0T0Lac7Bg+OREtMXa7moQBlUVqB6FHW2na
	OcZLOGolIk1umVu1DFOHbQ55432wo+gNLi+Gk20IzqICUzNe7tCpXGogRw==
X-Gm-Gg: ASbGncsg39JwD3gxrQHtKNl1/egSrQ4VFwI1kHPdy9O+74odv2VNnCZK2BwBVx4bPrx
	vCVdpIso4JGNIAbEm/Z1SjVfzW/Agoc6yyUwuJBPM/0LdGbeqyPktYVL6fZUyDsLwkuWXtW86Dt
	+QfdQKyqAJY1jsVC8HfPIxS5paLshUdKoY25GPNwH9B0Hl1OlRpXigjQvdsXzzvtwf08DfYEMkw
	wFRBFbGaXc8LvrItLnivOiNMqhun2nRodUAev82H4KEXm/TLpvVZqRCogOR7jtEC3ccZvvTAjeU
	ReRx+TDZsShTx9BYO4ONhTU+WQGdSmAwRrmAn+gkm0GUzJB8hcQiR92s+nZDuFDOqLHMTweb/l8
	BXa9PhIUhpOaDLKJZygHu6klPA14kcjmcO/Hd9PZ9uKHQ5pmS5zY=
X-Google-Smtp-Source: AGHT+IGL/IkaG18cQYErbvEdYMkP2KqnynGAY/Oe/0VDlGT5Sy122mQDJo7jthOno6Tyq3DGGQ4W+g==
X-Received: by 2002:a05:6000:2d84:b0:390:f2f1:2a17 with SMTP id ffacd0b85a97d-39c1211ca60mr2813734f8f.53.1743280861926;
        Sat, 29 Mar 2025 13:41:01 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66a8d4sm6622942f8f.45.2025.03.29.13.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 13:41:00 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [v2] python3-sphinx: version bump 8.2.1 -> 8.2.3
Date: Sat, 29 Mar 2025 21:40:49 +0100
Message-Id: <20250329204049.1463241-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213904

Release 8.2.3 (released Mar 02, 2025)
  Bugs fixed

      #13403: Define _StrPath.__radd__(). Patch by Adam Turner.
      #13399: Fix _CurrentDocument membership testing with ‘{c,cpp}:parent_symbol’. Patch by Adam Turner.

  Release 8.2.2 (released Mar 02, 2025)
  Bugs fixed

      #13392: Fix argument type for jieba.load_userdict().
      Add workaround for nbsphinx implicit imports. Patch by Adam Turner.
      #13402: Ensure inline <script/> tags are written exactly once. Patch by Dmitry Shachnev and Adam Turner.
      #13391: apidoc: Fix TOC file not having a title. Patch by Dave Hoese and Adam Turner.

  https://www.sphinx-doc.org/en/master/changes/

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/{python3-sphinx_8.2.1.bb => python3-sphinx_8.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_8.2.1.bb => python3-sphinx_8.2.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb b/meta/recipes-devtools/python/python3-sphinx_8.2.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
rename to meta/recipes-devtools/python/python3-sphinx_8.2.3.bb
index 614566b8f4..4c0de80785 100644
--- a/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_8.2.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
 
-SRC_URI[sha256sum] = "e4b932951b9c18b039f73b72e4e63afe967d90408700ec222b981ac24647c01e"
+SRC_URI[sha256sum] = "398ad29dee7f63a75888314e9424d40f52ce5a6a87ae88e7071e80af296ec348"
 
 inherit python_flit_core pypi
 
-- 
2.39.5


