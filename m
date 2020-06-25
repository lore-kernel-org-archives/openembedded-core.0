Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.5938.1593071996847276078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 00:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=x81fk2I3;
 spf=pass (domain: linaro.org, ip: 209.85.221.68, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f68.google.com with SMTP id o11so4790182wrv.9
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 00:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oGiBEzmAD6cBcNsyM6ToUK7j8yUlmrnXoMMB4cutA1M=;
        b=x81fk2I3W/dLp7Whv/qLcUKdRmUrMFm6MPj93nYiAY25acN0GLIVX/upNgvUtW2Z9Q
         guRKNbqFCJkllHRzdpWRmi0AW2RnyAU9qxySr14KC1KRr/t03hmhUN+uv0IQ2PD+jUJl
         FXNvN/c3J+ZvjocuWd1P2Y4/suBgDIU/fnctLYfAnniK+6uqKiMHtg6FEVmaz9UlEvS8
         /hrFqurE9CHwAz7+iI05m0QcWWZ0EO7FDOImwwQ0U2oVnS2+pdOZMEWpFSy+be8XiMI0
         NZum8K77Ug0gEomB9d/PJLp3JItO5Nbj7QBdJd0xrRGCbh+k5WiJ8DZrKoss7mUNAO1N
         8peQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oGiBEzmAD6cBcNsyM6ToUK7j8yUlmrnXoMMB4cutA1M=;
        b=CC2QadDTVUyiS/rY8m4+rWQAqJsb63RjLyrtRLZIOsLr+ISzxtBlkaXNU+2yU8JIUK
         rQL+ommuk+zTLJYEwnUhY5zn8335fhWjHj1UR3UQtfOcmFJcrucGzLa2vAwm5E/BUe05
         kviO9vByUthaFK9nu7cjZ0m2u5mjzTLtxIbJuIZEoKbfVQetPAQ1tlxNguHPrPJqDP/V
         Gp05h5z1cL3jPXnaDg8gK30DoLo+5KEeeV6TTr0S3KsTsft+B3w1t8A4nI7DFsrENEL8
         9mR6i4ayBQeBxVQry8YYsg8gt/VtVNq5Glvh/Pu9++x/rBE03kcKSor3P6VM4f6nSIIq
         qQBQ==
X-Gm-Message-State: AOAM530r4Lf2pdVaillz7VHNwrX7SLf4ztzC2oLijaaHeuKDOl7bZqTf
	Kjb7vFSobhvNwPWyhSA/nxrI8wm4yANF7w==
X-Google-Smtp-Source: ABdhPJwsrn+ePG0blgXN5FQ7fOglXsIKAp9mlu9maXk1UIBdypxmqKPM6NhfiOa87buMV6CQE9ziRw==
X-Received: by 2002:a5d:4d8b:: with SMTP id b11mr35671243wru.341.1593071994920;
        Thu, 25 Jun 2020 00:59:54 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from qcom-hackbox.linaro.org (static.8.26.4.46.clients.your-server.de. [46.4.26.8])
        by smtp.gmail.com with ESMTPSA id m10sm12074833wru.4.2020.06.25.00.59.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jun 2020 00:59:54 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org,
	christophe.priouzeau@st.com
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] checklayer: parse LAYERDEPENDS with bb.utils.explode_dep_versions2()
Date: Thu, 25 Jun 2020 09:59:27 +0200
Message-Id: <20200625075927.21983-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.20.1
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

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 scripts/lib/checklayer/__init__.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 1138000275..0e5234808e 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -59,9 +59,14 @@ def _get_layer_collections(layer_path, lconf=None, data=None):
         pattern = ldata.getVar('BBFILE_PATTERN_%s' % name)
         depends = ldata.getVar('LAYERDEPENDS_%s' % name)
         compat = ldata.getVar('LAYERSERIES_COMPAT_%s' % name)
+        try:
+            depDict = bb.utils.explode_dep_versions2(depends)
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
2.20.1

