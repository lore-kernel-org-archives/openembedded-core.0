Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EE7C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 13:33:00 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.7120.1665495175294681461
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 06:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kf7LcHdA;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id g27so20119488edf.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 06:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sW29xfLFg/4vghfRXGZLMMkDJITI65v6X3rDVwqlnM0=;
        b=kf7LcHdATgAXhDlgfpl1k5/4XBEP8Urw4i1MIJwXiKbEn5EOb0We0kwGJbMYaJJ+nu
         V6S/LkfPIgOhYdthf2vH0XhvUWnDFQ/VF/SnC8ksmbhryCylnavL6XNgwktUSEcHq/Nz
         DWEKURoHaA8pbGFtpBQZo8GefMP2EI7mf2QKyHiZERZhsvtM+3wQhCQq0GZLOwHdwhVr
         cz5FDrFXuteHQkPjI4c/mPytr/YpXAlm2k6nHf+ErQIMc8AUMZysELiclSRDuSN0IjIy
         Aq2U/tv0lDjwYzMXsMsF/M7otDndbbeSMV+6gpSkWXlNyQ5DQvWehiq8sorPyWMrDFat
         XpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sW29xfLFg/4vghfRXGZLMMkDJITI65v6X3rDVwqlnM0=;
        b=mVOsctO+/Svu+PUdi+rQ75LI5vErvr+Eere2EdYim0QqVSFymPusF1I5GjXyQz0JOf
         fdFK/DGZBMMHoUK1wkn9DG1ijvXiU9Ydlpf0LEcK3DO+4XDqt4FD/NzI/Bf3/RgGMDaJ
         owCWql+E8M1fGFNs3/rpoTLc6oi8XwuHi16m9Rft+kQ5vwl1dUcsZ9/GNJNYTGdFoIfU
         OKh6PCckKCs150rJIkrLH1WibW9J6Z+8ODNV7Yj+W1RMGY9fDCgehJe8vhm5R22okBN8
         KlhmNedCKjxgiNBQimue7m5P5pFoUvVp0yU8Nglgo95SLaPpEG06MRxmwMg0ksmBGQCX
         QTvg==
X-Gm-Message-State: ACrzQf2EK7uCXbJp+KePd3nnr3lUZ471gmjI5GJ29Non9jqLM9mn47Lg
	+nq9rLkwUKQknpU5nmJ2MeGjLCc/Q0I=
X-Google-Smtp-Source: 
 AMsMyM6/VNhtn8IMEaP6RHyqiqa66jdRyJ/1Y2ELF+CFeMm3G0wWQTun1QXlmyhk+6g5MkIU2ZTpQg==
X-Received: by 2002:a05:6402:3221:b0:459:61c3:eea0 with SMTP id
 g33-20020a056402322100b0045961c3eea0mr23148466eda.225.1665495173290;
        Tue, 11 Oct 2022 06:32:53 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 e12-20020a056402190c00b0045c329a5f81sm3432643edz.48.2022.10.11.06.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 06:32:52 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH v2 2/3] u-boot: Remove duplicate inherit of cml1
Date: Tue, 11 Oct 2022 14:32:45 +0100
Message-Id: <20221011133246.25707-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221011133246.25707-1-alex.kiernan@gmail.com>
References: <20221011133246.25707-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 13:33:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171624

Splitting u-boot-configure.inc out of the base left duplicate
cml1.bbclass in the base include.

Fixes: fc9a17ad386c ("u-boot: Split do_configure logic into separate file")
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index f022aed732ce..b2f33e382664 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -5,7 +5,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr', 'u-boot-mkimage-native', '', d)}"
 
-inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1 python3native kernel-arch
+inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kernel-arch
 
 DEPENDS += "swig-native"
 
-- 
2.35.1


