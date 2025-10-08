Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB80CCA476
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 00:27:40 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.5068.1759883252990206059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 17:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tx9m5IiO;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-336b9473529so320781a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 17:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759883252; x=1760488052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x4wdi03wn2PHNqqpvnXGcRT9olWevzxmvbWlDIemZKs=;
        b=Tx9m5IiOLyXaHpoRa0VrpVdJNfPazWys+JdWd8aFPR19Nenv9WhjXUgUTOrevIE1WD
         C5tAyPoCM9QMRrlZKpdqdyXWe5pENiqaRG0SsHq4HmGkXVjKWTwVqGI19O95MyK3r5Fb
         L/2b3n2zT0/Gu9kDkSX61/SXhHbMwgVC8kOh3BJO9eEQsDHnX2C6VypzcnjO3Jc+w7kD
         VBMecyrhZXUHtGoJZsdQ+0p182BmJBRdipiQw8U/RlV/6uQ3rtMDllDnRxOsR27MfLTr
         LGE5FkMyVERTO4hlTQPbqggyPi9gmaHGquD32xkLPAZdlrF85KaD8MZ6F0zFnR4tZMhO
         Fb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759883252; x=1760488052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4wdi03wn2PHNqqpvnXGcRT9olWevzxmvbWlDIemZKs=;
        b=wAYoTD3lsHbRjCYzNC/GPqvOf79fJeixH1c82BWJ1qTw5E9T1WJw5CmesSaHT6NPCs
         TNYWy34ohTr5e3qaL9N1eJhO3ISpxYdiTlfMmPDe2wbsb3UBUB8u7dM3U+eh6wuGYPvF
         jExACnMQRppcGSrnK4/4j986a1vpP+h81ouzhOGfSk4EwI7p/szXCY9469T+GzgFMgK+
         YD0EsSDji/riKZGV4hawTnkh6yMeSvQiZAgiAnFHFQB21VZYZBDhNEgHd249j9mKu+Cg
         9amDS7+L/wfM8NnliKwKkUjdtmp4gYUp/neycTCMtd4qzbb8s7j2FBE8sAQ2tMvGqoDW
         yeMQ==
X-Gm-Message-State: AOJu0YxS4AKwytr8eLUd4U++Hu+T3oq+V/CkIlveP5FlIG61mkSbjX7G
	qpBK6j33ysU7KPjsNMXkexSXasUPVx59WGwJOnchaQ7VERMSK3/jjTy7Z26mS0YQ
X-Gm-Gg: ASbGncsnLGsOZKRZYsK37SO4mU+gV7RIqEz+zdgPTzxqC/Mg1rxDObX+uSGnZHqWdaf
	A+Pxt8RWbS0f1ij1LVAnjGq9IKYU5JwPeoHMLhro2+gaIsTuOQ4WoeeNa3VNThET2Lv7OBF44Eq
	pRQqMXHWgJs3uDRVOcCw//H3kjcY3xl07D2bT7q5lcyeDCMbtofExusEEsWVszAZ4AhP663hgmn
	LZ5HWijimUMMp9kjB6KVgUKDzGQdtUjnOPoFaikOWTuToWOJgbHSXHqRdJWMxJjIQdsr005zPjE
	NSyvcwJnpVaYXDNMH02++vzt29dy2w63LB5QxnrytHVyBX/5+1qrCKfNYhKLbqdpSGb5F9VTG0G
	5HeZwdlK/aJGOYRu4kEVYsr65lHGmrZQrD9fVodeOMZeOUBJNZN4dIXQybEl8wyIdm+63yA1EfB
	taQw1kQp9jAoSNekhzsOwWnVq3wVvYX3LNRLbnh7blQ9ZQK5CVYeb6s6LEu35l2OE=
X-Google-Smtp-Source: AGHT+IFjUv1Btuxch8TiV32d9P43PbBtVyruEjqHgf8LQR2c/P3UOA3DLqJvLmHLwYgX5C3+qtYAUA==
X-Received: by 2002:a17:902:e851:b0:25d:510:622c with SMTP id d9443c01a7336-29027f3e339mr16392495ad.28.1759883251876;
        Tue, 07 Oct 2025 17:27:31 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d111905sm178127515ad.24.2025.10.07.17.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 17:27:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] perf: Fix headers related build race condition
Date: Tue,  7 Oct 2025 17:27:29 -0700
Message-ID: <20251008002729.1850430-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 00:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224576

libperf specifies paths to includes in its output
directory if they exist, however install_headers target
is run in parallel to source files being built for libperf
and can race with objects being built for libperf.

This patch ensures that all headers are built/installed before
they are used.

Specifying additional include paths via EXTRA_CFLAGS is of
no consequence anymore after [1] because it now is appended to
CFLAGS, so if we are trying to do include path oderining via
EXTRA_CFLAGS it will have no effect if those paths already are
in compiler commandline

[1] https://github.com/torvalds/linux/commit/f5b07010c13c77541e8ade167d05bef3b8a63739

Signed-off-by: Khem Raj <raj.khem@gmail.com>

s
---
 meta/recipes-kernel/perf/perf.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 3b9e52fdb84..f071685a4be 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -105,7 +105,7 @@ EXTRA_OEMAKE = '\
     LDSHARED="${CC} -shared" \
     AR="${AR}" \
     LD="${LD}" \
-    EXTRA_CFLAGS="-ldw -I${S} -I${S}/libperf/include -I${S}/tools/lib/perf/include" \
+    EXTRA_CFLAGS="-ldw -I${S}" \
     YFLAGS='-y --file-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR}' \
     EXTRA_LDFLAGS="${PERF_EXTRA_LDFLAGS}" \
     perfexecdir=${libexecdir} \
@@ -173,8 +173,8 @@ do_compile() {
             sed -i -e 's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g' ${S}/tools/perf/Makefile.config
 	# There are two copies of internal headers such as:
 	# libperf/include/internal/xyarray.h and tools/lib/perf/include/internal/xyarray.h
-	# For reproducibile binaries, we need to find one copy, hence force libperf to be created first
-	oe_runmake ${B}/libperf/libperf.a V=1
+	# For reproducibile binaries, we need to find one copy, so built the headers target first
+	oe_runmake -C ${S}/tools/lib/perf DESTDIR=${B}/libperf prefix= install_headers V=1
 	oe_runmake all V=1
 }
 

