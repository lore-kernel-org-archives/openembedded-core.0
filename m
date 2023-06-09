Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0575DC7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:26 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.170.1686329662743104328
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=UfAxyqfj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-652d76be8c2so2102598b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329662; x=1688921662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38fsvO975XJ/CzEp87o7WaoUyDqk6QPSZ+KpsLfacDY=;
        b=UfAxyqfjPK55rzJODgUZQ/PqGonrMLH5Fncei+LpjBS6knWKRPdxzCUQifWSXfm96V
         KOKjzpqRQrZc1t7NJXG2l+Pz4LFp6DdFPmsEkdxMOvN+CiCim0TgZXP+tMOESVO8k+xD
         onzwX972tz9NYtH0xC1Cp2jjZpugr4jWhKI4+C38GyDnGyTIlhKz9YyBHDscNQV/SWlS
         7Hri5skpJWsc/mC014gNmK2d6QK7WslNWE4yqzX6x7MfezZWO7Wy5HerLreBNVfC/aFL
         lbbHvF+ZPm/T4GOpqHdT8aIUipu0IrzhyzFsEr80KzOL94zVFxlDj7s643jwOJPApEMu
         G/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329662; x=1688921662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38fsvO975XJ/CzEp87o7WaoUyDqk6QPSZ+KpsLfacDY=;
        b=fYmnl9O6Kqez0kOrObmuBa8i7eIgsDizDFy9UIKrL+qrFt7OC5a/skyUhNLFw7pVEo
         YqNXLtq5CWkR+/WnnI/jnnehpVq2Wn1qx2rGKG39AcYrL3WIJX+D5efsKL4placVlyrY
         izNJPed3p0FVbQULoAyWs6MFtYN8H72ibyqF7KrO8JfzyFkR5Yeclr6Nub8OWnjz/y3T
         2x/SCivMP2lKlxTJHD2/RwudXS68/61A0kB2XlWr96I8mo1+adgBWnQe12huHQn+cwdp
         sBd5cmcbnENRz0VCe7FqIkVlubgVscOAEsMczmskjVge2fMb8rkLYCpDZs1QurGJQE0U
         sFKw==
X-Gm-Message-State: AC+VfDyBS8vGlaJbL0nnzbDKEiULktIdhWOh2Ut1v4c6RoXzUSdSx6Dq
	iJJr/IC+MP5VXhKKzSVM5ic9uU1WAMdad0s6BDw=
X-Google-Smtp-Source: ACHHUZ43rCYCoQfCCG6KuRVnbiIGn5vJ257a8lSFWE53uio+wSkh+ujKSk38GLu0MvK4WbIsxdyrYg==
X-Received: by 2002:a05:6a21:3405:b0:114:9bbc:c325 with SMTP id yn5-20020a056a21340500b001149bbcc325mr1897652pzb.11.1686329661861;
        Fri, 09 Jun 2023 09:54:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/30] avahi: fix D-Bus introspection
Date: Fri,  9 Jun 2023 06:53:38 -1000
Message-Id: <ec7ba3c31611ed9962b844256734a07ff4ca9152.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182577

From: Eero Aaltonen <eero.aaltonen@vaisala.com>

Install and package the D-Bus introspection files.

Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b8183ad25af3bcf23f04dd649b6ef665569fac8c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index bf6835e0d6..8649140a45 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -83,7 +83,6 @@ RRECOMMENDS:${PN}:append:libc-glibc = " libnss-mdns"
 do_install() {
 	autotools_do_install
 	rm -rf ${D}/run
-	rm -rf ${D}${datadir}/dbus-1/interfaces
 	test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
 	rm -rf ${D}${libdir}/avahi
 
@@ -135,7 +134,7 @@ FILES:avahi-daemon = "${sbindir}/avahi-daemon \
                       ${sysconfdir}/avahi/services \
                       ${sysconfdir}/dbus-1 \
                       ${sysconfdir}/init.d/avahi-daemon \
-                      ${datadir}/avahi/introspection/*.introspect \
+                      ${datadir}/dbus-1/interfaces \
                       ${datadir}/avahi/avahi-service.dtd \
                       ${datadir}/avahi/service-types \
                       ${datadir}/dbus-1/system-services"
-- 
2.34.1


