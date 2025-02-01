Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3097EC02192
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 17:30:17 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.47521.1738431010773030268
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 09:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gLCSM7FW;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso4981259a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 09:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738431009; x=1739035809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nwMDuq6nzL2QYpqI2tNZhT2AGNQp82x/dRoREYFCP4A=;
        b=gLCSM7FWqEmNNkWj2jLMaXQzX8rd0OiXn2HqIeZH+eB6AHfRL+D9nWXiOGMGG2qIE1
         2ofhdVwrIeVSli5w57A33wqoTkJWS497eeUwzFtO1eku8/gV4n5wFkahvgy68mgmD1QI
         idAu5ma60noDhy0xqbqvJBLqldJqmWoiHkpPwlubTTUJftGbf9kMFNplkSkYl8eSklob
         kiAO63/f5+FqxUwX2GGgkd7bPwbBYB5causUQurmGh6oT5VwT6AnDqtYBU/cjL38aJ/H
         3UNZCvf1F/NSxemvORu/I5BkQynQuG5X0TBeauf4nDSjvH+bY/enQKcJ8h2u9BZ4IBZT
         T2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738431009; x=1739035809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwMDuq6nzL2QYpqI2tNZhT2AGNQp82x/dRoREYFCP4A=;
        b=vL9ksGwCm+nmS7a654ffdkWxTpIN1qwqaerhTDgEzHjzIl0Y9FD1rzCrD3sAa5uhrm
         cCp9LAaqb5rtO3JB+sg3/tgENNkdN31zUuldrXg7aOjMqIULvLwdtYYOEDjJs1dIQ7z+
         W0Xi5d4xJl37lKohY91F5xZ62Js4wwuRVakGsJM1Jn6wwTew8y3SbHFkyGPWHU74Jbsc
         C9TRM+Cqb3oUmo2VMM3UKEezyxhNoX30gMJcHtpGpgSxY72pvmK5DqtP7qS6BUGiwqIe
         LJLkVzexKOwgYVOBBw6aWasAl/j3DaVMTchHAu2pFu0NfCBOz3+ppC3LNnvS8qo48LQ3
         n1nQ==
X-Gm-Message-State: AOJu0Yy7mlqDlSN+DtZLCzJNeGOX2ZnE/XDtahvuM/yLxFuWbg0aGk6r
	csxzfyljbKSbupZ1CY56Uelz7tO88iAUblp401fmbWqOrn7VAz8y1gXGD7m1
X-Gm-Gg: ASbGncsYbjxhzrDEzSxka+5WE6yHRi5J+oQLYfon0lC/V5dBIxOWNFxIkku7Ib+F3s1
	PcOtGLHqdSVheDSseXkZbBlP/Uc3W0rlmLNKOfkopE9WiluzghYGL+2KVsAYtY7aTmIuHatCcXX
	tvSff3RqpyP/OtbF9H9enLnN9cmkX//Ji29Ha+Cx5g93O2jSLkI4gGLsgAuxVp+EJ+dxGDC7ib1
	TOsE9Ursxt910fzG98jRd19AhTkqo+PRnMoilYEbfPjqh6U409m5uxhQvE9iD9Zu9px5da1Xes+
	6AS7H4Io/ZQNchWDAt7XPJmTFWQuwaq44EU+uaSDExXeOqodL5YgBjQwdQ==
X-Google-Smtp-Source: AGHT+IEe4UF/fm6OFvzn9zfL8vG8nHqhRWUf1YjpzddYf3vAKMrNV2tu3BkYiPxFyiJa2CyJVYyG+g==
X-Received: by 2002:a05:6402:240d:b0:5dc:1395:1d12 with SMTP id 4fb4d7f45d1cf-5dc5effcb54mr14786252a12.31.1738431008684;
        Sat, 01 Feb 2025 09:30:08 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c9da7sm4669984a12.79.2025.02.01.09.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 09:30:07 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH v2 1/2] nss-mdns: Rename recipe to avahi-libnss-mdns
Date: Sat,  1 Feb 2025 17:28:43 +0000
Message-Id: <20250201172843.1490-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 17:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210612

meta-networking has Apple's mDNSResponder which also delivers libnss-mdns
nsswitch plugin. Rename this recipe to avahi-libss-mdns and add an RPROVIDE so
that either than be chosen.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
Add missing Sob.

 meta/conf/distro/include/distro_alias.inc                       | 2 +-
 meta/conf/distro/include/maintainers.inc                        | 2 +-
 .../libnss-mdns_0.15.1.bb => avahi/avahi-libnss-mdns_0.15.1.bb} | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/{libnss-mdns/libnss-mdns_0.15.1.bb => avahi/avahi-libnss-mdns_0.15.1.bb} (97%)

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 5000b08eb833..a938c007e8a0 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -13,6 +13,7 @@ DISTRO_PN_ALIAS:pn-alsa-state = "OE-Core"
 DISTRO_PN_ALIAS:pn-alsa-utils-alsaconf = "OE-Core"
 DISTRO_PN_ALIAS:pn-alsa-utils-scripts = "OE-Core"
 DISTRO_PN_ALIAS:pn-atk = "Fedora=atk OpenSuSE=atk"
+DISTRO_PN_ALIAS:pn-avahi-libnss-mdns = "Meego=nss-mdns OpenSuSE=nss-mdns Ubuntu=nss-mdns Mandriva=nss_mdns Debian=nss-mdns"
 DISTRO_PN_ALIAS:pn-avahi-ui = "Ubuntu=avahi-discover Debian=avahi-discover"
 DISTRO_PN_ALIAS:pn-babeltrace = "OSPDT"
 DISTRO_PN_ALIAS:pn-babeltrace2 = "OSPDT"
@@ -147,7 +148,6 @@ DISTRO_PN_ALIAS:pn-libksba = "Fedora=libksba Debian=libksba8 Ubuntu=libksba"
 DISTRO_PN_ALIAS:pn-libmatchbox = "Ubuntu=libmatchbox Fedora=libmatchbox"
 DISTRO_PN_ALIAS:pn-libmpc = "Fedora=libmpc OpenSuse=libmpc2"
 DISTRO_PN_ALIAS:pn-libnl = "Mandriva=libnl Fedora=libnl"
-DISTRO_PN_ALIAS:pn-libnss-mdns = "Meego=nss-mdns OpenSuSE=nss-mdns Ubuntu=nss-mdns Mandriva=nss_mdns Debian=nss-mdns"
 DISTRO_PN_ALIAS:pn-libowl = "Debian=owl OpenedHand"
 DISTRO_PN_ALIAS:pn-libpam = "Meego=pam Fedora=pam OpenSuSE=pam Ubuntu=pam Mandriva=pam Debian=pam"
 DISTRO_PN_ALIAS:pn-libpcre = "Mandriva=libpcre0 Fedora=pcre"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6e3cb54a1fb5..bec55a7c1c9b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -52,6 +52,7 @@ RECIPE_MAINTAINER:pn-autoconf = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-autoconf-archive = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-automake = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-avahi-libnss-mdns = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-babeltrace = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-babeltrace2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-barebox = "Enrico Jörns <yocto@pengutronix.de>"
@@ -364,7 +365,6 @@ RECIPE_MAINTAINER:pn-libmodulemd = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libnl = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libnotify = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libnsl2 = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-libnss-mdns = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libnss-nis = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libogg = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libpam = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb b/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb
similarity index 97%
rename from meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
rename to meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb
index 0db609fc473b..9b8275b1138d 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
+++ b/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb
@@ -22,6 +22,7 @@ COMPATIBLE_HOST:libc-musl = 'null'
 EXTRA_OECONF = "--libdir=${base_libdir}"
 
 RDEPENDS:${PN} = "avahi-daemon"
+RPROVIDES:${PN} = "libnss-mdns"
 
 pkg_postinst:${PN} () {
 	sed '
-- 
2.25.1


