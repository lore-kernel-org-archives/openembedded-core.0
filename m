Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139DDC5AE5E
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 22:48:52 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.20275.1700174928357479542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 14:48:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c2ZorgdO;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9d10f94f70bso185061166b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 14:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700174927; x=1700779727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdlzgoUZANXR6v0465sIrJ9Hs3IgMFC19ooZZ+TXjyg=;
        b=c2ZorgdOfik2ZxDSWty3hHrXFMW1nByV+/ZDsHyjSfkokgZy8xTaZ0ZyqlUuufb/3o
         JJDN85b4e+vj8qPTMziZFKaSxjf18wxO/I2IORzrd8vtdXi8ZO0yiqmyaDA+1b+w9sgR
         X/OPXxT1PnRHqba7Y05aVwp+RT7ZU0pvrU6mRzNDAx8RkQ+uFEYOe0ha6sg4qn2bQKtK
         j7o3d+eWt9niCY+qaanyaU0e5BQGPzE108WTkAAk72rxOcwM8td4dfGnQdx12qbRyThb
         QyhdYIlsZ9C9pRuS/01+d/3lHeRPiimCAsTJtwrCS9+wfyCVzsGu8mU2lNkPif7Tz4dI
         bCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174927; x=1700779727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdlzgoUZANXR6v0465sIrJ9Hs3IgMFC19ooZZ+TXjyg=;
        b=R4c/rAf9IwsVWtp6YFJ07PZd1NvEhTQEqLteeML9NY00zzGMNxiDSwY/J5Y3VzGKq3
         rj4YoEwZGzzj/xNKecE/eQ7pjcsgW72Vvr/ysqYibKu+xe5I9W84wwKxjWfWbfK05Ym1
         3JtH+3mjnkBLgYBzYjbtyTorQCZr3Xzo7NGfp00FLiQu2IhcJSKKhk75ljgTKHcXz8qT
         9AX5w9Ox+Em1qsxb9SphzIqk9xtejKhkOrfPF5nxgNinvsd+wJ3/OCRdgWdClHtwyENc
         cLbSOjrG63Ou0N5/e1vD2yDVmTYnrScLsCPTvh8Mr2UB0d24Cw1Hc1L3q93LdtL/RqI3
         0zXA==
X-Gm-Message-State: AOJu0Yx+CIKUDEmHsxahRQ7V51p3N8ag6KPoH1dbSDgLdJomZGbgDmqK
	kDiV2QZJas7KehGwl0bScy1V5GbM7dI=
X-Google-Smtp-Source: AGHT+IErojjFdTSfB1NBT60uLqF2M5uFksZtwg5WiPG6bTj1v/sLlRg2JHxld21aQYm8hlxc8fT58g==
X-Received: by 2002:a17:907:7795:b0:9c0:99c4:79e8 with SMTP id ky21-20020a170907779500b009c099c479e8mr12696109ejc.6.1700174926446;
        Thu, 16 Nov 2023 14:48:46 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b19-20020a170906709300b009e5eaf7a9b6sm122152ejk.139.2023.11.16.14.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:48:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv2 07/12] perf: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 23:48:31 +0100
Message-ID: <20231116224836.2696913-7-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116224836.2696913-1-martin.jansa@gmail.com>
References: <20231116224836.2696913-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 22:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190821

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index a90acd55ef..32882afdf4 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -98,7 +98,7 @@ EXTRA_OEMAKE = '\
     AR="${AR}" \
     LD="${LD}" \
     EXTRA_CFLAGS="-ldw -I${S}" \
-    YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}' \
+    YFLAGS='-y --file-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR}' \
     EXTRA_LDFLAGS="${PERF_EXTRA_LDFLAGS}" \
     perfexecdir=${libexecdir} \
     NO_GTK2=1 \
@@ -405,7 +405,7 @@ PACKAGESPLITFUNCS =+ "perf_fix_sources"
 perf_fix_sources () {
 	for f in util/parse-events-flex.h util/parse-events-flex.c util/pmu-flex.c \
 			util/pmu-flex.h util/expr-flex.h util/expr-flex.c; do
-		f=${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/$f
+		f=${PKGD}${TARGET_DBGSRC_DIR}/$f
 		if [ -e $f ]; then
 			sed -i -e 's#${S}/##g' $f
 		fi
-- 
2.42.1


