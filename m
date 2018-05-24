Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0711974922
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 14:55:54 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id 94-v6so3687027wrf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 07:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=64irZT/EdcnU6xkLjoOzNYqYzt21KeUO/F12Kq0a5QU=;
	b=ECBGnaJDy4z8JQyBc7dyL4zu1qKU1uYqMTnhKrmdlnoE4LAgUE9wXzng93cbCqhdrZ
	GU1VG0LFz6qPQm0Up55ZdhKajsuqh85uALX/nP3owPNnKDfMlWlIVIl3fYTL3ftanjX+
	oI1bBoMibJHR+qXfVR9vccOW5LLeOXqDljfTl96XicADLLn5WtJxVkx/5I4vfMEZJBKr
	IZc64D2xwDDntEzjWtwcl7Jv/1wayxXGiKktke7+5CfOYAnl5cBzXPuVNJlWOFgQ1zgK
	IzRK7h+71tVyjBIGxALcxdndqWwNW5pcZYtko7DO5R2DGg0nqLi1dJ936LjssPlpGP+U
	6CLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=64irZT/EdcnU6xkLjoOzNYqYzt21KeUO/F12Kq0a5QU=;
	b=hYtzcY1q0CQekDXhDNcUzmmIFm7MhSQlhPeLaZzWFj+8IPeJS5+6ir6S2hBYr0BFKs
	tqLX9l7fKsZbjw7Xtq1kOvCzEgAk9Cm7ob8C+oTdlPsto07x/3KYC7qm7DtUlNZyXhVS
	fCI3boHFq6UbuBFpMg61atvfCrUko7/FtC5Krd3NdwFYZPaBGVYaf5Dd3wSRZTjUPMjy
	Miykuemx84NJWvpqB4kBwDaHOC+Xa/7psfRRab7HFlz1PGDfg5DYWOHF857ZiR7CZv3f
	OfdDsEmlBtzUMVPyZTkx2rdLZe9XLwvCEpjgPN1yybVQ3wKj5Dw6BVHyR5OCT4NDa0y/
	UDrg==
X-Gm-Message-State: ALKqPwe3ouMt9icTRQmUxegiAZLrzHavM48zY2DSHmWmcYYPiCMrwKvW
	79cFK/uCaRraFNweOxo/Ejf7jg==
X-Google-Smtp-Source: AB8JxZp1csuTARJd1mqvJf4alJ+6bkjnVPtrWNp6ub7lSkA4RlEmlasbClgk8J+PmdtwpHHiHWu1yw==
X-Received: by 2002:adf:a292:: with SMTP id
	s18-v6mr725839wra.114.1527173755208; 
	Thu, 24 May 2018 07:55:55 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g127-v6sm4040882wmf.42.2018.05.24.07.55.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 May 2018 07:55:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2018 14:56:01 +0000
Message-Id: <20180524145601.26722-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] perf: fix build with kernel older than 4.8
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
X-List-Received-Date: Thu, 24 May 2018 14:55:55 -0000

* perf is failing to build for me since this oe-core commit:
  commit 9b38c824961fc9dce51bda95c25dac91a69fc64f
  Author: Hongxu Jia <hongxu.jia@windriver.com>
  Date:   Tue Apr 24 11:33:47 2018 +0800

    perf: make a copy of kernel source to perf workdir

  the problem is that perf sources in kernel older than 4.8 (in my case
  4.4) are depending on the "global" include headers outside tools
  directory, e.g. swab.h in:
  kernel-source/tools$ git grep swab.h
  perf/MANIFEST:include/linux/swab.h
  perf/MANIFEST:include/uapi/linux/swab.h
  perf/util/include/asm/byteorder.h:#include "../../../../include/uapi/linux/swab.h"

  this was resolved in 4.8 with:
  commit 7e3f36411342a54f1981fa97b43550b8406a3d69
  Author: Arnaldo Carvalho de Melo <acme@redhat.com>
  Date:   Mon Jul 18 17:42:16 2016 -0300

    perf tools: Remove tools/perf/util/include/asm/byteorder.h

    Not used anymore. This also stops include linux/swab.h directly
    from the kernel sources, remove that reference from the MANIFEST.

  and few more changes to make tools/include more complete and standalone:
  tools/include in 4.15:
  asm  asm-generic  linux  tools  trace  uapi

  tools/include in 4.4:
  asm  asm-generic  linux  tools

  but copying the include header even for kernels which don't really
  need it doesn't add big overhead, so just copy include to perf sources
  for all kernels.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index fb4e3ac668..51f5597eb9 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -98,6 +98,7 @@ EXTRA_OEMAKE += "\
 "
 
 PERF_SRC ?= "Makefile \
+             include \
              tools/arch \
              tools/build \
              tools/include \
-- 
2.17.0


