Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B547CC7EE2F
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 12:07:20 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.5985.1685168253900791776
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 23:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=M/8Xu0oq;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-30957dd7640so845266f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 23:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685168252; x=1687760252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2irKUYwyYh1dcWlnjohfgaLhlT8ND93pcpRz1tlDtpw=;
        b=M/8Xu0oqe759Fz8f1+sLxhtgKwLXGFq1DvlLCMGTsi0OW4gsPuY/6qdR0kx7LVzwmY
         eFcuKMl9D6hCDUorT+TdWJdElG4XpcmEuvrobixc5mI+NMKioQr4LRYbwapXbLcX1ACb
         wIBmnwZb3CuvRDwThXVUdm4HMcJl2C9wR52kkQz3TTdgYNQ9uTonu9jKxcTWPNugOHYq
         VkWOmbji8vrbgwnY1P2r/LY1i0L23dJM6ZYXF1W4AEttGilCBqutTxTTYwS/mC1TIkMj
         RriFZWeFWZzvXz8APUU6fmYHU6o9DGqMU4OEZAfup+lNe9LWDgK44ez3Zh8y2hRPxw6w
         cftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685168252; x=1687760252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2irKUYwyYh1dcWlnjohfgaLhlT8ND93pcpRz1tlDtpw=;
        b=KKa7POwqC58pC3mnwHnAuwocMVvbEZCVoaEtoYpEwk8jnXDIS+mE8t8021cKJjRDzg
         Wew9aLQHygU1dmhk+wlL6Vd7ocPVHMznVWnexQ8Y4drhLqIdT4jYCL8c75j3CBLyi5Y+
         n4InPhtBMScXU94FxmGsnqfb7CoFO5t+MAXbHMkTuWOvbC7dfEvuyc1yksM/NOVP69aT
         Cqe+LORjjwJyTWLtrVlSy3g781WEF+x6BjqTRUJq5Q4nipna0ZyCRhS1tipPEGeDr59b
         9lMxTSGSyB6Qovzp6xSXmiJxD84s49cTyv7BxW4CwGMuePFF46JP8pkAsVsI3lYkmOzQ
         50ew==
X-Gm-Message-State: AC+VfDw2HXyVbgkQJvdo9A0VyX2/WyXw+tOCxJsSybJitHre7w45nQa/
	UnjvNh0KZvZHqHVYHK6vmctfNEPedLr4nXkx
X-Google-Smtp-Source: ACHHUZ5jd+H+T6auJyGPpK/a99EXJW1fGUOh76C6GLH16XOsgQqUprFgxPILGKSIa0SH/k29SQkrUQ==
X-Received: by 2002:adf:e4cf:0:b0:306:475d:92ff with SMTP id v15-20020adfe4cf000000b00306475d92ffmr2347398wrm.3.1685168251717;
        Fri, 26 May 2023 23:17:31 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-f2b0-7c97-e26b-fbea.rev.sfr.net. [2a02:842a:2e:7001:f2b0:7c97:e26b:fbea])
        by smtp.gmail.com with ESMTPSA id e8-20020a5d65c8000000b0030649242b72sm7014623wrw.113.2023.05.26.23.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 23:17:31 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: e.aubineau@technologyandstrategy.com,
	f.lahoudere@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [kirkstone][PATCH 3/5] recipetool: create: npm: Add support for the new format of the shrinkwrap file
Date: Sat, 27 May 2023 08:17:24 +0200
Message-Id: <20230527061726.937747-3-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230527061726.937747-1-m.belouarga@technologyandstrategy.com>
References: <20230527061726.937747-1-m.belouarga@technologyandstrategy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 12:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181800

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


