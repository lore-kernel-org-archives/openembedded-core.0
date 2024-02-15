Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669CEC48BEB
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:38 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.18128.1708013910887103464
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hnrPlJbn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d91397bd22so8206825ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013910; x=1708618710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDFFDgWBzesqFYwKTMeADQwjdU5MCVCJAkFJi9PNso0=;
        b=hnrPlJbnWExsUivflD+06d+SKk6SOgtXESouQRXBdHSlsRnD2gGvTfqXbaSbJq7JnL
         Kd2TCzIUFDxxirwVJeT2iVzYRiUXiaKvE8lVQq7AUIP/+bLC+op0TQHFNt0qDijcDP4S
         7mSuHqWbJHqv3RCorPw3NZJe5zDwy0Hypbq1ZLZDPe5eHSdwq3ksLAP7VFZqpykN5hKT
         Y0yYb4oSoXeIcnDLZRXdkjPeSq3+wesEEE/M4qOeXXZdwn3BxWePvNkChvTwAyWDZTdo
         GC+yRbfJXfccEjQ+0FJajbaaz+M6NLw9sORbLeFOagISjb9AxNpVyY/RY7+pSxZ9T/yx
         PIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013910; x=1708618710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDFFDgWBzesqFYwKTMeADQwjdU5MCVCJAkFJi9PNso0=;
        b=UJvd12rg9q4+tKw73+ZuYBec2pq+WRUM0Ph1vcvJd0aJJA01lQBMGgAFRyCNb8BHd0
         taKy6n2/rlshBZcn++l37bCpX6q8HnwN0+qGQd/pnfjs1ZmlRm06KDEHq6XgPqkELMwU
         UQPJHyxLhFaaPM31yz4hk7Ny2lWoSxaIgHpkn75FK7iWt1ydVZ8Rq4/zoKMulZnlbXQe
         Bcq/pS5/ydBlajW1MHjYlERNdHSwDcq4IazftTf0SrPd8zeAk4ccL7478SVRJsMyO8QL
         6IWhIaIa80uV9kraSAA8XumMpDPwJkKIJApqelKWzbzIoNoJjaQRzHv4YeEL23RjGe3m
         Okpw==
X-Gm-Message-State: AOJu0YxfyuRmco1PpZTVdWPw6JIZ4GADx7Xlle7WO5iTlg4YRHAtu5DF
	Rt2fnngXDsaKzhCso/wvhhvyizLWd10pfqrGjV98Xt2FEsy6SsRwU2tmfVQCzXNanFLx61S6FNi
	VE+Y=
X-Google-Smtp-Source: AGHT+IGkVXnAItF/PEBNoKml/8J4T76qXoLZ6g0TFfhsRFcugzxg6l5JFg1eoCgxMmRLcJFOq6APmg==
X-Received: by 2002:a17:902:9304:b0:1db:3618:fed5 with SMTP id bc4-20020a170902930400b001db3618fed5mr2023520plb.53.1708013910276;
        Thu, 15 Feb 2024 08:18:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 10/21] linux-firmware: upgrade 20231030 -> 20231211
Date: Thu, 15 Feb 2024 06:17:53 -1000
Message-Id: <0569b19936d20acc77a3f11d1033fc7ae5e8f331.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195530

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0caafdbbf4e7dc84b919afe14f7cb8c46a9e4ac2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...nux-firmware_20231030.bb => linux-firmware_20231211.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231030.bb => linux-firmware_20231211.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
index b1f5247975..0ed4d91f8a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
@@ -151,7 +151,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "ceb5248746d24d165b603e71b288cf75"
+WHENCE_CHKSUM  = "3113c4ea08e5171555f3bf49eceb5b07"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -237,7 +237,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c98d200fc4a3120de1a594713ce34e135819dff23e883a4ed387863ba25679c7"
+SRC_URI[sha256sum] = "96af7e4b5eabd37869cdb3dcbb7ab36911106d39b76e799fa1caab16a9dbe8bb"
 
 inherit allarch
 
@@ -248,7 +248,8 @@ do_compile() {
 }
 
 do_install() {
-        oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' install
+        # install-nodedup avoids rdfind dependency
+        oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' install-nodedup
         cp GPL-2 LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
 }
 
-- 
2.34.1


