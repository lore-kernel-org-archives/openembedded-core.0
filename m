Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77217C25B5F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 13:53:29 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.13222.1714744406523874834
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 06:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ict8/iLZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f3e3d789cdso6698582b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714744406; x=1715349206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUBdXyDQiiF6V/4biQ4tWzrnIlHgE3iqaWXrHlzBiho=;
        b=Ict8/iLZ8u3+u0YYTRzNm7KqmEP2/peDfujGAIz/czEJUIQtBgg1c8rmXiIU6iwk+G
         KTf3hdp/QUtmUirAIObTzab/xjd5Mx9qxnhF+XfKTKOTu5c0HtHfn+HmH34OSOttu/Ks
         BuT2tt9PWoJRCDKMp2eJ/epjMEN5BdYN6vg29kCbiI3SmAoVXBg2LeBevPARfGXTum5K
         KjU68R/BeMm3OZNCpDwb+b2msvqmSVHxMvj/Ah9E43rM7WTEtBLbYiUDmPre+PyTHDHn
         R7qcDpFQb2EjXnxl7yXKLRiBHRtSCMrWCfII554lXL+jWOuseaOGm6hKvW+j7jz1eP7R
         +IwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714744406; x=1715349206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUBdXyDQiiF6V/4biQ4tWzrnIlHgE3iqaWXrHlzBiho=;
        b=VbC6RQhjcDCRKiof80zYaiZWWl2LVNu1inIbPEpKcSkgfStgcLaNovKCMMAcDAo+hx
         Myr/0RrYSAXZHjRQUof+kx8ygzoG89CO0blsVeIKUzHo74sBoUVKaM/eW30MFXq4shsM
         0UFHI7LWTGDb1aJNgHwhCDs5WJj74pBeYxWoyJNxhSBHsNiR92rlgx8jIOCxJjJe36DY
         vqm86wwQ/ZNLbrWQR6q8uqIOe89yVruc4DG6pJfBQG8skeYtrENioP8Pae8YZwCXOlgm
         oY+7EZq2T05Wq6Xv22a4hHVRJbroyD7fXDH4W1zoPm7cXQfCQiZWa2RuZ6QbT5iVyNhk
         iYBQ==
X-Gm-Message-State: AOJu0Ywon6aUc5tYeLcKFOkb4lwbur/JMmt7hey5CEaWzYqi2H1BinVy
	L2JP/kkj4ibIPw9SF38MyYLD4w72y/ZWHWvkbZ2udsxONVcrrN4sS3OISlMgOilAm1H9B9TBblu
	C
X-Google-Smtp-Source: AGHT+IFZvAydwqhvWM03v5V6JFWbkLX5+C5wC6EY5G6Ev69gxefEM+ccRDHl1EgkJkXBRgVyexMeYQ==
X-Received: by 2002:a05:6a20:12cb:b0:1a7:4f8b:6439 with SMTP id v11-20020a056a2012cb00b001a74f8b6439mr3530043pzg.34.1714744405782;
        Fri, 03 May 2024 06:53:25 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id e2-20020a056a0000c200b006ecee611c05sm3044941pfj.182.2024.05.03.06.53.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:53:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/3] systemd: sed ROOT_HOME only if sysusers PACKAGECONFIG is set
Date: Fri,  3 May 2024 06:53:14 -0700
Message-Id: <6954cd4bb60762f86981621e8b37dbe5e8236640.1714744247.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714744247.git.steve@sakoman.com>
References: <cover.1714744247.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 13:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198995

From: Christian Bräuner Sørensen <yocto@bsorensen.net>

Fixes a bug introducted in ebafe46379 systemd: upgrade to 255.1.

Besides updating systemd, that commit also made other changes. One of them
being when to perform the replacement in order to fix ROOT_HOME.

Previously, that happened on a configure prefunc and on
${S}/sysusers.d/basic.conf.in.
Now it happens in install and on image/usr/lib/sysusers.d/basic.conf.

However, that file is not present if sysusers is not in PACKAGECONFIG,
since that file in that case is not installed hence resulting in:
sed: can't read <redactedpath>/image/usr/lib/sysusers.d/basic.conf: No such file or directory

Previously, in the case of sysusers not being in PACKAGECONFIG, that was a
"silent error" since the replacement was done but the file was not really
used since the file was not installed.

Signed-off-by: Christian Bräuner Sørensen <yocto@bsorensen.net>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_255.4.bb | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-core/systemd/systemd_255.4.bb
index e7498c802d..f58a1bc2b6 100644
--- a/meta/recipes-core/systemd/systemd_255.4.bb
+++ b/meta/recipes-core/systemd/systemd_255.4.bb
@@ -271,14 +271,16 @@ WATCHDOG_TIMEOUT ??= "60"
 
 do_install() {
 	meson_do_install
-	# Change the root user's home directory in /lib/sysusers.d/basic.conf.
-	# This is done merely for backward compatibility with previous systemd recipes.
-	# systemd hardcodes root user's HOME to be "/root". Changing to use other values
-	# may have unexpected runtime behaviors.
-	if [ "${ROOT_HOME}" != "/root" ]; then
-		bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully supported by systemd"
-		sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/basic.conf
-	fi
+	if ${@bb.utils.contains('PACKAGECONFIG', 'sysusers', 'true', 'false', d)}; then
+            # Change the root user's home directory in /lib/sysusers.d/basic.conf.
+            # This is done merely for backward compatibility with previous systemd recipes.
+            # systemd hardcodes root user's HOME to be "/root". Changing to use other values
+            # may have unexpected runtime behaviors.
+            if [ "${ROOT_HOME}" != "/root" ]; then
+                    bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully supported by systemd"
+                    sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/basic.conf
+            fi
+        fi
 	install -d ${D}/${base_sbindir}
 	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'false', 'true', d)}; then
 		# Provided by a separate recipe
-- 
2.34.1


