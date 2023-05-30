Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46109C7EE24
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 22:28:28 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.32.1685485698764451858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 15:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=soqAgaRH;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f6d38a140bso2819625e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 15:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685485697; x=1688077697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2irKUYwyYh1dcWlnjohfgaLhlT8ND93pcpRz1tlDtpw=;
        b=soqAgaRHQRqhs/wnMzAXFpX2f/jBqahJbYFggWctMOxp5uWtbrXIFFs6J8AvQhEzsw
         yEayiKBhITMFr/vXxATRmw7eTvZ2L+3H8cJPYSgtiHm/c8vor5bmSopmBCDvv3SRXCno
         c1y80hSG8ANQkKbXIJNbH5unzxxqBhMnDMlCHyRycE5mGvaDlELPYfwG0Hjf9kJUnnZ/
         KqRF7kOoDKW39hr1s/DueQupNkvTkI4WV1iptH9hLhH4rjo4K7UsAZFgPpEAqRGKCtIB
         3iM05tVOceXShTWG4c3/PY4074cavnpRClI+VHd85sqZaizyIj+CvNeA6jfand3bdrNa
         Ac6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685485697; x=1688077697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2irKUYwyYh1dcWlnjohfgaLhlT8ND93pcpRz1tlDtpw=;
        b=VCl1D4c5uAbFhLP5OCr8V+5JaWQ9iUc0Wx1DyoMoWT0HL0Za+PRV6AF+gat93VwGRn
         DAbOvhSL3dtMu6I4wsdQhChrf4MOeO5Q0qpeX/BS6g6VtIMsfA8FOAIG1mArwLCq4Doe
         bzvKs9a4wS0PiiHW9kDZ3ILMu8ZYCMtW3SSKOhJAm69MiRr9ZKHw8DK7VD7SKNIEGdDC
         7KPeYYVgHBra53NCHN9/PWDlWUsLgR3LH7wdVU4cqRzK0O1kLZJb79xuvdT0DqVQnekC
         /mCJC/D0fs1dlzheQ5JfOxnH0xSkF8CiuHyA8hJ4F3pWXXIILgW9Fk76fGpjluAkVXX/
         QcFQ==
X-Gm-Message-State: AC+VfDxCEs7A0/7bfby7vbgdxLvI43DE/N39nYeHS78fbySWVFWyKQcG
	IyIyQERkihyRXNn2DgMV1UtLZTopM6t7IqUs
X-Google-Smtp-Source: ACHHUZ5gBkc9S2HxdWuD7lZuBS7Ln6WdXMq3FU9k7Ssxnxqm3F94EbRi8WVz5JWpBKFpa7gGBKpRbg==
X-Received: by 2002:a1c:4c17:0:b0:3f1:731e:cdb1 with SMTP id z23-20020a1c4c17000000b003f1731ecdb1mr2912688wmf.6.1685485696916;
        Tue, 30 May 2023 15:28:16 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-af81-84f4-744a-71c9.rev.sfr.net. [2a02:842a:2e:7001:af81:84f4:744a:71c9])
        by smtp.gmail.com with ESMTPSA id f16-20020a7bcc10000000b003f60fb2addbsm22515276wmh.44.2023.05.30.15.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 15:28:16 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: f.lahoudere@technologyandstrategy.com,
	e.aubineau@technologyandstrategy.com,
	j.guignard@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [master][PATCH 3/6] recipetool: create: npm: Add support for the new format of the shrinkwrap file
Date: Wed, 31 May 2023 00:27:49 +0200
Message-Id: <20230530222752.42503-3-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230530222752.42503-1-m.belouarga@technologyandstrategy.com>
References: <20230530222752.42503-1-m.belouarga@technologyandstrategy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 22:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181963

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


