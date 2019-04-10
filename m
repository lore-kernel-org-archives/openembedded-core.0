Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id AE4B67D90B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:34 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id q16so2561407wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CtjziQ09FbnC6cKC2MnmjJzxkJuN8uXiJhvJsL873PE=;
	b=rqHe7qhWNgcAUm2PbjTb/rk0fkwgJGYvy7A7eA+Xkb9K4Pyj9+A5/PQUYxD3ZIt63n
	YplX73BUYVqmOJ2EzgEh6/8ZQaOFrLK/n9xUqgYWU3xNwBDvlhDRv+G4nVhIlDg6fTrR
	nmb3wWca0pQws6zTQ8DA9fuwZWLzcryiVYeIXU2n2tApSmbTzJITHUHcsQmb5eF0XMEE
	Cg6dvyQlK4lsn0zyYl+AMPdZ5dXn3oEdFvaaD6H39MqxbUk9coRYEaF2PUWnJoLA2IL+
	w0nZmLv+b55HkL+a6F+rNsFmWNAoy7RUkhcLuJLuwjtvnaamNwuWMTVTsR3zhdws+U6P
	y1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CtjziQ09FbnC6cKC2MnmjJzxkJuN8uXiJhvJsL873PE=;
	b=uGOCWbH6ur0JeKEXkBNrg1gKZDuH7LSO6sOFC4C5ApALs7bWPFNQ6Fja7sQJARLo+0
	C/owmm7Hop92k9TUgF0HQhmvkYdOwie57UKjQPfmbYQ6Uyn+yDYioV12YqwFV2CPol7K
	Y1tgzFjh9/1Yp/cW79bN65eEoqcjFppyniSwb0RvKN9bqmwESgxa77rSEwMEiNED3GcZ
	Uayg1pTUES4/0su/QT7f3VpOdTsmLCsU+HnywODPIei9ObyNb+m1J/HNevt1kT07XXwF
	p9B9MZH/J2tga6GZj5yCHGQ8+3aZKQcFJ8y+FlSy4MmlU8Ys0YE4Kc/QR+eTmbR4xYzp
	vlJw==
X-Gm-Message-State: APjAAAVq5gMNixoXpFubCmLeL2hzQGsmZivodC5sFfgJyRcww7IcXoif
	dzFtvnXalXgsyQVtTMCOGJlc1qsdEBo=
X-Google-Smtp-Source: APXvYqxdpn3HlaBfADkq51mX13dwaC8hB4JeUt71kO4EMh4JKk+fpZd1wWHxHBXHEwgmVaCcDWKbkQ==
X-Received: by 2002:a05:600c:21d3:: with SMTP id
	x19mr2873307wmj.2.1554901955112; 
	Wed, 10 Apr 2019 06:12:35 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:48 +0530
Message-Id: <b254ab6ce34da3d3241a51958b5770664d317fcc.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 29/33] lib/oe: Fix collections ABCs DeprecationWarning in Python 3.7+
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:35 -0000

From: Khem Raj <raj.khem@gmail.com>

- Prefer collections.abc (new in Python 3.3) over collections for abstract base classes

- In Python 3.8, the abstract base classes in collections.abc will no longer be exposed in
  the regular collections module. This will help create a clearer distinction between
  the concrete classes and the abstract base classes."

- https://docs.python.org/3.7/whatsnew/3.7.html#deprecated

- see https://github.com/python/cpython/commit/c66f9f8d3909f588c251957d499599a1680e2320

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/maketype.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/maketype.py b/meta/lib/oe/maketype.py
index f88981d..c36e7b5 100644
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
2.7.4


