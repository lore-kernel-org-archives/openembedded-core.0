Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD105C6FD18
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.3127.1675840911151617160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hrl81Pcv;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso757822wms.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMgFGFbh10hMwpovVNLvJGvi4FJj3Ut/IFPkrXHlV6w=;
        b=hrl81Pcv/LKtkPyTPElMlUHxHn2CVqiBVHqE25OpFybBdW7xanS6kO7HRnOvwIkoeX
         cz2WgF0QnecZzGWAA/SVYJwumeoF/XWnVGfBezuhooPbHiyo/e0FsyiAXbiDYe2ZN4R3
         o1Kp/yakRmLLvvy29drB9CgEc/3gV5Yosmv5110TF56yi1mnVyEbMXOdYuud/SAWdEVt
         fiKy4hbBhO/bIEvpiEysmLFSTKes4q8IfUklsbP/mk7jmNs7cVB43EFitRCQa2sqqjvC
         Ee76/sPv1Wza+XOMoSKM020facZlDoH72BQr6jrvp5GqtQ6mQ/DtvWoIFXnB5yCl5Rh6
         l7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMgFGFbh10hMwpovVNLvJGvi4FJj3Ut/IFPkrXHlV6w=;
        b=dUMw3wsP60Ye7sdoW1jj8tVa3eFStKztEkTrrbdJ9vqFL3BQ1o+GDYRM/HKQbeeVMk
         BAxJR86yxlBZMMuZzRZr3XXRto+voeYW45xA8HqzVkOZgR0oLg7aiPDPblYQhn7PSJ7E
         WfNjb7BRpmEfjt1ltbahzQAQYo5ROHJp8VwZoxUMKaxFWsjeUhyXlLbUD7/Hj+E+409W
         RH3Ffrhggn50rGvvJ3Thzfd2Y0/5Iz85qyFQmD3vZffuMA3fKQzxLNJ34ZN/ynnhQKIQ
         qTx7zzDHGVVRlms4tdwHxaYPzadBbWmV1D504qXrvDzD1dZjzAAUXjN4vCHPiuSkc20T
         otNw==
X-Gm-Message-State: AO0yUKVYQfABTSP/VfEKuIpjUZpJn10f35/ELBjeSVouN2q/pgrat7B5
	L/YGpFyBKiwFWgqmtMwzBdKDPEuXJn4=
X-Google-Smtp-Source: AK7set8f5BK0DiJ58fem5Y/HdalqQnNHB5D1Ra1EZnTtt8pywPHNN1QsSNHaUU4IFr9kwvbqLzNMhw==
X-Received: by 2002:a05:600c:43d5:b0:3d9:e5d3:bf with SMTP id f21-20020a05600c43d500b003d9e5d300bfmr5580780wmn.32.1675840915661;
        Tue, 07 Feb 2023 23:21:55 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/52] lighttpd: upgrade 1.4.67 -> 1.4.68
Date: Wed,  8 Feb 2023 08:21:05 +0100
Message-Id: <20230208072143.2930292-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176853

Rename options where appropriate. pcre option supports pcre2 now, so convert to that.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../lighttpd/lighttpd/fix-missing-test.patch  | 23 +++++++++++++++++++
 ...{lighttpd_1.4.67.bb => lighttpd_1.4.68.bb} | 23 ++++++++++---------
 2 files changed, 35 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/fix-missing-test.patch
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.67.bb => lighttpd_1.4.68.bb} (75%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd/fix-missing-test.patch b/meta/recipes-extended/lighttpd/lighttpd/fix-missing-test.patch
new file mode 100644
index 0000000000..6aa843b75d
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/fix-missing-test.patch
@@ -0,0 +1,23 @@
+From d809433d6d900e899f796606b11bdc6a73413ac5 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Tue, 3 Jan 2023 17:50:16 -0500
+Subject: [PATCH] [meson] remove t/test_mod_evasive.c
+
+Upstream-Status: Backport [https://github.com/lighttpd/lighttpd1.4/commit/d809433d6d900e899f796606b11bdc6a73413ac5]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index ff472c320..77089fc3c 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -721,7 +721,6 @@ test('test_mod', executable('test_mod',
+ 		't/test_mod.c',
+ 		't/test_mod_access.c',
+ 		't/test_mod_alias.c',
+-		't/test_mod_evasive.c',
+ 		't/test_mod_evhost.c',
+ 		't/test_mod_indexfile.c',
+ 		't/test_mod_simple_vhost.c',
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.67.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb
similarity index 75%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.67.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb
index 838881f238..a9163f8492 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.67.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb
@@ -17,9 +17,10 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://index.html.lighttpd \
            file://lighttpd.conf \
            file://lighttpd \
+           file://fix-missing-test.patch \
            "
 
-SRC_URI[sha256sum] = "7e04d767f51a8d824b32e2483ef2950982920d427d1272ef4667f49d6f89f358"
+SRC_URI[sha256sum] = "e56f37ae52b63e1ada4d76ce78005affb6e56eea2f6bdb0ce17d6d36e9583384"
 
 DEPENDS = "virtual/crypt"
 
@@ -27,19 +28,19 @@ PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
 "
 
-PACKAGECONFIG[libev] = "-Dwith_libev=true,-Dwith_libev=false,libev"
-PACKAGECONFIG[mysql] = "-Dwith_mysql=true,-Dwith_mysql=false,mariadb"
-PACKAGECONFIG[ldap] = "-Dwith_ldap=true,-Dwith_ldap=false,openldap"
+PACKAGECONFIG[libev] = "-Dwith_libev=enabled,-Dwith_libev=disabled,libev"
+PACKAGECONFIG[mysql] = "-Dwith_mysql=enabled,-Dwith_mysql=disabled,mariadb"
+PACKAGECONFIG[ldap] = "-Dwith_ldap=enabled,-Dwith_ldap=disabled,openldap"
 PACKAGECONFIG[attr] = "-Dwith_xattr=true,-Dwith_xattr=false,attr"
 PACKAGECONFIG[openssl] = "-Dwith_openssl=true,-Dwith_openssl=false,openssl"
-PACKAGECONFIG[krb5] = "-Dwith_krb5=true,-Dwith_krb5=false,krb5"
-PACKAGECONFIG[pcre] = "-Dwith_pcre=true,-Dwith_pcre=false,libpcre"
-PACKAGECONFIG[zlib] = "-Dwith_zlib=true,-Dwith_zlib=false,zlib"
-PACKAGECONFIG[bzip2] = "-Dwith_bzip=true,-Dwith_bzip=false,bzip2"
-PACKAGECONFIG[webdav-props] = "-Dwith_webdav_props=true,-Dwith_webdav_props=false,libxml2 sqlite3"
-PACKAGECONFIG[webdav-locks] = "-Dwith_webdav_locks=true,-Dwith_webdav_locks=false,util-linux"
+PACKAGECONFIG[krb5] = "-Dwith_krb5=enabled,-Dwith_krb5=disabled,krb5"
+PACKAGECONFIG[pcre] = "-Dwith_pcre=pcre2,-Dwith_pcre=disabled,libpcre2"
+PACKAGECONFIG[zlib] = "-Dwith_zlib=enabled,-Dwith_zlib=disabled,zlib"
+PACKAGECONFIG[bzip2] = "-Dwith_bzip=enabled,-Dwith_bzip=disabled,bzip2"
+PACKAGECONFIG[webdav-props] = "-Dwith_webdav_props=enabled,-Dwith_webdav_props=disabled,libxml2 sqlite3"
+PACKAGECONFIG[webdav-locks] = "-Dwith_webdav_locks=enabled,-Dwith_webdav_locks=disabled,util-linux"
 PACKAGECONFIG[lua] = "-Dwith_lua=true,-Dwith_lua=false,lua"
-PACKAGECONFIG[zstd] = "-Dwith_zstd=true,-Dwith_zstd=false,zstd"
+PACKAGECONFIG[zstd] = "-Dwith_zstd=enabled,-Dwith_zstd=disabled,zstd"
 
 inherit meson pkgconfig update-rc.d gettext systemd
 
-- 
2.30.2


