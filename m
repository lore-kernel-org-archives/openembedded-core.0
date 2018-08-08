Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8688B78BF6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 22:49:27 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id f1-v6so1748702pgq.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 15:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9evr431z/NALx74C2NkDsQvdGiDuEnPXJHbPmwtts/Q=;
	b=qQmEVbCgjdtFmQF8nLyFdM7YSqA9eBoIwkVvNln4Jje1dgngXMWpc5DzCWdXNzOQvz
	XCD97vHRJ/L4yl8DstZc/W4A+9pXrvhiB9YGLd+xhxapZl7Jem7zs0icVDQimlLob2Vb
	nOsWM26Z79Eklbh7FZmjdG706iXTBiuQ77p0mm77NAX1tnGbWJ5DDwH6TX3s9q+u0RUi
	ovB/BrtWz73vmAMtTvpW6pllm8Y8gFLvs+ZDhhqLhJM2giGeFyK6mvj0UfUBT+uhBhtQ
	r6g/i5IGnC8MrM6SueyBa83yFIhJJ3u819WjzAWcnutV/QWqmTVMHWCCeVKgX6VXtaOk
	lr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9evr431z/NALx74C2NkDsQvdGiDuEnPXJHbPmwtts/Q=;
	b=AWOx5+yWiwWY9cpr7/JDjAj/yWqXfyds8dO32ymFOLCNi08EMnunl5ZpF4iSpJBN/2
	sQ71iJkgpDxVvBfh8LkUV3rJ9wBZpe7IKK/q8WtknsA+QVRIc6gsuZgCg6LeIqkuKdIS
	+Jo1fr7AC9YzULdgxdVtV3Z4X0dNsOp78hIvwIV46Rb9FKLBSnWjyDMMMEchnCBUCo0+
	JbPc3BVLiQj2aj7jPFxa+AXsAX9c3zFxUdcbZBA56xskhAI/p41QJHffczoORaPPizaj
	Hw3StOvF2Hh95scqfq+PI3Ym6zpj5thoyf/zvPNzFEVjPQO/h6a6XXURI+kDJOdjSv/D
	HP/w==
X-Gm-Message-State: AOUpUlGoaR3+2aV5XTNo2YsD271zcmbCma/ihv7FC7e7gijB1i9UXHPV
	6GpL9ETwEKoX+3llKrJPeXBaKzvY
X-Google-Smtp-Source: AA+uWPyC1S0TxjreBUiqBZtwz9wzIgoRSxXCTbuekZVunk64vMKCqj2m3H38q9J+7bsHSvQr+5/Tlw==
X-Received: by 2002:a62:a6db:: with SMTP id
	r88-v6mr4873622pfl.60.1533768568253; 
	Wed, 08 Aug 2018 15:49:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	s195-v6sm15226452pgs.76.2018.08.08.15.49.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 15:49:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 15:49:13 -0700
Message-Id: <20180808224913.23196-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] lib/oe: Fix collections ABCs DeprecationWarning in Python 3.7+
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2018 22:49:27 -0000

- Prefer collections.abc (new in Python 3.3) over collections for abstract base classes

- In Python 3.8, the abstract base classes in collections.abc will no longer be exposed in
  the regular collections module. This will help create a clearer distinction between
  the concrete classes and the abstract base classes."

- https://docs.python.org/3.7/whatsnew/3.7.html#deprecated

- see https://github.com/python/cpython/commit/c66f9f8d3909f588c251957d499599a1680e2320

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oe/maketype.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/maketype.py b/meta/lib/oe/maketype.py
index f88981dd90..c36e7b5604 100644
--- a/meta/lib/oe/maketype.py
+++ b/meta/lib/oe/maketype.py
@@ -7,7 +7,12 @@ the arguments of the type's factory for details.
 
 import inspect
 import oe.types as types
-import collections
+try:
+    # Python 3.7+
+    from collections.abc import Callable
+except ImportError:
+    # Python < 3.7
+    from collections import Callable
 
 available_types = {}
 
@@ -96,7 +101,7 @@ for name in dir(types):
         continue
 
     obj = getattr(types, name)
-    if not isinstance(obj, collections.Callable):
+    if not isinstance(obj, Callable):
         continue
 
     register(name, obj)
-- 
2.18.0


