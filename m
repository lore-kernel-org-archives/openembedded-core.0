Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.11018.1599880049852310360
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 20:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Eq2a1a32;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: geoffhp@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id w7so8658396pfi.4
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 20:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AxZ0j94ZiDxxLVq9o95530HNzGsLE0cX7TNZu8Ov1v4=;
        b=Eq2a1a324C0imuDHrz1jfk83yr8KTcplM8xyqIxzxrnRVDP9cDku2bHIid9BmWX/Mw
         16WNnSxpJpNrqNhc6KuNnmds8DNDWUE586Q8XKpVYqOsWbtAvzzfdDG9Bm0z2bCN/D7s
         iFNIQZJ9KAmaOZXO+tIR3IFyTRvUbehX4jM2ceCC7N3SnZqEBfdb7/OX4Gg87zIo72/c
         3guKy6KpO5RmAjGAYK4bK5wrduG8X266QO6DMPPDtVSW7WVRaKCYWsKzczLc683m4YJq
         j7jkLOuhAxlumIQlck46XdarmwiZQs8w/ra+5X/gxEyR0rZonnhJqD6sywX4lVXiV4Uk
         joaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AxZ0j94ZiDxxLVq9o95530HNzGsLE0cX7TNZu8Ov1v4=;
        b=T9zk9bSmDq4TeNfAxL8hg8IqSpyucNovKxMRDDbgwl511rOV96Ygd4YO1coHSMEiqE
         sLSXbIJv4b9AVS7KuVMD+zsbsIRq4Z5fVU2Z0NS/Q8srWVjVCEZvTwQZ+1T1BX14q1L6
         o7UulN0Pvn0u23EeKf/PBwSsYaGCgIqw6NFoG7RVQ3dTu9o9t3BA78XIHocK9D9wR8KG
         gql3eVy4zzvRwQV3q4Vn7v/RPl0UtnWevQBCaeuaz8uE1gYfnFUgZrTVQ12R93m6MXEO
         oSFzGX+fZIxDk05Rk/77UW5uh2sZDLpD/vBWwvHbPbWjrgdYghtapIaA2PT92xFD1nUa
         sOKg==
X-Gm-Message-State: AOAM5304lNVAd3JqGeCl3AAbBByYkCojikVpZe/wHdxlxGL8B/imrvot
	7wK7jmvLxy5/pi9LFxX453H9x9zvd3zb+A==
X-Google-Smtp-Source: ABdhPJwRGuvAS2bS8gQ3rUgO6WXoXD3nq4KNFanR8fczdETRJxz+9DMkEtPFYL0zc8mZAUHn6Q2qKw==
X-Received: by 2002:a62:17cd:0:b029:13c:1611:652b with SMTP id 196-20020a6217cd0000b029013c1611652bmr4872305pfx.11.1599880048921;
        Fri, 11 Sep 2020 20:07:28 -0700 (PDT)
Return-Path: <geoffhp@gmail.com>
Received: from localhost.localdomain (cpe-23-241-71-171.socal.res.rr.com. [23.241.71.171])
        by smtp.gmail.com with ESMTPSA id q34sm2716789pgl.28.2020.09.11.20.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 20:07:28 -0700 (PDT)
From: "Geoff Parker" <geoffhp@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Geoff Parker <geoffhp@gmail.com>
Subject: [PATCH] systemd-serialgetty: Replace sed quoting using ' with " to allow var expansion
Date: Fri, 11 Sep 2020 20:07:05 -0700
Message-Id: <20200912030705.16235-1-geoffhp@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.20.1

