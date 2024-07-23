Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8D8C3DA70
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:13:52 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.43734.1721740427205720964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=w0Z+Fftn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2cb7cd6f5f2so3092931a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740426; x=1722345226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuL3KbOX4moTDmCM2Y70OelEilCs5Zv01j8B9m2tSPs=;
        b=w0Z+Fftnm7OlDiVoJ3Xy1NLdZRFkztxvvKxfvcGOftDkhQCtuvIh+oG5cMmvbS7PId
         l9imIFChI16qFlqJSrc5kVVkC6GDmOmTOBRrs5XF4Nkt+GVnAWs78u829bv7GDu2pWST
         Tl++oACZJM4B5nJBck61UnqQACcLRhaKzvd7vRXkprnZIjRl5HQcNuZfrxcnxMVZxwLG
         R/DjerAFmfE4mDsesxTOm0jHkSiBHdxtWZmYmNKKEU417YuggOFX6L3yBVeAF2XdG8fs
         Sw39DC1inVT/36Fwyzqpw0jH6Ht26lJqIFcSAddaykVjXOT2myHKCkkQRtamD7k1Xkva
         DekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740426; x=1722345226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuL3KbOX4moTDmCM2Y70OelEilCs5Zv01j8B9m2tSPs=;
        b=B6iOhOnxoHTcjRKtXmU/dn4eV8zQrrjyseIRb4Qd6Sp/XKiN+ZXZn20QzzztT01iYC
         SnFWx6fsr6w2OC/zUu1+dpGHHvhNRvBUqXkWkdQk0cBT1KDvL3ebtbnbHPyURtdw+yka
         YaFNhcNrKKXL+pohi2Hb37VXvZVi/A5dPe6RV5fiYh0lZ8aXomHQYo+R62Yz4GfKzGlx
         RlQ5dZLtVO6GjH3EvVplX5WsZnajXE3fcau16Kqt2b2al7G2OcwPTHsUWHBU27W5N2Gd
         OxCEA9n8iOMyVeELXHQs7TmjL1CGgIakMpqUmj3KeHqYwIH6SHjMmIwWwTYAkxswEUJD
         OFJA==
X-Gm-Message-State: AOJu0YygzHFOfEDZj6ymOGHW0I6/ZxU7uwRRr0Ey4Kh+PUVoK45ghVny
	g2CFXy5affnw4ohf8/D+65JKnk9cDkpIz7GtdzFOcOxJX73FMF6TvBIIakDnYb0DKwA2LX4LNCq
	+XVk=
X-Google-Smtp-Source: AGHT+IF++YFfKAvk8GB15hmRyXY0yJsjdMjQhyTaVn4C3XOME51xrmN4kCZ8sElfeuwBbLuJM9CNlA==
X-Received: by 2002:a17:90a:8a88:b0:2c9:98c2:f6d7 with SMTP id 98e67ed59e1d1-2cd273d5280mr8021365a91.5.1721740426516;
        Tue, 23 Jul 2024 06:13:46 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/17] tzdata: Add tzdata.zi to tzdata-core package
Date: Tue, 23 Jul 2024 06:13:11 -0700
Message-Id: <cea6bc554f8326d1d7b680ce8e8a05f1f186b6d0.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721740245.git.steve@sakoman.com>
References: <cover.1721740245.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202357

From: Simone Weiß <simone.p.weiss@posteo.com>

Additionally build and package tzdata.zi info file, as e.g. Systemd expects it
to be present.

[YOCTO #15172]

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a57c7062c9b70361486898974beba4682cf4a76d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/tzdata.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index dd1960ffa7..2099b05db8 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -20,6 +20,7 @@ do_configure[cleandirs] = "${B}"
 B = "${WORKDIR}/build"
 
 do_compile() {
+	oe_runmake -C ${S} tzdata.zi
 	for zone in ${TZONES}; do
 		${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${B}/zoneinfo -L /dev/null ${S}/${zone}
 		${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${B}/zoneinfo/posix -L /dev/null ${S}/${zone}
@@ -37,6 +38,7 @@ do_install() {
 	cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
 	cp -pP "${S}/leapseconds" ${D}${datadir}/zoneinfo
 	cp -pP "${S}/leap-seconds.list" ${D}${datadir}/zoneinfo
+	cp -pP "${S}/tzdata.zi" ${D}${datadir}/zoneinfo
 
 	# Install default timezone
 	if [ -e ${D}${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ]; then
@@ -141,6 +143,7 @@ FILES:tzdata-core += " \
     ${sysconfdir}/timezone \
     ${datadir}/zoneinfo/leapseconds \
     ${datadir}/zoneinfo/leap-seconds.list \
+    ${datadir}/zoneinfo/tzdata.zi \
     ${datadir}/zoneinfo/Pacific/Honolulu \
     ${datadir}/zoneinfo/America/Anchorage \
     ${datadir}/zoneinfo/America/Los_Angeles \
-- 
2.34.1


