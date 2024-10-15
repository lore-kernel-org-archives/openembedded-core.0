Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F77D1D89D
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:20 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.4791.1729018273512724878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BYn0pX/s;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso4458882a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018273; x=1729623073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4Pb4OiD8JicQGC/ShVUEbwxThHAIuWrUkNbiXDx9Oc=;
        b=BYn0pX/s/AIzJgUTcSl+IvouFktFwDMVnzQDPXNN4GTUtYk/x4fCcAOs125FsXHddH
         kNFBqHcap++0PttJ7NMqnK3LbVy8MbbrjXe2BE//1T3y21UjdPW7fJGrT+1MytnD27vc
         6gURbsDRvvRYyRsnTXK5YZ95rZxzdJH1g1cbpraEJJ0BfGgsnbN7sR0+q6pz9dJzyUSw
         rRT2RkS3ZmLI7TOLz90M8s59qDXEeV0GbM/zGFUNS82rgUj5SZyJxt7bITt/TNfmzmJN
         DWDyYXLsAcwkeEwgbadPTf2ih6QZitW932sgEQJBiexGnH1yNCN6wmxlkSXWcAbzakD2
         6Lpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018273; x=1729623073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4Pb4OiD8JicQGC/ShVUEbwxThHAIuWrUkNbiXDx9Oc=;
        b=JknSP2Niz0pda9pZLRxncye+kr6AHXD6lbKx6BBc/qjrf9fEDN4HWsQ+0Z4asFYq8L
         qPeRJNfFj8MG98qLPxaz3D69berEx+Y091zGmSxJWDFfef7nRr4hrh9Ox98iZJSgXsDL
         jbmHLKzN8Pi8iuSuBhP8sF03gMeZBUpCPHC4nFF3ofQ3lscXs5hApOaMm43mi35MynMa
         0CRnsMN3t/lgd/7DsHe6VCHVEoeWt0WDNwJ0BIi4f6n/G05ZcZEGS5T42gEd97cQnOHz
         O8KeWxm8S1o98Pjia9xtE/qwWLEPD2c6D2a4tLChrTBbKzYEfjm+88eRAKIEyPalX2qF
         m1uw==
X-Gm-Message-State: AOJu0Yx+N0aO3k7mlzF56uovJpWuhI8f2RcKqANs6CdxK+xXxsjRMoH9
	/BbHT47QTBSQ3A0LPwj2SZGAyUrZHI9kob8TJu3VEJtC464OyGF7L/MLqCNMiNuMwYQV1TJnYgZ
	f
X-Google-Smtp-Source: AGHT+IEVIKsOV2lUN4No6d4dbMSPHkIuoJ9+OUIeos8OvNYiGpN3VEXdX3ZW9Zi5UnCcLs8x7Rssbg==
X-Received: by 2002:a05:6a20:c70b:b0:1d8:f679:ee03 with SMTP id adf61e73a8af0-1d905effa5amr1719094637.27.1729018272661;
        Tue, 15 Oct 2024 11:51:12 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/18] sysvinit: take release tarballs from github
Date: Tue, 15 Oct 2024 11:50:43 -0700
Message-Id: <e39cad8d845ee17517e69c2935567a9316ab8d22.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205930

From: Alexander Kanavin <alex@linutronix.de>

Upstream no longer publishes them on savannah, e.g.
release announcement for 3.10:
https://lists.gnu.org/archive/html/sysvinit-devel/2024-07/msg00016.html

There's been several new versions since:
https://github.com/slicer69/sysvinit/releases

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6cb71eaf3d225de14e62cfc1b76dc8094f8f4aed)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/sysvinit/sysvinit_3.04.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_3.04.bb b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
index 6a612468f3..1dd5f575d2 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.04.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 
 RDEPENDS:${PN} = "${PN}-inittab"
 
-SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
+GITHUB_BASE_URI = "https://github.com/slicer69/${BPN}/releases/"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
            file://install.patch \
            file://crypt-lib.patch \
            file://pidof-add-m-option.patch \
@@ -27,7 +28,7 @@ SRC_URI[sha256sum] = "2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-inherit update-alternatives features_check
+inherit update-alternatives features_check github-releases
 DEPENDS:append = " update-rc.d-native base-passwd virtual/crypt"
 do_package_setscene[depends] = "${MLPREFIX}base-passwd:do_populate_sysroot"
 
-- 
2.34.1


