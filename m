Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1B5AE7F2E7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 20:57:17 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id l2so77761041wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 13:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VFLW2xfnamzOevQYimPDGWwsr8UH7LL8Er6xJurXF8U=;
	b=MXl2WNWlTfFUz93XSJCj0dASzgVSzKP1cjTTC4u+hYYWhjPMu30Tcq7oMUPJoZjyXM
	b5t73MmaIyzKVxsqt2hRLNGc7pWzOIBM1vmj9TnZzV+lhMSj3QqMUcdShfGe7c6466Xb
	dZKDt4ciAfRshBZhMw32hZNXWYbMHDIOw3GV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VFLW2xfnamzOevQYimPDGWwsr8UH7LL8Er6xJurXF8U=;
	b=uiuATydOkXHQD0OTdm5J4NSwdHSZo+wAi7SNzi0mlfcR9zUQB9Oaxxrtm1qz2WaRDl
	DGkAnJcdwfqVn9FF3uoBOiryBsmXn8/0vJUgjQfmUFupsHtDc88dR8wiUg6sP5qDPL8q
	ES4GROpMKGYb6SIqEJ1/9Y3jkKWv26sshcyLC8aeyOL8bFyG8WeX9QI+si4acH6E+wQs
	wOswqgXu4/i/ouEU56JxuwuYkE3oiblNPVTeg6g6UdLi9cClH4bGlM1SOGGR5jvIzLdw
	MrfOc3GAXI033M1Q+bDcyyakLR9P+G1Alb4jy7SV7nAJOKKO/z+ns5xQmK+FyooSup9Y
	7yCg==
X-Gm-Message-State: APjAAAWu7HujdhALKRJ3LSqTNgbcUSmBMw1InXkwgr/upgW/ycmLPM+p
	4z6+ijYcFO9b+TjziKdPA5VgZ9ygVwE=
X-Google-Smtp-Source: APXvYqxL5S1uIoEroe/NvDqIUtTH1XxRdRdqWxZqkWSrhAGwqxt+9tXAUBIGlahSbu8U582hQT7S6g==
X-Received: by 2002:a1c:d10c:: with SMTP id i12mr6320993wmg.152.1565125038384; 
	Tue, 06 Aug 2019 13:57:18 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j33sm204491496wre.42.2019.08.06.13.57.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 13:57:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2019 21:57:16 +0100
Message-Id: <20190806205716.12240-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] sqlite3: Fix zlib determinism problem
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
X-List-Received-Date: Tue, 06 Aug 2019 20:57:18 -0000
Content-Transfer-Encoding: 8bit

sqlite3-native in particular was finding zlib from the host if zlib-devel
was installed. This could lead to races where pseudo-native may or may not
fail to build.

We don't need/use compressed page support with sqlite so disable the dependency
(it doesn't have a configure option so use a autoconf cache variable).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/sqlite/sqlite3.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index daf3db5e9fb..2ad621503cd 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -21,6 +21,10 @@ CVE_PRODUCT = "sqlite"
 
 inherit autotools pkgconfig
 
+# disable compressed page support as we don't need it
+# we can see non-deterministic floating zlib dependencies otherwise
+CACHED_CONFIGUREVARS += "ac_cv_search_deflate=no"
+
 # enable those which are enabled by default in configure
 PACKAGECONFIG ?= "fts4 fts5 json1 rtree dyn_ext"
 PACKAGECONFIG_class-native ?= "fts4 fts5 json1 rtree dyn_ext"
-- 
2.20.1


