Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB34C54ED1
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 14:59:42 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.1121.1747839581391111404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 07:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uEUV49z5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22d95f0dda4so71458745ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 07:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747839581; x=1748444381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLPmv0BsRRInlWdLPSZtd9FrjBLFwptv+v7098B1VN4=;
        b=uEUV49z5gEJ2ba58xsg55vg9W638o+RMnaYnxKfXN3uCKagCY4zuHveVbdpq4d4N4/
         8pwkb26aotXoGfV+BueR9rGW+QfigXiL4W7aPZOlejB0MByPvLfrDmd6neCKFv34PTXR
         hIfUckGxDl38aCeAwWSnGSvOKwZJ76nFszUgqcLpIuzmHbL9YWVEe3BWXPzKXyyg7Vfr
         4H79JKE2WYnUsChGG7jh8IuXAa4neVfdaebLGGFLmnYrJjii2oPvgnJwjipshLs30Khx
         84Lu915fO4c8whqCsdQ3F6WLtvkKvTQ1bujoVuOv3AnVxMs+kMyAB2Lm+tC4ZxowqhJB
         tJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839581; x=1748444381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLPmv0BsRRInlWdLPSZtd9FrjBLFwptv+v7098B1VN4=;
        b=qHWt4YTvr6ugp+19hVFoO7oEFEeK5cnq9fC1hKaJm6nTj22Cqc+kerJkCdZnkOqlKe
         /yFuGvAmGpxpkK47SsUff8jufWG1pjjfRzgvymQXbeatbfNwQhwj5oYtNr7+cGisMDQr
         Atda6KTrV4UEL0jNREZpXFtEVG2hBBqRjSxTriAML5+daCbiNWd/veSmvET3wb+6l+E1
         wYFIEqmeQUyiwuO+vg223SNyo2IlYh4zOJ6fAbNkPgxr72Yj8j1BYNXPsfkX99HgE4cx
         TExdto4MZxoZ/s0s2OJNYNol0hfTYRcl5C6IRULOmeXpu4CWNgQuogSq5Dw2RyzSHFES
         TOwg==
X-Gm-Message-State: AOJu0Yz43XkXGydQE9G8sH9fR5sr8K6NPXyp6Ngq0G1tEAAeOCy+8n0h
	gpMcfw7RkJd5N3p639NS8+3JSmP+abw8M2hqzys1B7h8byk9XQjSoNDyuYoAUNJZ1lerydBumdK
	6sJ6v
X-Gm-Gg: ASbGnctEALSOj+0jtSmkieS2SoRi5J3Rtkt7652YuCMR6sB3h2MSLyTSmhrZ/m2122g
	rGY+/2725du+vOvJ3Wh4/kiHIvkaGrYqm7R8YfTDecIbQIR9xNdHKEfSvVQyGVTxXPuZHcpIGhi
	RWXcfpoJzBi1ASDaOH9cDauZck4cKMoJD7YckQjY3r+tE3hKmJb4oK/pS9tpy4TtIke2L8ZBBYs
	7WTzkGvDclAkhK9DNroQZM1ntP3HfXeUrRYID5z52j9+i1VvqSjk5ujo1x1lbb5p1kxMLbO9IBq
	VrtgWqMJboPc7FHj12lpmraqx8eEdol/bIoLgDsrUH0=
X-Google-Smtp-Source: AGHT+IHEUI8vLYzs3oGwfw4x/XY+AZB7O70R/XV9TCswJvlwGx+yqGeqIwzx72HlM+JUFC7VlQqL8Q==
X-Received: by 2002:a17:903:46c6:b0:224:10a2:cad5 with SMTP id d9443c01a7336-231d43dcae5mr336007745ad.10.1747839580645;
        Wed, 21 May 2025 07:59:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89d4:3586:e576:3ce4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm94189645ad.53.2025.05.21.07.59.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:59:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/7] libatomic-ops: Update GITHUB_BASE_URI
Date: Wed, 21 May 2025 07:59:20 -0700
Message-ID: <29d920f4c2249df7a69f00100924b4525e03c0d9.1747839445.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747839445.git.steve@sakoman.com>
References: <cover.1747839445.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 14:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217043

From: Nguyen Dat Tho <tho3.nguyen@lge.com>

libatomic-ops moves to new repo https://github.com/ivmai/libatomic_ops
according to topic: https://github.com/bdwgc/libatomic_ops/issues/66

Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
index 824400e743..6269133408 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A library for atomic integer operations"
 DESCRIPTION = "Package provides semi-portable access to hardware-provided atomic memory update operations on a number of architectures."
-HOMEPAGE = "https://github.com/ivmai/libatomic_ops/"
+HOMEPAGE = "https://github.com/bdwgc/libatomic_ops/"
 SECTION = "optional"
 PROVIDES += "libatomics-ops"
 LICENSE = "GPL-2.0-only & MIT"
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libatomic_ops-${PV}.tar.gz"
-GITHUB_BASE_URI = "https://github.com/ivmai/libatomic_ops/releases"
+GITHUB_BASE_URI = "https://github.com/bdwgc/libatomic_ops/releases"
 
 SRC_URI[sha256sum] = "d305207fe207f2b3fb5cb4c019da12b44ce3fcbc593dfd5080d867b1a2419b51"
 
-- 
2.43.0


