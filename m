Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.13059.1593410883421100372
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 23:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GisloqkK;
 spf=pass (domain: linaro.org, ip: 209.85.221.67, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f67.google.com with SMTP id j4so12780167wrp.10
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2020 23:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9ERZK7j3YpQlisKqhZeF+sAGeIesIr0hllh1u0xvAeo=;
        b=GisloqkKLsXVHyR80uKGf89BW3DRAuXOIa/+j3gzxB7+0V/zBHtzWFcBOJo4S3DypX
         /PMRLFeSHmCzHM6m4xaJJhbIL6WLfiSCfvm0H4N3nLi9HGKGLW0lM6nXmoHtWBWY5Yav
         Joho30AlBcZ898RVN+Agdb0SC9vbIdDl+G3eLcpvKkk1FzgSV2Cn8loFw6tbnHqab+f5
         KxihfVHZLW104gPoI92F13/jGgiv0/iH5tc15EUaDHTnGV7HSssE/gOpnCuNCvPARTkD
         KG5D4IDniISLtdA3g6kbL5CZ3gNpe2VO8AJCR8F/8cpNJRdd9QTXfibUCZjw3NmGUBKX
         wMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9ERZK7j3YpQlisKqhZeF+sAGeIesIr0hllh1u0xvAeo=;
        b=LZrURlS1ohzGj5d7uPjnE9ic6pHEEdQX9LPt8yCunZ8xjS6JkBJQfGgUpZS3qKYgjH
         1nqHtK8p0Br2FD3J9qiKq9KFNT5YdueN3igoVfiAD60nrhSo2TpRhJZ8wcOOm+tuqrx4
         Y02dm5G2b3pZEjj8DPbdohyXzQU3GjuBoxkkjd8gDO4a1s9vcQEOQnCRuMDMFZJ73YsW
         n12NQBlmWRJ0j8Z4T9VkGM3qxLNHT7sN5mkChr7/7aMdhnD2Xfg8nKgS2pc7wr1pU4Qo
         DhfwOw7IxEuKE6DKQxp0C/WBzCGdNjylTNXvSNMmpNpG24jF/6e59FIauRP1lIqctjgc
         WIow==
X-Gm-Message-State: AOAM531EcoQ6fLvq1NAsflGbT457WHfho/O04oS2t/xHoNX1L83/Yh0/
	vGpsejCUJrqHPmPt0PxvM/O9xw==
X-Google-Smtp-Source: ABdhPJwNIC7OHjQZzb2cBkxrO790o7WfLWgfvfgp6MJCslTLAKTE76XfV0upxdLROYK/yZpG++L4EQ==
X-Received: by 2002:a05:6000:111:: with SMTP id o17mr16296167wrx.178.1593410881735;
        Sun, 28 Jun 2020 23:08:01 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from nikaia.localdomain ([2a01:e0a:1b9:3e10:d6af:c5d9:8b6e:b994])
        by smtp.gmail.com with ESMTPSA id f17sm29146080wrq.3.2020.06.28.23.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 23:08:01 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] checklayer: parse LAYERDEPENDS with bb.utils.explode_dep_versions2()
Date: Mon, 29 Jun 2020 08:07:54 +0200
Message-Id: <20200629060754.167539-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAYERDEPENDS is a string of this format:
"DEPEND1 (optional version) DEPEND2 (optional version) ..."

However when we parse LAYERDEPENDS in _get_layer_collections() we
parse it as a simple string, and if any optional versions are there the
'depends' field is wrong. For example, running yocto-check-layer
might result in such errors:

ERROR: Layer meta-python depends on (>= and isn't found.
ERROR: Layer meta-python depends on 12) and isn't found.

Let's use bb.utils.explode_dep_versions2() to parse LAYERDEPENDS, and
create a string that contains all dependencies, effectively
skipping/ignoring any optional versions.

[YOCTO #13957]

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f81f07afc200fe06c5c06ea81a4f8a3a43436faf)
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 scripts/lib/checklayer/__init__.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 1138000275..f625d59896 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -59,9 +59,14 @@ def _get_layer_collections(layer_path, lconf=None, data=None):
         pattern = ldata.getVar('BBFILE_PATTERN_%s' % name)
         depends = ldata.getVar('LAYERDEPENDS_%s' % name)
         compat = ldata.getVar('LAYERSERIES_COMPAT_%s' % name)
+        try:
+            depDict = bb.utils.explode_dep_versions2(depends or "")
+        except bb.utils.VersionStringException as vse:
+            bb.fatal('Error parsing LAYERDEPENDS_%s: %s' % (name, str(vse)))
+
         collections[name]['priority'] = priority
         collections[name]['pattern'] = pattern
-        collections[name]['depends'] = depends
+        collections[name]['depends'] = ' '.join(depDict.keys())
         collections[name]['compat'] = compat
 
     return collections
-- 
2.27.0

