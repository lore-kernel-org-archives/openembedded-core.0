Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web09.10439.1607534325040974025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 09:18:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZriGtYsS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id q75so2487975wme.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Dec 2020 09:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P90ON83oiI6uCVfeuW61WCVoVl0rAwEs663pSoXN+JM=;
        b=ZriGtYsSDoJOGyIlqJ7Ct17XYu06LU3WDGVgdLTtR5JPa+VpsaP/mT8qbTlcOfj3cO
         tRbj6VJCppK4/jaL1gh1Gl+Caavxg1CNs6fAN35A6lIfyG3widgi6FdHTvUAqLQbU2Yy
         VRQ8itMPFvavi6XcpqwmKN4iWCHs2YAa8xiFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P90ON83oiI6uCVfeuW61WCVoVl0rAwEs663pSoXN+JM=;
        b=NZqHIfhxSXF+s53xDXLMrCP2ZDceFibmR+M+ojMuJsKWkQvqNBcagP22PvToPpterP
         J2gvWY4oGjCvlKAnOtYE50neOKdNplrNVfDVJpWfDQrMjojk61Be1gKeMH9lxc0LUZqd
         5cU6grutHbdZQX7omKr9tUXdCj7wHzPTNn6vxOe4rd9cIFW4Cu+9GbVc++aUqC1nyK7q
         3xh1KGOQUZulQKWaiEAiLLArCot7ODCHvEMwHg2NIcyx7e73BXuuas0SX9tegaMO/Rzr
         dv24Z8f6CPUWRn0lwJrQpW8G7u1g3EKieZnOYPcB78vtJOrAeiLI3eedEIFKPWXGmamP
         3tIg==
X-Gm-Message-State: AOAM530QVQE5jIIkqqbvou0f1MzCj/HqG9IvHEm/M50cNh5d4p44h3xU
	2nx9dz116NemAPM4wQLbaf5YU5XjiF9umg==
X-Google-Smtp-Source: ABdhPJxwEOALIIidSpv/OJFFPv4E6N1d43u+XsuR/5u/TeI8r6C+YIj+HQDKDDPiOIk/yj42IYBzSA==
X-Received: by 2002:a1c:e309:: with SMTP id a9mr3914657wmh.172.1607534323309;
        Wed, 09 Dec 2020 09:18:43 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (9.8.c.0.f.4.1.5.6.b.7.5.c.c.0.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c0cc:57b6:514f:c89])
        by smtp.gmail.com with ESMTPSA id u66sm4986020wmg.2.2020.12.09.09.18.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 09:18:42 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] metadata_scm: Fix signature handling of METADATA_REVISION and METADATA_BRANCH
Date: Wed,  9 Dec 2020 17:18:41 +0000
Message-Id: <20201209171841.3648579-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're not interested in the dependencies of these functions and what
those functions look like, we're interested in the value the variable has.

Force the hashed value to be the actual value from the function. This
means using METADATA_REVISION in DISTRO_VERSION for example now
correctly rebuilds when it changes value.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/metadata_scm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 58bb4c555a2..2608a7ef7b8 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -1,5 +1,7 @@
 METADATA_BRANCH ?= "${@base_detect_branch(d)}"
+METADATA_BRANCH[vardepvalue] = "${METADATA_BRANCH}"
 METADATA_REVISION ?= "${@base_detect_revision(d)}"
+METADATA_REVISION[vardepvalue] = "${METADATA_REVISION}"
 
 def base_detect_revision(d):
     path = base_get_scmbasepath(d)
-- 
2.25.1

