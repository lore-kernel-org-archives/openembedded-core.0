Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38EFEB64DC
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 11:44:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.15869.1686829457252939350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 04:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=MLWuYNne;
 spf=pass (domain: baylibre.com, ip: 209.85.221.45, mailfrom: lrannou@baylibre.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30fceb009faso529098f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 04:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686829455; x=1689421455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+9U1fuYAs9zKZ8RaFvWYT/K3mbHLVpskyyrodumb5I=;
        b=MLWuYNneVZE4g8Kk1DsdOau4JqSG1Q57vdVGiAJiXqgn+o9sMpTLDTWaD+45Ewrv6X
         pg+LhmuBFfbi9+oLhszzFrmUgj293MGe9pdFE+RmgBgOqTSsazNHWKH0+7BtvUDu8F6i
         zBAQxs3s8cunPcgDn6Zxc7mpwpoarFZSfoRH+6nCR5buF/EMlTtDOPXLEzB/CLo7p+bD
         PtYGbmKaSJ+5jNnWICnD555Idw27zltVzuE1GIj8j91/AF/i5FOPaIU9N9N3gARVwIWP
         s24zytOoP36T2T+1yhE/fyVMwcmzT05fgfxlxjba/72XPpIdxIzFtju0yTsnW7cl3Ua0
         EPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686829455; x=1689421455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+9U1fuYAs9zKZ8RaFvWYT/K3mbHLVpskyyrodumb5I=;
        b=NpY0lSgMXczj8PWuTX8sRrxt0J8lc97BS/1+jk+A8Ocq31kGwqz/cD6qf8/5ed5hQB
         9cOo/Q4Tz10k2f8dFnkBxOqKVKCRF78OLfkHOpyiWbmmc8AkA732TPE38dVJaJQx3tUs
         Pyf575Q/e8yyto5a9CMP5+p0PGEJQp0h73OnL+F1wBmz5EHH1H1iu3j3CtZLJHZJr2w1
         TGGsZTxRDx1QvOJELGuQA8U8/GgKbZvSANvZn11x2UOuJZclYwVyjuou2OixKlMYo9FN
         Qtoz/JtQMsvwfJI1qvMtEuJQLUztHX/ZrKEzub3ZflRC69S9QTH9m/qqmp+thwTB1Eda
         DpVg==
X-Gm-Message-State: AC+VfDynisbiKVDYUwvIlnenD5RQl9ds0fvL5PCM5D8gZQjE202dhEC4
	1rVsdpS9G28GYtjzUR26Mch+qCpEhaYKB2AvftE=
X-Google-Smtp-Source: ACHHUZ5Dh7CWEsXSa7p4BFkiuWBir9TzbhNRPO/r6f9WdmdQA7qoHZRmMhhgnRh8doJq1RezgmhAdg==
X-Received: by 2002:adf:ec43:0:b0:311:ab6:1a8e with SMTP id w3-20020adfec43000000b003110ab61a8emr3739197wrn.9.1686829455806;
        Thu, 15 Jun 2023 04:44:15 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d6311000000b0030fae360f14sm15429154wru.68.2023.06.15.04.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 04:44:15 -0700 (PDT)
From: Louis Rannou <lrannou@baylibre.com>
Date: Thu, 15 Jun 2023 13:43:54 +0200
Subject: [PATCH 2/3] systemd: replace the sysusers.d basic configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230613-sysusersd-v1-2-eaddf3179773@baylibre.com>
References: <20230613-sysusersd-v1-0-eaddf3179773@baylibre.com>
In-Reply-To: <20230613-sysusersd-v1-0-eaddf3179773@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Louis Rannou <lrannou@baylibre.com>, anuj.mittal@intel.com
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686829453; l=3392;
 i=lrannou@baylibre.com; s=20230614; h=from:subject:message-id;
 bh=2u+4EIk4wuXNn19J+5bpCctm+T/VfFFuTYIzzgbHX6E=;
 b=xgydEuiWaN6nJQt8jEw5ks9Aflnl7J1nQ6cK23/dTuMVYwBFTYFGX6KgxfG6Kkbek8ElkeZgE
 e1ER/P+dlurDbfQrZORAbrOL3tfu5FJwp/R65b5jy2ARxueMeUJQqof
X-Developer-Key: i=lrannou@baylibre.com; a=ed25519;
 pk=QLSK64UNeqThVe2CiH917a68zTpexYuA7iXw6WQ0bbI=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 11:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182847

The default sysusers basic.conf.in file sets the root home directory to `/root`
and does not permit its configuration. Replace the file delivered by systemd so
the root home directory matches the `ROOT_HOME` variable.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
---
 meta/recipes-core/systemd/systemd/basic.conf.in | 40 +++++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_253.3.bb      |  5 ++++
 2 files changed, 45 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd/basic.conf.in b/meta/recipes-core/systemd/systemd/basic.conf.in
new file mode 100644
index 0000000000..fac288f7fa
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/basic.conf.in
@@ -0,0 +1,40 @@
+#  This file is part of systemd.
+#
+#  systemd is free software; you can redistribute it and/or modify it
+#  under the terms of the GNU Lesser General Public License as published by
+#  the Free Software Foundation; either version 2.1 of the License, or
+#  (at your option) any later version.
+
+# The superuser
+u root    0     "root" :ROOT_HOME:
+
+# The nobody user/group for NFS file systems
+g {{NOBODY_GROUP_NAME}} 65534       -            -
+u {{NOBODY_USER_NAME }} 65534:65534 "Nobody"     -
+
+# Administrator group: can *see* more than normal users
+g adm     {{ADM_GID    }}     -            -
+
+# Administrator group: can *do* more than normal users
+g wheel   {{WHEEL_GID  }}     -            -
+
+# Access to shared database of users on the system
+g utmp    {{UTMP_GID   }}     -            -
+
+# Physical and virtual hardware access groups
+g audio   {{AUDIO_GID  }}     -            -
+g cdrom   {{CDROM_GID  }}     -            -
+g dialout {{DIALOUT_GID}}     -            -
+g disk    {{DISK_GID   }}     -            -
+g input   {{INPUT_GID  }}     -            -
+g kmem    {{KMEM_GID   }}     -            -
+g kvm     {{KVM_GID    }}     -            -
+g lp      {{LP_GID     }}     -            -
+g render  {{RENDER_GID }}     -            -
+g sgx     {{SGX_GID    }}     -            -
+g tape    {{TAPE_GID   }}     -            -
+g tty     {{TTY_GID    }}     -            -
+g video   {{VIDEO_GID  }}     -            -
+
+# Default group for normal users
+g users   {{USERS_GID  }}     -            -
diff --git a/meta/recipes-core/systemd/systemd_253.3.bb b/meta/recipes-core/systemd/systemd_253.3.bb
index 45dc6ab5bb..87fbf6f785 100644
--- a/meta/recipes-core/systemd/systemd_253.3.bb
+++ b/meta/recipes-core/systemd/systemd_253.3.bb
@@ -17,6 +17,7 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 SRC_URI += " \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
+           file://basic.conf.in \
            ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '', d)} \
            file://init \
@@ -252,6 +253,10 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
 # The 60 seconds is watchdog's default vaule.
 WATCHDOG_TIMEOUT ??= "60"
 
+do_configure:prepend() {
+  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in > ${S}/sysusers.d/basic.conf.in
+}
+
 do_install() {
 	meson_do_install
 	install -d ${D}/${base_sbindir}

-- 
2.41.0


