Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4448EFF885A
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 07:05:08 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7364.1777359903394826374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 00:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=s8XNtLsD;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e7d984096so121835311fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 00:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777359901; x=1777964701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oWr3A8S59cxriNa5fp1jXd/0NzIbtinX/cG+fBcmLls=;
        b=s8XNtLsD6b7F3mN+rwOiCmJ13S+pS9UsX1jBB3rN/+rPnlmbZiHEonnLO0LcqQyRyj
         VWrfIRdNPfb6ys/b+E93/K9DfqDa3XpeNY/j8K26s4QqCpZAqCNUk7ROwjKss/g3VRNA
         cL7ctreQrsM3FxSMqU3pWEFr6A2hzofxZjotdpRZNGfKIAhvBi0K3PBGrbLap/hcO/JK
         ciS3JEVTvaheFLUr4E3vje+1ITD2ws8hC3lfl/GfpoGrUJh+dR3EZrOkc2cU0dc5ewe7
         TPUZ5oM+aIdAVdhdRdqat93lWfRO+1j7ILnT+SzIpBiWDAZemtpi66R3DW3swe4Mdyiv
         qrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777359901; x=1777964701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWr3A8S59cxriNa5fp1jXd/0NzIbtinX/cG+fBcmLls=;
        b=GBGjS4kN4bWG2NbS6HO9y/ZhfktNYiEPXx/YqAYk13XVn1Io0HEZu+Wx+1JmFVQQ+Q
         JhFb5eI9rp/31EGYdBSggIRhiCfN3nnOvK2M/xDBgVYQebLUCxEDcEp7r5wCm3OR/SUX
         pRclvdnTgKB4B4bCnQa4RGJ7OMjhok3SOaA0llk6ihwjgyQTjgk+hMFL/DNKWTuLSqHH
         5p40Ai7zNn63dkQaWnELw9B9khar1s65P/TntrXJ1wudIJ8w7hpTPhyFfsHxjcXsGQdY
         92rkDeztOVUlEmJFXA3xKb4b78UeWPJ+0xK7wTZj2NCptSL4iKjG6vR2neAV9Z0pZcvY
         5B7w==
X-Gm-Message-State: AOJu0YwVE6tPYrX0OWGJxYcGej1BnXhuFz6SN69WlxLgwAABAUD1Sqz/
	uo4IxbfDtw6e5uRmTajqIlksVT+DepEzHyndHAfxndu5SeNHdFCcTg3y1F3qzR+G+ZXdECZSRr8
	BdM0t
X-Gm-Gg: AeBDietvRvDENzE+qcsL5ROVa/RHQqBzzsagvDAqfIASdFBOjfOOz3TvrHNnpMDbPxZ
	WTO+Dkx0Kc2DKmEhlaxSVNpyYhfoTUfNSFw4yp/FBBxK+CahgpIPNecUWfTKHQnxJcR4xdNQb4c
	l8h5nmYyt65yRG7SoxASRGULoEYt1qV/btdQTrw3Sz/MRh66ZVMiwbqlAXD6z841effR36L/6OE
	IyOG15UmO6hMTgl0wb7jgrVPGmhe5pVyL7GEjb/9hiCYAEhwh0muQN2i+3sA7anJb6MDr8DV+/T
	NNBgOGndMpugxNSQ1NBF7LJpeVErfV6FbDpG94fjSFs6LccAlf+vurAnKjW4jcSr4rgOJxUzFOo
	x0dZaQiJWydoQYpUgIuGva0jI19tIkpStnPkIIg5hI8kCfI4ZV+fcqqNDwalaDOlR+ak2tcXO7X
	sFjn03m/lSVfbc+Jq502qDzl9CI8fDAoIgzByc72VyOsg9Vd108fljWUfXgOR9nQ==
X-Received: by 2002:a05:651c:3252:b0:38e:cab9:365c with SMTP id 38308e7fff4ca-39240b34918mr5617361fa.0.1777359901258;
        Tue, 28 Apr 2026 00:05:01 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f2e0d9bsm4765121fa.6.2026.04.28.00.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 00:05:00 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [scarthgap][PATCH v2 1/2] ghostscript: Pin to C17 std
Date: Tue, 28 Apr 2026 10:04:46 +0300
Message-ID: <20260428070449.1820616-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 07:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236042

From: Khem Raj <raj.khem@gmail.com>

The code defines a custom 'bool' type (as an 'int'), which is incompatible
with C23 in which bool is a keyword, and trying to use <stdbool.h> fails
because 'int' and 'bool' are used interchangeably in the code.

Add the flag to CC variable, since CFLAGS is used by both c and c++ compilers
and clang++ is less forgiving when C compiler only option is used on its
cmdline so it complains about -std=gnu17 and bails out.

(From OE-Core rev: 49657089ef215824f8f79a81deb7baf4f27d0030)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb | 2 ++
 1 file changed, 2 insertions(+)

v2: no change

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index a48ad671c7..57a1098521 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -50,6 +50,8 @@ EXTRA_OECONF:append:mipsarcho32 = " --with-large_color_index=0"
 EXTRA_OECONF:append:armv7a = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 EXTRA_OECONF:append:armv7ve = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 
+CC += "-std=gnu17"
+
 # Uses autoconf but not automake, can't do out-of-tree
 inherit autotools-brokensep pkgconfig
 
-- 
2.51.0


