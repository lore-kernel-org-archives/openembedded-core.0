Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.9672.1628087063316509956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 07:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RMRufoV6;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id i10-20020a05600c354ab029025a0f317abfso4065041wmq.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 07:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i54VJmv/rxLB3uf/DmrxkGZ4DImi4wH2xy4vgJs/k5w=;
        b=RMRufoV6AVNyXq8ri1WI4zXorEmbhtcWnco7R/iK94dwjXv9qNaZ7OI9N4i4WNMMMT
         oarcwbZqAHP+04ZETrH8lCrVYx/prXItgEk3u130DPy3O7s2FIFRwzMf5DaLqPrympUC
         1IYaHJGJXA3eADxq40Mj3oqVeOicpNc6w+kHBHg05bc7SK6lMq+t5rBvlyCllOJZSy5e
         AUL60PJ0zOAcMPW1U7kjfum2EV6FLDSy6wfV1KwTxdt5R7OeSB0ZmM1cQgLXYuQakCeB
         2ncgSZnZxdH4HRoPoDS1mQSMJRm1BMz6Qk8cfujHLYu5kuxwjvhAgmHZaxpQYUx0ervS
         DRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i54VJmv/rxLB3uf/DmrxkGZ4DImi4wH2xy4vgJs/k5w=;
        b=MfRHPCbk8RBxTMXOUB+bLxguTr+JYMAv19EqnmKNjabvBAXKm7qtM8tCBDAePq4sB4
         MStRomzZ5MedtozWFlInBPtKqG2NzpqJormWjoDVimv2ovcT45ZrF0Og3wasyL3SYZYz
         Nk8CoRdjKtssWbaGPo+PHw0OibldS8/cMZSyrM+KY/k//zVvTv/ZIVQNQ/2H/0EW0KpR
         OrqvlLB3i52qtl7lJopzPqoJKz6Dn4eFDiRVTBbvTRVqdrmWdb/a0cnooiLAm4rAP61W
         RtvID0oqsx+UAjbRe82l+gAD+SrhmJbr41Fg1P1Apd61MH0CYEpJKeF0P2r+/zQNHGfy
         LrzA==
X-Gm-Message-State: AOAM530u08D/mkbc8sszt2hp3qzroX+++wuOY+n++WETGuH1Ety+hchN
	JDZ7zLz2Cc9ScWhbi3TjVJVrf+1ZKTNrkA==
X-Google-Smtp-Source: ABdhPJyyImOcsCVQsTltp/L3cdPWwQu3glDBaGHmS7pcq89XznWkh6o1J+0fhrS1ITlU5ca49n+dng==
X-Received: by 2002:a05:600c:608:: with SMTP id o8mr27345488wmm.104.1628087061489;
        Wed, 04 Aug 2021 07:24:21 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g16sm3165511wro.63.2021.08.04.07.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 07:24:20 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] convert-overrides.py: allow dots before override in vars_re and shortvars_re
Date: Wed,  4 Aug 2021 16:24:18 +0200
Message-Id: <20210804142418.251658-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

e.g. VIRTUAL-RUNTIME_com.webos.service.flowmanager_armv4 weren't replaced
with VIRTUAL-RUNTIME_com.webos.service.flowmanager:armv4 or when package
name contains a dot like in:
RDEPENDS:gstreamer1.0-meta-base:remove

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/contrib/convert-overrides.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
index 1f395deeeb..97debb6298 100755
--- a/scripts/contrib/convert-overrides.py
+++ b/scripts/contrib/convert-overrides.py
@@ -69,11 +69,11 @@ packagevars = packagevars + imagevars
 
 vars_re = {}
 for exp in vars:
-    vars_re[exp] = (re.compile('((^|[\'"\s\-\+])[A-Za-z0-9_\-:${}]+)_' + exp), r"\1:" + exp)
+    vars_re[exp] = (re.compile('((^|[\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp), r"\1:" + exp)
 
 shortvars_re = {}
 for exp in shortvars:
-    shortvars_re[exp] = (re.compile('((^|[\'"\s\-\+])[A-Za-z0-9_\-:${}]+)_' + exp + '([\(\'"\s:])'), r"\1:" + exp + r"\3")
+    shortvars_re[exp] = (re.compile('((^|[\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp + '([\(\'"\s:])'), r"\1:" + exp + r"\3")
 
 package_re = {}
 for exp in packagevars:
@@ -122,7 +122,7 @@ def processfile(fn):
         pass
 
 ourname = os.path.basename(sys.argv[0])
-ourversion = "0.9.2"
+ourversion = "0.9.3"
 
 if os.path.isfile(sys.argv[1]):
     processfile(sys.argv[1])
-- 
2.30.2

