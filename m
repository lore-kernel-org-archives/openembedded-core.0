Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28A4C5B555
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 22:26:40 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.37185.1748816795091237995
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 15:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BjAKy0mM;
 spf=pass (domain: konsulko.com, ip: 209.85.215.194, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so3973851a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 15:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748816794; x=1749421594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzXcTYdkBO9QWhZZ1jT7MV4MCHnYuvG6geO3jdH3M3s=;
        b=BjAKy0mMzeQfDCt/FBksteTTcNcIfLkljoGV4/WvajNdg0YfRgd++Byoooe7zp3CYX
         iWw+v4idcm/15yTKl9xnd1FkYK0taNjxzR7ePvBLWKqK8vclWpjhLSVYEdmnCI2SaZik
         0CLZdgZnvF7wGq+fSmB5HySPhOsaZH72jc4/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748816794; x=1749421594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzXcTYdkBO9QWhZZ1jT7MV4MCHnYuvG6geO3jdH3M3s=;
        b=cUVSUeesoE0Q/fPx5WpIbOZKVx8qJm7luGtmMxpro4ubWIY2XBTrelM2qQX00gvCr+
         a0i8CFXNlMhKAqH8xjvyz2F+8gfWqpE6GD5TEXrEXdMQobscW26WhIeiGFbj1hc1nUQP
         wXfcl5vpkA/+6wHfdXCLQhXmIKuhstg26eMgOYYOrxxSrKOvMp1z8b6zCBzQl/k8t4OM
         pM1iuPgYyL0ZhzsH3HvB5FBlq/HMOQoFqCbdf73hy8Fev9CkcuhTX3B533swlYuegK+t
         RwXMNQxBWDLQk+YA22UGiWz6bDNasMSPWcc+yOm9e5G/ZwQgozvBpY/G1+Eo5BSo0VsS
         SgAA==
X-Gm-Message-State: AOJu0YxpvdSUbjv2EiR0z2O11Rqdasn0JfZ1CzTWr/P9goGvU+7sNLo/
	8o2Qnu9/Amm/i89cv0D+EP9/BuP6KGvWIgJ0k3tUmVsWSrqvXzRvmyQmekoilIRd4xEtPkJODkT
	SQ7qLfTHSelqY
X-Gm-Gg: ASbGncuwVIH/wC1/dqXiTn5wXVeDTmb9x+78UD8S4HpCgaFpJIsAl4B0k03h0dVF/5s
	z/OPZ0vvOOt/XI5fcvTB4z70MgmO7un/H3TO7pERYrx+4EI+LJYCIigK8k47maPDfqEu2vuwtEz
	PHpo3OzP3EEdvaez1PTcKyv52ZhqTLavRqLQxL6swJOD4iE5EQPq0OZmUh3jDQMT4e6oLMbEErX
	0wXeWHUVTe4pW1G6Hvz6TKN1yhiTZHADO/+chlNmFYpt3dNOo4+3z0/7jdL4Dbw63FVYyQhAFAn
	jLUWGxE1N1wFh6wMOjAOzWijzYWz73hiL2p0+2ohB+zPURHeoGJ9YI0tMgvTx9nV4qr77c4Roji
	Rpoa6x8flvYYJy7E=
X-Google-Smtp-Source: AGHT+IH8Y6IA6qNWwUrG8kPbnc9pmXJMbtk1NNdqYWc/SQmReSdHffr2vuRsfeg7R3P4KhwynGbEyQ==
X-Received: by 2002:a17:902:dac5:b0:234:986c:66d5 with SMTP id d9443c01a7336-2355f76553emr96408025ad.5.1748816794130;
        Sun, 01 Jun 2025 15:26:34 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd362fsm59197395ad.116.2025.06.01.15.26.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 15:26:33 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] python3-pluggy: upgrade 1.5.0 -> 1.6.0
Date: Sun,  1 Jun 2025 15:26:16 -0700
Message-ID: <65bf46a0ec377653ae8ea633eff4040284547151.1748816484.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748816484.git.tim.orling@konsulko.com>
References: <cover.1748816484.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 22:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217681

From: Tim Orling <tim.orling@konsulko.com>

Comparing changes since 1.5.0:
https://github.com/pytest-dev/pluggy/compare/1.5.0...1.6.0

Release notes:
https://pluggy.readthedocs.io/en/latest/changelog.html#pluggy-1-6-0-2025-05-15

Deprecations and Removals
* Python 3.8 is no longer supported. (#556)

Bug Fixes
* Fix a regression in pluggy 1.1.0 where using result.get_result() on the
  same failed Result causes the exception’s traceback to get longer and
  longer.(#504)
* Correctly pass StopIteration through hook wrappers.(#544)
* Raising a StopIteration in a generator triggers a RuntimeError.
* If the RuntimeError of a generator has the passed in StopIteration as
  cause resume with that StopIteration as normal exception instead of failing
  with the RuntimeError.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass for core-image-ptest-python3-pluggy on qemux86-64

 .../python/{python3-pluggy_1.5.0.bb => python3-pluggy_1.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pluggy_1.5.0.bb => python3-pluggy_1.6.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb b/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pluggy_1.5.0.bb
rename to meta/recipes-devtools/python/python3-pluggy_1.6.0.bb
index 1f9bb6d1cb4..b8e4bbc75b4 100644
--- a/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pluggy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
 
-SRC_URI[sha256sum] = "2cffa88e94fdc978c4c574f15f9e59b7f4201d439195c3715ca9e2486f1d0cf1"
+SRC_URI[sha256sum] = "7dcc130b76258d33b90f61b658791dede3486c3e6bfb003ee5c9bfb396dd22f3"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


