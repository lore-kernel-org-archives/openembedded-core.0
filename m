Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF6073163
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:24 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id r187so5033626pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Z7ZOb68LZWK5O1QjmDHyvVjSJbshpkAszzJq6/xmteQ=;
	b=ISSOU/8wayWguWYbdo4zBKIbP17kQf8O7VZ2o/aBPg5kDYJUDvSMF7+CtZASb3dKNL
	Mgv+pPbimKauFYcQIhW4AGjU2QD/LTeRgxC30FUEzBB7uzB7MygX9pRr4FAwM/fSJ/si
	87EOIZgQNL7fRaFMUnZGK7tEbyiTDkG4fkzHr0cSAC21ZNMKDCmK51egXcTk3XXffjUd
	UchzpN0dKEUyn7+wcdFLOXGj79FIFKE7pAi+scMkBxLyPevRBOEL8gzyjFEquaf1JljX
	6rC/Zq2hNCqxaLnnGZGlFwQK43J9iOQ7j/YT0ZPJQwcnuy/sRKS8holy8u8iEGH9UyDy
	IF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Z7ZOb68LZWK5O1QjmDHyvVjSJbshpkAszzJq6/xmteQ=;
	b=S60/bZi4IcspooamCUjuOXKaBtTGKmedE4zIX+rreRWdSbbrQjgLSgL11qIvcSOmDD
	lRuPV1M2ab5qbPqdUeAi3r3IlP1Ib3OtBsUb39q0Nyr2h0tOGeySO3BxbDUguQMMpJc7
	uLENfoJq05Ce0ApKz95EdiOx4RalcsTQys9/Vd3GEgoLDbhbTjdmtJQwD8mhsHcfKnD+
	W+toi6pK4vSeEN41cWeqrBY24DUKhASl3R+wPJR9PqrVOghbrJfxuUfo8Adpr+a+pzbD
	7oEkhgYlCNzGrhC5IQPlnBxrIQL5zhuVwVHtPVTdyjeOqYr+Z1exQZ+4SoLCaKscGGvz
	ZP6Q==
X-Gm-Message-State: AOPr4FWG3/YMtFq1YaDCFheHo8//mO1z5nQGo9Ueew8FYxm80E55PuWdamr/fWyagedYcA==
X-Received: by 10.98.77.6 with SMTP id a6mr6728050pfb.133.1462988185499;
	Wed, 11 May 2016 10:36:25 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:37 -0700
Message-Id: <6edd95b22c548681cf8ef5f47bc3f0acf33b428b.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 34/42] gdb: Disable binutils components
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
X-List-Received-Date: Wed, 11 May 2016 17:36:24 -0000

when building from git we also get the binutils
components since the tree for gdb and binutils is
same, this can then casue building binutils with
gdb as well and cause packaging conflicts, hence
disable the binutils pieces in configure itself

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 0e6ecd4..1d1cf8f 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -52,7 +52,10 @@ EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x --disable-werror \
                 ${GDBPROPREFIX} ${EXPAT} \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
                 --disable-rpath \
-               "
+                --disable-gas --disable-binutils \
+                --disable-ld --disable-gold \
+                --disable-gprof \
+"
 
 PACKAGECONFIG ??= "readline"
 # Use --without-system-readline to compile with readline 5.
-- 
2.8.2


