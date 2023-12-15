Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C553DC4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 17:11:15 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.67664.1702660269850301644
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 09:11:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KFkuMs09;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: jpuhlman@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d04c097e34so6673685ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 09:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1702660268; x=1703265068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eoeq8XjozX76Qw8bqH9LYPH5VQyWwpZuW0y5fboeLXw=;
        b=KFkuMs09o0SIO5lrGjtvHUTKm6pA/BdWu+AA0DcbgjZZ6CZPg+YWMuZZdbds/2Pmma
         4/pNrwELsRCNPw/kHHvGm/t+Phswaps7qKdZo0gZjdjjybC7mCOUFn63Yq8I8sL13jcj
         iGg2LxrNtW/6ccnAdMwf32teNIZH39VPOcwKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702660268; x=1703265068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoeq8XjozX76Qw8bqH9LYPH5VQyWwpZuW0y5fboeLXw=;
        b=JcchmONhBhAGHasRKJ2QfyHLpLa8NBx34MkwranOPCrlJypf7prSrJS88Ijit1VwOg
         vDuybHsftkBXyxKBW/YP2D8vNJ6woDvkH6hB2AS2VwYvw5t4UCFmgcokQhwekroKlFx8
         m9JzuMUlF3H31HyyM+687Z7gWKa2bDg75mqzpR9LWINd5wi8xkBuCIrRTtbEYGkM6RwG
         2pvuCZ2vhywyuYVpoCBNPURTH9pQDnxY4NPh5MITwBgLCxCQKhZ4XLA5A3kZIdHfZicU
         qJpuxtbmrjreZ5wbWUS1MxOKDgT/CADVkRUFAjxCCI8h6+tOCUb/VtwjEWLdOq3/2xG+
         p90w==
X-Gm-Message-State: AOJu0YzAX7JAMOucafwpmddpI5XQJZg4bGpMcMfEZ5KJaomgLVRG4e50
	Ikg2DjZxrdBkQNPS1E14XeHkRCsG0iRNfAiExNg=
X-Google-Smtp-Source: AGHT+IHuqs8KUkhWDVZwrv8p3rC1OnSwANh+eQXHTYm46ymJMWcdOsvsLV6nr/Wp6cGqVGg8LYDEXw==
X-Received: by 2002:a17:903:41c1:b0:1d0:6ffd:611c with SMTP id u1-20020a17090341c100b001d06ffd611cmr15831506ple.62.1702660268172;
        Fri, 15 Dec 2023 09:11:08 -0800 (PST)
Received: from brown (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902b70400b001cfb971edfasm14471978pls.205.2023.12.15.09.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 09:11:07 -0800 (PST)
Received: by brown (sSMTP sendmail emulation); Fri, 15 Dec 2023 09:11:00 -0800
From: jpuhlman@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [PATCH] create-spdx-2.2: combine spdx can try to write before dir creation
Date: Fri, 15 Dec 2023 09:10:46 -0800
Message-Id: <20231215171046.2926492-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 17:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192536

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

On occasion a file is attmpeded to be opened prior to the
creation of the spdx_workdir. Create the directory before
the open, just in case.

File: '/build/layers/poky/meta/classes/create-spdx-2.2.bbclass', lineno: 1081, function: combine_spdx
     1077:        )
     1078:
     1079:    image_spdx_path = spdx_workdir / (rootfs_name + ".spdx.json")
     1080:
 *** 1081:    with image_spdx_path.open("wb") as f:
     1082:        doc.to_json(f, sort_keys=True, indent=get_json_indent(d))

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index b0aef80db1..486efadba9 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -1075,7 +1075,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
             "%s:%s" % (runtime_ref.externalDocumentId, runtime_doc.SPDXID),
             comment="Runtime dependencies for %s" % name
         )
-
+    bb.utils.mkdirhier(spdx_workdir)
     image_spdx_path = spdx_workdir / (rootfs_name + ".spdx.json")
 
     with image_spdx_path.open("wb") as f:
-- 
2.35.2


