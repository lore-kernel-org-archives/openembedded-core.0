Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51DDECAAD1
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 14:40:01 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.26440.1661956794936413956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GsimiKHd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id u22so14301964plq.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=tlj7AmkaM+g464Fm+ItOEGF7yG30upw9taYu18D7CmY=;
        b=GsimiKHdSaZ/cYHs9d2AffocP+V+P69tUymzwhu/lZEYlw+2K2Ba4guy1idAMZ2lSB
         rMr5htuo5NVIhUh/BYUotKaVZ6hIumdtw8lFhLaPD2bzSEUzyX8sgdMeNWniTOIyZTRm
         0cG5N8Uj4nZGxdwkUdWkphaDTX4gpiHzQhRdArmm2ZXNQRRQJBzwUU78FOtAQGi1AYQU
         9RYg9QvnAqOnFuxJQWsyEdFdgD1/vo33w6tWUjZBoDgVsokruUdiFWEQiDcjSsGyZp8m
         A8pHEG9f6DE1S3+L7tkDY938qj1mXjKyDkCsDWtPWu8rTAU2KrLu3y3dVVFE9ezzZ6W2
         lY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=tlj7AmkaM+g464Fm+ItOEGF7yG30upw9taYu18D7CmY=;
        b=xwhG5z/Ay6dHn2vv2s5CTf9mab+Pgx+BwtA6+vbOi4lFZu2UjH/C7IfZ9bpHwHRnb0
         2sdVBgNUHw6kWS8DTzfkFzo+rGW90FDXrg3FL0YEdkpgbluAC8YhKwVNasHsDrCDNQUD
         FqeN/ezqLe/Woyf2twXPMphUgnUb8feIJ45YCCZFjGLFZc9DYjx0Bkro0eSKfRuMAxDk
         V/QiXJVN7kHRKO/+QPe01FB+knjyzz94Rc9lW6RWkraxyx5xoF/oEteVELvsCXKNKCaJ
         vb62EP8bh/d+SpgaqAQwA7Nj/ijiLZ/XyqWJq5gl3JnH1yAg73m2Sn3HLkcX+w/CSAmg
         ES0g==
X-Gm-Message-State: ACgBeo0beN9/uIcZRSda3hRk2w5YTfV0PRuHPZutce36yhieh3vcK2wP
	uq7r8LBlPQHGlHTKZ/K1o57pL9IYmQvTB85w
X-Google-Smtp-Source: 
 AA6agR488Cjq3T3a/qXwQCNaydMWCLR9AOF8LksdZt7OpgCBEg2ySQtfWj6XYBOADBdy6B4ulm923Q==
X-Received: by 2002:a17:902:bd49:b0:172:df88:8981 with SMTP id
 b9-20020a170902bd4900b00172df888981mr26129796plx.120.1661956793894;
        Wed, 31 Aug 2022 07:39:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a170902d1c500b00174d715cb76sm6070780plb.2.2022.08.31.07.39.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:39:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/19] bind: upgrade 9.18.4 -> 9.18.5
Date: Wed, 31 Aug 2022 04:39:22 -1000
Message-Id: 
 <75c4b8361ef2d3a39e192ed8318d1038a3ff0999.1661956484.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661956484.git.steve@sakoman.com>
References: <cover.1661956484.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 14:40:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170113

From: Alexander Kanavin <alex.kanavin@gmail.com>

BIND 9.18 is a stable branch, suitable for production use.

Notes for BIND 9.18.5

Feature Changes

The dnssec-signzone -H default value has been changed to 0 additional NSEC3
iterations. This change aligns the dnssec-signzone default with the default
used by the dnssec-policy feature. At the same time, documentation about
NSEC3 has been aligned with the Best Current Practice. [GL #3395]

Bug Fixes

- An assertion failure caused by a TCP connection closing between a connect
(or accept) and a read from a socket has been fixed. [GL #3400]

- When grafting non-delegated namespace onto delegated namespace,
synth-from-dnssec could incorrectly synthesize non-existence of records
within the non-delegated namespace using NSEC records from higher zones. [GL #3402]

- Previously, named immediately returned a SERVFAIL response to the client
when it received a FORMERR response from an authoritative server during
recursive resolution. This has been fixed: named acting as a resolver
now attempts to contact other authoritative servers for a given domain
when it receives a FORMERR response from one of them. [GL #3152]

- Previously, rndc reconfig did not pick up changes to endpoints statements
in http blocks. This has been fixed. [GL #3415]

- It was possible for a catalog zone consumer to process a catalog zone
member zone when there was a configured pre-existing forward-only forward
zone with the same name. This has been fixed. [GL #2506]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0a419b730ca87daa4e07daf022a550fb4112b9b0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.4 => bind-9.18.5}/bind9                     | 0
 .../bind/{bind-9.18.4 => bind-9.18.5}/conf.patch                | 0
 .../bind/{bind-9.18.4 => bind-9.18.5}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.4 => bind-9.18.5}/named.service             | 0
 .../bind/{bind_9.18.4.bb => bind_9.18.5.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.4 => bind-9.18.5}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.4 => bind-9.18.5}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.4 => bind-9.18.5}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.4 => bind-9.18.5}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.4 => bind-9.18.5}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.4 => bind-9.18.5}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.4 => bind-9.18.5}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.4 => bind-9.18.5}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.4 => bind-9.18.5}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.4.bb => bind_9.18.5.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.4/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.5/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.4/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.5/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.4/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.4/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.4/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.5/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.4/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.5/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.4/bind9 b/meta/recipes-connectivity/bind/bind-9.18.5/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.4/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.5/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.4/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.5/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.4/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.5/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.4/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.5/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.4/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.5/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.4/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.5/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.4/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.5/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.4/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.5/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.4/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.5/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.4/named.service b/meta/recipes-connectivity/bind/bind-9.18.5/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.4/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.5/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.4.bb b/meta/recipes-connectivity/bind/bind_9.18.5.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.4.bb
rename to meta/recipes-connectivity/bind/bind_9.18.5.bb
index c3efaffeda..28acecc507 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.5.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "f277ae50159a00c300eb926a9c5d51953038a936bd8242d6913dfb6eac42761d"
+SRC_URI[sha256sum] = "0cee078d74f0bdc4ec374435026b25de7892f26540a18b22a02ef728a11dcae7"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


