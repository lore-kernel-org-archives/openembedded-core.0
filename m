Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C53C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 10:08:43 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.72896.1746526116619462299
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 03:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=fJirHGwb;
 spf=pass (domain: snapchat.com, ip: 209.85.128.48, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0618746bso37384025e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 03:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1746526114; x=1747130914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pJinP8nAUZFLAigjqckKC83d7QgmyXISX8++nUG7EYs=;
        b=fJirHGwbR4sXK6EXPHtAbwb3c8kzLeotPS4D8UzUJklHZHYJJd479Xj/eeasFf4jlD
         4rtpFKT6yAnKteMs7j0iskwUhdoAW1bvXup53HOdRCUkpyQUGNv+LWfWjSHNE/gucMxV
         N3CW6a6LNlYpq8IzasPLedwGG4jF8wJXYHLzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746526114; x=1747130914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJinP8nAUZFLAigjqckKC83d7QgmyXISX8++nUG7EYs=;
        b=fatyJahWayQBTH2x2JXvy8AYT3kBGTVfruB0DnYmUS3ismv0HrQrBwcXqF06iwmaHz
         FjCjHdPuwJQJowznJOT6GeQfUjdTN8bgOkm0vIh9Duzed5zQqiz7EGSuvFONirVbZAjK
         QWAeg2Z89Ip0OZwtX36nxOxjziGwXhv0V/L7QRtHzRyn2jYdrjK73uWvV8OuGs/EIxD1
         JwKum8myxLMeYPuE4pcMti0CB8Miuiw0FFHcBK/K2zr8J14jkJhhLIZv1mxyvc4sZEmJ
         izSSPqutPWtrbzjl6HYsoQdz8lZM5KRX6ks2L6vQaoe1vHtqjszqJN2hSnHUVV5AYv/l
         KJeA==
X-Gm-Message-State: AOJu0Ywgecox3CwRFzt5rRmZ8sdAPY+pWEHrmu7VkyfxXoHL2bxN+Z8r
	a+gFSbe1rV6LgQyv07d8nA7xC4lAyaCdIK10QS4M3hFr4bEgsswMr+mtosueOlnfUvdyNm0+JT7
	OFZ8=
X-Gm-Gg: ASbGncsNDWK4R83/WPJlopyWKdNPq1flBPk1fmr73S0N6wl2D+49XxhgbNJngdJuSzt
	hKpecmJcppXYVeWQq3zbCl5sYr12166SI9PKReWhfXi6I7dNxPk23wjQ2nSh9i611O9uhzpuLVT
	rW5nW3zQn8KBGdWTzQdOib6zQuX8A5OhD3/ac1JRyqigs9JazsBl+7rxsD+QmHeoUeO4UR8aVSa
	NzML0NNCxKCFtq0kYCzKhxPw/8by3iLYPo5ZN7ML/2UtmwyY/ld8uhYWG6VsPWOB7F5vDkHbuKw
	LruPDaDRfRYw/pAJJXRAM/M3LG9OBrRpzW406oIanQf6xVVLSM13lXdoZ/5n/QlH888f45JRsl6
	rPX8aAZbnr+qHYhfLR8I=
X-Google-Smtp-Source: AGHT+IFDnijT8PRWDtKuFaroigJ/B3JGu/HqUIaFc5vCuHs9pJMq02FmmYn58YZTgOUGxAi3lWlGGw==
X-Received: by 2002:a05:600c:870c:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-441c48b0293mr98148085e9.2.1746526114279;
        Tue, 06 May 2025 03:08:34 -0700 (PDT)
Received: from localhost.localdomain (80-108-196-96.cable.dynamic.surfer.at. [80.108.196.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89ed4f5sm164947385e9.18.2025.05.06.03.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:08:34 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] coreutils: remove outdated comment
Date: Tue,  6 May 2025 12:08:24 +0200
Message-ID: <20250506100824.391727-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 10:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216035

From: Etienne Cordonnier <ecordonnier@snap.com>

The comment about hostname not being included in base_bindir_progs is wrong after https://git.yoctoproject.org/poky/commit/?id=b9bf37ec6792f82753fe265fdcfc19db7dd51ab6 ,
so remove it to avoid confusion.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-core/coreutils/coreutils_9.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-core/coreutils/coreutils_9.6.bb
index b876a8fdd0..16f56ac772 100644
--- a/meta/recipes-core/coreutils/coreutils_9.6.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[single-binary] = "--enable-single-binary,--disable-single-binary,,
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 PACKAGECONFIG[openssl] = "--with-openssl=yes,--with-openssl=no,openssl"
 
-# [ df mktemp nice printenv base64 gets a special treatment and is not included in this
+# base32 base64 df mktemp nice printenv get a special treatment and are not included in this
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


