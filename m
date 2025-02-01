Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB47C0218A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 17:05:47 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.46892.1738429542093698948
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 09:05:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=abTAUg/d;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so20940695e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 09:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738429540; x=1739034340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pEJlVAK3jQ8t5xffolJ1DgnPSG+u6vZfujI9zuMjIKo=;
        b=abTAUg/d/QiGK03GOjqWY2xjElocrkMbSHg1Laz6AH1VSHdBn8tzY358DJVcXbabRl
         Mdm+MZXLg3nIRlBgpsycQP5h9FMXvB34iR+OdV/xjg1gU/zwssAK/CXJAPMUqEE+g6fG
         xNz7CWorUxbqZbz6qNhhKt9L8D6mMo6LIbN86U8OAJHMzMyyeTeW3Q8GrvyC02aqniL+
         Q5RobMd8rKf2/zyizplWfzEZ8WoyiKiuZIKTtesuqYP2g+CVt+WnaJhu+owUKatvV6Yu
         RkF47v+H+Ki+E4pEILhY8E9K1wzptjDMVRG+2zSpFGj/5V9Ervs7FLonrKKsfcVgDcON
         OSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738429540; x=1739034340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEJlVAK3jQ8t5xffolJ1DgnPSG+u6vZfujI9zuMjIKo=;
        b=E7FxoFP4LMo1lytlN6sOG/FscvzSoYCF7een9DNn9B2To9g3P0BJ1JFdbcfP+4Zelp
         djftKQczIuxo2aHgYGBxevFXCJnj9YDolRc6B0n0T+sqLM4UEs1t2dIGtNOPiMEkgFc3
         bxq5PrpiG1mGQWcfI057b5JDEoNK8xckQ9Oe08VujuG8nZUU7sn4TsOXn4rZgKIkZ5lr
         xR3ubyHXKAvcAJIhJXQ+bxKxruO8RVQ2Q+PHdSbrb8wHCmu2uNtajcaSIUhu2U2MOAQl
         PZhqcwgTQs6eKcU5wvgihLP1H2+FwF49FfEi5ECzTiG8Qv7RjbzoCsqqzTgJfbyp5OOR
         0Fgw==
X-Gm-Message-State: AOJu0Yz3QbLUw+tYfxM/mLTi/4hjLccJnCZfHx7M5PTuHWU3uTxAAlxw
	aGxz+vYrkIsEEkTGYB2B19pNLUNymjS77Fibgm0IR1TF4YI5DjL8h+dcNxbn
X-Gm-Gg: ASbGnctnXiFgMrZ87sUqBXv1esBH2ypi116hyRzpBixFnZeJfQ7OUlCWwfOC6QCuz/7
	vOG4okEEdJtDF9YIkU+adXXb9lP8vmX4nmgBZKoUc/akDt40rF4UdYofspzOCsA3sH1lXWVkgWm
	RJzjDBwqIS6NFhUKJULpgrBJ3zv6NOjnLSi84eivHueuHFZHZ2xd8mEydFjNKXZZlwyB2Dtvo8k
	6x0pxmlZEiH6oFyZIctlHNxtN+v5xA5zxp4UzcEHqqcLWvdm83mhm1RL2gLSlHi037yL2M19wmo
	9pRu9o0kOY/BAecM+Rw81RDHuG+esEWwSmJxNzqAJFqfCi92TtNORH+KMA==
X-Google-Smtp-Source: AGHT+IE3eba1xy/g/syBUpNljlKhKne/dDGkVFw76IO7FyKKZOUVntiIoJwDSne7KSWgxDWffpJWWQ==
X-Received: by 2002:a05:600c:3556:b0:431:5863:4240 with SMTP id 5b1f17b1804b1-438dc40d30dmr119489125e9.24.1738429539435;
        Sat, 01 Feb 2025 09:05:39 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2e239sm127088755e9.18.2025.02.01.09.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 09:05:38 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core 1/2] nss-mdns: Rename recipe to avahi-libnss-mdns
Date: Sat,  1 Feb 2025 17:05:09 +0000
Message-Id: <20250201170509.2974-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 17:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210609

meta-networking has Apple's mDNSResponder which also delivers libnss-mdns
nsswitch plugin. Rename this recipe to avahi-libss-mdns and add an RPROVIDE so
that either than be chosen.
---
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


