Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010ACCA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:47:01 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.89574.1756849612350825372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Rt0pA8N9;
 spf=pass (domain: konsulko.com, ip: 209.85.214.178, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2489acda3bbso47445555ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 14:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1756849611; x=1757454411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbuImuCYfjCpUCet0u9+wg0N09/2Bh6zEsQdLxMR8So=;
        b=Rt0pA8N9ectFCe3Kj1GK9jYH7ZxRLaMDBfGOGyPoPY7lOuTytPVGPL2yqfTQnceoxz
         EJj6sM2v1xwDZfxZTDD+xXpmlBqBhwiicOace6+VQ5vNHYWwgyankefjCcyUB+9vYV56
         nJaUX5Kb7tMPKhYc6LBv+5tieK+rB9/iJLKDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756849611; x=1757454411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbuImuCYfjCpUCet0u9+wg0N09/2Bh6zEsQdLxMR8So=;
        b=wAxRDVaD3HjlsQMzteRfi1rKpOh0EXN47W3bdWT61TK/jW7pwFOScZnopmx8gLw5Wy
         trtn2qjjlrsD9H2jH4leencyAJVnAgyfm/f9UZXelTE//liPO2Fxnn8qSVFLzXhbIAOv
         pE98oVPmLLyRwUrtKkI7NI6z9kgmopWZvZMoC7VFigHtQ//QvWtiAzXelBriMuyPJ4Ji
         LnnJAkxLLWoKP2gUk+ZnbWVofofFHlX+ZAHW3QICrTkR8TG5igBwqCCFFSR1ifcHO1bb
         OsIjDhqh3gfaqWVWAGqwLo9YtLZDY/TX9Uxjxas7gsmPrSHtLko2oxYshePDmd3SbiNz
         szsg==
X-Gm-Message-State: AOJu0YyOdEokF3FYUPGo6Q8jJrz37nqz4LAQoCPJjL14h4Kukyr7aAaS
	ATpZNGRD2onv/03StqofcTPyixH81NOgliqWdjwBxLE9FQ+NDH8FIFXxW8eftpscwAaYTd6NxQw
	VxU3UmA8=
X-Gm-Gg: ASbGncvN9Hu27fj00G+Z70yvhrxT9ipZqXmYPk1eBq42BwzNB9/k9Coxgo47ckFWiRD
	o4U4SYK4s/snsyaR4vGOzVUlVDObf/dvE7IjSxtq+l+PdNdkGIYVNPwphQaGeyiLxImSTkvY8iU
	ERKAZ5ZYDnW7yGPY0OTkbowu7MLwKGtY3qUaC6hqY957VlNHVe21kBEQHwhtSq/HLCw07VUckef
	RJrhzQwzbYEEljSsjClD4JC3ho9hbGEGbEhOjkreSKNaF1XhaKnQ5ilSK0sA9IvUcL1QkFHB4ML
	q++qyUFiuC7kOAEWS8A436xY84HAjpBenrLEmBPkzYiT7zmWnZW4+jZnEnNkaT373P9xOZX2gIh
	zQZJmHajBu7rYArh8mEr+0v2KP2V33wkh/dhICTKGSgssYbMBaQBKLyXk/1nWrw==
X-Google-Smtp-Source: AGHT+IFXCEUk7rb6MWzySB6yUJGxr34zbISiiVQwaX8Qea3++W5rSVsyFPi2uHQhGhCvvnHSeMmitw==
X-Received: by 2002:a17:902:d4c9:b0:24a:9491:f610 with SMTP id d9443c01a7336-24a9491f8f2mr174550395ad.49.1756849611163;
        Tue, 02 Sep 2025 14:46:51 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1f3205cdsm24048925ad.90.2025.09.02.14.46.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 14:46:50 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] python3-requests: upgrade 2.32.4 -> 2.32.5
Date: Tue,  2 Sep 2025 14:46:28 -0700
Message-ID: <2f55499d304eed92ef00c40abb8ef5c81eb516cd.1756849390.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756849390.git.tim.orling@konsulko.com>
References: <cover.1756849390.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222751

From: Tim Orling <tim.orling@konsulko.com>

2.32.5 (2025-08-18)

* Bugfixes
  - The SSLContext caching feature originally introduced in 2.32.0 has
    created a new class of issues in Requests that have had negative
	impact across a number of use cases. The Requests team has decided
	to revert this feature as long term maintenance of it is proving to
	be unsustainable in its current iteration.

* Deprecations
  - Added support for Python 3.14.
  - Dropped support for Python 3.8 following its end of support.

https://requests.readthedocs.io/en/latest/community/updates/#release-history

Comparing Changes:
https://github.com/psf/requests/compare/v2.32.4...v2.32.5

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-requests_2.32.4.bb => python3-requests_2.32.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.32.4.bb => python3-requests_2.32.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.4.bb b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-requests_2.32.4.bb
rename to meta/recipes-devtools/python/python3-requests_2.32.5.bb
index 49d44298f64..43b63e32b1f 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.4.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
@@ -7,7 +7,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-python3-requests.sh \
 "
 
-SRC_URI[sha256sum] = "27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422"
+SRC_URI[sha256sum] = "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


