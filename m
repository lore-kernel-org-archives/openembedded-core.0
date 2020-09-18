Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.417.1600445731552731553
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 09:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DsVuZVhr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id w7so3753864pfi.4
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2020 09:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=CPPTCTRn3aoS1jIBwQ/Il2/Y8lSlJ3NFsJ48aEZvNx4=;
        b=DsVuZVhr/eiF44n4qOW14Js2/yPOlWxKt2WXtD83/muQ5HonBuX/JP7zingk81u8qH
         kJmDEC5J+26S6CkXQjU5MDRSha4ktgd3/3eJqs8ITpV10QzxlZaowmIkfbnicSTE8ss/
         NtEvOsjFQK/rFBxzVAhZIfGDzpu/OJWVI4ExdBvOPNtqHshjc+7oqubb8lm4NA/bgzmn
         ae1dhOxl2qofmmDAIJ30u+owYdyW29zkq9jBE1wbsQma3qZiiLZCW/D0jiL/suG6cM9Y
         pYW9WL3JhDc8+n9+6Q4zanXFd1KLVWYfUpobDaBiqGEd1nMMshuhogzHcNIlAn6wiJJ4
         obXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=CPPTCTRn3aoS1jIBwQ/Il2/Y8lSlJ3NFsJ48aEZvNx4=;
        b=fKgkqwO0hMIb07NP8IIwtj0Klgo0nWsLYZJC/Ub+q4eFVVG1cYOnZDrAo8VWw/0Br0
         39Ql08cDyfb3SUHCZ8HfWyU54zsvGrWMdGXSDOyysY2KmD0T1OgW99C4bxeA+qujK657
         QnyzubA8OjTFHKTAKHbehVzmzg/up8BkIJQ+p5cEZEwu05kt5MjFlfk4yG/HVhwrglyo
         mYeqT7LXV/FXnPLvPJJrREb7JjU/H1skRP0nyNzWFZ1xGZeqEEpPUJSkUUH/b0RjALod
         EhIK+F37C+LkqhmAA82rmIUpyMlvgFbL14qIhySB8VgIMJW8k9HRx7pdHCy321ukPbKY
         Zsgw==
X-Gm-Message-State: AOAM531jlHujyP7ih/SuRkSGG5hcj68UyMxxUKuf2E4zjx+Os9pmjzuR
	qcqmwCdlnrGXfIQGM3r/+cf/xCknI2UHOaSbGao=
X-Google-Smtp-Source: ABdhPJxHdo7K7+w0YmPkENk1QoFSPwTu5EQ/q7s2aF3/FtogzNK2EqFjJUq/089QGScDin1FyonI0Q==
X-Received: by 2002:aa7:95a6:0:b029:13c:1611:6524 with SMTP id a6-20020aa795a60000b029013c16116524mr33118590pfk.4.1600445730516;
        Fri, 18 Sep 2020 09:15:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q15sm3260100pje.29.2020.09.18.09.15.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 09:15:29 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/7] systemd-serialgetty: Fix sed expression quoting
Date: Fri, 18 Sep 2020 06:15:09 -1000
Message-Id: <edaecac74210ae201dc5eea5758bcf4e85cb14cb.1600445624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600445624.git.steve@sakoman.com>
References: <cover.1600445624.git.steve@sakoman.com>

From: Rahul Kumar <rahulk@mvista.com>

Fix sed: -e expression #1, char 13: unterminated `s' command

Error Message:
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['pseudo-native', 'glibc', 'patch-native', 'quilt-native', 'gcc-cross-arm', 'gcc-runtime', 'linux-libc-headers', 'libgcc', 'flex-native', 'xz-native', 'libtool-native', 'automake-native', 'binutils-cross-arm', 'zlib-native', 'mpfr-native', 'texinfo-dummy-native', 'autoconf-native', 'libmpc-native', 'gnu-config-native', 'gmp-native', 'attr-native', 'm4-native', 'gettext-minimal-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| sed: -e expression #1, char 13: unterminated `s' command
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/opt/Projects/poky/build/tmp/work/qemux86_64-poky-linux/systemd-serialgetty/1.0-r5/temp/run.do_install.11228' failed with exit code 1:
| sed: -e expression #1, char 13: unterminated `s' command
| WARNING: exit code 1 from a shell command.
|

To Fix this Issue using the strong (single quote) character in sed command.
It is recommend to use quotes. If we have meta-characters in the command, quotes are necessary.

Signed-off-by: Rahul Kumar <rahulk@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e2fea05e150dcfec4b7dfbd8edddb53897026bf9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 044c6c5b67..059fccc2b6 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -21,7 +21,7 @@ do_install() {
 		install -d ${D}${systemd_unitdir}/system/
 		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
 		install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/
-		sed -i -e s/\@BAUDRATE\@/$default_baudrate/g ${D}${systemd_unitdir}/system/serial-getty@.service
+		sed -i -e 's/\@BAUDRATE\@/$default_baudrate/g' ${D}${systemd_unitdir}/system/serial-getty@.service
 
 		tmp="${SERIAL_CONSOLES}"
 		for entry in $tmp ; do
-- 
2.17.1

