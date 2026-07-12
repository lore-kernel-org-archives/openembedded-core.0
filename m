Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFBFC44509
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:48 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9340.1783835502659071467
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=KOXwYdkw;
 spf=pass (domain: underview.tech, ip: 74.125.224.41, mailfrom: vince@underview.tech)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-667bae10ba3so1791209d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835502; x=1784440302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJgH6M0et/poWJAv7MNUQOJjkPgQBFQG7yvDbEBkxt4=;
        b=KOXwYdkwr47eembb0dT/TjXukOnzR2chQ5Fdx1UzmvCeoneeOqL7Xm66fEUlw7xrnm
         1SiBjVkiUTD5KIFbRQO3VaDZpSSL4vK6iP0IlZAL1vxd/HIt7k76Ixi29X5xaG3oP8iz
         hAFa2tt76P3PwubGX0fIOZMaZTLWmNRtNULzocXFQrFM95/yARrbfD4A+hhaSMiQQdJ0
         ZBqKNNFoVb+bgRvVzLYH2EB5UM4W8p205zXTGzcD7Gzxzldgiw4R5ZwYYA079YqxiFfS
         5rkGRHkETiO2YvrSD2GZNcTgwikLFxiwmmg218TWHZ8KC6WGDcbqbp3D0671wvecr8rL
         zSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835502; x=1784440302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJgH6M0et/poWJAv7MNUQOJjkPgQBFQG7yvDbEBkxt4=;
        b=ZGnPB0T+rd2f4ZjfKw3fMev8XfwDksJV+PXPrZ5qQr0TEcbsV/qDs9M9hJblT4bT74
         K+KmtMvjgFIorxILwbWlGg0DqymVa+VfTia9VnxllVODDg3VlZ0zveHcZeWhJxkuavZO
         Gbo+19/na2BO8YOjvNeVJLA0RHyOyZLPShv0OK0Gc2Xtofo0uKmxDerJ5yBKKq+x1QMV
         nznkpa5fQG8hBzGvd3ZFeMafcuCxfN6FcC6na5rP1BIXfXZiTK9V5oIPmu1kWZ2Qr9W6
         xkNGdWFMsm0ao28OGNiJ9yl6yFS3KEvXtmgEEIZGrDbVtZrvAF8JkrIy8aAjQJQiiW8B
         3++Q==
X-Gm-Message-State: AOJu0YxRuN1E6k79/BqMMvXLt+97xZOL+cmQq/q26Qj/shQx4DpIXf6Q
	ck4Z+PvxWPP6wlULnapiSNQi5SYTvUKPk75fOLLPNwOajL/XgUZ/cktuct50aDZjoktoA6uM2Cn
	klGYqyRo=
X-Gm-Gg: AfdE7cmJC+d5qQMsxelUZTZMbYpydLJkK9ThdqfvHBJ4Mbg91WYg2Ewwga0jHqducHl
	YyIEE9O1pXxd+apFTzTSISgK1CSCTlsKK6e68RcIelfWzxRh4YWfMyuwpKSuNfsfhLT6A+xRjuB
	uS82Ehd78Ben0ieQUBLwMoNO9ZxQJiwvoAWEITn+lxAMx090Ye+a7/FgidzUnwoSzaMjxq6M1ac
	pvSb+M4hoXIaFSno5rH4K4F7gzXtkxOAfbxO7Pnyv6e9i+OwbiZxfo8qXi0vqameMC3VK5VMBr4
	tRziuo0Sj3JkAM6ICzX+D+tJpn9MhNLQXYpNVf3F5GV4Y4IZwVHvTuDBcFZptavSDKFlhXCbEHU
	xau0/BiMhxicl9VZCaybTRm3XC/sp2aYm6Io1y3CfTazdfTQCsEoZrroRpA27kkVGeectWLsoLN
	1iEN8KcHaXiAkOZw==
X-Received: by 2002:a05:690e:4891:20b0:664:71f:c5aa with SMTP id 956f58d0204a3-667d7abd690mr2534206d50.23.1783835501654;
        Sat, 11 Jul 2026 22:51:41 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:41 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 14/26] systemd: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:42 -0400
Message-ID: <20260712054954.4063745-14-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240739

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


