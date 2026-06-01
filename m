Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07282CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 19:28:33 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7652.1780342107250646784
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 12:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=AJDz6lc4;
 spf=pass (domain: konsulko.com, ip: 209.85.216.45, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so2100742a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 12:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780342107; x=1780946907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OQVVobIczFSuYk64TGJ5zRBjrK3InyPgj5L5fkvFdH4=;
        b=AJDz6lc4m4+vVOoIMrMqAYeZLxVxBTalzz6a8FW1Le27roNm1XoDIDAHRL//y/5VDy
         4CGxyC2hQ8KZeB2Z22Jw4OLRS6kZOqtMrLC2xtBIlAzudhnBnb6XFKLl1Dcs3uNuqJUB
         ZD3Chq+1Zd5GjXz2OPz2kiCZHIi9FT7AHylNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780342107; x=1780946907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQVVobIczFSuYk64TGJ5zRBjrK3InyPgj5L5fkvFdH4=;
        b=meM+Xu8Z7fQLxYqjlii4AXyaZwXaV3oTP/G8rt7ApyV/F8/k9i46msEH9FT+TzYt1m
         xzq/12C5WmIaS9OKWUSXBpwb8CmnM5MRluDnq8RmpnNooX0oSIA420Vd7Av/xbHB6SjF
         mKZ/IDVnKP4EuywRtmbH+MCm/pwp3nhT2lAoxIc7pYL0ZGvL3cROj6myz4kitg3xa2hc
         l+SVByIisdNdg2BRlpgSukvg1JYBKFLs8k1jLeOcBhJXXMx4zLxuodAQk+8J/4GCYV84
         zAxbOJTygQED4oU2yTvoDIaLXo1r2ooexj55mXGIr++U3GBt5Pm+eyhBiCKRn3hkaCpo
         60Dw==
X-Gm-Message-State: AOJu0YwPUuYEZY4tob8G7JPfpO13gSvuTYdCXUdNENgYGesZtWzzNlN2
	o8V0/XTUqfym4NB+39xEDaW1HIU3Rrhx/b0tsLmIgWBSBdVjKCjlbTHt5dNgcQbtiLwAkWu6iEi
	xB5A/
X-Gm-Gg: Acq92OFDm+9AZPqb1yYnNsqCe6MUKdELGIVDsiVINoDfzu8Io4UGkyEr4Zde40G6eLW
	Gq96DIjonrhUi7589fLuH9nZ3kegcUj3BY8kh7NjqDDk+kQoOP4boiTr5QYBvFImS2VMMYJkqnZ
	pDcoSsG01YdXbtOvef96EZKQkfwSU5ue4JnGHRgIU+6WdqYBlweUPLMAzGu80ibZwz5iRqX63ve
	z3ETGgDftfz7SKJOE86UeO5EYy+NP0d0aXfz1I/kcPhm9Yi0zkQ96zxKhoPp8zMdB1W3jIFjNzD
	co62L2b/iQAilJwfMFDYWgjMDa6TLYBec1H/nLBHk5fJqaGiDMlrpyE1wCz1+AbrrtEJEx/Jr6T
	XHnAhjfZ6miPJM4eymNYaEpvpN701P2Yw0n/7FESc38Fl0WO+/mcMJJtjhFvJeqdOr+I7omSVb5
	+NZ052f2WrjazkUvWLacC6aBjo0vrp1YETn/vLtfy1QJ1eEQIX944wf97gTSCp15r8IRvZn/9AL
	g==
X-Received: by 2002:a17:90b:5184:b0:36b:8824:d7cc with SMTP id 98e67ed59e1d1-36c501efef2mr11123520a91.20.1780342106516;
        Mon, 01 Jun 2026 12:28:26 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772b9591sm10601188a12.22.2026.06.01.12.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 12:28:26 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] vim: upgrade 9.2.0340 -> 9.2.0569
Date: Mon,  1 Jun 2026 12:27:43 -0700
Message-ID: <20260601192742.333006-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 19:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237987

From: Tim Orling <tim.orling@konsulko.com>

9.2.0501 enables GTK4 as an option

CVE: CVE-2026-41411
CVE: CVE-2026-42307
CVE: CVE-2026-44656
CVE: CVE-2026-45130
CVE: CVE-2026-46483

For full comparison of changes, see [1].

[1] https://github.com/vim/vim/compare/v9.2.0340...v9.2.0569

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested on qemux86-64 with core-image-full-cmdline:
CORE_IMAGE_EXTRA_INSTALL:pn-core-image-full-cmdline = " vim"
and also
CORE_IMAGE_EXTRA_INSTALL:pn-core-image-full-cmdline = " vim-tiny"

 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 6e0058b13e..b00b2602ed 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://no-path-adjust.patch \
            "
 
-PV .= ".0340"
-SRCREV = "6addd6c101117706bc9b3609d3a418e26e92618f"
+PV .= ".0569"
+SRCREV = "54ffef7eb83f2592833f422b89bf5f30de6b4bb0"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.43.0


