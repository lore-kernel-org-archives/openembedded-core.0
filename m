Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D0CCD8C90
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:26 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6127.1780698857652095400
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UnRMP0/B;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso1269050f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698856; x=1781303656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WKJQI6dfIZf3WHgLbBg0IdM6mCurlDlaa9hePjdGLs=;
        b=UnRMP0/BdOd6D4xnzFScCk/MybUVuL5CpQkaYOds0YKIJxmYjoCrVlDz+T9+KouF5+
         q0pedyH/bgfz41awjDfBW1lWYCqnhnkzWpRpkaVG0CPN8vf9fkJP7JQ1cAbMBIthPT0G
         /aPJJQcuGlLoAG9QWqxc+0vtDbHtZiyd73COU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698856; x=1781303656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3WKJQI6dfIZf3WHgLbBg0IdM6mCurlDlaa9hePjdGLs=;
        b=frGZpUzv6c1GsIuxzEa8VV4D0piXo9rXZTBPDcItAOzYjK5HrijWcUC6kSgJConBht
         FCG8gFhdnNj+Z4xLD6f7FWlXqqac7/Z0hTtVcZDAFbkLLZxRzeABfVVxLlqilpT4NVHT
         tEbg28nsBYepn9QOXJ+LWxTwr1mwF1N1Pvm/fAZP6dESTwucLPDclF3imRWb5DZpOvH3
         N1dVAwZadBY02qhoG1XAbHG4CHgDzy693X0nhqAuRVCFd7DDotB1IXpwGRLwAyugAdLv
         Gd9gSCEEp1rbxT8hLu5mMjGsXqJR716yE5Gpogpvby8kegw4J5RM6pN9cvM3/Hw2949Q
         uQ/g==
X-Gm-Message-State: AOJu0YxLAZH9mkTtICcXyewZZg2YerbYX9wkO/V+2B+37pVmZyfpwK9D
	wilcgNHwlQMOYfKIKrKJnMEF6dqW0UOA7f9hFEuEP1PryoIbzgTw53McNd8krTO8BGdVn9kpJLa
	3uKq/
X-Gm-Gg: Acq92OHkBG591x7mBpOHNbetAEdH3ZBuH9WCi1inP2IhVZecSMUZ1gbIs/jH+CRY8z3
	n618fXgBcRj0paIR/xYOljOL37wtDIa67YnEJx2JfJbsFh8wkZuQuG+hXEx49HoIJJOBTYduhoR
	jnG1+2lrP7/aFcBzYaeFFn8S4sqFdsVBgrWR0CS2pHD0SlQAGWWpMwu/SWcSc2qhmAg3Z2P2kpA
	Ew9cTph9yFBvStElmu4KfLtYg0wmikpXOjvLuYeaVMBsXbbBMGJiKfaZse2sstU7WiDnKB1mGrh
	XX5JAmc+82yBvy6OtitmhmlZ7GzGhICOr6DOuXan2ziH7ISgI8RVRsOffpV94N1XcEQ/oZdPT9M
	wKcvblYGb4c9Cq259jZMMSgLo6fD1IFOHVwcWM67ucmUq+WCsO343a0ujloCiRD3EJtCep8UcVh
	T6ys8G/0YffSHjHfoR0CBvjc3fAZ92WwOwjy0GJJdFcXowwezt0f/gCan0jP7/vFlVFuJ0yIUZP
	1gCGJ6d4f0CiJq+QUWg99o1BFCablwZwVALCCs=
X-Received: by 2002:a05:6000:1284:b0:460:2d45:fe8c with SMTP id ffacd0b85a97d-4603063e7c4mr6676704f8f.38.1780698855978;
        Fri, 05 Jun 2026 15:34:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/25] go.bbclass: change GOTMPDIR to improve reproducibility
Date: Sat,  6 Jun 2026 00:33:50 +0200
Message-ID: <1b08bf9296fb6583234933b22b67b851591610a8.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238192

From: Changqing Li <changqing.li@windriver.com>

When cgo is enabled, the Go toolchain writes temporary source files
(*.c) under GOTMPDIR and compiles them there. when -trimpath is passed
to go, Go passes options such as
-ffile-prefix-map=3D$WORK/b387=3D/tmp/go-build internally to the GCC
instance it invokes. The variable WORK is a temporary directory created
under GOTMPDIR, refer the following log:

[snip of compile log]
WORK=3D/build/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/build-tmp/go-buil=
d377321751
cd $WORK/b387
TERM=3D'dumb' x86_64-wrs-linux-gcc -m64 -march=3Dx86-64-v3 -fstack-protecto=
r-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dfor=
mat-security --sysroot=3D/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recip=
e-sysroot -I /tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/sources/buildah-1=
.41.5/src/github.com/containers/buildah/vendor/github.com/proglottis/gpgme =
-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0 -ffile-prefix=
-map=3D$WORK/b387=3D/tmp/go-build -gno-record-gcc-switches -v -D_FILE_OFFSE=
T_BITS=3D64 -I $WORK/b387/ -O2 -g -ffile-prefix-map=3D/tmp/work/x86-64-v3-w=
rs-linux/buildah/1.41.5/sources/buildah-1.41.5=3D/usr/src/debug/buildah/1.4=
1.5 -ffile-prefix-map=3D/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/build=
=3D/usr/src/debug/buildah/1.41.5 -ffile-prefix-map=3D/tmp/work/x86-64-v3-wr=
s-linux/buildah/1.41.5/recipe-sysroot=3D -ffile-prefix-map=3D/tmp/work/x86-=
64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native=3D -pipe -v -ffile-pre=
fix-map=3D/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/sources/buildah-1.41=
.5/src/github.com/containers/buildah/vendor=3D/_/vendor -frandom-seed=3DTZk=
SPVSBUvDMjg4wKjWS -o $WORK/b387/_x004.o -c unset_agent_info.cgo2.c
[snip of compile log]

OE also passes its own DEBUG_PREFIX_MAP to GCC(finally by CGO_CFLAGS),
including -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR}, where B is
${WORKDIR}/build. Because GOTMPDIR defaults to ${WORKDIR}/build-tmp, the
Go temporary directory looks like ${WORKDIR}/build-tmp/go-buildXYZ. Its
prefix therefore begins with ${WORKDIR}/build, so GCC matches the
DEBUG_PREFIX_MAP entry for ${B} first.

As a result, a path such as ${WORKDIR}/build-tmp/go-buildXYZ is
rewritten to ${TARGET_DBGSRC_DIR}-tmp/go-buildXYZ. This breaks the
-ffile-prefix-map option that Go itself adds, because the original WORK
path no longer matches the value Go expects. Since Go creates
go-buildXYZ directories randomly and internally, this causes the build
non-reproducible.

This patch changes GOTMPDIR from ${WORKDIR}/build-tmp to
${WORKDIR}/tmp-go-build so that the path no longer matches ${B}. This
prevents unintended replacements by OE's DEBUG_PREFIX_MAP and
restores reproducibility.

Note that pure go program like go-helloworld under OE will not have this
issue since it doen't use cgo, it is reproducible without this fix

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 0642d2323072f561a4d0eeb9266213387b2997fc)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index d32509aa6d1..61b08a082f7 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -77,7 +77,7 @@ B =3D "${WORKDIR}/build"
 export GOPATH =3D "${B}"
 export GOENV =3D "off"
 export GOPROXY ??=3D "https://proxy.golang.org,direct"
-export GOTMPDIR ?=3D "${WORKDIR}/build-tmp"
+export GOTMPDIR ?=3D "${WORKDIR}/tmp-go-build"
 GOTMPDIR[vardepvalue] =3D ""
=20
 python go_do_unpack() {

