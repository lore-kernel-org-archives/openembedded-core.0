Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77963C43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:24:53 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1284.1783747483865141832
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=F7fLRDJk;
 spf=pass (domain: underview.tech, ip: 74.125.224.53, mailfrom: vince@underview.tech)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6675db463b9so1437364d50.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747483; x=1784352283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tKXQIxWCi+1qUWaQnd8ywTdn0QIlFJGyu+sQBQ/NZc=;
        b=F7fLRDJkFtOuBexfyawmqGPzhLkz0rEZgqKka0YOzwL2Y4OkikUZ78MvQoSqo96mLD
         eClv5CJdzIWVi/u49/hFzPqyaKySO+5XdxuQpt4mQV3e2tyGseLDY+mqLhOOrk9mMnss
         6ibOxa4D6lkD0fEzqF8n++wWTI/V4OeyPvlf7UVDgRyCPuyGIYmTKGjVvk/Y4bb9txiz
         oNYdJFsN+p+/M3LRWJFO3xBr8pVIM9T7Dijb/KoXAytrIh0TjwF7rULI+j4OFAIPEa27
         J++C4MdQ5fDIqYPdPdlQsp7AC9VN5hldVR75Vg/XRJUxL/ipJSXcWDY0XdhF7d4slBbY
         Awmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747483; x=1784352283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+tKXQIxWCi+1qUWaQnd8ywTdn0QIlFJGyu+sQBQ/NZc=;
        b=Ymmh+EGDmlMkgyZyoo1TiZLGwQ1X7QQLcwaMuhoAK6odLV617XRR9oqOK5r9QgaRZ/
         +n7zNSmeTsCG92zWVwQzfuOyaEo+2tbu8zmaVH1vrCWycxNPp54a4bIL0air+tDZndrQ
         kLY6ys7Pem+KUp3iJKOmN0jWFMwPJ2OsZtNW5cWB0SU1BlR6HFsilNG7ylY9eF+832HQ
         4j6OehGCNht5Kho/QON2KzBi611Md5hSLNjyGAMSxM6Je0H5VkKVqjr+zcenlY1MZX+A
         OINKVK1bGHkQR5WjDYhDhT9isyvq/Y9yLScDie4v6Bs8Fh2MZLHBlc3qa2BIGIHjHeye
         SAZg==
X-Gm-Message-State: AOJu0YzRk92LgWdgYpIBNkfu8PVmTo2taPXz7UdFLm0HDGzKIheVaTMi
	0vhIS3ury62wwoKdNhiOddSb7GvuzDuk/R4U0bVhAjmuDMchrDmOSYDRqVHkr33ZR1kGD9dn1zb
	4ngV4LiY=
X-Gm-Gg: AfdE7ckw5BsVWO23fXFS10CGA3HhP0shBOk+GalIWbu6vaRvJTj/RbWHSQ3QsC81G3i
	oOQpuv0AJZHJMGoGpMzSwPduOqGLXmIk055BFSXETWwZtqEITXiH7l53Iy8f3UCw6zmqbxKihD5
	S6G0laa6/QNSGPEciLYhSFdoCBDY0VR7ErHfXXcZXVzICLgvaEoH4lxYJjyrkrSfy0sjo5QSFhM
	NjdR+aWW0FCfPDt12gzNSplrGtknLC8EbwjQlrOeRmgQZL4DtnWHCFbJOY2di+pkcHeaF1Q1YGj
	certLhFm68t8kvnxnR6uCg+9WfTIpSCLpVp3CsXy3L61S6IZfHSjel7Px8SJzmy74Ntttwvi1ce
	iRVSP1SS7caWG+7NS5EZfEc7Cr64KDMLN42D4oltdGuQy5NvhdkTWsajRqbZCfQ5dJOUAHtL/gm
	P37hmZ4SieHEeNGg==
X-Received: by 2002:a53:c3c3:0:b0:667:8b91:243e with SMTP id 956f58d0204a3-667d7cd9ce2mr992458d50.109.1783747482811;
        Fri, 10 Jul 2026 22:24:42 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:42 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 11/19] systemd: rename kernel prefix
Date: Sat, 11 Jul 2026 01:23:55 -0400
Message-ID: <20260711052403.1292286-11-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240692

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uninformative with builds if
KERNEL_PACKAGE_NAME variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-core/systemd/systemd_259.5.bb | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core/systemd/systemd_259.5.bb
index f3ec0edae7..7f359dc4da 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -8,7 +8,7 @@ DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
 
 SECTION = "base/shell"
 
-inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives systemd gettext bash-completion manpages features_check mime
+inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives systemd gettext bash-completion manpages features_check mime kernel-vars
 
 # unmerged-usr support is deprecated upstream, taints the system and will be
 # removed in the near future. Fail the build if it is not enabled.
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


