Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E10C5AE4B
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 07:37:06 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.2314.1700120224306143141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 23:37:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xtaa2d8N;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so707375a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 23:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700120223; x=1700725023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63Adzdk5TK6VG3u+sUV0yH2HG9PvqRmhWMmzR2QZ4Ro=;
        b=Xtaa2d8NPpja59oxsRShFaneBedwcIp7xqK917t3loG9IRvkHEG/fZhyAwSouqfNvH
         TFH0cd0jesY4GbxJo8p7DHdGneFHGab3rwnIYZ2HM3P9FDZiBrULxeFKdoDHVceH2d4x
         YJSk4RimPMVZiIW4iXFI8Gf6kpwWiB/6mwIJFt3z38087aDHjNlXBWicR5xxHT5Yo89v
         ljiT+870J2NwwVVjCuJJiEnyIdLph4+OWkBIhnydPX2vNk6itY+emnVPXkOkVmi9+mao
         TSxXcLk1YBrPCg3SPO5G2DGFh2juq6IZJCs2j+50jBzzytYQSKmKGs7U9ctvlTPOsQpH
         Em6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700120223; x=1700725023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63Adzdk5TK6VG3u+sUV0yH2HG9PvqRmhWMmzR2QZ4Ro=;
        b=eS+ZiCKuK6OfwW1X1Z7G14UNK9sFceRqM0oAHnxs3MHIKvgv4DVD7BjBo0/w4MQODm
         VFQYQCyZQZlhtUT/TxBpuki1N3jzkP1xNnP8Lw+85PfMDSUXdil1+6SgylELDH3sWf40
         EFRn5P/QGiCLSYAvgPgYca7NLUJ0fZnA2qqo/x5//OsTXS8ZgMrnr4EJNR6rl++jNp5J
         1sJKLmldLc8cXEUSG36pE15M/GHsA7fV+ET7JjnskIHr2OH9071OSXdK8Oxgk8+zkiBe
         tWZwnXdurA6/0dpq7uS25BmhzW2LLQTuzM4mWZnb5xImadGxUAuQfzcj6+PeSEpNzcbJ
         ApBQ==
X-Gm-Message-State: AOJu0YzJ/eEUkyoBN1iWYXP1M1Vg5ybh6nbL5u8dwv8D5QdnoO7ibJJb
	PMtl8BBhvgLGupOYX4fKQ8LAZDz+X8w=
X-Google-Smtp-Source: AGHT+IHnS6dDeGtsPWJ1vzrxhVwwirkih1PAUu3WToMKhQlalXkFw2b/NUzVBip/jmWO+skfw3C2Pw==
X-Received: by 2002:aa7:c3d4:0:b0:532:bc4d:9076 with SMTP id l20-20020aa7c3d4000000b00532bc4d9076mr11147006edr.19.1700120222549;
        Wed, 15 Nov 2023 23:37:02 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l14-20020a056402254e00b0053db0df6970sm7386252edb.54.2023.11.15.23.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:37:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 07/11] perf: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 08:36:46 +0100
Message-ID: <20231116073650.2710535-7-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116073650.2710535-1-martin.jansa@gmail.com>
References: <20231116073650.2710535-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 07:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190759

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index a90acd55ef..85ae338a67 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -98,7 +98,7 @@ EXTRA_OEMAKE = '\
     AR="${AR}" \
     LD="${LD}" \
     EXTRA_CFLAGS="-ldw -I${S}" \
-    YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}' \
+    YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${PV}' \
     EXTRA_LDFLAGS="${PERF_EXTRA_LDFLAGS}" \
     perfexecdir=${libexecdir} \
     NO_GTK2=1 \
@@ -405,7 +405,7 @@ PACKAGESPLITFUNCS =+ "perf_fix_sources"
 perf_fix_sources () {
 	for f in util/parse-events-flex.h util/parse-events-flex.c util/pmu-flex.c \
 			util/pmu-flex.h util/expr-flex.h util/expr-flex.c; do
-		f=${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/$f
+		f=${PKGD}/usr/src/debug/${PN}/${PV}/$f
 		if [ -e $f ]; then
 			sed -i -e 's#${S}/##g' $f
 		fi
-- 
2.42.1


