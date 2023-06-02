Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B55BC7EE3A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:35:08 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.13232.1685712900813745672
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IbVLmXV6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-30aa1eb95a0so2099625f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685712899; x=1688304899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3yeS4RdBIE6jJ9bW2aOkbiHNkgwrOmJSuKeV9jYuwk=;
        b=IbVLmXV61LFNLcFdO1TzILazSCDarTdvpvVodzjRLrazP8qk8JVQDaXKBjLbauKhqN
         Nwwlr8e+RaLy/U/1wVLz2y5SUgeOh/WMIPIvV6KNQWfnb+FTRd+4F9D4qtWH+wlk+/Ly
         muXglu3n7Wjihfyet3svK2wjWqG21GY7sHouY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685712899; x=1688304899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3yeS4RdBIE6jJ9bW2aOkbiHNkgwrOmJSuKeV9jYuwk=;
        b=MTYTdTnyluUQVS77+2MvWa/7QW6lKysRrMtrqbkZs3jIeiLjuB6Ng2ZH1XY6C8Tolu
         OJ8lxMjRWzdcAN2FDHI0C/+vRZCYQiOPh0Kk3vt7IARfnUEafDnUKUOrEVoXOoyUguIy
         VVB0EXC+RwB7QuQmwK7+Ymqsg6INDZzXZmDEkE72zho1gSkxx+U+6aZ9Q+sQBdNoh6MU
         vMVKK3hp9/FdZ9LzoBhqdwqnaCVFYRFyr6l1Jgp8VXVeZvbl2aP1DWoaRvmExS4QJXlt
         iPWwyUN+2pNP6mKdaHIfgqwjnbjiRZ9SqTwiZNotGaFsdWjxywswfsM76hfD7Uk7kdMa
         0quA==
X-Gm-Message-State: AC+VfDxX5rVE/6PPrgrrfj4NtzeJXKHtdyAYp1XOvjD09FHy2yY/7iZ4
	RF2TxzdfyBMpK3H0wnEC1ZqEsE+nW73vETjSqdg=
X-Google-Smtp-Source: ACHHUZ58KEVfitx+lgxTY2GIyZBxg2zMhQNLnvHxZCoY6tcyeYJWLDgs5KQ5LJwEwFGI4csNkPB+jQ==
X-Received: by 2002:adf:f9c9:0:b0:30a:bda7:f16f with SMTP id w9-20020adff9c9000000b0030abda7f16fmr54301wrr.0.1685712897187;
        Fri, 02 Jun 2023 06:34:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id z10-20020a056000110a00b003063a92bbf5sm1734262wrw.70.2023.06.02.06.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:34:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH 04/11] classes/create-spdx-2.2: Fix runtime dependency calculations
Date: Fri,  2 Jun 2023 14:34:46 +0100
Message-Id: <20230602133453.229023-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
References: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:35:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182322

From: Joshua Watt <JPEWhacker@gmail.com>

Fixes the runtime dependency calculations to also only follow direct
dependencies of the current task instead of all transient dependencies
in a similar way as the build time dependencies.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/create-spdx-2.2.bbclass | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index c461c77744a..f9cb3add387 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -454,7 +454,7 @@ def add_download_packages(d, doc, recipe):
             # but this should be sufficient for now
             doc.add_relationship(package, "BUILD_DEPENDENCY_OF", recipe)
 
-def collect_deps(d, dep_task):
+def collect_direct_deps(d, dep_task):
     current_task = "do_" + d.getVar("BB_CURRENTTASK")
     pn = d.getVar("PN")
 
@@ -474,8 +474,8 @@ def collect_deps(d, dep_task):
 
     return sorted(deps)
 
-collect_deps[vardepsexclude] += "BB_TASKDEPDATA"
-collect_deps[vardeps] += "DEPENDS"
+collect_direct_deps[vardepsexclude] += "BB_TASKDEPDATA"
+collect_direct_deps[vardeps] += "DEPENDS"
 
 python do_collect_spdx_deps() {
     # This task calculates the build time dependencies of the recipe, and is
@@ -489,7 +489,7 @@ python do_collect_spdx_deps() {
 
     spdx_deps_file = Path(d.getVar("SPDXDEPS"))
 
-    deps = collect_deps(d, "do_create_spdx")
+    deps = collect_direct_deps(d, "do_create_spdx")
 
     with spdx_deps_file.open("w") as f:
         json.dump(deps, f)
@@ -710,10 +710,7 @@ def collect_package_providers(d):
 
     providers = {}
 
-    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
-    deps = sorted(set(
-        (dep[0], dep[7]) for dep in taskdepdata.values() if dep[0] != d.getVar("PN")
-    ))
+    deps = collect_direct_deps(d, "do_create_spdx")
     deps.append((d.getVar("PN"), d.getVar("BB_HASHFILENAME")))
 
     for dep_pn, dep_hashfn in deps:
-- 
2.39.2


