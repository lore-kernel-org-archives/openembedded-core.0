Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA3EC54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 14:59:42 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.1117.1747839579883602397
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 07:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ou+tdMbn;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b26c5fd40a9so6337009a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747839579; x=1748444379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21jObjESMjC8Ny8vy+U56IrxPTqMwDwCh9r0yU5775A=;
        b=Ou+tdMbn6LwXV4DSffiI4o0nK+DlZ+PyhKYLq7JHSfQHK7fAzKzK5Qu9F21VTEW8YD
         Z2SNAwjc3fBST4sdAeaYs2j+j68U2T0zjo6MLCdPVoZsFjQ//bQOWboO0sHn9O3MDzBS
         tckNv8IHO5UsRUJcVTClh5OuCWboXW+01M27Zro9MLMmRGQlUcOTIRM4Sc/I7grK3vH5
         Nd2eYKhi5A1KYVhQ8/i7Z0hzbrNgstRME5gxyvEf/FAWneWHaOd1zNG63zx3l3oFh39U
         Gk7LseWYRY0SMkmujxmTUsHJhTS+UUxEkmKTo8Q0jT+HFKvn0Ur4i162YtE3f8LOXeg5
         UI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839579; x=1748444379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21jObjESMjC8Ny8vy+U56IrxPTqMwDwCh9r0yU5775A=;
        b=u7NCGfvUdEBOvrw8NlfejTVUDg5rP14Lf88KnANU1eWhRGhhRvWhZPVuUSn+LsSfJh
         /l+rPnLoZhq+rRCxXhjo96A5M2FDy4kWT03Hr0RPFVSwJ14plbVUJMf7rWpp2RPiGBwb
         BMecNhaf2T7hYwh/lUbIQ2v+nDmmn44FtlKdXNcRzObjcKdHXMuiU88FOWfsvG1R47Y3
         AlB0LQ+siqabQ5HGwylyb9Z8elVg0KjwG9DQqbtjP86SSpmhE7MSik8/yh/hsuDrd1ex
         EI/hlZrhAn8FIC2iC6tOVgW5HVKt/9aGktXA7MDyRvaDIj3AFy8m3aEPDNBOTHa2Tcbt
         gxXg==
X-Gm-Message-State: AOJu0YyFQc+5Zkf+Y5feIyrfvhihp+M1grUxpQKuWufrZP6W+RVf5a/n
	6hC6cUJYtBQfCDc3+nzL1KwaDuYnahPANR+8aPdeZC2eYWOdfR07Ct5/l8r4VYZ6Hl/v5YtK1B4
	zONvv
X-Gm-Gg: ASbGncsezV8RhfvtenwooPp6OG6MohdUtTFNZw8Y6U5HzvxVHlEN1rdLwGH7IfzotB3
	D6NIr9ioDH7J0ISjTDzw+PsWunvGZSTDaDlbTVC1qzCKGC/Bb3WAddkR3K1b3bQfKqURLyN47zX
	9SVyp2b4Njoo2QztQyTSjD3Maa8xD71Hk7w9MwNHUeRfwQUaNYOGAgbIPGf49UWNVwi1BFht7gP
	ZbbKqXENC2FhKh0pAFGb5oun68T1kVocipWrlxg/UDMjH3jGBA3hEEjq2ED93d6l0BgsCz6QU9t
	OxzlANwFIYFisN7QF3imlvvPVyHypS2slhokMOJlOT4=
X-Google-Smtp-Source: AGHT+IGUQ8FTPSjpwNISIt2zMlgiXR9ud8b+yvvPA0rDIiHV+35gbWY0okgpHhZRPK22Y+uSP9HTKg==
X-Received: by 2002:a17:903:3d10:b0:22e:23c1:d711 with SMTP id d9443c01a7336-231d4e5087cmr301036545ad.16.1747839579089;
        Wed, 21 May 2025 07:59:39 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89d4:3586:e576:3ce4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm94189645ad.53.2025.05.21.07.59.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:59:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/7] systemd: Password agents shouldn't be optional
Date: Wed, 21 May 2025 07:59:19 -0700
Message-ID: <180455ee76a3819933f45ddd6ce9a5610b3ba947.1747839445.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747839445.git.steve@sakoman.com>
References: <cover.1747839445.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 14:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217042

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

If extra-utils package is not included in the image, you'll always
see a warning that password agent is missing whenever you start/stop a
service:

Failed to execute /usr/bin/systemd-tty-ask-password-agent: No such file or directory

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_255.18.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_255.18.bb b/meta/recipes-core/systemd/systemd_255.18.bb
index f85ad61080..bb9dc3da33 100644
--- a/meta/recipes-core/systemd/systemd_255.18.bb
+++ b/meta/recipes-core/systemd/systemd_255.18.bb
@@ -592,26 +592,16 @@ FILES:${PN}-extra-utils = "\
                         ${bindir}/systemd-cgls \
                         ${bindir}/systemd-cgtop \
                         ${bindir}/systemd-stdio-bridge \
-                        ${base_bindir}/systemd-ask-password \
-                        ${base_bindir}/systemd-tty-ask-password-agent \
                         ${base_sbindir}/mount.ddi \
                         ${systemd_system_unitdir}/initrd.target.wants/systemd-pcrphase-initrd.path \
-                        ${systemd_system_unitdir}/systemd-ask-password-console.path \
-                        ${systemd_system_unitdir}/systemd-ask-password-console.service \
-                        ${systemd_system_unitdir}/systemd-ask-password-wall.path \
-                        ${systemd_system_unitdir}/systemd-ask-password-wall.service \
-                        ${systemd_system_unitdir}/sysinit.target.wants/systemd-ask-password-console.path \
-                        ${systemd_system_unitdir}/sysinit.target.wants/systemd-ask-password-wall.path \
                         ${systemd_system_unitdir}/sysinit.target.wants/systemd-pcrphase.path \
                         ${systemd_system_unitdir}/sysinit.target.wants/systemd-pcrphase-sysinit.path \
-                        ${systemd_system_unitdir}/multi-user.target.wants/systemd-ask-password-wall.path \
                         ${rootlibexecdir}/systemd/systemd-resolve-host \
                         ${rootlibexecdir}/systemd/systemd-ac-power \
                         ${rootlibexecdir}/systemd/systemd-activate \
                         ${rootlibexecdir}/systemd/systemd-measure \
                         ${rootlibexecdir}/systemd/systemd-pcrphase \
                         ${rootlibexecdir}/systemd/systemd-socket-proxyd \
-                        ${rootlibexecdir}/systemd/systemd-reply-password \
                         ${rootlibexecdir}/systemd/systemd-sleep \
                         ${rootlibexecdir}/systemd/system-sleep \
                         ${systemd_system_unitdir}/systemd-hibernate.service \
-- 
2.43.0


