Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD885CA100C
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 03:03:37 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.3622.1756868607835849832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 20:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gxX6/FQs;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3298961169bso2787393a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 20:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756868607; x=1757473407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoOX7NR9Az5x6gC+VPKdOXr8DbzLRisciCC/7CBfoYc=;
        b=gxX6/FQsUKguaqkm8YcUZWjYdPlErSYTspYh+nvozPcejG7Ka9LrxmkCnv1nOyPDgQ
         ehB8UCZFiHl7+SdseRlkBeqXa7YQ95k074Ibzw7W7XIaGi18USDLPEWrAjdWdJf2+XT1
         JQ87zqLv6mAzEm1daQakidmySWC148VgOqywAtcflFnJWzjnc+fONKgfENa2IPENtTo9
         Q+oXxmxodfl/ouYgTcrZ6T4o8JMcOU5gEbwQ7xLInS24jpHKuqVMU9JwcmiOCjX4FZlu
         sL72Do61IXA/L9h7E2kulM5JrMxOUtYKiqQdQtMjrLOEi31K1C52U0sjQT1EU/GEMwlK
         tNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756868607; x=1757473407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoOX7NR9Az5x6gC+VPKdOXr8DbzLRisciCC/7CBfoYc=;
        b=BP7RfKf7YV2Evq+15MEIrOjFzZs8NQTKL/WQUWs3DpJygIUUiWCWsnfoXPfhN7t0hn
         LerA2wIUdTvgyKOrBpumhMqZe0HSPoHzEop5cOjBmYNhXqoBOLe5GhvGnsHC9jBFnKR1
         OgDi4N+e+zQOcwsYsQfqmApXw3DphcWAQ41CLx3/8C3wt+Q0Fu4h/2roaO/xUFfaoW3G
         m3KCp+xqTqeMtly6L0CKR3YZcMUSw39hpxKMUhyLqQ4MqN+mKo+1fTDxLR1E76ut1YeT
         tQmEuSHK4Fnnr7I8VEtY2H+iBdkGnhOQkza2LE2Hng4InSKF38pfBTeoGWwy0k7VlTqQ
         XrKQ==
X-Gm-Message-State: AOJu0YxnBXGKQsz2Z1qXxKqtckIzlDmrEHBdo6bIoMATsdMYc/r05KBn
	vzHOtYabjs9dVuaw5G7dpMv/VRwlJEivWgHBUWclYMSmPLDSnXRDM75fhA2im2y1
X-Gm-Gg: ASbGncvfNgCMPK/RGC4UsBWAysdgTU2y8wshvLdkD7asRE3kW6F4sAbAikI7OPV/6wJ
	GSGS63CHKieefJ81biZVI1VOOyvzPxGnwdqH81hH6ozeQcmBrWiNtO5Tp5e5AXtvWuZh0AHUNpZ
	3jKfJXfZXOORmdTD4B6CliKTmsBFWVUY7R/XN9FwQ9TfjQvwRxm21whxYx3weousnaaSeJjktJJ
	/FMvatqlEaiqsM/RNI6h/uCJtp4v6ah6kbEKy9FyIwhOZEmLhO3Dcqfl0/DH0jtBRrjtmXTkTqa
	O07XtUkDHfwfvoHMxJ1cS2204SIGcAN7gtPloPo/kgkbY2CtZYGKNxmY6R2Q/fHIRKA8Auo8jVb
	E0BLh/X2O4Opd9qbN3g5TNm7fuLONcLtceudUMSWmLwJJGZ9mJgIiPYJI03mP+v6tzfZ++o+Z9I
	EBupv11P374ORkdgBXSMtnNYoHoySniv1qrIBRHFa0RR9CziNOGgE=
X-Google-Smtp-Source: AGHT+IFOZgwoGeIbTNFW2Dmu619npMKY7lPzZyAOK6ny9ly/rx9d/fmBHTzzMRXeO7XyrCxL1OIpgw==
X-Received: by 2002:a17:90b:38c5:b0:327:c207:b3fb with SMTP id 98e67ed59e1d1-328156cc954mr16147063a91.25.1756868606798;
        Tue, 02 Sep 2025 20:03:26 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327976b5074sm8993845a91.4.2025.09.02.20.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 20:03:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] python3-pdm: Update 2.25.4 -> 2.25.9
Date: Tue,  2 Sep 2025 20:03:22 -0700
Message-ID: <20250903030323.3669364-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903030323.3669364-1-raj.khem@gmail.com>
References: <20250903030323.3669364-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 03:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222838

- Add site-packages path to pdm info and print interpreter URL in
  pdm python install -v.
- Support explicit free-threaded Python selection via version suffix t.
- Multiple lockfile/pylock improvements and hash handling fixes.
- Windows path resolution fixes for uv; CLI help formatting preserved.
- Dependencies: require packaging>22.0; bump truststore to 0.10.4.
- Misc: fix AI coding fast apply error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-pdm_2.25.4.bb => python3-pdm_2.25.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.25.4.bb => python3-pdm_2.25.9.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.25.4.bb b/meta/recipes-devtools/python/python3-pdm_2.25.9.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.25.4.bb
rename to meta/recipes-devtools/python/python3-pdm_2.25.9.bb
index da77ed8f6c6..6938edb82f4 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.25.4.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.25.9.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "bd655d789429928d6e27ff6693c19c82bc81aa75ba51d7b1c6102d039c8f211c"
+SRC_URI[sha256sum] = "fb5fcd561986db1d83255d01e97e2e16f80debf743934d891a62ff2933ccc80c"
 
 inherit pypi python_pdm
 

