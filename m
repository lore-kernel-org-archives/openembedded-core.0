Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E218CAC582
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:29 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.834.1757438128833548572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 10:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bY25eF/d;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-24b1622788dso40653445ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 10:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757438128; x=1758042928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fxPMzIBZWaortAFdO8bZpRIuEWk+DQbY4gBjT6Bp9x0=;
        b=bY25eF/dLK60+mwnVwbemhN9hbVIblz0iUKgZnvQ0l+j7RVPBJc7/G4yQ1F2tXZgl+
         n5COOCK1Rt9PXlRaJAq6Fsk3nhUesPc6bLywPsTLSzQxyc0QKq5cEX64mJQFU5ruPWfz
         NI5BWI7UPbcJMhTT420V+/CKNkhh/4+DDY6LYTcUBHwuxuh11tiL7WMyPGuecjKk1lgP
         RRByEsske9TIimV2r8AEDbir6DwGbGQXS+t6440S7cAkTIAhfYZ7C4vkbMJX97m8TOz6
         QGmjcxO63TIj8fqNzF0e4Ib9oY3i/Sao6oQSS8p61SYGppaYrJKpxihNOMJe8EmJtFAU
         KaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438128; x=1758042928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxPMzIBZWaortAFdO8bZpRIuEWk+DQbY4gBjT6Bp9x0=;
        b=p4UoGZP0DUGbCmXgrLP33NLXE3sRSxfPwp7k4lHBave7n0eBXYT0mev+M1ozQNBYX7
         2yIVNRwcBaaUDSCJA3ob4OSwRmk5s7GsZLiDxVbhtbGO+sgnq0jiur7PqOvgJ7NRi6CW
         vPDo9ZwpRyItq2S4jXEPqsgMiP53NRPTQ8PLiHw6UJn3BvW+EqFrOJpW1Nc4cj3To7MP
         jSTcP1W+NLIvPlfnUJtFDjIeA9cKpwj8uRQLbAqheBhir84dF+GHec1n7q0bbS7LiwtC
         7AP1l3Mf7+Cgl4z0MYlbW/sNNAHpfPTHI3Bj1+3J2rOD3gSpM0WIGxTH8/kWFdDiCZC+
         zopg==
X-Gm-Message-State: AOJu0Ywyx6ZXnx5sXLKAjSnlszcd0uF0DgKi4w1Pa3ZFkC39qMIVpYH/
	Pr413M/WS1dp0Nl1CWvPpPwxcWDo/xM9r/ebJF6m7XOLxNLMAPDM0f5LxAeC0ebN
X-Gm-Gg: ASbGnctHSCKNjjLmeQtYMkY67zVRu4qg2YiSqhAeWjCgfTde7LBOQX/5IenuGnaCiY8
	8+qb6gpjiIALF2qaXRgg43trgyuWN2p1fm/sOMdB0nHfs0AX0GECw1RgUZPAIrwU/cfkvBS4bOQ
	0XCKuRGEY0QkGVwHUU5IGUIhA5OdUGisV46cvJPx9XC7KLscnIhxA9/DkVFODHQ1JvZJbMrs2Kk
	MTiKFBFl8P8BwkRE4ifl9STG4/3hR35LNJdJU8b4VEc4IW+mBDm4m/O+6dIl5NCn/+gUsnBihDS
	9mMf/xWzdAPOknS/PkQK14DOSU++wYG3MPqrmKFdl5F75NfVWUcwc72XkJdP8DXResMy3sWZoTx
	OWhmdApqam5FAb1BpOuK8dsG2biN2oCTU0Y5q9UpSeXkFmR3b3hP1ohqZiP0w3eY9ex/09MTHR5
	dQ/CNTyBsoT7wWHQ11LSXx9JklXoi+xGmvFJvsTvf4wdurgpzxQ84=
X-Google-Smtp-Source: AGHT+IEBDVzwuhv+HGK8+nSLn8BcNjZRTYKRcTGQKHByz0HS3vStlw4PSxd3Mk8ZRh2kvhj/6VbB3g==
X-Received: by 2002:a17:903:15cc:b0:246:c421:6303 with SMTP id d9443c01a7336-25172296262mr170661245ad.46.1757438127747;
        Tue, 09 Sep 2025 10:15:27 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::d0a7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a280ed093sm3156655ad.59.2025.09.09.10.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 10:15:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] python: Correct the upstream status in NODEV patch
Date: Tue,  9 Sep 2025 10:15:24 -0700
Message-ID: <20250909171524.3585220-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 17:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223123

Ensure it is reflecting correct information and status of patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Update patch with newly filed GH issue report for this problem

 .../python/python3/test_posix_nodev_disable.patch        | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch b/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch
index 85767e1e898..6e343deaa83 100644
--- a/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch
+++ b/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch
@@ -1,7 +1,14 @@
 Disable part of test_posix.test_makedev that depends on the NODEV
 macro being defined (missing on musl).
 
-Upstream-Status: Submitted [https://github.com/python/cpython/pull/31794]
+See https://github.com/python/cpython/pull/31794 where NODEV
+handling is introduced.
+
+Opened a bug issue upstream with
+https://github.com/python/cpython/issues/138707
+
+Upstream-Status: Inappropriate [Musl-Specific]
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/Lib/test/test_posix.py
 +++ b/Lib/test/test_posix.py

