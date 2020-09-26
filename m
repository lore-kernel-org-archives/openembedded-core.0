Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.12205.1601129312531739606
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2020 07:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b7y+GTYp;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id q4so999648pjh.5
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2020 07:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vtn3BtTQV2TQ5jzBKweEAVSYGylpguLtW4ocz1sFNt8=;
        b=b7y+GTYp/x8S/ZfMLPBjC2xxe2Z//qbdztWp2Llyjh8RzkQsWCl7liPVHChn3pP9d8
         KO7KP1WSJF5K6GiB4bNZ5ivjUmWp4viPECM153WmGyzoo1xkQOV391+naqJWzjw9LXUm
         qtOctH3/8cX2YpL00AS2XVeiYg8X2rfkvCiwbZzDzkQBWksYtGCWND88d7t/imNxMbGF
         5tetaw2dfRaYP7btH0IHt3BFlpOSO1lvpaROytw1ZvPLyYY+NCVC5uwSDMp2XgAs3cn2
         Q3sejlKEL1Sjvg9LvhswtuXqW4yaC+0yycaO50xhXl3D1Q8/VAjE5wDA4iUuJpkCBB/z
         0Z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vtn3BtTQV2TQ5jzBKweEAVSYGylpguLtW4ocz1sFNt8=;
        b=YZwL4tSe5dnxaZbKsCwWqP6CYO14unk+r6ELuw9PiK+vdy81xsUH0V8PSQY2lT/v88
         MDLM0EDB9YvivyX6Q9RsxbSfPtbafHo+fcQ5JTW/WO8iaYRkQVEjFKC0xZFAHfrLCsTM
         /ifm7ESU8BSw0VApTuATZTQXTb6oVXXO37nLGdfw6brM6BVdG9zl2DTzByhSLTGRMn3e
         p+DcX7MPg9oxJc7iiihjw3nIhNbBtMDc/ZN3+j7JT3YqxopnNEzYbgdrF/PA8MGZieK8
         a2x9QsvfWTzJfvpH5knnRu5bvohA3f4/m+sXTVqtiwcB6qvoLP6CXPA9Lj4l8ZabIULc
         uRbg==
X-Gm-Message-State: AOAM533oLOqqarg06S1s+bh9m6QN6c1iNQ4bL8VilHSnl6+jrZya1Xdv
	2MLBPsDQuEAFP1SiezTdr7F5kdsTdtlL6A==
X-Google-Smtp-Source: ABdhPJyCprVlAbXAQcM70kyq6s6ntJBk9rAZ7hUlF9+ZZTqcBqb8Uwl+6nxnZ1mvh5K4jp2fMqgOcQ==
X-Received: by 2002:a17:90b:117:: with SMTP id p23mr2215541pjz.67.1601129311549;
        Sat, 26 Sep 2020 07:08:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id d6sm2145709pjw.0.2020.09.26.07.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 07:08:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ptest-runner: Backport patch to fix inappropriate ioctl error
Date: Sat, 26 Sep 2020 07:08:26 -0700
Message-Id: <20200926140826.2546826-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The srcrev bump is actually bring single commit [1] on top of 2.4.0 which fixes ptest
runs with messges like

ERROR: Unable to detach from controlling tty, Inappropriate ioctl for device

[1] https://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/commit/?id=834670317bd3f6e427e1ac461c07ada6b8936dfd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
index 0a3186dac4..10b4c5b6a4 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "1e9a84585909b970cc8850d3ea02a7215dcfa5a3"
-PV = "2.4.0+git${SRCPV}"
+SRCREV = "834670317bd3f6e427e1ac461c07ada6b8936dfd"
+PV .= "+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
 "
-- 
2.28.0

