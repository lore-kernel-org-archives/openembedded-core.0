Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85174C7EE39
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:35:08 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.13234.1685712901995388716
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=iUkd7/6D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3078a3f3b5fso2047761f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685712900; x=1688304900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+07BB2F06dmMl33PwubqMzCPIremYoAqfE9RxL6LqGU=;
        b=iUkd7/6DtCwMjA+Kz8zLNasFQbEMGWsnVuUtT7X/PSUxVCFnOTliRxjYALTj+On+UR
         XQ9TWCOD0xKPUMZ5gRG9iGIHeh6mRGBY+jMQd3Nwjjk5eMuxzkeyTCggExAFwTrUWzoY
         49MYr/+AA/eyTGyQzBZlDQySdJeyXZsSQHSXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685712900; x=1688304900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+07BB2F06dmMl33PwubqMzCPIremYoAqfE9RxL6LqGU=;
        b=LJ7vubMCxl4EHJDimlcXIGv2TI0msiDOy+UA2YYtOt7DbBP/7EXRkdRkupC5B0Qntg
         +HKEXEgKROO6gPwNSurqjsay49ejnocw7UuFgsvs6EStVRcAtuf/JFWml1qOBsWHOE0p
         Ef3qgJbkH9uZUlwHNUaOYBKB/P7rG2CNyUtZ8hyechm7vxf96PlTAotqHle2RDaiuZcM
         CXcgJvjgn7sCFsZS0aGo0vW0YRgj3s8+2rFCo2UJMfBSmfQBegRCmZ8484tS5L1cLQh2
         Up5k/Qf6jKoJD3qvHWC/dvA/ojIxPNmoU8RM6dD0VMLVncE9RpF4W0aZEem+hNsdu1il
         rN9w==
X-Gm-Message-State: AC+VfDw5QCPHkZRU5fed5kWp+uG9tTL1EC46LFgqEjckOv4J3WdC/u2k
	a97ZZv7zqeryRXfGDGHwpssUIyEd1Bq2Pf6Daz0=
X-Google-Smtp-Source: ACHHUZ7fdWLXphDx3yJcAcG0Gf6TZF7teDQWnm8Lha57cV4ascsFCe/LG+qvucO42I3CyYgSqSD01w==
X-Received: by 2002:a5d:61ca:0:b0:2fb:1d3a:93ff with SMTP id q10-20020a5d61ca000000b002fb1d3a93ffmr4956720wrv.61.1685712900382;
        Fri, 02 Jun 2023 06:35:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id z10-20020a056000110a00b003063a92bbf5sm1734262wrw.70.2023.06.02.06.34.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:35:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/11] create-spdx-2.2: Add missing variable exclusions
Date: Fri,  2 Jun 2023 14:34:48 +0100
Message-Id: <20230602133453.229023-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
References: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:35:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182324

Some variables cause issues with taskhashes and are accounted for in the
output in other ways, or don't affect it. Exclude these to improve the
taskhashes with create-spdx and allow the sstate selftests to work better.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/create-spdx-2.2.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index b8728c5705b..7569f8792b2 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -338,6 +338,8 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
 
             package_doc.add_relationship(pkg_file, "GENERATED_FROM", ref_id, comment=debugsrc)
 
+add_package_sources_from_debug[vardepsexclude] += "STAGING_KERNEL_DIR"
+
 def collect_dep_recipes(d, doc, spdx_recipe):
     import json
     from pathlib import Path
@@ -684,6 +686,7 @@ python do_create_spdx() {
 
             oe.sbom.write_doc(d, package_doc, d.getVar("SSTATE_PKGARCH"), "packages", indent=get_json_indent(d))
 }
+do_create_spdx[vardepsexclude] += "BB_NUMBER_THREADS"
 # NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
 addtask do_create_spdx after do_package do_packagedata do_unpack do_collect_spdx_deps before do_populate_sdk do_build do_rm_work
 
@@ -854,6 +857,8 @@ python do_create_runtime_spdx() {
             oe.sbom.write_doc(d, runtime_doc, d.getVar("SSTATE_PKGARCH"), "runtime", spdx_deploy, indent=get_json_indent(d))
 }
 
+do_create_runtime_spdx[vardepsexclude] += "OVERRIDES"
+
 addtask do_create_runtime_spdx after do_create_spdx before do_build do_rm_work
 SSTATETASKS += "do_create_runtime_spdx"
 do_create_runtime_spdx[sstate-inputdirs] = "${SPDXRUNTIMEDEPLOY}"
@@ -920,6 +925,8 @@ def spdx_get_src(d):
     finally:
         d.setVar("WORKDIR", workdir)
 
+spdx_get_src[vardepsexclude] += "STAGING_KERNEL_DIR"
+
 do_rootfs[recrdeptask] += "do_create_spdx do_create_runtime_spdx"
 do_rootfs[cleandirs] += "${SPDXIMAGEWORK}"
 
@@ -1125,3 +1132,5 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
             info.gname = "root"
 
             tar.addfile(info, fileobj=index_str)
+
+combine_spdx[vardepsexclude] += "BB_NUMBER_THREADS"
-- 
2.39.2


