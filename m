Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFDEC19F28
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 00:41:36 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.14472.1658882489173289514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xLEX+TJB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id e1so4337545pjl.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QngP10n1UpLQ1mvCkG6BIyKYpS0AszeTJqIB02iFY5A=;
        b=xLEX+TJBNg9IvOKVTLT1fR2n47qydtGrPP8AKIYxfuSgZpZvBAXStYXU5SVAa9rZp3
         kw9KMXlvtqEJwYnA4vXmqImlayAYDOfkBWQhp1MlnrT+/eq+5TsjgMwkvsAoW3BM1GUJ
         s99Sc14Br2r3CxVo7rQ83cnclIjmCS61ts7MYZHdlMVu51eJWIingh0zA4H+4jXacAVF
         3bns7AVydtZ9Fx4nrxuMyj10z4myj9rwmheVfdtz76LIgAd/swzL4IqZGcg0ZpZUDgWa
         D2Z8Ik/B7OPhHbutlR+T/0pLLA0qN5jkzN6WeYWjMoI9urhg7/fHGfh/YbfQbxdIxyrD
         YXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QngP10n1UpLQ1mvCkG6BIyKYpS0AszeTJqIB02iFY5A=;
        b=rGiLrVC1B8RSYBfAro/DX+Im3GrrStdZJwzZB9fQEolsvKfrwOcWd0aK6VOFNwxfsh
         F17f0RkxzkvrKWrVlMH5ruWSy7nSNX/CmD2i4rAx1iGPiqwp3lc6TarH6eHAFdhgJBYG
         1Cchy84DvgJ99t2/2/EHmZc13eq8V5KAd4AFKOsFUdyUT1IbOotVu3fQTlAeKgjr+u9X
         NWC5MP0r0oNa8UCxZkyAeGwjTQk3QBWS6dq/oQAXks2VQwHFqCgrj+IJx5aADsJVs/qt
         cOLB6i+oDpK9v9Mt0GSi/WOMKQ85YsqjeKq6aWrkuxT+ggJF4T7zEulWtv4FBzhk6v6w
         +3lw==
X-Gm-Message-State: AJIora9pwzYUPlfO5ZFp9U6V9/lvlLtevxOB4LAmbhDoztTTUXyWpbjw
	Q/d+M6+ZNwPvFO9ZEfHdPcSN5ZpNJnSqkMR6
X-Google-Smtp-Source: 
 AGRyM1vw2GFHN11Ks3YkgBgzz7cAKZM44Gy216qgfsKhTa35RuwI3VSwc4sMd2VyXSVeKcHOeYhvUA==
X-Received: by 2002:a17:90a:fec:b0:1f2:8c1f:210b with SMTP id
 99-20020a17090a0fec00b001f28c1f210bmr1677364pjz.114.1658882487945;
        Tue, 26 Jul 2022 17:41:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b0015e8d4eb219sm12356278plf.99.2022.07.26.17.41.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 17:41:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/15] bind: upgrade 9.18.3 -> 9.18.4
Date: Tue, 26 Jul 2022 14:40:36 -1000
Message-Id: 
 <5bfb44bff5d296b8fd447acb7bdb29b544bd1c20.1658882276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658882276.git.steve@sakoman.com>
References: <cover.1658882276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 00:41:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168528

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
[func]          Don't try to process DNSSEC-related and ZONEMD records
                in catz. [GL #3380]

[func]          Add some more dnssec-policy checks to detect weird
                policies. [GL #1611]

[test]          Add new set of unit test macros and move the unit
                tests under single namespace in /tests/. [GL !6243]

[func]          Key timing options for 'dnssec-settime' and related
                utilities now accept "UNSET" times as printed by
                'dnssec-settime -p'. [GL #3361]

[bug]           When the fetches-per-server quota was adjusted
                because of an authoritative server timing out more
                or less frequently, it was incorrectly set to 1
                rather than the intended value.  This has been
                fixed. [GL #3327]

[bug]           Only write key files if the dnssec-policy keymgr has
                changed the metadata. [GL #3302]

[func]          Key timing options for 'dnssec-keygen' and
                'dnssec-settime' now accept times as printed by
                'dnssec-settime -p'. [GL !2947]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d5a12d549209f01324d03963db96449ee43452eb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.3 => bind-9.18.4}/bind9                     | 0
 .../bind/{bind-9.18.3 => bind-9.18.4}/conf.patch                | 0
 .../bind/{bind-9.18.3 => bind-9.18.4}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.3 => bind-9.18.4}/named.service             | 0
 .../bind/{bind_9.18.3.bb => bind_9.18.4.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.3 => bind-9.18.4}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.3.bb => bind_9.18.4.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.4/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.4/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.4/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.4/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.4/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.4/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/bind9 b/meta/recipes-connectivity/bind/bind-9.18.4/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.4/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.4/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.4/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.4/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.4/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.4/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.4/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.4/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.4/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.3/named.service b/meta/recipes-connectivity/bind/bind-9.18.4/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.3/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.4/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.3.bb b/meta/recipes-connectivity/bind/bind_9.18.4.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.18.3.bb
rename to meta/recipes-connectivity/bind/bind_9.18.4.bb
index b511b77f2e..5af2022129 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.4.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "0ad8da773bd93cba0ef66cc81999698ebdf9c3e51faed5e5c8c1eb75cad2ae6f"
+SRC_URI[sha256sum] = "f277ae50159a00c300eb926a9c5d51953038a936bd8242d6913dfb6eac42761d"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


