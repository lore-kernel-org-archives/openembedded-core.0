Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0974CCF9F0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 13:46:38 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.12196.1761659194742036198
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 06:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SxSGMXU+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b6cea7c527bso5839215a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761659194; x=1762263994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtBBpd63X0+tV2ApqJLqYTGy27BXdj7CbLrnde/NV8o=;
        b=SxSGMXU+ApbGxT2FytG9SrgmEzqMLV2MzgUohUZI7yTI03its51O99SdJAEdijUdD0
         8nWtRVxQ1pTtElxFkzBhFPC/xSoT6meOgG26WKkJLhLa595jlkLaXVWHh+i1gzog7k3C
         fcvy1hQU3BIw962UnMwFebAT65BW43PAYLqMrcAy8ybf7124ZF+ugFGbzq0zoRlh/S0b
         QwRtXriBKz9D18728NzfFcPw94XzhYR9dOEYeKja0BJJyGPF5RC3MZOfF9FZxBmrMibS
         J1meueTyWDP6TQI3C6ROsyA+4k/SGzXJI4C6gzE2Pv2wAyz4yXYIi7qBO0lfex3U0OSv
         n7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761659194; x=1762263994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtBBpd63X0+tV2ApqJLqYTGy27BXdj7CbLrnde/NV8o=;
        b=cikAalXShQQhDNkujW68b9LF5bnRbk12Jv4KnPA+CT89y3SrzKM1e0GNUyEP9NN3J5
         UCkWKezJ/+aYpxHa/GccEmVeb7jR7r3MavIOesPjdqdonzOMmP6qGyndy1t3aePDQXdA
         eM9LDaSGrKNaO04WHG6/2Mbhclgx3mXZ0C6UdlcuPliPhdib6n0PDgDXoeQmlAGd7bN6
         pM56APfU8p3B63JY29Yt7WGrBIei6nSk2rDB8dFuU2k+woysOWuRjmwVDFw7xJrFRbar
         g6+JPQAw11oFH8tQuJDyHSNcG88V/sQRNbCq87Ad1zNcHf7jlKuy3ht8cBhEhdW2DrcO
         S7zw==
X-Gm-Message-State: AOJu0YxuaQmBT///JthEmsKKN74Bo5v6X1iJ0bH1A+w92f2uulk0isV1
	hjhtLAdjJYDPE5266BllCYnifznGAgOJcNXzKd5jQA6yOjWDUlLAC4NVIpeMofru40J9AhDWcvh
	e9+iqKDk=
X-Gm-Gg: ASbGncuQbczuRTchV4KHp1u1GhgKUzHRYupJp8a5+IkAOn9iiO5l12jaxclekN5iI2m
	7loW8AGWjwGpa08SYGDxoln1BcxEA5ZVpEct1lXitKKNB4baPpgh7nIM7zSdvBG3a9g5iP8AJyT
	HxYlPCNyvqy1MRMlVHrR8QxkStJvBaplK44pRFHitEXpSDJ+oD/d/MU6cU5fnl9KsIZuE1FSWJh
	3lPAlebnPdlGQpSKHpLRUS5IEudtDDdlQhdV0iwTH4nXG6sGwj/py8SlA2PnRdIqafcql+DHrQn
	xelyizLkZfo+AAhm7oOlSyVKz44lllnw65XWi8eV+HloB97+8xvkDmZchq+wFQ8SV6Q28Pc7FWe
	/1N9g8hMgOab7/b7pW4gC5ct5EVQ6NHED21zLO6edu1LXvuYVYUpIxIbu1krdXq+9wLs=
X-Google-Smtp-Source: AGHT+IEbb3QC7EdBxvMXHdgZ1kgiiQ9/4LkgMw3OoC/S5Ujnubyjw0ZXKKeMPbKOn/3jXemH7QnP9A==
X-Received: by 2002:a17:902:c94d:b0:25e:37ed:d15d with SMTP id d9443c01a7336-294cac97ed3mr43219075ad.0.1761659193927;
        Tue, 28 Oct 2025 06:46:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2bae:51f5:3bdc:4c68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40a7esm119894605ad.70.2025.10.28.06.46.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 06:46:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/8] flex: fix build with gcc-15 on host
Date: Tue, 28 Oct 2025 06:46:15 -0700
Message-ID: <c13635db898146de4935c8c1c5e61cd732fa694e.1761596406.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761596406.git.steve@sakoman.com>
References: <cover.1761596406.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 13:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225405

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  http://errors.yoctoproject.org/Errors/Details/853017/

../../flex-2.6.4/src/../lib/malloc.c:6:12: warning: conflicting types for built-in function ‘malloc’; expected ‘void *(long unsigned int)’ [-Wbuiltin-declaration-mismatch]
    6 |      void *malloc ();
      |            ^~~~~~
../../flex-2.6.4/src/../lib/malloc.c:5:1: note: ‘malloc’ is declared in header ‘<stdlib.h>’
    4 |      #include <sys/types.h>
  +++ |+#include <stdlib.h>
    5 |
../../flex-2.6.4/src/../lib/malloc.c: In function ‘rpl_malloc’:
../../flex-2.6.4/src/../lib/malloc.c:16:15: error: too many arguments to function ‘malloc’; expected 0, have 1
   16 |        return malloc (n);
      |               ^~~~~~  ~
../../flex-2.6.4/src/../lib/malloc.c:6:12: note: declared here
    6 |      void *malloc ();
      |            ^~~~~~
make[2]: *** [Makefile:1431: ../lib/stage1flex-malloc.o] Error 1

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...01-Match-malloc-signature-to-its-use.patch | 25 +++++++++++++++++++
 meta/recipes-devtools/flex/flex_2.6.4.bb      |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/flex/flex/0001-Match-malloc-signature-to-its-use.patch

diff --git a/meta/recipes-devtools/flex/flex/0001-Match-malloc-signature-to-its-use.patch b/meta/recipes-devtools/flex/flex/0001-Match-malloc-signature-to-its-use.patch
new file mode 100644
index 0000000000..fc3b8c563d
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/0001-Match-malloc-signature-to-its-use.patch
@@ -0,0 +1,25 @@
+From cec508013706ef06dbac036905a90cbe075fa03d Mon Sep 17 00:00:00 2001
+From: Richard Barnes <rbarnes@umn.edu>
+Date: Wed, 2 Oct 2024 10:35:09 -0700
+Subject: [PATCH] Match `malloc` signature to its use
+
+Upstream-Status: Submitted [https://github.com/westes/flex/pull/674]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ lib/malloc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/malloc.c b/lib/malloc.c
+index 75e8ef9..701b9b3 100755
+--- a/lib/malloc.c
++++ b/lib/malloc.c
+@@ -3,7 +3,7 @@
+      
+      #include <sys/types.h>
+      
+-     void *malloc ();
++     void *malloc (size_t n);
+      
+      /* Allocate an N-byte block of memory from the heap.
+         If N is zero, allocate a 1-byte block.  */
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index f7d4ef1f08..52543b6e02 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/flex-${PV}.tar.gz \
            file://0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch \
            file://check-funcs.patch \
            file://0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch \
+           file://0001-Match-malloc-signature-to-its-use.patch \
            "
 
 SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
-- 
2.43.0


