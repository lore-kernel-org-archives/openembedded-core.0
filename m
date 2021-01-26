Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.13184.1611672233392530585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XbyXhzqD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id u11so9856042plg.13
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vjhZS8ROF6ddlxGwpc2LxqvZjRsM6GDyhLqdB3/ERWg=;
        b=XbyXhzqDNKUQKF7Lxsjc4HW7ZSmEzdjdw3W3Wfbg1Iysxi4V8m+1HTqo5fAyKN2qeO
         XomUlcxiyW9qZYpTpTIz5uemqxjzsPuRjM8NLo6ZRug31vK0NzxReFigefPKmdZU5hmo
         dgaGF9KLTKM43d809pBd56XTCO9usOtkJ2N/8X0ysWqZrhFbRcnlXWW6pbqiXoKs5eNL
         2Jkq+CF5+7ip1F89N7rc/+NVSDWtYjjN87XdKt8ziUKQJZhuTSIW8hYntqg/HI/D7rcZ
         aZuYnUWOOXgYviT9nPYfdBkzEJzh6iLQ8E4szx0XSElzcgIa3idP5ZgCbKxCURhxqdBR
         b9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vjhZS8ROF6ddlxGwpc2LxqvZjRsM6GDyhLqdB3/ERWg=;
        b=IIkLkgzZJT8UGJBGRA5RQxH9XvpH+e7QTKpkq59iD0yJWQUkAgmYZgBw8750dHsp30
         5r9WQkDT100EaHIUyQlDLc9KROEehb/xtJFVEUCvGXpBHg8smfxpcsiBjC/VhIDzRYDc
         39VE0egLfvqxYUcGSaaqxeVRCk6GCR+fNfH+byThCti52mNnnTKxqz6Xv8mUEgJvqwia
         L9hW2fihbOgSPmUgEby6EjQDxcrez2sh8T5p3DAxaAKRA/WBMs71FTyIXjxDk1g/z1te
         6aifVBD2LzFTTv2rnYcruxt+vbW0W5tsM3SYOXmVpkUvoVxhyugsvHnJZ6JlDvD0gVm0
         dB/Q==
X-Gm-Message-State: AOAM5339mZDkjADLWMzseoRGdMiVnfT5YpciFtxyjxKyuNQHXiEJtZPP
	ecSVZaLFwBwIXq1pJzpvereB9aiTh97yU16+Mvc=
X-Google-Smtp-Source: ABdhPJzEEjVkfZtQ/7DMwcWNLFB/oX3XXSpGksSW4xIKHeCV9K3JZ3/yYW40U0BRr+8O7n1H/vZW7w==
X-Received: by 2002:a17:902:7847:b029:df:d889:252c with SMTP id e7-20020a1709027847b02900dfd889252cmr6285288pln.76.1611672232524;
        Tue, 26 Jan 2021 06:43:52 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:51 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 37/46] pseudo: Add lchmod wrapper
Date: Tue, 26 Jan 2021 04:41:48 -1000
Message-Id: <09bf4883e4649c154fb65c44a50dbc006e3d3b81.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

New versions of glibc have an lchmod function so we need to wrap it.

Identified through a reproducibility issue in initramfs-base where
/dev/console created by mknod from coreutils changed permissions
depending on the host distro (mknod used the gnulib wrapper on most
hosts but newer ones used the libc call).

[YOCTO #14162]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 20a645664977530e602e1ac97e8dc0962e730e6c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 78c6b01f09..7fa11a54e7 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "6fd57da7b1de1a2b6cf530e336d58bb5f8bdd015"
+SRCREV = "1ee9a1e05e200f189f6644411ba9304e8a479b0b"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

