Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A523C001E0
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 09:28:49 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.3539.1690450123669687064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 02:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=oQLVjZbJ;
 spf=pass (domain: baylibre.com, ip: 209.85.221.46, mailfrom: lrannou@baylibre.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-317798b359aso734560f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 02:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690450122; x=1691054922;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Cioe5GLYWrMXzZz7iv5mVFtPUhg4rsVBrkEBZCED0M=;
        b=oQLVjZbJtMUqDKS8ZQ6VmxL0uwiK4rstjyIrWbgJqFPrT50ypHysI4vvrX56Ix8nh0
         tVZvAxIBzjwAcW4+4vl6gajl/PUIf+39TFKfte6+mgAU9wyc19XoQxHLDo6+Tyi/XhK0
         3FdYMsz25LsyduMAELU9/BROi/aVAXF+f3Ajt+6ERX+GgViQEKqRY+wnZ5zPmsAudoeU
         omF9g+uGMc6sbukPkl6ycMw4nz2070NU+B3x1aUBw9DP0cuFKctSa6xEiFmcK5UFDQBs
         8DZO0k5uK5CMaUS6nMpRo2+gIfZeqqKWdePQeQnrMJnG3+ur+0Khx0ClZoZSjIMmaErD
         yJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690450122; x=1691054922;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Cioe5GLYWrMXzZz7iv5mVFtPUhg4rsVBrkEBZCED0M=;
        b=XArmhkK0xwJqwrNwYCerleLZXPNBcy0hz3pAvGGkIjTEtOwwGczAlZGUSu5K6pjB4F
         XvHjtf+WlTgChP9MBFQ7+WtFhrpiNEKlmBe39T1PyMSuwRyjscat7B0Hf1t8WsWN64IN
         CcFoi4+5oArEEs2zFD8JbwvUjbhG9Ol+3rkF/cBhiK4Q/2yWn/eCpFkFLaiHBAcl4wKY
         0ATcIDq2LsF+Yn6yK5pQu8xpijrgY5hUYRMOAllAj2pvYgVBe93KE4JB9Uny1S27kLMW
         2iKDkbPWK7Y/6+Nid3nuf116C5dgFO/CW9IjQLnVPtqTu2aSTFPF1FIkvdJcqsw9TT2C
         4yIg==
X-Gm-Message-State: ABy/qLYUQEI5cG1WXmoEjSoya6Q8JHzek/GMctjddupXCIjmABfnQMGn
	CyXAIBUfjtLwo7fpLAy1PMOJAA==
X-Google-Smtp-Source: APBJJlEyMo6307m/Wi7rZM3DZPAhKwDRrLxg1R2Ww8OuSBe5Zzz6djZ2jRqBvOICPiHEfAUjapQo3w==
X-Received: by 2002:a5d:4942:0:b0:317:6fff:c32b with SMTP id r2-20020a5d4942000000b003176fffc32bmr1221361wrs.53.1690450121653;
        Thu, 27 Jul 2023 02:28:41 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id b17-20020adfde11000000b003143765e207sm1489129wrm.49.2023.07.27.02.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 02:28:41 -0700 (PDT)
From: Louis Rannou <lrannou@baylibre.com>
Date: Thu, 27 Jul 2023 11:28:37 +0200
Subject: [PATCH] systemd: sysusersd: change how the root home directory is
 set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230727-sysusers_root-v1-1-e39b7602d80e@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAMQ4wmQC/3WMywrCMBBFf6XM2kiSmgqu/A8pkqcd0KZkajCU/
 Luxexd3cS6cswH5hJ7g0m2QfEbCODcQhw7spOeHZ+gag+Sy52c5MCr0bg7dU4wr086c7NDmuIL
 mLMkH/Oy929h4QlpjKns+i9/7r5QFE0xpq7QLqldBX40uTzTJH218wVhr/QKyyxVkrQAAAA==
To: openembedded-core@lists.openembedded.org
Cc: Qi.Chen@windriver.com, tgamblin@baylibre.com, 
 Louis Rannou <lrannou@baylibre.com>, 
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690450120; l=4251;
 i=lrannou@baylibre.com; s=20230614; h=from:subject:message-id;
 bh=L4Y+uY99NWqQK+gGt2KUyNyNiwqd2FEdNk791LJDSAc=;
 b=QdML3JAMITQEGRLW1Nb8XVXXR2a5XxyglpQ7mPmQA9tOxj1QGWJL4TrAZveaDYzLCoXTkzgWK
 rfa0k6Ttu29Ceten/+OG5GAkC25+/otkCibQG8y//jopGALhVcgSZJL
X-Developer-Key: i=lrannou@baylibre.com; a=ed25519;
 pk=QLSK64UNeqThVe2CiH917a68zTpexYuA7iXw6WQ0bbI=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 09:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184925

Modifying the sources brings troubles in the devtool command. Therefore it is
better to patch the source with a custom variable, and later replace it with the
correct root path.

Suggestion from :
<https://lore.kernel.org/all/DB5PR02MB102137939DE6D43E423A9D296EF03A@DB5PR02MB10213.eurprd02.prod.outlook.com/>

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...usersd-Change-the-user-root-s-home-direct.patch | 32 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_253.3.bb         | 11 ++++----
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0029-sysusersd-Change-the-user-root-s-home-direct.patch b/meta/recipes-core/systemd/systemd/0029-sysusersd-Change-the-user-root-s-home-direct.patch
new file mode 100644
index 0000000000..738413ec93
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0029-sysusersd-Change-the-user-root-s-home-direct.patch
@@ -0,0 +1,32 @@
+From bf97001978cdefad644f7b4b909f281368e5a4dd Mon Sep 17 00:00:00 2001
+From: Kas User <kas@example.com>
+Date: Thu, 27 Jul 2023 08:23:06 +0000
+Subject: [PATCH] sysusers.d: Change the user root's home directory
+
+The default sysusers basic.conf.in file sets the root home directory to `/root`
+and does not permit its configuration. Change this to `:ROOT_HOME:` which must
+be set before the installation.
+
+The upstream considers the root home directory should not be changed
+<https://github.com/systemd/systemd/issues/27959>
+
+Upstream-Status: Denied
+Signed-off-by: Louis Rannou <lrannou@baylibre.com>
+---
+ sysusers.d/basic.conf.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysusers.d/basic.conf.in b/sysusers.d/basic.conf.in
+index 0aec080a4c..f26c224341 100644
+--- a/sysusers.d/basic.conf.in
++++ b/sysusers.d/basic.conf.in
+@@ -7,7 +7,7 @@
+ 
+ # The superuser
+ g root    0       -            -
+-u root    0:0     "Super User" /root
++u root    0:0     "Super User" :ROOT_HOME:
+ 
+ # The nobody user/group for NFS file systems
+ g {{NOBODY_GROUP_NAME}} 65534       -            -
+
diff --git a/meta/recipes-core/systemd/systemd_253.3.bb b/meta/recipes-core/systemd/systemd_253.3.bb
index cf0e17ff00..0f96140025 100644
--- a/meta/recipes-core/systemd/systemd_253.3.bb
+++ b/meta/recipes-core/systemd/systemd_253.3.bb
@@ -17,7 +17,6 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 SRC_URI += " \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
-           file://basic.conf.in \
            ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '', d)} \
            file://init \
@@ -28,6 +27,7 @@ SRC_URI += " \
            file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
            file://27254.patch \
            file://27253.patch \
+           file://0029-sysusersd-Change-the-user-root-s-home-direct.patch \
            "
 
 # patches needed by musl
@@ -253,10 +253,6 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
 # The 60 seconds is watchdog's default vaule.
 WATCHDOG_TIMEOUT ??= "60"
 
-do_configure:prepend() {
-  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in > ${S}/sysusers.d/basic.conf.in
-}
-
 do_install() {
 	meson_do_install
 	install -d ${D}/${base_sbindir}
@@ -368,6 +364,11 @@ do_install() {
         sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
             ${D}/${sysconfdir}/systemd/system.conf
     fi
+
+	# The root home directory specified in sysusers.d/ was patched to
+	# `:ROOT_HOME:`. Change now to the correct path given by ${ROOT_HOME}.
+	[ ! -f ${D}${libdir}/sysusers.d/basic.conf ] ||
+		sed -i s@:ROOT_HOME:@${ROOT_HOME}@g ${D}${libdir}/sysusers.d/basic.conf
 }
 
 python populate_packages:prepend (){

---
base-commit: 23d9e2e210f18401ac669a930f2328aefacdc925
change-id: 20230726-sysusers_root-adb4c6b4cd05

Best regards,
-- 
Louis Rannou <lrannou@baylibre.com>


