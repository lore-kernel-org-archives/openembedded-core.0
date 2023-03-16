Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52545C6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 12:51:27 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.11255.1678971079945442631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 05:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l2HtUwME;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: jhatnedap@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id fd5so7175110edb.7
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 05:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678971078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GIAHX10awp2yo9WW2zU4ertJgWYgJ8B/nKZuP4xSMAI=;
        b=l2HtUwMEzOBtHeqxPwgX28h/0nyyB9nXKokjfTGK9dmNVlJ2ndsfNpOq+LKtk9fhIr
         a+TeChPLGfPeb8TyGPiomdO/6pfwTBYRGhcRU1hVgZmADvqIGcYcryW+aSQaqlNxOs7B
         pUs6FPhv9tfpSTVgNDhYW8nZn6d7b8RaMvYBarhkYyipEhow9XziEErgv9xmIL+g3fzB
         3ooEhLKMjYZMVKbMkjRFfYpPwjK8CylJbVA6uXln04wPO6EGEZzc2NYhN2HLErxmfP3H
         cpssV1axdLWHwGzzPW1YljKzocCNtHkKstYXyF081XVXqqbwT/iVGhI24O9DWQ2PYVrY
         YMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678971078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GIAHX10awp2yo9WW2zU4ertJgWYgJ8B/nKZuP4xSMAI=;
        b=QTRm973eOqIhHaS7vCwi6/QMQzBGBNDQ4YfiaeiWdWK6vet8zODHBeh3w+HqYar+Vg
         t0oBHmCa6mdAKeIeF1a03GNeS98fyOpfUwxe+YKjmjscONY/91qJLT9GW3FO5TWzLzyE
         uC+GO3/nyblu4zNwT9Ub3xmsKPeeM+AZFlYXqWpqRMmcnLyw4JaiLIyoSCaf8dq3NIrZ
         2/ofot9eXm/x7rcFW4iQkYyNBq7H77Vm3e3Nobek2w5gH2grw+ZGxt8ccRpf4f52/pep
         SwtVrysOqtK0QSa1+Hsui+tcc7YIFmtGVmZKbsV6eJ5hLutsasCJqVWeAApyGFe36MG/
         AEUg==
X-Gm-Message-State: AO0yUKVueODJTrFADi6C8DpxNl/jbAwMtyrF8DzVQi7o/iXIc2zrKePx
	3AhDaXzqAc9cEuakUZD67rX4qU1hrt0=
X-Google-Smtp-Source: AK7set/I40c4ZoTc7xmWhsW6OssHZi5eKEjf91L9FBFQOB6CiJ/rLheJTjgLP/cQoMY054tY/U0dLA==
X-Received: by 2002:a17:906:5ac7:b0:931:1567:f84f with SMTP id x7-20020a1709065ac700b009311567f84fmr636029ejs.4.1678971077966;
        Thu, 16 Mar 2023 05:51:17 -0700 (PDT)
Received: from NVC4181.nedap.local (smtp3.nedap.com. [87.249.123.12])
        by smtp.gmail.com with ESMTPSA id m13-20020a1709060d8d00b00930d22474dbsm450177eji.97.2023.03.16.05.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 05:51:17 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Alban Bedel <alban.bedel@aerq.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jermain Horsman <jermain.horsman@nedap.com>
Subject: [dunfell][PATCH] systemd: Fix systemd when used with busybox less
Date: Thu, 16 Mar 2023 13:51:11 +0100
Message-Id: <20230316125111.1473-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.39.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 12:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178705

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
2.39.2.windows.1


