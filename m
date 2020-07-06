Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.61425.1594051890649518444
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0aRZ/SEP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id k5so7650939pjg.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bYne4GHAaYhjavfB6iPDfr1QL61YzuOlVKtVAyb29xg=;
        b=0aRZ/SEPcItRXVBoiZtzq2PculaasiYNHx9QkGZ6xe7XNNciMQHdAqTE20uI+4dmG1
         ltb5U39M+hVlYJvkEo4d0Gme4N96A1J3i9rntlJbHoBJrdq5+5WJtrcXfFZOlCtqtdYV
         uY6RNIDGH7uMFlSUuyIPAjRpLmuWbIFSE3DgGAaXUr6TYvXT6kJUHx4k0GFKOX+dGVyZ
         3l2f/ioeb71GLWsFgluO+kl/O9mB/2fnDAJAqkwToI8R8gZOYNYOW59p6dkMXeU19Qxl
         DExgsvbSbcd8rl9aaqEJUBafYoxh2xAmA6nEa5aJE2Ze5A8T2t22KlKppWl+RVb8DpeG
         JErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bYne4GHAaYhjavfB6iPDfr1QL61YzuOlVKtVAyb29xg=;
        b=s0goTv+FObxpzaJwo2ACOn0Zpat/R88ofKnkM+2wwolVPnsMQylVFzQvbscRLUABsV
         6ciXeFt7BH8TR7rgBWT3+Wyi9zTTuRFaHYG59WOS4QnrKNj24Gr/u621IYg84PwS6cKu
         xbLz4SPNWXcZYLHrN5SLtV7g9Db9Bda+fS2C5jXCzt6ABVLtMFdss+y7fBTkfa4x2PUc
         +4bfEEOwRSUlsCU7fiNgcObbgrHFFHL3WONdEs+iDbBWrHHb17V+Mam+PKmDCP9qZ1TB
         A42Txrjh0L5iwAv/Qj/RnGyH2WJYAlSftlVYblrHNuiopec3+nkdpRpErE18JXz57BdW
         wmmg==
X-Gm-Message-State: AOAM533A9RqTi+j3dJbEqDgJZeeMYvQoaPrtadHD8RgDVqG6gWIMQsQz
	PqWRNmLdn4eh2jkA8XLvW7fNJjME+x56Bg==
X-Google-Smtp-Source: ABdhPJw9X1rHcUIi8VPSS8Q+5tQabm3AQO3Ka92XIsp2tb64UoytuXJ0VMeQpfYb8xyxX70/yBTNIw==
X-Received: by 2002:a17:90a:a887:: with SMTP id h7mr26985pjq.0.1594051889657;
        Mon, 06 Jul 2020 09:11:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:29 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/25] modutils-initscripts: update postinst
Date: Mon,  6 Jul 2020 06:10:12 -1000
Message-Id: <136151688ed9782c00bf4f8b12a9a4d90da497e8.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Changqing Li <changqing.li@windriver.com>

in container image, it don't have init system,
install package modutils-initscripts will report error:

+ systemctl mask modutils.service
/var/tmp/rpm-tmp.DYK3Pm: line 8: systemctl: command not found
%post(modutils-initscripts-1.0-r7.3.cortexa72): waitpid(823) rc 823 status 7f00
warning: %post(modutils-initscripts-1.0-r7.3.cortexa72) scriptlet failed, exit status 127

fix by use same way as systemd.bbclass to decide if systemctl mask will run

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eec648f23df0a4e05130f8ef5a04902296567e38)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-kernel/modutils-initscripts/modutils-initscripts.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
index 0f3df5577b..881b7db92e 100644
--- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
@@ -24,7 +24,7 @@ do_install () {
 
 PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
 pkg_postinst_${PN} () {
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+	if type systemctl >/dev/null 2>/dev/null; then
 		if [ -n "$D" ]; then
 			OPTS="--root=$D"
 		fi
-- 
2.17.1

