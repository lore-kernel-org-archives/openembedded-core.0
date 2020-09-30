Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.5751.1601502051800090044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 14:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RYfHkGaT;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id s31so2017692pga.7
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 14:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QzvdtiXAE+X0V7sLLT5LN7l6b5x/XvNMdbLI6HuwzO4=;
        b=RYfHkGaTLFlNCJKVB1DoxZHynsSVBk0gZIsxppGAuHSd4YO2z9N+hPzkkThVCtn3by
         xhqbYl3lh/phQ+c9DPhfffCoD3xonXd4x/CZ86z5rkg+GpaiVsJC1AlnjIm/Jjdx3tIG
         ZUPU8J9F+O3p+LlY7W2CL5b9qNUEwfs6s5i1Oh9GDEvmXyfinpEGEPXhiPF4gnWcjvKi
         uB5VXt6V1ZFjy7K3+SXy623F1N2DrZcwmW+FcxVFaWMGW9VLAsVWlpMeCIbLjqA+47WS
         oa7lu+HBvWRl0cF/w0frDlnbaLc75Tblk4JJAwdx6o4dtOG1KgQ5xhbPCB670EshIjyL
         F8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QzvdtiXAE+X0V7sLLT5LN7l6b5x/XvNMdbLI6HuwzO4=;
        b=IM1hX4ws02iP1wqW/4KiBEtfeC46LLuPA5oYLemfjemd9kO10OPBaBXDSMwvWcXpxY
         l2HmBu02rIZq85amhZNStz5dO+s/XxgHKBLSUWrturnmjdWXA5oTTt1yZCHtJKuFmE+H
         XaAcfU1x4coYTfSKYvqLkJkSWlJqAgj4JjT1/3SZpRBdrrgRMW5CF1F4A5fn+OYGCQGo
         eCJX2CgZY6IalYrn2P+9R9EJbO+wuptIBZeeBk9HFZEHg2TRB5e9D4cO2TS7YrAHgnlO
         NudL4xn1jB9wZWCrjkwZyomsGvUTlFj/u54ZilXdxG+faCV5RC+ouogtj8l0lNyc6OMw
         1AeA==
X-Gm-Message-State: AOAM5302EJxdATYCEVq1Q993G2h4cJZFEkGO5nmRxpBOjj9eUXYnnGbg
	ve9/3HZJAd6ImaKhMwAHhKh9xPCzfoASew==
X-Google-Smtp-Source: ABdhPJz3UDHvFz9BWnJ40RwRc9Zq+zjMsO3wiXtTrQuvycCafzYIJZwgFTLSwS3FQYfE/4QM+wbFJg==
X-Received: by 2002:a17:902:8a96:b029:d2:8cdd:d8f5 with SMTP id p22-20020a1709028a96b02900d28cddd8f5mr4147612plo.69.1601502051023;
        Wed, 30 Sep 2020 14:40:51 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:d879:d540:4522:d2a1])
        by smtp.gmail.com with ESMTPSA id n28sm3064222pgb.51.2020.09.30.14.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 14:40:50 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [dunfell][PATCH v2] oeqa/selftest/cases/devtool.py: avoid .pyc race
Date: Wed, 30 Sep 2020 14:40:47 -0700
Message-Id: <20200930214047.30864-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

In certain conditions, most likely under heavy load on the
AutoBuilder, the prebuilt .pyc files are attempting to be
executed before they have been completely copied. Avoid
this by not copying the .pyc files (nor the __pycache__
directory). The impact of python3-native recreating the .pyc
files should hopefully be negligible.

YOCTO#13421
YOCTO#13803

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---

v2: actually use dunfell in subject line

 meta/lib/oeqa/selftest/cases/devtool.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5003f08c75f..d8bf4aea081 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -56,7 +56,8 @@ def setUpModule():
                     if pth.startswith(canonical_layerpath):
                         if relpth.endswith('/'):
                             destdir = os.path.join(corecopydir, relpth)
-                            shutil.copytree(pth, destdir)
+                            # avoid race condition by not copying .pyc files YPBZ#13421,13803
+                            shutil.copytree(pth, destdir, ignore=ignore_patterns('*.pyc', '__pycache__'))
                         else:
                             destdir = os.path.join(corecopydir, os.path.dirname(relpth))
                             bb.utils.mkdirhier(destdir)
-- 
2.25.0

