Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.418.1600445733656222969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 09:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EWmxfwEW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id t7so3426776pjd.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2020 09:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=kwvEONX1c1sNVO2D4DG5ZUz+ck3yBFeCS+aROtSlM8s=;
        b=EWmxfwEWT5dt1wtwt55cA1t/+OBmjvL/yy0yfTp/1WMeECwUqvzBlfdV+ZL4w9E/lr
         UCRh9HuJl0TIqi+HfzPjbZ230F1WyVcYqBLNQFyV2kjuH6gTwEsGDJhioqaYeBIKxvoA
         fRTQxtET3TH7RhfgDrBSo/vB8WEwDdpKUIR+2jPipVcTgCBq4gkWAazllBeGLgrqbuQK
         jDB4tI1EmUBJlJwKdzbMHqDVZI2KKQ+IWZvH7sNlhL0QbVj88T0cEJhNYJ6XvFT8TS9o
         2HPOPrHqMjMDnACm5YYzHKspaVwvWtxaawAENT0rMrn+kKROEtfLn+IkYjXj1nTfoRcb
         nUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=kwvEONX1c1sNVO2D4DG5ZUz+ck3yBFeCS+aROtSlM8s=;
        b=YyRehhnqRY8IlztII1C9QwQNbEr0D9blH43mPSfeNuD+X7TD/xKc4hq9A/gnKiEYaK
         e2gclNbsOo8iSnzfN9n8uyvq7f2C4jfM1xaE5OD+JNtkq++LvsOwkr+vNBdyfnAt0xWp
         VvUHMMyWnVT7cQzy/NykuGtEZS4apyfyG1014kpqGai2SsuuJYy8hBHbOneN/PVNPVcu
         MFeQA+VjGA47vt+oeN+MI7X88ohC/2k1FZ6rjCP47oHbMoSkCjEzaxIiQvfoVSANccWx
         2iTwU6DgbCUkHQEDhXDfigsTa/54cBAg0HwBaQq2vTU3Ww4GiFp9N33ZhuhDJ2TTpZWI
         5lfw==
X-Gm-Message-State: AOAM5304yRISCjGK+ouy4dL726S3KatNnKP/tPJohlPIZJ6YSUDULvK6
	I7HvG9Q6PK0qe+5aL/gcT4PeaFBhptzx7wYAvRY=
X-Google-Smtp-Source: ABdhPJxh33hQW2dJ8NhEbYFh5J6OBqv7cf3ro3PrLwupgdQf4wz1kSnUNgY0ShTYvWebwGQumR06iQ==
X-Received: by 2002:a17:902:8605:b029:d0:cbe1:e773 with SMTP id f5-20020a1709028605b02900d0cbe1e773mr34344867plo.26.1600445732756;
        Fri, 18 Sep 2020 09:15:32 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q15sm3260100pje.29.2020.09.18.09.15.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 09:15:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/7] systemd-serialgetty: Replace sed quoting using ' with " to allow var expansion
Date: Fri, 18 Sep 2020 06:15:10 -1000
Message-Id: <1cc94a6b9b6a9d12f782471053448ad9795944bb.1600445624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600445624.git.steve@sakoman.com>
References: <cover.1600445624.git.steve@sakoman.com>

From: Geoff Parker <geoffhp@gmail.com>

A recent commit added single quotes around the sed regex's. This prevented the
expansion of $default_baudrate in do_install(), and ended up with systemd's'
serial-getty@.service file having a literal $default_baudrate.

This broke the serial console getty service.

serial-getty@.service was getting a line which looked like this:

  ExecStart=-/sbin/agetty -8 -L %I $default_baudrate $TERM

Rather than:

  ExecStart=-/sbin/agetty -8 -L %I 115200 $TERM

Fixed by repacing the single quotes with double quotes in the sed expressions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 80b721bfa4fe300a2f52f233f44fa2835426d304)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 059fccc2b6..0cc0dc8c79 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -21,7 +21,7 @@ do_install() {
 		install -d ${D}${systemd_unitdir}/system/
 		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
 		install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/
-		sed -i -e 's/\@BAUDRATE\@/$default_baudrate/g' ${D}${systemd_unitdir}/system/serial-getty@.service
+		sed -i -e "s/\@BAUDRATE\@/$default_baudrate/g" ${D}${systemd_unitdir}/system/serial-getty@.service
 
 		tmp="${SERIAL_CONSOLES}"
 		for entry in $tmp ; do
@@ -34,7 +34,7 @@ do_install() {
 			else
 				# install custom service file for the non-default baudrate
 				install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/serial-getty$baudrate@.service
-				sed -i -e s/\@BAUDRATE\@/$baudrate/g ${D}${systemd_unitdir}/system/serial-getty$baudrate@.service
+				sed -i -e "s/\@BAUDRATE\@/$baudrate/g" ${D}${systemd_unitdir}/system/serial-getty$baudrate@.service
 				# enable the service
 				ln -sf ${systemd_unitdir}/system/serial-getty$baudrate@.service \
 					${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty$baudrate@$ttydev.service
-- 
2.17.1

