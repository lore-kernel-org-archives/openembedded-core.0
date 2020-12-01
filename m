Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.508.1606848776145356234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:52:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dN9+fosT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id m9so1727962pgb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=jj2cgtQv08dbNTclAlWCW4gRQSSu1kKZIF/VU5/Qizw=;
        b=dN9+fosTTOSs03qoM5hqf96vKUaSJtCjY5E3RZIDtxrED5r6sIlfvFcFA4KKa8LF4D
         wEb3/sYPS/MTdkC9zAyYVhtmm/KC3NaOWBIf/fuiYfHAJfw0u3ec9sr+R9Cg72L9tr3F
         Cr305SeDVbq7PhYyw3hJk5ASRkR2QMWKFZe9OL7hoFklMajY4U5NzKglKgQS5QS/eCjl
         eiNL5KcfWnx1A1VdfpQs5wDv085iUDHsObxIvGRzXcRAMD0nLcLZkR1V6I4vCMZHU0Vi
         G6pl0xHLDlEDQPjNl1mgYPh4bw4de6VR5f6nXuSJ0qNHt1W8sjLWdhtyC66r8LkquYBi
         kN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=jj2cgtQv08dbNTclAlWCW4gRQSSu1kKZIF/VU5/Qizw=;
        b=BQxbpkm6jVEKAniegjFPdGnyUmg4nFDaIW5fJKUUSX2tMZGejkAcGB7b6x6zwKgUrT
         kXP1MJYAKlT6xgEZj7xyts7bMf3MAq8jUDLS9fkG/PZIPjr7zUiTR07xJLgBeqw57oei
         kFCWez5rjJchbxKVUmUmyfWdZUKCYipgarWfDXYP7u49aHQ6zV+cOCxI3bOXGhqN1xFd
         Vrq2HGfRuiFlMe0ebwDotxuiXCruCgKCG16sLR2sd7inpBlVANjtZhsDyus2PTgB4Jyd
         g2qiojbvtwzQwemWu9o2SU8QaJZu26qb16EH2aXEqi4KyBK2a1cAgJiqEsp28d+hKj6w
         0ZsA==
X-Gm-Message-State: AOAM531PsLciSIIKKdYygoonIKhdLaBVrdWH9AhVpTYXoXH7kiGgerx6
	P4w3ko97e/HIwhrjscqaKFz+RhERnIhI9Ddg
X-Google-Smtp-Source: ABdhPJxc7uuffRS68tBVix5W2qZ+4801Tid60Ql0SP1uc+9thr1Z0EZowAw3xg2PJeXHlMhx0ZUEIg==
X-Received: by 2002:a05:6a00:22ce:b029:197:9168:80fb with SMTP id f14-20020a056a0022ceb0290197916880fbmr3926217pfj.38.1606848775275;
        Tue, 01 Dec 2020 10:52:55 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:54 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/16] eudev: remove bashism to be compatible with dash
Date: Tue,  1 Dec 2020 08:51:57 -1000
Message-Id: <34161447a03386d629a3782dabcd7f56fd8b9814.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606848593.git.steve@sakoman.com>
References: <cover.1606848593.git.steve@sakoman.com>

From: Fedor Ross <fedor.ross@ifm.com>

Remove 'echo -e' and replace it with 'printf'. In bash the builtin
'echo' has an option for interpreting backslash escapes. In a shell like
dash the builtin 'echo' interprets backslash escapes by default.
Therefor the 'echo' in dash doesn't have the '-e' option. When using
'printf' instead it is safe to use it either with bash or dash.

Signed-off-by: Fedor Ross <fedor.ross@ifm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c747acca33f84879a1ebd0ef972c07f4d5dff8b7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/udev/eudev/init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/eudev/init b/meta/recipes-core/udev/eudev/init
index 0455ade258..c60dbbf6d5 100644
--- a/meta/recipes-core/udev/eudev/init
+++ b/meta/recipes-core/udev/eudev/init
@@ -52,7 +52,7 @@ case "$1" in
     kill_udevd > "/dev/null" 2>&1
 
     # trigger the sorted events
-    [ -e /proc/sys/kernel/hotplug ] && echo -e '\000' >/proc/sys/kernel/hotplug
+    [ -e /proc/sys/kernel/hotplug ] && printf '\0\n' >/proc/sys/kernel/hotplug
     @UDEVD@ -d
 
     udevadm control --env=STARTUP=1
-- 
2.17.1

