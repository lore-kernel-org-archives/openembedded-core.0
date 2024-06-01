Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF79BC27C4F
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:26 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.36117.1717244721180034925
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a2OimwGJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f32a3b9491so22068645ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244720; x=1717849520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYEMku8zcykEZlueturWvIwXH6TnevTrYc8aTUVk4WQ=;
        b=a2OimwGJAweMzigj/fI+FoiMntSeayXqeZIKLMQQHGwaD6ulx9hhdEVQt+TBBDh31a
         cLl6n4cYauryStOgVfnL1qBN69xSs+AoAJdEuXWO0t1ZKOF2a+ySFtLQho0+xVMDT6Bc
         rIjv16HOrMF5KaYW8mxru1WglOTOT9CXNVUJYFaVaiP2EEvRWVJ3mDsLa8j/c65mRuvy
         qX4PVw6HZzfNGsfLcN+b1oHn/hrO0esDRTiYKBKzfnMNxOB0z1Kv1ZPQy2bPCBVv5npv
         grO3/8xFTsOOqWcpR8glFmKCwJuxLhIhjtspa9J9poraWIwkQnsMIhCcubKQoX38nbsS
         uamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244720; x=1717849520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYEMku8zcykEZlueturWvIwXH6TnevTrYc8aTUVk4WQ=;
        b=dikHBznRVJO4MjXEEHqRa7CgLM2R2aYEkgIlj8w9TB+EGD/zLbXXkTmzhzce8rWRcN
         /+xwr0fr8mAjZG/zH8IuANY7S9Nt+zf0VuAw8axK84yOTVhuLphZyKQVOvuig6Z3I/L4
         P2h21QKu2qehLxElZNFjMQO8nG/FGiYTyi8jP2fLpQjd8l+k3ACyVBf9dfjtmrBq9hrg
         NHCcDtujlmtfRYimczrMYT8qja/xjtA9hPmDCllvYRecgzDC59otWQPiAozEsuouA26z
         Ni3qFZ9LkV8bFQXwU1TOZ8DNfTxzOC/AG/3F/QLpxeG+Gg7M/hc1zEyRhWg0melhNIQu
         xs8A==
X-Gm-Message-State: AOJu0YzeExOvhpdB0hLYOOQ+3+/ErVgivJpwGQnEbgjpaP0vdHqNoduJ
	LPLU6xnysth+JSOScesf2Qjk1Q8sdf044w1lwNNHdorTTx20jTDGAMNP3YwWVruV+zjSYVusJbY
	x
X-Google-Smtp-Source: AGHT+IEUU4J5l9lBO86kIggDL6sP8h3ICJMjWgaBDaULcEBXOIgs4efq1ss69Un8CFTTYO/KFw9x4w==
X-Received: by 2002:a17:902:bb87:b0:1f6:3429:69d7 with SMTP id d9443c01a7336-1f63709e4ffmr40382875ad.52.1717244720379;
        Sat, 01 Jun 2024 05:25:20 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.25.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:25:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/21] lib/package_manager/ipk: Do not hardcode payload compression algorithm
Date: Sat,  1 Jun 2024 05:24:45 -0700
Message-Id: <c2b00cd4148d4b08ba5673488a652f8daf3ac085.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200115

From: Philip Lorenz <philip.lorenz@bmw.de>

The chosen payload compression algorithm can be changed by overriding
`OPKGBUILDCMD`. Ensure that package extraction deals with this by
globbing for "data.tar.*" to select the actual payload tarball.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2ad05635a6da403b4fadcc126fe7734067c12c73)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager/ipk/__init__.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 8cc9953a02..0f0038d00d 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import glob
 import re
 import shutil
 import subprocess
@@ -134,11 +135,16 @@ class OpkgDpkgPM(PackageManager):
         tmp_dir = tempfile.mkdtemp()
         current_dir = os.getcwd()
         os.chdir(tmp_dir)
-        data_tar = 'data.tar.zst'
 
         try:
             cmd = [ar_cmd, 'x', pkg_path]
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+            data_tar = glob.glob("data.tar.*")
+            if len(data_tar) != 1:
+                bb.fatal("Unable to extract %s package. Failed to identify "
+                         "data tarball (found tarballs '%s').",
+                         pkg_path, data_tar)
+            data_tar = data_tar[0]
             cmd = [tar_cmd, 'xf', data_tar]
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
-- 
2.34.1


