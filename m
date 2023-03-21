Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CF5C74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 14:20:47 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.14395.1679408444388753287
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 07:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gEkkALHF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id l14so9061812pfc.11
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679408443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkyLkyMkLA59nT0rEscBj5daQZtrlpZEmTPcdmNSgRc=;
        b=gEkkALHF5Avi8+uPFCcwQLiMAfmLcY4VM8fpJ+3JSDUVOv1PgorB2bGnw8AD29Du39
         ooWZO00ufwb42SeG4Eyt30zqhbdKq6jZjryDzYPKBtQXKybpOGcbXLMTO9T6KaamVc0g
         ID94YB/iAEGVXVpnHQGRxT5QyKw6sEEXTY/L9fhakfxNxMpiTOR/JErj07k3GSBxm5Xh
         1g7Ef/5JEo9GuA+Z5uibgulCv5CVeSCJU15siDbNEShfX5++MUmRb3jPUU88QPMDcWYv
         odV8y0hdoMTXa7VN3dsBnPpW9sefLPaa582RbFiO+diDgXv04PUyaOREwsvHH/4dkIaH
         2kbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkyLkyMkLA59nT0rEscBj5daQZtrlpZEmTPcdmNSgRc=;
        b=VjRJK1QgathMDZVv5aEUxlRfXcHQkc9mVkIJ6PB+VF6Bz7jg9qUQhTGNYcYxemNx9J
         JCvy/zBf1eIY/eKnG++LvKSvlxZFR/SNyRYifBU65LjmV9CsPfUYg0d41GyZIKdAEm8R
         EpfRTMMRPqng9i65OxxM5HZcNHVcyKEespPiihdhbXMsmFnXbgdgy9QzTLyzvq8Y+HcE
         bMNvVR0NaX2mgQazE1NvOMATSOEnydggsZVEAqVIPBmADux0rnzT4cB/MHie1LW8xYq/
         +TLUbwaG8m5zkTYOZt25RlfNKBCXQAVjb3w7oF3YlZ5Opvd9FU1RlQfUvlK39OpZ2ayh
         Yu0w==
X-Gm-Message-State: AO0yUKVZ9NcDur9Xcp4B7B/D9ccDe39AdhGntNrQruRLWp/oR2Rx0/rZ
	ymk80LlqmmVtNDNZUecDmSbH/enO65bqVtI02u8=
X-Google-Smtp-Source: AK7set91FBpB0yKlM2KDq+penE/2/B0Ku1ABBjgLC1fcJENIGm071DrS9WXqlZrenryM2Cw67bdkTQ==
X-Received: by 2002:a62:1cd2:0:b0:626:e177:fc64 with SMTP id c201-20020a621cd2000000b00626e177fc64mr2119229pfc.19.1679408443474;
        Tue, 21 Mar 2023 07:20:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b005892ea4f092sm8551291pfi.95.2023.03.21.07.20.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:20:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/14] systemd: Fix systemd when used with busybox less
Date: Tue, 21 Mar 2023 04:20:12 -1000
Message-Id: <06271fd8d26bc34448524157077c23eb1ea29c52.1679408291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679408291.git.steve@sakoman.com>
References: <cover.1679408291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 14:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178878

From: Alban Bedel <alban.bedel@aerq.com>

Per default systemd use a pager for the output of most of its tools
and it expect this pager to be color capable. But that is not the case
when the busybox `less` is used, which lead to output garbled by color
escape sequences.

To fix this issue add a profile frament that disable the systemd pager
when busybox `less` is detected.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit de7e36a7858ebca4615975967fcad1c399eacdb0)
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd/systemd-pager.sh | 7 +++++++
 meta/recipes-core/systemd/systemd_244.5.bb         | 5 +++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pager.sh

diff --git a/meta/recipes-core/systemd/systemd/systemd-pager.sh b/meta/recipes-core/systemd/systemd/systemd-pager.sh
new file mode 100644
index 0000000000..86e3e0ab78
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd-pager.sh
@@ -0,0 +1,7 @@
+# Systemd expect a color capable pager, however the less provided
+# by busybox is not. This make many interaction with systemd pretty
+# annoying. As a workaround we disable the systemd pager if less
+# is not the GNU version.
+if ! less -V > /dev/null 2>&1 ; then
+	export SYSTEMD_PAGER=
+fi
diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index 2bca1fbc82..98a580e2ea 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -18,6 +18,7 @@ SRC_URI += "file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
            file://99-default.preset \
+           file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://CVE-2021-33910.patch \
@@ -317,6 +318,9 @@ do_install() {
 	# install default policy for presets
 	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
 	install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_unitdir}/system-preset/99-default.preset
+
+	# add a profile fragment to disable systemd pager with busybox less
+	install -Dm 0644 ${WORKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.d/systemd-pager.sh
 }
 
 python populate_packages_prepend (){
@@ -539,6 +543,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/dbus-1/ \
                 ${sysconfdir}/modules-load.d/ \
                 ${sysconfdir}/pam.d/ \
+                ${sysconfdir}/profile.d/ \
                 ${sysconfdir}/sysctl.d/ \
                 ${sysconfdir}/systemd/ \
                 ${sysconfdir}/tmpfiles.d/ \
-- 
2.34.1


