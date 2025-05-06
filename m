Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E799C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 10:21:14 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.73050.1746526860902893385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 03:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=YDUSD5Mb;
 spf=pass (domain: snapchat.com, ip: 209.85.128.44, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf257158fso29697965e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 03:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1746526859; x=1747131659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R0L4vhNxTopG5JWc039OkVlby07lI2ULWaPF5p9Bqes=;
        b=YDUSD5MbtGi7arZV3U39t3d/tkUOA5GokItcE8C4IIi22PkQinDO4bWezkGDQrL9zw
         UstOaRa1gl0zbUWyzXCSW58l3/DZUJLN6o0HhPl1TGx7IuGbnBcp3Tc2iwmpO5hDl73L
         mUz0BOKmypFzjHXqVfsrX90qpAk5yGKzmqI+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746526859; x=1747131659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0L4vhNxTopG5JWc039OkVlby07lI2ULWaPF5p9Bqes=;
        b=HyK5BiS8b6sO1Rm6y6msD2/MqLQH5M0FBW3Be4YNAkcSDi0JYk86SVbD9XzJTKfvo8
         XT2fbgr+c+0fXNj0gE7uHmHR0lT0QcA0tSsuRapH8M04WreyIb54maHD7UItSeEqdpBk
         G1y8fKlO8c8scXGXbjslrIB/Shcxv6H27tHBG9PBii8rGmlFbg3mA3wTpYCuxb6XyixG
         5xvjCMme2it5M0gwVsV4+GrWSQOr0Kk8niuBzENCehlZ9uW4fXUMvKJ8MyQoo4xTKGrU
         ClNz0TM+DY5D1fsWFkL+6HAK7l8fosW5wQOm4G44vovEnyvqYB6Eszy2DlmMu7NxQ0/k
         dt2w==
X-Gm-Message-State: AOJu0YwlSwqRI4Si03o4X91mP416lykCHsayb6hkhPNvyzePStN1daA3
	bK5B7WsWZM/SmTngcXbQjh65vZ2yaW/mHXDcoL7DN+vZacmDa5ajgrKrH59zYAFMX6GKMytp1Z7
	UuLM=
X-Gm-Gg: ASbGncvA+fqVD2yuKbfujS+uZzEr4V7T9yIURz1J5xNFZEZcO6TSd0ewy1sgDwvUUvv
	vpU/qhNiUlgwmJQzMGy3wUcUW1FS1yU7vMSKbdkQ5oujX9ko1Co7cVQ/1yV0+/A9KXKggTZx8X9
	5xRulsHF9r5IT2w54tKB/2ktGDnxoq9sNQ8oa6EArWhfqS8ART9wGsNE6dRY79lD9YL3qP3Ws8M
	ib2JAv32SiGbk09+wmqEhwqIPlSgU9KwRHAikd7WDCIv2/WR9P014LTllVitaioakk6ZDfBjD/8
	4dl+qus62/Z7prOrYnmOJurrayv8jbMKtEPgdiz0MyB2HPtsSMMW82iyw756IAsU0h+tynh8xaF
	qdfpcI+c4/WUalBFlN30=
X-Google-Smtp-Source: AGHT+IHXGVCw3mdRp5EiMI2bh5mE1lSIlsZL4S2IdUeatMznOO+7EXD5Eboej04Q6Q5YdJCkEtlIIw==
X-Received: by 2002:a05:600c:871b:b0:43d:fa58:8378 with SMTP id 5b1f17b1804b1-441d053bf8dmr25446745e9.33.1746526858840;
        Tue, 06 May 2025 03:20:58 -0700 (PDT)
Received: from localhost.localdomain (80-108-196-96.cable.dynamic.surfer.at. [80.108.196.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm140574425e9.26.2025.05.06.03.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:20:58 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [oe-core][PATCH v2] coreutils: remove outdated comment
Date: Tue,  6 May 2025 12:20:55 +0200
Message-ID: <20250506102055.409076-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 10:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216037

From: Etienne Cordonnier <ecordonnier@snap.com>

The comment about hostname not being included in base_bindir_progs is wrong after https://git.yoctoproject.org/poky/commit/?id=b9bf37ec6792f82753fe265fdcfc19db7dd51ab6 ,
so remove it to avoid confusion.

Also improve comment about bindir_progs.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-core/coreutils/coreutils_9.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-core/coreutils/coreutils_9.6.bb
index b876a8fdd0..6e1867f3e4 100644
--- a/meta/recipes-core/coreutils/coreutils_9.6.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[single-binary] = "--enable-single-binary,--disable-single-binary,,
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 PACKAGECONFIG[openssl] = "--with-openssl=yes,--with-openssl=no,openssl"
 
-# [ df mktemp nice printenv base64 gets a special treatment and is not included in this
+# [ base32 base64 df mktemp nice printenv get a special treatment and are not included in this
 bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
                 join link logname md5sum mkfifo nl nohup nproc od paste pathchk \
@@ -58,7 +58,6 @@ bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname
                 sha384sum sha512sum shred shuf sort split sum tac tail tee test timeout \
                 tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
 
-# hostname gets a special treatment and is not included in this
 base_bindir_progs = "cat chgrp chmod chown cp date dd echo false hostname kill ln ls mkdir \
                      mknod mv pwd rm rmdir sleep stty sync touch true uname stat"
 
-- 
2.43.0


