Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web09.8615.1608620436176651454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 23:00:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SqCkXEpW;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id r17so11078773ilo.11
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 23:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lQjWmpFsbc33QD+SUEu0pZTn9rA+r5C26rSRM+jeRUI=;
        b=SqCkXEpWaSFyvxOXhIwRINGJ2YwdOoaj0c49ElNtt10Rr8m9BGh2CnJxauuje/BZIn
         I217jt2QzBrnPXRrTMAkBfKxHc1U1s1NZ+LpcTbt6s+DM/AVljF11IquC19p+fZAgKBY
         81QLNTQadqKLzPOzIuT8meQh/Eaj8S55xL3mcDSjPySAblwaE/CB2UUU3t2tPKZbyF8P
         tPLoazjhwIw3ImNvzqwxbgkjX9KfGWyZfi6dCfk/eVXj1yCMvPPLCWX01ju+BouUrr+x
         dXH7frFGV+9mRz28ZXh9LqendkUrCHOTu/xYy7YB+dT0apfmTl6wuqrTLdZ5gHCQNExo
         wE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lQjWmpFsbc33QD+SUEu0pZTn9rA+r5C26rSRM+jeRUI=;
        b=NiDHOkG337mJYw4ch6r4OMaBx3pzYyGP8N35P/3MwuffxRUVXlsIk1TLRF8V27UXHy
         a5uis20q7mB+VndPHXuf4FOErPrbGHxvCX915RJxhw2voNNgiBgWtt+j3F1SZWwiYCJ7
         vQYEdIaiGxDe3NqZ6nrt4XiYndSsdY15etNT74pp4qv8oA+bOgOQDxR1foA0PI4a5VMj
         LUPQV/dwXclPCSgJt0iQ0VT2Xj9EhyDVPNk4ArXL6XbVPGdiDRu+hbIc0X40Vh6F6oPQ
         fNpZhIo4mVkl3p1dfz9oqFU0dbVb7zXiF5xRv5qsycgqz/M3SATBV1TBfb/s7TIwp18r
         GjfQ==
X-Gm-Message-State: AOAM531JiO4919iUuIa/FSJmQw724jySo+YlHeVDvZ3E8G+5oah5r7qa
	VPMMmYyuIYCgy+9Rj/Zt/PY5UyYfJvPY/Q==
X-Google-Smtp-Source: ABdhPJwrFZMVDa2K2vuLFY3qrTQOGE8/0sQ340NTs8oPa0GFuLSbJxHWLhQt+8n0Df/lSJ5+E2crUQ==
X-Received: by 2002:a92:6d12:: with SMTP id i18mr20009780ilc.48.1608620435219;
        Mon, 21 Dec 2020 23:00:35 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id p13sm23775533iod.54.2020.12.21.23.00.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 23:00:34 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] sysvinit/rc: show text progress
Date: Tue, 22 Dec 2020 02:00:29 -0500
Message-Id: <20201222070029.40230-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In addition to the progress bar, show which startup routine is running by
using the "MSG" facility of psplash.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/sysvinit/sysvinit/rc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index d0d3149821..6995930ee9 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -27,6 +27,7 @@ startup_progress() {
     fi
     #echo "PROGRESS is $progress $runlevel $first_step + ($step of $num_steps) $step_change $progress_size"
     if type psplash-write >/dev/null 2>&1; then
+        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "MSG $(basename $1 .sh | cut -c 4-)" || true
         PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "PROGRESS $progress" || true
     fi
 }
@@ -53,7 +54,7 @@ startup() {
 		"$@"
 		;;
   esac
-  startup_progress
+  startup_progress "$1"
 }
 
   # Ignore CTRL-C only in this shell, so we can interrupt subprocesses.
-- 
2.30.0.rc0

