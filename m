Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A61C41513
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 20:05:08 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.6746.1691179506135557845
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 13:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: otavio.salvador@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6bc9c01e154so2272540a34.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 13:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691179504; x=1691784304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DEPBG0MkKpF4rLwtSXXjHOULL7mJ05VkwDafli0jGIc=;
        b=Q26vgAyWF96PEpU7xisOIvU/JHmjmB5QwX8ADMfH/7rTGDtdRhK38hbfngtZHBD39J
         bKnlsDBNDJxQ5QZXhpm/k7CSLJm/Iq2Qb60woF78tpK5FK6fbh81FCUQ3i03L8XVdjdC
         jEZArKgB/U2g5UCBeTPKVWQ7wUuyuj3I5+e8B2gFH1labWrGpr+11m+S5Zq21Ag4Zecs
         gdUL2MEyrBKBaysW+GCxSWtStrXyVCK5meaA1cV5R+3aMTXksMqqKJlrX83HaUKbv2ek
         qIVZ/uIlFE1tFJW6v/CJApa+wnKcXVJ0klsqbGf9hMSv6xh7hsDyL1SI9qY9YCPk75mb
         Z0bQ==
X-Gm-Message-State: AOJu0YxvfyTo5Dd3xcBVIoFAB+nG6sFoWiGEiZyT6loAm8P1tBQTo149
	NFUvFz/z1o6P/l1V1RUsngKyZ2zOVFAqdA==
X-Google-Smtp-Source: AGHT+IFhKtBp+QLRMyXtvnFCT5hVdjD5XSBI8s77rpIf0AHdHrgE8E8DJwZHCIeFw6eOP72FzTCtAw==
X-Received: by 2002:a05:6830:2083:b0:6bc:d5a5:c2f with SMTP id y3-20020a056830208300b006bcd5a50c2fmr640344otq.9.1691179504551;
        Fri, 04 Aug 2023 13:05:04 -0700 (PDT)
Received: from localhost ([2804:d51:5904:c000:7713:9c86:e19c:d8a6])
        by smtp.gmail.com with ESMTPSA id a20-20020a056830009400b006b8c6eb962esm1552589oto.52.2023.08.04.13.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 13:05:03 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH 3/3] weston-init: mimic systemd behavior when running in sysvinit
Date: Fri,  4 Aug 2023 17:04:11 -0300
Message-ID: <20230804200438.1651568-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804200438.1651568-1-otavio@ossystems.com.br>
References: <20230804200438.1651568-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 20:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185541

The systemd uses /run/wayland-0 as global socket and it is important to
align the behavior so it avoids diverging when using sysvinit. Another
change is installing the ${sysconfdir}/profile.d/weston-socket.sh script
also aligning the behaviors.

The commit modifies the behavior of the weston-init script when running
in sysvinit. It mimics the behavior of systemd by exporting the
WAYLAND_DISPLAY variable and using it as the socket for the weston
command.

The changes include:

- The installation of the weston-socket.sh script in the /etc/profile.d
directory, which sets the WAYLAND_DISPLAY variable to /run/wayland-0 if
it is not already set.

- Modifying the weston-start script to check if the WAYLAND_DISPLAY
variable is set. If not, it sets it to /run/wayland-0.

These changes ensure that the weston command uses the same socket
defined in the WAYLAND_DISPLAY variable, allowing compatibility with
systems using sysvinit and systemd.

Fixes: 2818cbc730 ("weston-init: add profile to point users to global socket")
Tested-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/wayland/weston-init.bb           | 4 +++-
 meta/recipes-graphics/wayland/weston-init/weston-start | 6 +++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 024e400665..6c8dc36467 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -40,13 +40,15 @@ do_install() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
 		install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
-		install -D -p -m0644 ${WORKDIR}/weston-socket.sh ${D}${sysconfdir}/profile.d/weston-socket.sh
 		sed -i -e s:/etc:${sysconfdir}:g \
 			-e s:/usr/bin:${bindir}:g \
 			-e s:/var:${localstatedir}:g \
 			${D}${systemd_system_unitdir}/weston.service
 	fi
 
+	# Export the WAYLAND_DISPLAY in case it is using the global socket
+	install -D -p -m0644 ${WORKDIR}/weston-socket.sh ${D}${sysconfdir}/profile.d/weston-socket.sh
+
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
 		install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
 	fi
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index 01670cd4f5..7b898bb436 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -68,4 +68,8 @@ if test -z "$XDG_RUNTIME_DIR"; then
 	fi
 fi
 
-su -c "XDG_RUNTIME_DIR=/run/user/`id -u ${WESTON_USER}` weston $weston_args --log=/tmp/weston.log" $WESTON_USER
+if [ -z "$WAYLAND_DISPLAY" ]; then
+	WAYLAND_DISPLAY=/run/wayland-0
+fi
+
+su -c "XDG_RUNTIME_DIR=/run/user/`id -u ${WESTON_USER}` weston $weston_args --socket=$WAYLAND_DISPLAY --log=/tmp/weston.log" $WESTON_USER
-- 
2.41.0


