Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3EEC44508
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:41 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14788.1783866578524674878
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=P25Ba5bi;
 spf=pass (domain: underview.tech, ip: 74.125.224.47, mailfrom: vince@underview.tech)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-664a09bc459so3867924d50.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866577; x=1784471377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJgH6M0et/poWJAv7MNUQOJjkPgQBFQG7yvDbEBkxt4=;
        b=P25Ba5biGOUy0Nhe1cZxowjXONRsMZykDdAmFqhUUvrNU6QPNUJ9YOTFMQ3/dyxLFa
         CApub1S0K39FtUnXjnWRklhYxsGD+mJ9WLKAp4gB+PUO5CeaK7tF3W4vySaixWtwUhWR
         rQicnwRwlk+jNCyJXj/wksKOkaFboVStcgapBKh2fvy0NPCCR9WuqN9teNgNrZueveUD
         uY3CNn0FqbHALsEgcNnwZu+MeX79CuzSwYnUXZnqtkKyK7rA+t6ursbkMvCar6jKyM7U
         7OvNcvMe4sogtOp5TBgGqduo34HilY8JIeNy6E6hGSdRZos88XIj9j65Dnz70nrpY/vv
         b0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866577; x=1784471377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJgH6M0et/poWJAv7MNUQOJjkPgQBFQG7yvDbEBkxt4=;
        b=Z21fiyDvorqwmJWo20rESSztOetsWncr4gWzuaBJ+ZXNnYrYgDgLwGspY4JpakUtDO
         VqNJeGVGu7yx0U8/41zwLhZPVpsmHONsfDrJOof3bSAFwUzuhS5GRMj38Xu07fCgigrU
         gdn5zyJDxDCdTCgVyzKmjsY+TozYSY/DwvBhj9XhWSmgHrNvpEuhY+/a/I5iPZC25vto
         3fOT7/7mmEuZDzLJGe0x9lfT7RG9vM9do7qV8d0squu7sBpNAY29xr1h1MWoO4HwKasH
         4JlInzPx3VzP+aKe1FT7T2jss6qFJVNaSSKKnveTtCKkqpuNrRb2HSMxO0gr24k0+7p1
         ojoQ==
X-Gm-Message-State: AOJu0YzC9JOdqKGvhVzsEYQLjC77Nf5e3xt7SlwUI1T4XCB7fDWjwJLP
	yqeXvG83Qa6E3zIqKOCe0tLR7Y/22/lvyeC07+vcS3RxKiEOE8MknFo7Zb5loob9qcoLlQfbdGz
	Y/rSg4Bw=
X-Gm-Gg: AfdE7cl7cCY2bvxdSAMDAjgCqGwlu1LviqAKkZcQodzrViP0Dk6NW3iBbsLtrEZPoXl
	QglavOquNhxpuLRVNx2xBe0cYOT0Uy9RYXsDTDjyxcMhi1ILCQ2gmp7P3SrpD4/BUDW6geT8Itl
	sZ+CXEzvaeLAzGhu+szNWlqJ2SCHaZnfcnU3G0KL5AhfNoI/TNlb30WhhnghQ9xaEATA48M3ry2
	rrE+h5OOHui2wGiEGTtZa3mgGCU6f7aEn0fDJ9tHhPjy3Fa4x87dmps8kHZzz0LPfDILvEKjBrb
	J3N3DO5vxrUX9vKDyphvSglvUZCvuGoB2uyjwpUWS5dCCmpxWMnc974UakW3AIWxejbKoXxEoml
	oGvC4ycNtDUCqeKptVF9U88FzJO1jRZLR8SfoRzbsN4kbwwYp49Ul4qN12lUcjyxNZMaeCsDeHE
	UWpVhgtt33Li+JTQ==
X-Received: by 2002:a05:690c:688e:b0:809:ae5:1d2f with SMTP id 00721157ae682-81e90017f6emr42794427b3.9.1783866577215;
        Sun, 12 Jul 2026 07:29:37 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:36 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 14/24] systemd: rename kernel prefix
Date: Sun, 12 Jul 2026 10:29:06 -0400
Message-ID: <20260712142916.2573370-14-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240780

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-core/systemd/systemd_259.5.bb | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core/systemd/systemd_259.5.bb
index f3ec0edae7..9f082a07d1 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -483,7 +483,7 @@ FILES:${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
                       ${nonarch_libdir}/systemd/systemd-binfmt \
                       ${systemd_system_unitdir}/proc-sys-fs-binfmt_misc.* \
                       ${systemd_system_unitdir}/systemd-binfmt.service"
-RRECOMMENDS:${PN}-binfmt = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', 'kernel-module-binfmt-misc', '', d)}"
+RRECOMMENDS:${PN}-binfmt = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${KERNEL_PACKAGE_NAME}-module-binfmt-misc', '', d)}"
 
 RDEPENDS:${PN}-vconsole-setup = "${@bb.utils.contains('PACKAGECONFIG', 'vconsole', 'kbd kbd-consolefonts kbd-keymaps', '', d)}"
 
@@ -561,9 +561,9 @@ RRECOMMENDS:${PN}-container += "\
                          ${PN}-journal-gatewayd \
                          ${PN}-journal-remote \
                          ${PN}-journal-upload \
-                         kernel-module-dm-mod \
-                         kernel-module-loop \
-                         kernel-module-tun \
+                         ${KERNEL_PACKAGE_NAME}-module-dm-mod \
+                         ${KERNEL_PACKAGE_NAME}-module-loop \
+                         ${KERNEL_PACKAGE_NAME}-module-tun \
                          tar \
                         "
 
@@ -744,7 +744,10 @@ RDEPENDS:${PN} += "volatile-binds"
 RRECOMMENDS:${PN} += "${PN}-extra-utils \
                       udev-hwdb \
                       e2fsprogs-e2fsck \
-                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 kernel-module-sch-fq-codel \
+                      ${KERNEL_PACKAGE_NAME}-module-autofs4 \
+                      ${KERNEL_PACKAGE_NAME}-module-unix \
+                      ${KERNEL_PACKAGE_NAME}-module-ipv6 \
+                      ${KERNEL_PACKAGE_NAME}-module-sch-fq-codel \
                       os-release \
                       systemd-conf \
                       ${@bb.utils.contains('PACKAGECONFIG', 'logind', 'pam-plugin-umask', '', d)} \
-- 
2.43.0


