Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D989C77B73
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 06:25:49 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.5829.1685168739736297783
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 23:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IBiEpX3w;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f68fc6b479so15820945e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 23:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685168738; x=1687760738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2irKUYwyYh1dcWlnjohfgaLhlT8ND93pcpRz1tlDtpw=;
        b=IBiEpX3wFvlEqQ1IW24jMK6QVDnz47ZtEkC4Bt9WfmFVak0xZTwEXFm5wvX6vEyWBa
         FkUaUabQSRx6ApGvgtcvzvUdJ6jXWFDFQT5s5pv8kpbvkpn5bpNvF+tMbSZabF9/gcVF
         YZZMSU4ddQnekhY3j0k6E3VMPuFWR1YYcVLEJRsdmGw7G0vcC791hsgoKWCLoguXbMhZ
         /WTjLOpliFAB8XZHaVy0cca6p9KWWw48V82Q0sqJ10svzRhdG1x9Al3Y+rVCohsTjdlM
         YDjFyiZxht2fBFiDoRlAYeV6tq/VWga5/XvUBpRc8ZfMVLJpnpEsPn4WQy6ov8lJ9zu9
         Mjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685168738; x=1687760738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2irKUYwyYh1dcWlnjohfgaLhlT8ND93pcpRz1tlDtpw=;
        b=Jq/+FFfhpA6hU0tKMr1YzcvtAEBynHg/+j1T7B0VCsiTxXbpb+pRoOvsREnDD+S81u
         zLSDGL6GTZiaLSIGkiK7HQAAo4SrPHoH3+IdbiqSHW75jBgyAoN5qdXcnbdgxnMZDqSL
         YJqyuyVAfFNWRC5jUCkUfcjCBxS9kPlyFnL5sKZbAR5UyWqeIXYQ27lGzHM0UPCXv/Wc
         8sXWLHlYy4mt7w/GFdo9P3o9MFqZznI5e4pbsTP5502oB8e1lc8OUPw+QNMZcqamHr1t
         pug6hZYAPs4CA9z+N79GLLEhRiN4M+7ELvWR2ZVsaUQSoQHtA/501dRZpaCTKamDNIFS
         79sA==
X-Gm-Message-State: AC+VfDwibF9gu0telf2KzOFpMlSBkzLh8ija8OxF8pwI7mnEtfDOJzDi
	0i0wpffMjf0juFQ516evf4dy6SkNrx78MVN0
X-Google-Smtp-Source: ACHHUZ58xKvlAmpYKZIgEeyqP3SXyLPO0pGWldONu7rVJIqJ5V4P3XWY2+JfuYI4p0HYJhNTd8SV5Q==
X-Received: by 2002:a05:600c:2111:b0:3f6:3bb:5132 with SMTP id u17-20020a05600c211100b003f603bb5132mr3096649wml.24.1685168737629;
        Fri, 26 May 2023 23:25:37 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-f2b0-7c97-e26b-fbea.rev.sfr.net. [2a02:842a:2e:7001:f2b0:7c97:e26b:fbea])
        by smtp.gmail.com with ESMTPSA id e21-20020a05600c219500b003f4fffccd73sm7347071wme.9.2023.05.26.23.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 23:25:37 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: e.aubineau@technologyandstrategy.com,
	f.lahoudere@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [kirkstone][PATCH 3/5] recipetool: create: npm: Add support for the new format of the shrinkwrap file
Date: Sat, 27 May 2023 08:25:30 +0200
Message-Id: <20230527062532.938477-3-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230527062532.938477-1-m.belouarga@technologyandstrategy.com>
References: <20230527062532.938477-1-m.belouarga@technologyandstrategy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 06:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181793

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

The shrinkwrap file changed its format, but npm does not version this file. So we can use it properly.
The actual changes make the script check if the npm package has dependencies in the actual shrinkwrap format.

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
---
 scripts/lib/recipetool/create_npm.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index e667a4d19b..25e7ddb472 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -134,11 +134,10 @@ class NpmRecipeHandler(RecipeHandler):
                     licfiles.append(os.path.relpath(readme, srctree))
 
         # Handle the dependencies
-        def _handle_dependency(name, params, deptree):
+        def _handle_dependency(name, params, destdir):
+            deptree = destdir.split('node_modules/')
             suffix = "-".join([npm_package(dep) for dep in deptree])
-            destdirs = [os.path.join("node_modules", dep) for dep in deptree]
-            destdir = os.path.join(*destdirs)
-            packages["${PN}-" + suffix] = destdir
+            packages["${PN}" + suffix] = destdir
             _licfiles_append_fallback_readme_files(destdir)
 
         with open(shrinkwrap_file, "r") as f:
@@ -234,7 +233,7 @@ class NpmRecipeHandler(RecipeHandler):
             value = origvalue.replace("version=" + data["version"], "version=${PV}")
             value = value.replace("version=latest", "version=${PV}")
             values = [line.strip() for line in value.strip('\n').splitlines()]
-            if "dependencies" in shrinkwrap:
+            if "dependencies" in shrinkwrap.get("packages", {}).get("", {}):
                 values.append(url_recipe)
             return values, None, 4, False
 
-- 
2.25.1


