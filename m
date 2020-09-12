Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.8514.1599869860905259923
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 17:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YiTW/chL;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: geoffhp@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id bd2so1642322plb.7
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 17:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DyzVuRBDD3gKvRZeFzfsa1hyf/zRJFtVA4V3ZCKS2CE=;
        b=YiTW/chLDuZB7ta0HPSX/2C2s0i/vji+S3R/A4YtY/8dMV0zML4062QQD1sBPB9+8h
         jF62np+J44bMgLIIacev0rjx6Cdk1GN0OfdWhZJVu68Yj/1E9SVTdSw/poTiHrCsllSE
         uKESTQnFhTHHWQ74r9HUKSCFIJJ6aZNvzIuIxdNROsQW4H0vlBXIo9skU7yKXFck8J6t
         TGdqtubMxcHz9Dmgjd4KqL2A6gH75f3+LZGNtkxUlKhX2QD4+YboP6Gmygcm1YKQChWA
         V2XuK9hzPY4s65sI1jgUfIgxK8nAz0lNIvLY1UHtc/yK8OzqaVsf2Fb1ktah9SLnht8V
         3ITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DyzVuRBDD3gKvRZeFzfsa1hyf/zRJFtVA4V3ZCKS2CE=;
        b=gU66yxm3xZduYE0/7t+kfUY3fLihc0eODVMuA5S2QnXpROHMlF36XylHQtJhNIs1wx
         Me0kLLmEqe9QZ3tRXTTcdvTlSrF74JCH89PQjFrw597rvgPwh0Q/DP9Yo8mVQ/E/MM4K
         cyaO5/I8KdNjKoLIcvTcXyB0JJUBoUOH64HhIOOZlvfF4Sh8T3Q5B4Vc0T488XNgut2n
         HjWi/rDklkKHv3urMuCSoQSM28jN5qzGLIyxw1slv8J5s7iM+OUyX9puNTwXD2anLQch
         /RQ9suRk7/A7KWqT5Do7mXv+lbNcB6FjToDC/anVYU3mAPyIs3LnHV+VWUIhJE18vXpf
         Z7YQ==
X-Gm-Message-State: AOAM531wgkXdQIWvpO1NTcph77KkhxzmilJzaI8IKuup8zWVqQcc+OcF
	ieGnI4MF0RxKMYWpqIIlFhwA/WQ0ySvvcA==
X-Google-Smtp-Source: ABdhPJwbwZPo3ykW8JV90kfHdxxL1XHmTyJZMtX0J3z4/2RasuQrPES9I3bDsb7WbKfbQ/qr2FFlTw==
X-Received: by 2002:a17:902:7594:: with SMTP id j20mr964178pll.43.1599869860019;
        Fri, 11 Sep 2020 17:17:40 -0700 (PDT)
Return-Path: <geoffhp@gmail.com>
Received: from localhost.localdomain (cpe-23-241-71-171.socal.res.rr.com. [23.241.71.171])
        by smtp.gmail.com with ESMTPSA id ih12sm2736572pjb.24.2020.09.11.17.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 17:17:39 -0700 (PDT)
From: "Geoff Parker" <geoffhp@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Geoff Parker <geoffhp@gmail.com>
Subject: [PATCH] Revert "systemd-serialgetty: Fix sed expression quoting"
Date: Fri, 11 Sep 2020 17:17:21 -0700
Message-Id: <20200912001721.12801-1-geoffhp@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geoff Parker <geoffhp@gmail.com>

This reverts commit 12d0fdd9c990bdc67bf6c8fd2d269cb766069ea5.

Adding quotes around sed string treats $default_baudrate as a literal
rather than a variable substitution in the do_install function.
Breaks the systemd serial-getty@.service file and
serial console getty.

serial-getty@.service was getting a line which looked like this:

  ExecStart=-/sbin/agetty -8 -L %I $default_baudrate $TERM

Rather than:

  ExecStart=-/sbin/agetty -8 -L %I 115200 $TERM

Signed-off-by: Geoff Parker <geoffhp@gmail.com>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 059fccc2b6..044c6c5b67 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -21,7 +21,7 @@ do_install() {
 		install -d ${D}${systemd_unitdir}/system/
 		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
 		install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/
-		sed -i -e 's/\@BAUDRATE\@/$default_baudrate/g' ${D}${systemd_unitdir}/system/serial-getty@.service
+		sed -i -e s/\@BAUDRATE\@/$default_baudrate/g ${D}${systemd_unitdir}/system/serial-getty@.service
 
 		tmp="${SERIAL_CONSOLES}"
 		for entry in $tmp ; do
-- 
2.20.1

