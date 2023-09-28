Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1DACE7B08
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 18:34:25 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.522.1695926062450343336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 11:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=esvGJglj;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1dcead29b3eso5089598fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695926061; x=1696530861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4GnoGu93L17tBIoA0spmKEgywsyhqEphM3HlKoPUGNg=;
        b=esvGJgljzK52uYAkdnUPt8SI6pekitl05AsxshlgHB6OWaHXGZ+ZqTsoQlMT/OjD69
         9xLpWFyREeGpdfIUlGa7B/lUt6Go3a5Huij7cKz0IPrgMiH4CXigjnf0OPwJA2iL4JUm
         iWc7VtJ5VGQTUPh7n/LXxqRhBpfK6G7q8RWsWM/CuIdjFtS/niC744NiGT3A51NbkYIf
         ExYp4sA1bqxu7ocwsL76tA1l/P5MiiTGuj7esmcprxYTsice5513nTlewjV5aeb7yraJ
         JgkXZbtSSDZxEDGwsKvo+gd3MtCc54IHv838jFw+MO6Vb9u5mRBNVX+ZpUsdbT0CeEsH
         Y21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695926061; x=1696530861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GnoGu93L17tBIoA0spmKEgywsyhqEphM3HlKoPUGNg=;
        b=mwkNF4exFxC78YMIwhwFl80j3u9/fmcYE3XEs4HopGxO7/wiDaHxYuST87tBo7/e2a
         RTFt6R5Lpd8ya9Re6l7D4A8fGYO0ykBqm2CaAP8octmPw04J9Q6KB9YDaGlo5+QsNuBm
         UVELBaFF3t3F3cRJj9EqPJJyFhkRoxoaDqmMs5pvPaFvsvpn+aNlGCTihT96MyuDmDxd
         ZvswfAYpS39AvTovDv0uul+TaDZ1MfOl0ceD1825BiuRWbVG75rqHyg7Jt+f+lCdt1by
         p8I9U95A6y4jz+4lzCzNkqTMpElkWDhbhc7kP4H/pA4GXhALk9p7+56ihLWX4i18M2Ux
         XDMg==
X-Gm-Message-State: AOJu0YzvGINlEXhfzvsFwMRc+rymRN1j8iY+fn9BsahOhCouNQJbAuni
	xIoGV+m6BHiR9llLQ8dAhwT2lZMvP/w=
X-Google-Smtp-Source: AGHT+IEM8dDP3SCGuBd0FmRWDibWOW6kBEWogI1ColkveRB9bitX3rGSVYNbqfZeZS1gvAJ40ojV/w==
X-Received: by 2002:a05:6870:4712:b0:1d6:567c:deb4 with SMTP id b18-20020a056870471200b001d6567cdeb4mr2381762oaq.42.1695926060674;
        Thu, 28 Sep 2023 11:34:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::f27c])
        by smtp.gmail.com with ESMTPSA id v5-20020a056870954500b001e0fd4c9b9asm366251oal.6.2023.09.28.11.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 11:34:20 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/create-spdx-2.2: Show error if document is not found
Date: Thu, 28 Sep 2023 12:34:13 -0600
Message-Id: <20230928183413.19512-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 18:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188378

As in other places, print a more helpful error if a SPDX document is not
found when assembling documents for the final SPDX archive.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 3ee1b7ee0d8..b0aef80db16 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -1131,6 +1131,8 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
                 for ref in doc.externalDocumentRefs:
                     ref_path = oe.sbom.doc_find_by_namespace(deploy_dir_spdx, package_archs, ref.spdxDocument)
+                    if not ref_path:
+                        bb.fatal("Cannot find any SPDX file for document %s" % ref.spdxDocument)
                     collect_spdx_document(ref_path)
 
             collect_spdx_document(image_spdx_path)
-- 
2.34.1


