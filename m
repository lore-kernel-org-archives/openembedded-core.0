Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B53AC4450D
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:38 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.941.1783881810747188326
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=b0BEtFPW;
 spf=pass (domain: underview.tech, ip: 74.125.224.45, mailfrom: vince@underview.tech)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-664d22d7337so4708888d50.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881810; x=1784486610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJgH6M0et/poWJAv7MNUQOJjkPgQBFQG7yvDbEBkxt4=;
        b=b0BEtFPW4uFgW4qC6+8QFnTYocrYQa5M3c97qxpvUEoM7dDa2gygVe1zfVvzh+xWi0
         6SvZ3fuu7MKiAp3HDyb+IbB4NJHAsEFodz9SFm7kN7lAcpJ2aIz3uyBvmKgs2eZO4bvy
         wtGL49pX0oXmj4+FnsLGWqNCaYGt1mC+Y8cI1QwyYDj5mQMuKu5/trThv3dnYw8ms3AW
         LlFfM7MGrCnJdkY77Fl+YxI6j+R9cq+Y6KUXLLo38aEqqEVOaUjRJorZyjQaHWNr8igL
         /RSkvDIP0fdjE3hdFSJ3R1DI3K+ohsGHE/zDYVSheknNc8I2toQXvYfqBWexk6BvaBnt
         5aZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881810; x=1784486610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJgH6M0et/poWJAv7MNUQOJjkPgQBFQG7yvDbEBkxt4=;
        b=ntGC+LbNtFiICbVGTnT6CDwNZlSdlZcgtZVphoUPEya/kkUVWL0JYwIx8zfx0gMODO
         RQmJFWKAIcF4Ogk1rtSDJuwlEpjIcPl2LS5TEtOLZIT21Q1S2EHzdVMavcW+Npdotzhv
         P9tJ1viGJpmEBv6FFJziIG3zm2V22aAliIvo34WBSpSjpqB3JoSkArPSBahB/NRKVicb
         LmP1mz7TtbXQs+hZrUCs0YPL5ZjRBYj05vflqghfPznTn9FHmkUxQZugkHG5ZPQR8U3E
         +qYwbTEQFUNxyVPUYf6uszZebYpUvg4ROM5cC7Mmw7YnnhNUxvU9C+QsFzT6fjLraix+
         0Edw==
X-Gm-Message-State: AOJu0Yxb1uXd6NIZMvShGQrBz637PJPs0Mg7Kv8Euyjmx3xbLjYuLg9g
	6eRIJAZRSvA+rowZ62iwTOpfAvXeR0GBnKu0maO8YJQ8cMpAFk0HxYaLz4UgZetkhyQoKMKde4n
	PjH+Bx6g=
X-Gm-Gg: AfdE7cl7wJvHlDaSDQgzOtKDM7rrMnM3gx0May5JPcXp6oOAx7zjPIGgvi159wVNnwE
	UIueMq/BVcWdGzLyDCT6ywTg4t4DOZ5Fuopn+qBM00pw+c/eNUzkWeJ0Bj/YuJvu/4730c9dsrF
	eVgkPpKpy5qiKa6OB5CJlRQ8PJgdDUGx7Q6619ACCU0xTIEUmDfnNCvRXUXnwkwdbAcUZtHAwUK
	WygaStoHq/r9TnONMTsz+w+ugUL6ukfca1IMhYHTLb19OzZizkJm3GW0n4kDQVM12TWaF7gfd13
	8+EpoebHrqHn930MqOGc27wrxditDukhtbOdNrDUphtva4B9zQ73uy6E+VwNlwHbSt9pox/bZT/
	NcSrdJlVMv9HeK6vffKK0UoViERhz5W1YzbpbUqPpiMuQYoAmb1lqjodHBoFFNJvZaL+LE3Y8EC
	SaNFPolGxi+VS/zA==
X-Received: by 2002:a05:690e:450f:10b0:667:6323:5d44 with SMTP id 956f58d0204a3-667d98ed354mr3069763d50.32.1783881809823;
        Sun, 12 Jul 2026 11:43:29 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:29 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 14/27] systemd: rename kernel prefix
Date: Sun, 12 Jul 2026 14:42:54 -0400
Message-ID: <20260712184307.3259642-14-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240804

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


