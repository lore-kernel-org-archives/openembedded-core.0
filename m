Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.62232.1600092752594327145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=SokgrtVn;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id l191so11651908pgd.5
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=CPPTCTRn3aoS1jIBwQ/Il2/Y8lSlJ3NFsJ48aEZvNx4=;
        b=SokgrtVnWXutYq/Hsecwa5vdwB9NmrV5XwuJySz4OQOqGIFTmywYq7ZYEdYszoQYu5
         KfMDfvNkNHon3354n5jtkbuc7/vCscTab2qlulQLwbWNUJiajORLD7fkusE1umHrzdp5
         E3GQwIa55mlQLnRhjSRveb/zWOKCwg1RnNYtefGiJlgv3fIeTxY8Fp2Wx4MZ9/YIpKJW
         OpVibAOi+APT0w0UmSmCdvDuJky91gCqA9m/l/RyifEjx1I+uVlhinqevjL8U8LBGw5o
         5Jbfk6Hr0LlxJi8EESpgNgcEdJECM/df2MajZuV1qcrvIcP5FYXrotCCoL3VGND5HAjz
         L92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=CPPTCTRn3aoS1jIBwQ/Il2/Y8lSlJ3NFsJ48aEZvNx4=;
        b=I/thW3eOQ6kmdEAQMwwKdrAwTkObYngztjvynv9D/BB6XXqQiADGVBRr0nUO+xAh+d
         Y+AlU7M1XK6oHowhU0qtxxcFDk0hNeqcZXDzQ1JvAb6WFy3MQITXzUYKJdyepnsBGxoh
         3/SasR96VGgbJBIU07qfAUkXvloNksFjJmj1tlEa1JE+BN+fHBQN7XGcChiXzPiftPhM
         A7cfwsTtfFyuSWMmbpdjgdtsHNCC04ufLG+2U6LBAHo+6Lnp60br2W92uB+J+FAZI9Na
         SZ6HbvM4DqpVjz06tlV3O1IvKgX3ZKyIKx6NlZbAYA15+Rtf1tlY19OlOvrZYsQxCPds
         Jo6g==
X-Gm-Message-State: AOAM530+qvtXZVv8WrJINL2s7zpiUCYr4qMgVPLnuqSPr2ejyqeoIS1R
	ZS/HU2ZPdCq6eg1EZQKvi2rbI/YhZOXsmEsS9Gs=
X-Google-Smtp-Source: ABdhPJzyB6kNkRvkG+asiFiqGbl9FGqojl/gzcjOA6bat07F0j8RlQ0AeBg49DqZuGv7XSdGlpbVwQ==
X-Received: by 2002:aa7:9115:: with SMTP id 21mr13496250pfh.158.1600092751756;
        Mon, 14 Sep 2020 07:12:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:30 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/24] systemd-serialgetty: Fix sed expression quoting
Date: Mon, 14 Sep 2020 04:11:30 -1000
Message-Id: <36a4f6556f4d29f246b2558f3995cb7434699428.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

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

