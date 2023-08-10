Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE8BC41513
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:17 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.21282.1691683516396893839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=c8lLfsv2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-686c06b806cso787053b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683515; x=1692288315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDGGjSo1ZaIsnI3OVnMU8Zec4uzU9B2VTOEltzyMA9A=;
        b=c8lLfsv29cEPaQDQ7aMiuOLaGO7P9ACup6pAygztDI0LTNS1IiYM/vEzHdj99FfA5Z
         1YL1c11WEjgE4dfnDOtkAo/7bUlZ14HoGoYAAktI6Pf75OyaEdGiaAwM+2SqZGzuP+aC
         pfBg/wQ1LfYFmaksfcr09yW1RFE+nOpf+Cy6fO9/4YGiCXsGXv4aO7tM/K4LAM6sQBXv
         iYyXTAyK9Ofmne1aH6dJc7815wdtKxBXAU5qAMuEfQm+frwja5YaQx6OiVqgDHQzZCj9
         65B4t8dHIKXb/XF5+s+4OGNOT8OLdXDiNDjNZmTvHknCaEu6o6/1Q1ac1J/9IqBGxcn9
         nIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683515; x=1692288315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDGGjSo1ZaIsnI3OVnMU8Zec4uzU9B2VTOEltzyMA9A=;
        b=D2dMvKxZOxWjmjqJFtTgZYi12vsjbysD7qeuD1V2kC84iB4WB82HgphcSwI9KIskxQ
         SH0CzC+zs7VjnJZHd3/ExbpTRoJDiPBZPL2s9Oq8OqL7ibYHUEjubC9E9vmiPvdH0owL
         a6wPfm9Ur7Lnai5136N35DkkBlHcsFKUCqgQe+OUjwe4Y/Wv5UDQXVRSxJQwuY7oN+yh
         pZSQhaJiUDsmnd5KZH9Q24aEDGFbrQUS9VVBvugu+RDVo4LqBPdQa5KdZTeQFTTW8lci
         7f/JxqA1gMtcWXkI/J9ghmrudwgAWqvEiovLvvpw14x2mPUNQsyxWmDpRjgFK4sizNss
         MGAw==
X-Gm-Message-State: AOJu0Yyl8h9dHusdSEYuI24s6gu1uVOF+xILxUFY02ioF53fe6yOu8tf
	MLJIoH9k9IRD987WcDyxziZF4bf8sbIaNE4vFV8=
X-Google-Smtp-Source: AGHT+IHyawA8cyUMcs9ybXHeOMlTJ7TUbxVGK+/1+P/Tz71+h0hZun1e3MnuGYmwFOkIFvtWguTkCg==
X-Received: by 2002:a05:6a00:2d23:b0:682:95ab:32f with SMTP id fa35-20020a056a002d2300b0068295ab032fmr2766984pfb.1.1691683515362;
        Thu, 10 Aug 2023 09:05:15 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/37] bind: upgrade 9.18.15 -> 9.18.16
Date: Thu, 10 Aug 2023 06:04:13 -1000
Message-Id: <95988d1cc871458b978fac08c0d72a978bec0490.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185776

From: Archana Polampalli <archana.polampalli@windriver.com>

Remove enable-epoll & disable-devpoll configure options no longer supported in bind-9.18.16
    6b6076c882: Remove obsolete epoll/kqueue/devpoll configure options

Security fixes:
https://nvd.nist.gov/vuln/detail/CVE-2023-2828
https://nvd.nist.gov/vuln/detail/CVE-2023-2911

Changelog:
https://github.com/isc-projects/bind9/blob/v9.18.16/CHANGES
https://bind9.readthedocs.io/en/v9.18.16/notes.html#notes-for-bind-9-18-16

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch             | 0
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 0
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 0
 .../bind/{bind-9.18.15 => bind-9.18.16}/bind9                 | 0
 .../bind/{bind-9.18.15 => bind-9.18.16}/conf.patch            | 0
 .../bind/{bind-9.18.15 => bind-9.18.16}/generate-rndc-key.sh  | 0
 .../init.d-add-support-for-read-only-rootfs.patch             | 0
 .../make-etc-initd-bind-stop-work.patch                       | 0
 .../bind/{bind-9.18.15 => bind-9.18.16}/named.service         | 0
 .../bind/{bind_9.18.15.bb => bind_9.18.16.bb}                 | 4 ++--
 10 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.15.bb => bind_9.18.16.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.16/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/bind9 b/meta/recipes-connectivity/bind/bind-9.18.16/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.16/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.16/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.16/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.16/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.16/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.16/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/named.service b/meta/recipes-connectivity/bind/bind-9.18.16/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.16/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.15.bb b/meta/recipes-connectivity/bind/bind_9.18.16.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.18.15.bb
rename to meta/recipes-connectivity/bind/bind_9.18.16.bb
index 80164aad87..1b1649566a 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.15.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.16.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "28ae8db14862801bc2bd4fd820db00667d3f1ff9ae9cc2d06a0ef7810fed7a4e"
+SRC_URI[sha256sum] = "c88234fe07ee75c3c8a9e59152fee64b714643de8e22cf98da3db4d0b57e0775"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
@@ -39,7 +39,7 @@ PACKAGECONFIG[readline] = "--with-readline=readline,,readline"
 PACKAGECONFIG[libedit] = "--with-readline=libedit,,libedit"
 PACKAGECONFIG[dns-over-http] = "--enable-doh,--disable-doh,nghttp2"
 
-EXTRA_OECONF = " --disable-devpoll --disable-auto-validation --enable-epoll \
+EXTRA_OECONF = " --disable-auto-validation \
                  --with-gssapi=no --with-lmdb=no --with-zlib \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_DIR_HOST}${prefix} \
-- 
2.34.1


