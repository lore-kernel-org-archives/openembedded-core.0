Return-Path: <bero@lindev.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40F2FA373D
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 23:19:42 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.397.1666912778871877041
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 16:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=09hzplQt;
 spf=pass (domain: baylibre.com, ip: 209.85.208.48, mailfrom: bero@baylibre.com)
Received: by mail-ed1-f48.google.com with SMTP id a5so5436109edb.11
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 16:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FeU9TJS/JrVufbBvShn4tR2jR3qJkOkUEpBHOkKEYuE=;
        b=09hzplQtv9MN0YWYBwS0QAZE0ZM4fuuG1NBtH8n7arw8cLflUovgqH53ACAciDXWd8
         8w9bFy/0KaAlYg1RFhwpQKDwVDEy4u3+o7mYhYgeBUL7p5wbjLe959rRUAkti/OizUZi
         LGz/ZXRMEVDxiJIbdlt7EyhVkM6ZaErS0Q57+GD/PXZJwkCHuL5xvW6+TOrI0hjYCYAl
         rI3ol/XB+60RmVHs7vbHfQ8S97ZZk/pilNH9XZ2dir/FN7NdcRK/RKI5rCbexfqmgVjK
         Yba+wd3jnudn+v2StjJoqk0cuLcOWi0zHQPBYdeNcTghGHUGX77WtJpdlJ63A4lO7F+2
         QFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeU9TJS/JrVufbBvShn4tR2jR3qJkOkUEpBHOkKEYuE=;
        b=JW0c2RjhAisTHEJ3napxHmXshGvFFBBdk03gpFfE3rX/HKRo18+62ZBQ1f+4WvCSzm
         UKmW+CzfY4dfaMvgdaxzCA3pC3244NZ42jBBHcFzCX1Oa0SRz6eo33gYthfGTYDnb0zN
         V63AnPvbo3oXS5cTw2HqSwwldc5awnImDOv/VbGuDLHpxl3sjrTWeqiVIY0k5kB5QCL+
         CUgwo+2Cdt46203jryoFCtDzJb3Zlhce3c8cTdAYUepiVK4UzI+Hd9tHaNSDmfk7Q0Z+
         kSwXvHwegmVSb1ZaxodjslVaBnXwZ/BnpTg35QFfFnfgRDUf97vFejxTeCbOC6ilQZBN
         0zrw==
X-Gm-Message-State: ACrzQf2KEK1H1bNDITjVR/uf3LBSJYhIy5BOU5HsO0NjAHRpEJDxk0VM
	LmEWr45iDqDBQsz2ufKqYqqJtz64/oI7+g==
X-Google-Smtp-Source: AMsMyM4WXbzNnUUYaFoxoujeubQ4cwfxqvhxGVxUM/USAd+LdPIxn3EajuMExJgplqBO4kwFuEcQXA==
X-Received: by 2002:aa7:d506:0:b0:461:565e:8673 with SMTP id y6-20020aa7d506000000b00461565e8673mr32455091edq.416.1666912776875;
        Thu, 27 Oct 2022 16:19:36 -0700 (PDT)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id r1-20020a17090609c100b0078db5bddd9csm1389723eje.22.2022.10.27.16.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 16:19:36 -0700 (PDT)
From: bero@baylibre.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Subject: [PATCH] bitbake.conf: Add HOSTTOOLS_NONFATAL bits needed for OpenMandriva hosts
Date: Fri, 28 Oct 2022 01:19:34 +0200
Message-Id: <20221027231934.504923-1-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 23:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172230

From: Bernhard Rosenkränzer <bero@baylibre.com>

Some Linux distributions (e.g. OpenMandriva, ROSA) try to support
gcc style LTO objects and clang style LTO objects at the same time
by replacing ar and friends with a wrapper script that calls the
binutils or llvm version of the tool depending on input.

For those, the binutils and llvm versions need to be available in
HOSTTOOLS as well (or the wrapper script will fail).

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 meta/conf/bitbake.conf | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 62cdd9aa9c..e03bfd1b6b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -534,6 +534,14 @@ HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLAS
 # Link to these if present
 HOSTTOOLS_NONFATAL += "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc pigz sftp socat ssh sudo"
 
+# Some Linux distributions (e.g. OpenMandriva, ROSA) try to support
+# gcc style LTO objects and clang style LTO objects at the same time
+# by replacing ar and friends with a wrapper script that calls the
+# binutils or llvm version of the tool depending on input. For those,
+# the binutils and llvm versions need to be available in HOSTTOOLS
+# as well (or the wrapper script will fail)
+HOSTTOOLS_NONFATAL += "binutils-ar binutils-ranlib binutils-nm gcc-ranlib gcc-nm"
+
 # Temporary add few more detected in bitbake world
 HOSTTOOLS_NONFATAL += "join nl size yes zcat"
 
-- 
2.38.1


