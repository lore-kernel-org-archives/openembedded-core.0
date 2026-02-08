Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2365FEF06E1
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:12:41 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26835.1770562881498185751
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 07:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bEHvgc6n;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: logan.gallois@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-436309f1ad7so1160704f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 07:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770562879; x=1771167679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=bEHvgc6nyx3vtlnM+ZQ+KMX0PlTNNLfgJfRG4P0swrWaxJ+yOp/hMxbwr92pJ1M/rb
         0Wg3NX5+8kpPV1EjWYl4PMVuLUkxqY46/EcZjr5GXlEbqG68Z8t5ykd8OefNEnRRC5Yq
         ndq7IcXr38buoYRufOm9/smIyqI4wLe34dVGlrDIa5djUIjg0AcxvL/MmkR7+ZuqitGF
         tRFnNmuXbUOGIn9B1K6sMVn+7FLebCvrraGiMAaVmeYBmm7YFkfjyzyGt+qbch6/mfFJ
         vlyLLR/stvRdS2p93OeL0e6fNMxa6QAw0/uFKvk64QO9432/GbOdHe8SqLCaGbB6J40E
         5Gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770562879; x=1771167679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=sKwFip2RgwMV+iXi3X5VCU0vaLLP2unf7g+qsKlU0I5xQWCPi6wa4haHWGDX1VVGGM
         WJcda1Rb4tMvPim+e/R80h4nPGM06/drRSRqkSs81SEIL5ljkzpnrF6/xyPI71ZFIIgs
         1JtjfsZq4HLuST0pxblHCdL+0Ssze0Eei4uVtb1SeGJSP13J9+UZCx++lqE3MfUlc2aU
         nByJIOgvqsaDOI551sqG+Jc32aLAFkRMylrrIHFMxPAAK4J0E6yEckgnljyfc9hHTYd+
         qXJfso8tOJCzu7MZxYnLDoqCGwndS8/IEOandrYoNd4AdxceYdUU+3FysSVsUDvOm/c2
         /Prw==
X-Gm-Message-State: AOJu0YxFbgOHKA9FUEcsb571zs48g26qQZH0YfYt4bCcuvDTZH3Hhk8v
	z+MJhZvBZ2MBj2tMO3iiyK2SjnTfphIGjVv+4mOHFV5S2mOAbQwl8sTY7QQQjg==
X-Gm-Gg: AZuq6aIQL3D8edJiXTfMhUO25Ogz9buqV9FiM45QSY7zdZWjJPN/e67C6QU43xIjGTs
	8hJP/grkferM/1bDPLmRxKqtw9EKgA+dgzCuJu4hbxGFAFCGFG8gLqfMhKJB4jk8a99dI6HI2eS
	UThOXozNszTYYAWNuCCqzEk7PImIkkMvepMvdNkcFMCOdLMzO3I9Q6DdyA8cuCfeU0LwyZCFyod
	qcYMiRA1gk7B76FSlWv+j1nesTLzQLUL/UdQeJalmu1yAuP+EwbLKM+Z0zekKeoMyhItCYmFeQl
	t/+VDjTBpwgv+5o5ZGmSvXPOkzntqcsXjtY5j0vsIfMdiSLlpHnJN5l6/WHJwqdAF+wDhABKAmI
	s00c57V4m/tso7kwvOs24toQtBpXifHzdj9/swsCo5BZjPm9OGhnca0ZS6qSOwTAuIKmAWji3GK
	gTTEhKaIfhgv72omR1pWhBgg0tgh9kQ6NfR6vGUbTyiqHSkVGNrh9FiWgYUN1DSLdHtw==
X-Received: by 2002:a05:6000:2505:b0:435:ae97:b37 with SMTP id ffacd0b85a97d-4362938a576mr13448121f8f.52.1770562879126;
        Sun, 08 Feb 2026 07:01:19 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362974b230sm21645779f8f.36.2026.02.08.07.01.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 07:01:18 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 16:01:17 +0100
Message-ID: <20260208150117.8113-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260208000829.343627-1-logan.gallois@gmail.com>
References: <20260208000829.343627-1-logan.gallois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:12:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230682

From: Logan Gallois <logan.gallois@hexagon.com>

When using the new bitbake-setup tool, an oe-template created in a
custom layer was ignored because the TEMPLATECONF variable was not
exported to the environment.

Export TEMPLATECONF so that bitbake-setup correctly picks up templates
provided by external layers.

Signed-off-by: Logan Gallois <logan.gallois@hexagon.com>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index b391f3b9254..0a3146fd503 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -101,7 +101,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "export TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


