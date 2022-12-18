Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2E6C10F1E
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:29 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.32104.1671380003628515572
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 08:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ryK9UbqV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id v23so1647957pju.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 08:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRu72vjt9KDVP+ngf5hSWnVQeEQ6R+evNXSEAcB/FM8=;
        b=ryK9UbqVamXZYnUk5dGn31xQhvIG/8KBAqdpGEFFK48T8iUAzRpUYyYEK3YL/NMqEx
         drZYE0RApf7g3xV7/PMPCRE/DDQfn6s+3XV/FxZNdRwwi4fFU6XIc5jmPc/XUELqcjov
         xR8PWBe1jCfQiC9WzO8ok8KseCEzS9JtPWpPXx1UNi+nc7h3DzFB6TLBzkz4jmPAavKO
         zAMjwgPyq4riEGUXsqC7Jn5fU7l3Q0uST8edbgx+f3zE7aWNc7R+/oZ7JYUZOtmr+3wv
         FuWS6dV9/lt51QxGedGS21eUXWhI21MtPUq8SsJVw/JVtQqoNrhNwfvqmU16Npk8vcjo
         H6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRu72vjt9KDVP+ngf5hSWnVQeEQ6R+evNXSEAcB/FM8=;
        b=K0cWrVgwbD0NRYizW5yGfk8iOMCutLNW2kyyqIEgqqLE+9DChXa42OlcRGD1qfNbyY
         EvCFFnRbbgUlAAdL/5fBUt3YZ7R2dgmrU0lfbyd1w8Mmi5Cp3jb04V4ymIzl+xkPiO5+
         vkVR1dlKowE8M+hHYDEjLIRKwVkB6hyhuDtaDF4KkE+w+8UDRAPZyA5mYuyOXJU5xXjz
         AiOopdIzw8ezibJfLdWPR29n1ZskUKLSBFP6zaxcIr4qZeS7O2SwDcWE58JOA0X22670
         /HToLNi6VLJMKe+IoGz2dExH1FBj8INfHfnc5Ticp/GNfBDqqKa+4wZezPmJ9wbEFfRp
         mjFw==
X-Gm-Message-State: ANoB5pkWHx/mRBodoWki5g+u32Nd9Sn/I9y8QpfoiAxmA5eHP7QHMTc7
	eG8Fz97Ub38KSLLY2gRu0C1Ldf0721iau/3seFI=
X-Google-Smtp-Source: AA0mqf7u6MOYHHILJOaa5bu+LPspVh3f30zKqL6GeiNyIXFEdGzk+zDf9kmtHUjjkWnaQRlGXzK2jw==
X-Received: by 2002:a17:902:a507:b0:189:7cd:6f86 with SMTP id s7-20020a170902a50700b0018907cd6f86mr42588339plq.62.1671380002655;
        Sun, 18 Dec 2022 08:13:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001896522a23bsm5278763plg.39.2022.12.18.08.13.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 08:13:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/19] bind: upgrade 9.18.8 -> 9.18.9
Date: Sun, 18 Dec 2022 06:12:48 -1000
Message-Id: <38219ac0617eac1969e4535a7dd22bf4c1fa1463.1671379841.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671379841.git.steve@sakoman.com>
References: <cover.1671379841.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 16:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174791

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  Fix a crash that could happen when you change
  a dnssec-policy zone with NSEC3 to start using
  inline-signing. [GL #3591]

  Don't trust a placeholder KEYDATA from the managed-keys
  zone by adding it into secroots. [GL #2895]

  Fixed a race condition that could cause a crash
  in dns_zone_synckeyzone(). [GL #3617]

  Don't enforce the jemalloc use on NetBSD. [GL #3634]

  Fix an inheritance bug when setting the port on
  remote servers in configuration. [GL #3627]

  Fix a resolver prefetch bug when the record's TTL value
  is equal to the configured prefetch eligibility value,
  but the record was erroneously not treated as eligible
  for prefetching. [GL #3603]

  Always call dns_adb_endudpfetch() after calling
  dns_adb_beginudpfetch() for UDP queries in resolver.c,
  in order to adjust back the quota. [GL #3598]

  Fix a startup issue on Solaris systems with many
  (reportedly > 510) CPUs. Thanks to Stacey Marshall from
  Oracle for deep investigation of the problem. [GL #3563]

  rpz-ip rules could be ineffective in some scenarios
  with CD=1 queries. [GL #3247]

  The RecursClients statistics counter could overflow
  in certain resolution scenarios. [GL #3584]

  Less ceremonial UNEXPECTED_ERROR() and FATAL_ERROR()
  reporting macros. [GL !6914]

  Fix a couple of bugs in cfg_print_duration(), which
  could result in generating incomplete duration values
  when printing the configuration using named-checkconf.
  [GL !6880]

  Refactor the isc_httpd implementation used in the
  statistics channel. [GL !6879]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit e57fe26b3f85ebfabdc8b574caa5c97602e4d771)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.8 => bind-9.18.9}/bind9                     | 0
 .../bind/{bind-9.18.8 => bind-9.18.9}/conf.patch                | 0
 .../bind/{bind-9.18.8 => bind-9.18.9}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.8 => bind-9.18.9}/named.service             | 0
 .../bind/{bind_9.18.8.bb => bind_9.18.9.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.8.bb => bind_9.18.9.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.9/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.9/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.9/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.9/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/bind9 b/meta/recipes-connectivity/bind/bind-9.18.9/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.9/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.9/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.9/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.9/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.9/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.9/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.9/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.9/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.9/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.8/named.service b/meta/recipes-connectivity/bind/bind-9.18.9/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.8/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.9/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.8.bb b/meta/recipes-connectivity/bind/bind_9.18.9.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.8.bb
rename to meta/recipes-connectivity/bind/bind_9.18.9.bb
index 2964dc9963..b95b900069 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.8.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.9.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "0e3c3ab9378db84ba0f37073d67ba125ae4f2ff8daf366c9db287e3f1b2c35f0"
+SRC_URI[sha256sum] = "6a9665998d568604460df0918fc8ccfad7d29388d4d842560c056cc211cbb243"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


