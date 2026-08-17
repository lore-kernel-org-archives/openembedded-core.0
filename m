Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6D1C5DF7D
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 11:21:55 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28070.1786965706371327606
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 04:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hpohl4X9;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso3731170e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 04:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786965704; x=1787570504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5kF5HJ5WvGO+yy0llszwPtgZ+Md7a9gt1AJRKyJvvo=;
        b=hpohl4X9qwhaxjoZzNg0/BFGytxzRH3y4Q5dmg433Hj5/HYBeIob5nqUBAwkwlgx2o
         vC/PRZ8y/XIYMSKpiiAPJAOCXWUcdCw+fFSv2X4OZGrdKnSNRHrTv6OWxfbs6t+KigG4
         fQbdMnU1jz5FVdVUwc/Iy8qutymzHcKO7R5e2t+1PmiZu7Rzdm7nxcPiKgVBrGDmtdNc
         C5zxL+5hPSc3+mmmybIosGhIUXT2H5wH4yB1HIwezwK51d8XAu0nutpyIdhfDRZERn2X
         iKkoSfOSMmauUHHCAimFAWDz0m0+CzWCDN5d5RIwdRibQbd3so9HoT957Os/T9tbvGv7
         SJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965704; x=1787570504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o5kF5HJ5WvGO+yy0llszwPtgZ+Md7a9gt1AJRKyJvvo=;
        b=lleLoddL0o5aUoE3NMHxkUAavARUynELms0uQvc/qpt0XOFAMwmn9ToblAZ4bRlMWy
         nnDHQ6fjcm0hdW49fdzESVl6ClkZzyNBIvLUUaJ3wrSQv6CDMSHo1OP7iixl4A0wQ3kT
         00cWTuPX4xaYWDHkphx71khzFzZrZYQIW5GkWcunhED5SxNf1BkQdCBi7vQ8eiDgx1ll
         CPcbwHYbVwPOhRlw+cbVvaOmV1z4w3gpIgMHWkXyWwfI0AOedIRy94D0JVPc3pPfHoJ1
         Vgw+GO9N/mGwHQEgHZWKlSoiuGnJG+WU5a2c3q6dn6OeEJ3U/MB9gm4Gr4dWWl7jgZBW
         mZIA==
X-Gm-Message-State: AOJu0Yw17nYp6pRgOwuUwSHMnxI8jesYgnTBoejpKjYhnNdWnQXvkCci
	RrTSSemVMlKHlzlA8S9hNmp3Y1PKs/7LHcaixl/6lj1LYR4Z24QBCsPvEv0VXnfDv2zE5vq0jzE
	/mrGC
X-Gm-Gg: AR+sD11cdbvHtm7S9k68O35ACuQAxPRGHemb9sWMHnYwry7uNfA+hK+zSwal5WSp9wx
	iH23CE2gbfE+9m4B+hYhKRRLT+eVTUd9WqvRHO/a2VHyAlSUyVZ3UQaABcP+PA+iReT3Bs6ew6h
	aYJwM3GlTNhc07eBKcdImye5WjYnRZ9RG6S0yR6IfNSok4mVO82EeR39/GZH2S0ja2qjntmxlHV
	abo0pKOiUTFkuEnFgSAlutX7ZJXGyY+v5jzkWKG/kPbh1k5/RN/fXNYvGZQ5YXuh1G0KQJzIJUK
	RMrie//nzGQO/FB6lnw4CAafokVtA12XlKVluZNIUaYjmNNf6ezCL6Qt06bEvmY12UMtcZQTzlM
	WltfkAV2FjcCQzkO3mI4LdcBF362SsUQfIBFM/Hs3spy1GJh4nSCXAw2tDgpkhhQFhwf0x3luI4
	QGUDD72SZ4CgGvDq9zzC3NR9uIcwXK/u5PtGYNEOp587bMjTXm9oQ5MDo6maZWreC+q2peUR+On
	QH6HjUda73QxXc=
X-Received: by 2002:a05:6512:1294:b0:5ae:b259:75a1 with SMTP id 2adb3069b0e04-5b4591173a3mr3659871e87.12.1786965704166;
        Mon, 17 Aug 2026 04:21:44 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa0e5esm318180e87.25.2026.08.17.04.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:21:43 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH v2 2/4] testexport.bbclass: capture meta/lib/oe
Date: Mon, 17 Aug 2026 14:21:27 +0300
Message-ID: <20260817112129.1271154-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817112129.1271154-1-mikko.rapeli@linaro.org>
References: <20260817112129.1271154-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 11:21:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243615

oeqa runtime tests like stap.py depend oe library so capture
it to testexport tar ball so that test environments can run the
test too. Fixes:

2026-08-13 06:44:37,419 - runtime - INFO - ERROR: test_stap (stap.StapTest.test_stap)
2026-08-13 06:44:37,420 - runtime - INFO - ----------------------------------------------------------------------
2026-08-13 06:44:37,420 - runtime - INFO - Traceback (most recent call last):
  File "/lava-downloads/core-image-sato-sdk/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/lava-downloads/core-image-sato-sdk/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/lava-downloads/core-image-sato-sdk/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  [Previous line repeated 1 more time]
  File "/lava-downloads/core-image-sato-sdk/meta/lib/oeqa/runtime/cases/stap.py", line 19, in test_stap
    from oe.utils import parallel_make_value
ModuleNotFoundError: No module named 'oe'

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/testexport.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

v2: no changes

v1: https://lists.openembedded.org/g/openembedded-core/message/243420

diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/testexport.bbclass
index 12b7e17112..adcc36c062 100644
--- a/meta/classes-recipe/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -117,9 +117,10 @@ def copy_needed_files(d, tc):
             shutil.copy2(src, dst)
 
     # layer specific files/dirs
-    layer_files_to_copy = [ os.path.join('lib', 'oeqa', 'core'),
-                      os.path.join('lib', 'oeqa', 'runtime'),
+    layer_files_to_copy = [ os.path.join('lib', 'oe'),
+                      os.path.join('lib', 'oeqa', 'core'),
                       os.path.join('lib', 'oeqa', 'files'),
+                      os.path.join('lib', 'oeqa', 'runtime'),
                       os.path.join('lib', 'oeqa', 'utils'),]
     for layer in bblayers:
         meta = os.path.basename(layer)
-- 
2.55.0


