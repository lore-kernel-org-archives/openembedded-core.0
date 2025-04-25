Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A544C369D9
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 05:43:36 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.1028.1745559813024699035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 22:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MUYKTQcR;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7369ce5d323so1468854b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 22:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745559812; x=1746164612; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wc/JZpb9I01WkScxZifDGeny+GfXjxdfvFxjNwbPxo=;
        b=MUYKTQcRb0ZxcIAb9HXq7VQOSvp22kO4rbJ8/GUdQTV+5JhGoIbB9e8hgXYrlbsb5p
         UZj6J5Zw8UXn5GlDPDfHEKqkFRb1RreuN10Dvzbc19loFp6AN+gnxFTSrHWi76bZ7p34
         ZvMrPIzw/Apnt7pO/PVjmUpK0cTa6X9FzW8LRSPxn/nLDK+yqmVq3XY4BapMFG1mgsWS
         At4baI1Nq8R+U/uJ6hAUXNFnXA0jacqZCEzLtTayE54KU7BWxd1OTpPECsv916y8yF1Y
         WDm5313gnNFdTXQfXawXUUVfe89/BLFW6HNtpvsb9f5uD2vpSH4J8b/z3L7btTbcDuAg
         p9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745559812; x=1746164612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wc/JZpb9I01WkScxZifDGeny+GfXjxdfvFxjNwbPxo=;
        b=MSgYguYSs1IF5uF/JIvEDNFSNjNtFPDunY8yBOmwTjE+CERj9GTGxTIEKtBufeCWg9
         n60FDHZLJn+LNo2UeHbgvc54NPmAJp8cp7YqB5JkmitNjpykfDEamydNjTX4bxGXkyAv
         I/WcJsojdc9sFUfNG+xeXNmJ6XRjX0a1RZOgn3YRqIiqBHhLPGdWyCVzVkDK3gjbbiCF
         NNVfzbqTFUciVFRAH80rKKT1rpBA63BBA+Y3lS81GthMEMpI0ItlQUFEXP+4WgP7IyLb
         QD8JJo67TFDHneXcnhUOJw0ctv4AgKyyM3dE+5qljJo4hwPbLVU0k/qVQ9e8r7hIrNBF
         m+fA==
X-Gm-Message-State: AOJu0YxM7KVdvKV03fREjUlHHOvtvQE9G5XkNlyJZLileqd48VA1chTr
	pj2p0quMEIpsTMtGVIucEXxgb8a60ADahON6Ui1WAjM+JSjzhLlPZrjPgacz
X-Gm-Gg: ASbGnctUR7m8XJJxYV6SAFWmIIDZ1CQ4/hNM7R/AskR0tV8JYaZhJgLTDiucKt4rq+g
	uZP7ju6cgigolbtKvmXrAjUz5bA+FbVQ/7XJM4G/fj3gt+MRAbq5qB1v7Nb+945456CIBEgY0fb
	pmzXE5ZOiPLz9ZnbE4jM8K3yzDZDm1QqDcnEFOrFN9pQYeLBfJ/EeTutbcxRFhnE6xaQEgB93ka
	EMh5xbrgjg1WEAl3PyPXRopt//3GIepXpSfzUBiFhFmyms5FDphu7OU0JzXMAi04jqbPR0Al03E
	VMg8kcMXJv5HKuhiOfnAW6MFiBFA0MVf
X-Google-Smtp-Source: AGHT+IG4WeMmE1OR6+8VbtXe1VbHjJn97paZBAadaRMVK+jmctDXHcVTjQtWRXUsvTpxAv0FhBJN0Q==
X-Received: by 2002:a05:6a00:2e22:b0:736:339b:8296 with SMTP id d2e1a72fcca58-73fd896a1b8mr1289909b3a.18.1745559812347;
        Thu, 24 Apr 2025 22:43:32 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca62csm2363626b3a.167.2025.04.24.22.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 22:43:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 22:43:24 -0700
Subject: [PATCH v2 3/7] sstatesig: Handle special case of
 llvm-project-source shared-workdir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-clang-merge-v2-3-0a51d0c1940d@gmail.com>
References: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
In-Reply-To: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 05:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215418

bitbake-dumpsig or bitbake-diffsig tools do not work on any of tasks
exposed by llvm-project-source recipe. This is due to it being a
shared-workdir recipe.

Fixes

bitbake-diffsigs -t llvm-project-source-20.1.2 do_preconfigure
NOTE: Starting bitbake server...
ERROR: No sigdata files found matching llvm-project-source-20.1.2 do_preconfigure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oe/sstatesig.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 1f976067631f80d637ba803f49813323d17e7c70..826549948e24571ef57acbe6bc5a2442d6c49f13 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -418,6 +418,9 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     if pn.startswith("gcc-source"):
         # gcc-source shared workdir is a special case :(
         stamp = localdata.expand("${STAMPS_DIR}/work-shared/gcc-${PV}-${PR}")
+    elif pn.startswith("llvm-project-source"):
+        # llvm-project-source shared workdir is also a special case :*(
+        stamp = localdata.expand("${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-${PR}")
 
     filespec = '%s.%s.sigdata.*' % (stamp, taskname)
     foundall = False

-- 
2.49.0


