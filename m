Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D01E77184
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 20:56:57 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.3989.1733864209639578564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 12:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t2nItD+B;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fbd9be84bdso5527167a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733864209; x=1734469009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeZu+eCBH4KDs0pPctYUSAKpaLuvW0/vJ2R0ktELspQ=;
        b=t2nItD+BmO9xLv6Judj5p3l/eiRlWSmFyejfmNUfG9kvLawnSbWXR2DOkuoBNwRhME
         NjQn+S9Dld/ZptTYxYTOu/gd2b8INb8Uv5Vv+MJAT8uNHFmR6bTR+i8N8S0BaxRHNcmn
         ifH7a1BaV1dHgjOjEPB1QLCIoLQQB5SZ0c0o8Mp18ngO9YT/rfLqlPj7JN+26qssZeJf
         32e1cIIZF0DZcbppErfd91W1cHRBc0opK48kcyWfYf/WpHAoMeMV18qicizPnWXhlIf0
         yLBtBWdZIL8sXQRwKgF5Si8kl8z0yX3H4YVCg3s34T8qlH68n/aGVLTEz6RQkygFSHuf
         /1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864209; x=1734469009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeZu+eCBH4KDs0pPctYUSAKpaLuvW0/vJ2R0ktELspQ=;
        b=w88o8nejzKpThEEZb3yCpSvO/VVl3j0TdvTeAsm1kH2nRSuOQCQkk4lZcPqfm4ttGI
         e3Ecpf4PgjkS6p1x9xPxfuYSQd4SnZq+IvDHqqDTuTdLgDOEp9GoTg6sTl3NQtP3LjLH
         BLngC2QkVofcLYgRtkP14OcMfZCoES/uJ/EHMJbb2Q5THmR8nawLyqy4P4MmV9PWjKnu
         pkRG+Z5EsfRAPjUaUiFfx6fPBCJfkNQJtuQ6h/HeNmWXwCvvYN8l0BzrRE6WZ2h4qPJm
         A+uRcMEMmlDyeez6y6blbQ+saVWcYQ2L0X0HTvtuPXfp7F65gt7pn2sdHAyJ5tLX1CT0
         cPNQ==
X-Gm-Message-State: AOJu0YzTqK/d6ZaY5XltOKni+1ziTRMZZYYGRYgLCtrDtz/VAz+Nbqfz
	0hWHZpsT2TdQEY9t84xQE0plQSob4rIe4+I5/CbLPk+L+1tNgji5P0v/Gxn81nP0ms8MGkIlY8X
	G
X-Gm-Gg: ASbGncv0LJiR2xAZhSliE4Zs9fGFWM710+7AX/wczwnA8bUtYe4e65MsDQVMorcnsYP
	ZEUm2zXmH+F22qm1ZVeRw2NDLGyFvtDK1rE2jIpu11c4qyE47Kz3Uvht3mBJrD47CgOpz5km7hk
	UopDu60xGD4rBtYAQMbNrp8zNTU2le30brFakTYZrnOwtLhCjVLjyD930hyjd8RqahuJh0Fp5SK
	VLG4qGgjUsN08CMFhhj2AxL1V5srT0mEe23DGPFrRI=
X-Google-Smtp-Source: AGHT+IFvceqgMGz0VQSNOBf6MafTyJk1UJdZF9bfgSc0xB9aPBemTA5WtmFFUP5qUsSi65AG0qDWAg==
X-Received: by 2002:a17:90b:3d08:b0:2ee:6db1:21d3 with SMTP id 98e67ed59e1d1-2f128089f18mr590137a91.25.1733864208940;
        Tue, 10 Dec 2024 12:56:48 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45ff77b9sm10245470a91.36.2024.12.10.12.56.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:56:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/12] systemd-boot: drop intltool-native from DEPENDS
Date: Tue, 10 Dec 2024 12:56:25 -0800
Message-Id: <fffffc22e9cdfee5afe05baadaae941785f5a18b.1733863624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733863624.git.steve@sakoman.com>
References: <cover.1733863624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 20:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208552

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

intltool was dropped as a dependency in v236
See commit for reference:
https://github.com/systemd/systemd/pull/7313/commits/c81217920effddc93fb780cf8f9eb699d6fe1319

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd-boot_255.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_255.13.bb b/meta/recipes-core/systemd/systemd-boot_255.13.bb
index 4ee25ee72f..397316fe9b 100644
--- a/meta/recipes-core/systemd/systemd-boot_255.13.bb
+++ b/meta/recipes-core/systemd/systemd-boot_255.13.bb
@@ -3,7 +3,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
 require conf/image-uefi.conf
 
-DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
+DEPENDS = "libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
 
 inherit meson pkgconfig gettext
 inherit deploy
-- 
2.34.1


