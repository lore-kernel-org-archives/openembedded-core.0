Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5C4C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 18:02:52 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.28467.1703095363595657829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 10:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gEWnOOLK;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-20403a18a51so757888fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 10:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703095362; x=1703700162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGh6fKBHcSKFGUTQ9/sOSaUkczNKza1Sq1squ/vu0N8=;
        b=gEWnOOLKoitXBaISJc6nUcL364Mpcp+5vk/sys6usmQOhUaaf57d+Rx8lLeERpF5DU
         aAi3Uo8TghMdhz3rO4/O8Ekl7LVLC85NtQZVy155aUyVHyTuWPJkXciKKlj8bzLR0GMO
         7m/LdH93in41NRY4Ud+iA7ambU3ActlcWuZHlF3waQw3jIHhF+dEZEiNi9Lpz8QnSZJb
         jLuX4EZc0LbNV+T7LdN+rCkxANGJpVeabNvjO3K8kiRzG7jNsxQ1744RhLsp/GNptCxZ
         b4a/B5v9LKIRU28hvjVjLTQfHeDfaeKCemXcO1CYKyWzpdV9iEryIOlEntNolf7r2PHP
         CqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703095362; x=1703700162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGh6fKBHcSKFGUTQ9/sOSaUkczNKza1Sq1squ/vu0N8=;
        b=mF8ZH6ReV3eZfZEfxguBy+40XtB5u+AKSb9fYY1+OlOhspdpurlAR12M76jUu2vM7/
         /94AIdrvcMvRzZpqvYIoQ/5kqXzsBGrSzznZhegMrVhalGag1D39UsO4V5MCq6klyz6r
         EITVvAYKoegrxlZEo5QQ95J1rfyYi+/EMxQBdmsRTWiQiZ1yjIn8aLSIsd+Au9xk5myo
         aRFe0NhmY4Mn6A9rJ/nYcEKIQTFeRLuA4XVi4QjUdMh2D2fhJsQyEdcml1WEXytnVAmF
         y92UeDqu32th1eqwcTSC6nA4vF8zFmu5U/T3WWJSvDYV83z+9lQQRbqN+9ypyUnKmZl0
         932g==
X-Gm-Message-State: AOJu0YwsXsJarnhkCzHh1ySBKidItxROviwJ55ee7FiLtFzTlClLE+u5
	HzCgdxu06U7990FVZhmw3arycz37R/E=
X-Google-Smtp-Source: AGHT+IHQ8jHek6Au8SnTYc4+YSHasu3A4HV5agBrKycqq4XFSiZqQQaOu/By1XlTShpIx9n/1EljSQ==
X-Received: by 2002:a05:6870:224c:b0:204:224a:1cc7 with SMTP id j12-20020a056870224c00b00204224a1cc7mr117864oaf.102.1703095361500;
        Wed, 20 Dec 2023 10:02:41 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::d6e0])
        by smtp.gmail.com with ESMTPSA id k11-20020a9d7dcb000000b006d8786f3510sm43976otn.57.2023.12.20.10.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 10:02:40 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][RFC 2/2] classes-global/insane: Look up all runtime providers for file-rdeps
Date: Wed, 20 Dec 2023 11:02:35 -0700
Message-Id: <20231220180235.3502418-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231220180235.3502418-1-JPEWhacker@gmail.com>
References: <20231220180235.3502418-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192808

Uses the new foreach_runtime_provider_pkgdata() API to look up all
possible runtime providers of a given dependency when resolving
file-rdeps. This allows the check to correctly handle RPROVIDES for
non-virtual dependencies

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/insane.bbclass | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 72fcf6b2544..d625fd82f73 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -904,13 +904,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                     if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
                         continue
                     if not rdep_data or not 'PN' in rdep_data:
-                        pkgdata_dir = d.getVar("PKGDATA_DIR")
-                        try:
-                            possibles = os.listdir("%s/runtime-rprovides/%s/" % (pkgdata_dir, rdepend))
-                        except OSError:
-                            possibles = []
-                        for p in possibles:
-                            rdep_data = oe.packagedata.read_subpkgdata(p, d)
+                        for _, rdep_data in oe.packagedata.foreach_runtime_provider_pkgdata(d, rdepend):
                             if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
                                 break
                     if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
@@ -958,17 +952,17 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                     # perl
                     filerdepends.pop(rdep,None)
 
-                    # For Saving the FILERPROVIDES, RPROVIDES and FILES_INFO
-                    rdep_data = oe.packagedata.read_subpkgdata(rdep, d)
-                    for key in rdep_data:
-                        if key.startswith("FILERPROVIDES:") or key.startswith("RPROVIDES:"):
-                            for subkey in bb.utils.explode_deps(rdep_data[key]):
-                                filerdepends.pop(subkey,None)
-                        # Add the files list to the rprovides
-                        if key.startswith("FILES_INFO:"):
-                            # Use eval() to make it as a dict
-                            for subkey in eval(rdep_data[key]):
-                                filerdepends.pop(subkey,None)
+                    for _, rdep_data in oe.packagedata.foreach_runtime_provider_pkgdata(d, rdep, True):
+                        for key in rdep_data:
+                            if key.startswith("FILERPROVIDES:") or key.startswith("RPROVIDES:"):
+                                for subkey in bb.utils.explode_deps(rdep_data[key]):
+                                    filerdepends.pop(subkey,None)
+                            # Add the files list to the rprovides
+                            if key.startswith("FILES_INFO:"):
+                                # Use eval() to make it as a dict
+                                for subkey in eval(rdep_data[key]):
+                                    filerdepends.pop(subkey,None)
+
                     if not filerdepends:
                         # Break if all the file rdepends are met
                         break
-- 
2.34.1


