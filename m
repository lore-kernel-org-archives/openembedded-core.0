Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.6575.1593174586993809252
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 05:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZMURQrkk;
 spf=pass (domain: linaro.org, ip: 209.85.221.67, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f67.google.com with SMTP id h15so9317839wrq.8
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 05:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hLDRcNzLz0RDFTNpOIeSdNlOP5DQK0uV+lLWENiJ1TQ=;
        b=ZMURQrkk+Lruh/Z2NKlcKDKOxIN1nvB47uT2CFSX24FcL8qcKn9644Qd22bRpicr6d
         sjL4y96HVHkyL0puL3iw8K2pvDrGbhem8VH18brn+XG5oLSxfmId8YsfrSBbF1C0ou6E
         wmCZemIa04m1+CP41lA6x/zZ70VuBb0ybXLGegcfHQPgsZ5kmmHrLkJXavSXBygxNvUN
         c2CbY039tkAqodg9y3QwbQ0Oo7eb8fBe+RoKDlIM640uKlf3PyjmI4vCrDWJbonoWTpQ
         c0zaeFbPNP1iUwzc3V/pDcr52SJKEZ6EkeW+kS7lGHjsECFScuT26mKdg5R6IugHcx3h
         aAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hLDRcNzLz0RDFTNpOIeSdNlOP5DQK0uV+lLWENiJ1TQ=;
        b=Q6Cep5ZS7+O8f9NWSczakXUxw/7dSuq/FZmbp+VLWUK3TVqve2c+ncjjHPuaVs/tso
         ehabuZys+FrQj4pxJ4c6ftwnvbVIH2nZaCtdOJf++i536tUxpMfMBLFQddhEbF8qg3hy
         /O63RkTJwcEY5I+hzxJVVW2F+sQsm53eteyfwrRZFtkwM8kinVAX+8VlzN3Bu8E5mK5H
         pcwhkQphBDuhCvt676z3SueYlHi4tEBduHMICKxoV6xdB8DWCvbI03praqjYPl4EjHHx
         tcxjE8d1oUNBefudruRz/3J1XgtEdro1662UNmcvsfT1kQotbzf/2xPN3brrlljYOVMq
         hKkw==
X-Gm-Message-State: AOAM531ltq9++nVrMFIJu1cYwGL1mPCOnK3QCZVI/lJdbOf12teTIWwh
	hqBute8Qt+YAVlUnxOldoi1ReaF3Xe0=
X-Google-Smtp-Source: ABdhPJxbhZOALw6/5ArHBuv8kMj6YulsHZuLA9IeMqIy6bjlLWM6rGX2ZtXQMU+AoPPzFTDooACP1A==
X-Received: by 2002:a5d:69c5:: with SMTP id s5mr3529760wrw.197.1593174585142;
        Fri, 26 Jun 2020 05:29:45 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from qcom-hackbox.linaro.org (static.8.26.4.46.clients.your-server.de. [46.4.26.8])
        by smtp.gmail.com with ESMTPSA id h18sm36236454wru.7.2020.06.26.05.29.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2020 05:29:44 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org,
	christophe.priouzeau@st.com
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH v2] checklayer: parse LAYERDEPENDS with bb.utils.explode_dep_versions2()
Date: Fri, 26 Jun 2020 14:29:30 +0200
Message-Id: <20200626122930.21192-1-nicolas.dechesne@linaro.org>
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

[YOCTO #13957]

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
v2: 
check if depends is None before calling explode_dep_versions2()
add Yocto BZ number

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
2.20.1

