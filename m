Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616EAC4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 19:15:13 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.23486.1706987712005489188
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 11:15:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lMVYJ/Zd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2954b34ddd0so2657845a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 11:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706987711; x=1707592511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tO2bo/ZyPW1CYTNJNYvOlpAYONfs08PPr6+Vwr1lSJQ=;
        b=lMVYJ/Zd+HBS9LR+k4WFerd85XTc7zcolTjNY/AOSzVlSrgDkofQUF45XKemZ+kmC5
         dO+L+hOoabQ1D7zQ8Dd6TnWj9xB44daRGnY+io+vr/3GExh9kb23Vy4v3tuS6/oWzW3l
         d9R9KhzdQQqtHzvEVB6zcX5cKgYUMB6OU8ef5HZA/WcIDCmZNxp/KKFAbucJCiR/Z8G0
         oMF1lG10O/uNfNf3Zsseg8/VxkDYOTfDiczrLpx+DSH/xpXHWEVDIo3pXn9LSr7F12XY
         yZkAXPuoWvQJkhI+3punrI3bJP7qfy2ZgCCc1/SwiMSJ6YRt3xNsKUEZeijKS+mTQnuE
         NSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706987711; x=1707592511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tO2bo/ZyPW1CYTNJNYvOlpAYONfs08PPr6+Vwr1lSJQ=;
        b=SatuP1dq5W0Uh10TKuDxiMgrj2AecZtCu0Sg2LY8+gkgbc8BE6ghBe2bDCjYXMuqht
         NFhgRY4xoJe2CMkQTSv9vWSvSEhwj867YyRyDeLT9cQhuwHUVtbpWVDHDSSIUdoZbNZX
         NwIjefradOroZjag4u1k8EQIkoS80XMMIiV96MvWxKNUVPC/XKkKRNO4v/zT8k888fWx
         CKHiTyC6nvjBP8oRpVeXWZP3W+NgcK1m/dCng5xKEyKddYo5moHlHimX85TowYCWpPA2
         3qFS+bjtvGFt5kmPefG4zyX7DCoNWXW6CzAwxuPur1oFmGHqdCQUlV1ZEeD2BsjYPtd3
         +HAw==
X-Gm-Message-State: AOJu0Yyr7t1XpVYO+SkeCtUtnIJa0hGi8IRlsXTmxlXvjzWqSzXP4RV2
	69qKxK5QYpC4W6/2419ojd5/G6tiUyRUJCVmtKJ5otM/wGg+1WkkOpaThkOPFskCZM1q7ziiwJO
	HHAo=
X-Google-Smtp-Source: AGHT+IHOdjX7FGTz2pVhxboLrBsqH/V70WZlh8CgURwhXdmk83iAod75Nei/2NgP/pBwzr53Fgu7CQ==
X-Received: by 2002:a17:90a:cc04:b0:293:f16d:e53f with SMTP id b4-20020a17090acc0400b00293f16de53fmr8516298pju.0.1706987710752;
        Sat, 03 Feb 2024 11:15:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w63-20020a17090a6bc500b00296443780d7sm2376863pjj.47.2024.02.03.11.15.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 11:15:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 12/15] icon-naming-utils: take tarball from debian
Date: Sat,  3 Feb 2024 09:14:39 -1000
Message-Id: <12cb5cce1cad02125fbf695e0d94010535cf228a.1706987549.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706987549.git.steve@sakoman.com>
References: <cover.1706987549.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194856

From: Alexander Kanavin <alex.kanavin@gmail.com>

Upstream website has disappeared; the tarball can still be downloaded
but this is probably not for long.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit af59c518467d1174d1d63594fdd3279a2fdbd8f8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb b/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
index 67cbd03100..5502b66905 100644
--- a/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
+++ b/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
@@ -14,7 +14,7 @@ DEPENDS = "libxml-simple-perl-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-${PV}.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/i/icon-naming-utils/icon-naming-utils_${PV}.orig.tar.gz"
 SRC_URI[sha256sum] = "044ab2199ed8c6a55ce36fd4fcd8b8021a5e21f5bab028c0a7cdcf52a5902e1c"
 
 inherit autotools allarch perlnative
@@ -26,4 +26,4 @@ do_configure:append() {
 
 FILES:${PN} += "${datadir}/dtds"
 
-BBCLASSEXTEND = "native"
\ No newline at end of file
+BBCLASSEXTEND = "native"
-- 
2.34.1


