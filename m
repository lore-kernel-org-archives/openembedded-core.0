Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04C9C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:24 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.30311.1683300016327531134
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vREOgivD;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5144a9c11c7so1703825a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300015; x=1685892015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SM0Vkl73P/jfe4UdQO77uBCydwNEhmyacy+MTCyTrAM=;
        b=vREOgivDRyV71mZaYt69D7pitqvkw9lrEZfvf2t2OXnEZQqKOhSlYWqkv4kUqRBNmn
         80YMqGrYREZC2C+uxKWOb77fRuwNWuu/PpIm9NOIHtx3XgoQuQB7lGhx6q0hU96kw5nC
         BfrY1Dv8igWR1MI5XSMggZNrbhjt6KmhKqp1o23uK3+GTfPFLbY4KkqSNOSzuAC//tdU
         zQEEl24GKFtl2awMN82umGRDzHeIk7ru4wzfsrxuIMPdXeLzdreb4P2hLL6nt1PlxdEM
         /huvG/Yh03zou+ww7fIhR867mdZjZX22Deru7X5/AnXQZpyrG+1yemzwir/2yjb+eih6
         9VIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300015; x=1685892015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SM0Vkl73P/jfe4UdQO77uBCydwNEhmyacy+MTCyTrAM=;
        b=Pc5wWLb2l6L96mOLKm4RS6mKxoElmpkHkvSxkgdw3nlkz1RgYG+Vpo5tu+sVVheQUa
         3hQPN9NHq7C6zygZ8VMyqf5IDNn9J4JFyk4A8IA+YY113an2BcCUqY//Z2at6zhf7Dot
         lHz9pOr2ocDilWUXlC9RgoI/9oXMdEuu5E8PxZbHeX3QEdJqnn13RTvRG7XS8l1d8Vy4
         X2mrr9yO5GWgN7l6bZssxIn3PO3pjalSkB/vS+pdtwLf767b/3bm21/APYwDkBDUzDGv
         6jaDxTtKbEbkkf4Q2fwFWcIFhAToDelaZqqoxBtV9/rApVdYesjJorvntMlqxddMw+Vb
         qV5w==
X-Gm-Message-State: AC+VfDzii1znefTH2K5bpoKxTrxtwow8qmLxVFVNSyKRqyJNRDAinefy
	yMinvpGdRKfN1GJgElFxBjxc1GBH/90jR48J52s=
X-Google-Smtp-Source: ACHHUZ6xYLl6rTzp9IJg6zrY2lIvF6F1DhqKqLGUGKDf9AUES9ccMd5rhBWItAx+JduEg+Kx5Gr2sw==
X-Received: by 2002:a05:6a21:6317:b0:eb:6e43:8e1b with SMTP id wu23-20020a056a21631700b000eb6e438e1bmr1914778pzb.30.1683300015250;
        Fri, 05 May 2023 08:20:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/35] bind: upgrade 9.18.12 -> 9.18.13
Date: Fri,  5 May 2023 05:19:18 -1000
Message-Id: <29010c32f0e0f00b31e32a7c275a532688ddaf9d.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180927

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
[bug] Use two pairs of dns_db_t and dns_dbversion_t in a
      catalog zone structure to avoid a race between the
      dns__catz_update_cb() and dns_catz_dbupdate_callback()
      functions. [GL #3907]

[bug] Make sure to revert the reconfigured zones to the
      previous version of the view, when the new view
      reconfiguration fails during the configuration of
      one of the configured zones. [GL #3911]

[bug] Fix error path cleanup issues in dns_catz_new_zones()
      and dns_catz_new_zone() functions. [GL #3900]

[bug] Unregister db update notify callback before detaching
      from the previous db inside the catz update notify
      callback. [GL #3777]

[func Run the catalog zone update process on the offload
      threads. [GL #3881]

[func Add shutdown signaling for catalog zones. [GL !7571]

[func Add reference count tracing for dns_catz_zone_t and
      dns_catz_zones_t. [GL !7570]

[bug] Detach 'rpzs' and 'catzs' from the previous view in
      configure_rpz() and configure_catz(), respectively,
      just after attaching it to the new view. [GL #3880]

[test Don't test HMAC-MD5 when not supported by libcrypto.
      [GL #3871]

[bug] Fix RPZ reference counting error on shutdown in
      dns__rpz_timer_cb(). [GL #3866]

[test Test various 'islands of trust' configurations when
      using managed keys. [GL #3662]

[bug] Building against (or running with) libuv versions
      1.35.0 and 1.36.0 is now a fatal error.  The rules for
      mixing and matching compile-time and run-time libuv
      versions have been tightened for libuv versions between
      1.35.0 and 1.40.0. [GL #3840]

[bug] dnssec-cds failed to cleanup properly. [GL #3831]

[bug] Source ports configured for query-source,
      transfer-source, etc, were being ignored. (This
      feature is deprecated, but it is not yet removed,
      so the bug still needed fixing.) [GL #3790]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 51ab191224aa1320d622bf79184940afa3910d60)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.12 => bind-9.18.13}/bind9                   | 0
 .../bind/{bind-9.18.12 => bind-9.18.13}/conf.patch              | 0
 .../bind/{bind-9.18.12 => bind-9.18.13}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.12 => bind-9.18.13}/named.service           | 0
 .../bind/{bind_9.18.12.bb => bind_9.18.13.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.12.bb => bind_9.18.13.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.13/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.13/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.13/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.13/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.13/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.13/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/bind9 b/meta/recipes-connectivity/bind/bind-9.18.13/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.13/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.13/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.13/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.13/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.13/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.13/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.13/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.13/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.13/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/named.service b/meta/recipes-connectivity/bind/bind-9.18.13/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.13/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.12.bb b/meta/recipes-connectivity/bind/bind_9.18.13.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.12.bb
rename to meta/recipes-connectivity/bind/bind_9.18.13.bb
index 68dad77cdc..8617137e87 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.12.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.13.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "47766bb7b063aabbad054386b190aa7f6c14524427afd427c30ec426512027e7"
+SRC_URI[sha256sum] = "3b06b6390c1012dd3956b1479c73b2097c0b22207817e2e8aae352fd20e578c7"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


