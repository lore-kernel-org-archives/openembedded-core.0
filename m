Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B3AC678D5
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 02:33:34 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.45161.1673490812585027949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 18:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PtvrKRjI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d3so18777026plr.10
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 18:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYSbgHrKl+OV0kkgR/HMmmwmDuL46j8qMFbCPapU9w4=;
        b=PtvrKRjIAdKess8tKBZSYbsNWwvzRL3b5q4W6gR9OdixkDO3vHbEJw7eCMOAPf2sHN
         OxLzAPPBhgyOqYROMze/bKEYJeYUMvXg7HOJ9kmQbpC76TniINi0aCvAUVC6s1ziT+xm
         beSCZ5eWperULN+fRe8n4JhwM1MxodxqrwWplKsWIiXrTfa47O8EjzaQf3kmBh/5JokS
         B1ftMaHEAYku5r+O+gWAW7MonFb3rn5+H1glwUWpsKkLDe61t0qaWlEBHHfIsnVTN4DO
         gN897zDtoOAc3WT8Ypw5tMDJ5cC0hqjEbyb/vZ8meYtzGlYMKn11b+JK0FePARN/4RdR
         4jHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYSbgHrKl+OV0kkgR/HMmmwmDuL46j8qMFbCPapU9w4=;
        b=EkeVdmnpgXYkbobU8hLd3YYuyyNcpD9Gj4/qPQJVxSHgdm5tHIFN9qqhZBslxQqBnV
         HCdvZQmLT1UqAtaQ/x4A3+YKFEc0Gt8d8d5BA4HBfQMaDRDscHmSXNuBZ18GkX/ItvNT
         3XJlzaWRX1bjXmjy4+LPqZG5Q81PTRH3hmoFfwsEXazdpzqcfXbQ182bzP3Xshtn6ZnC
         pZUfArent2ffrrPpf5P1wiZaUNyiGLd+k0Myfj1G1NVN+lP/DiXrWE+pgBE0tA2ZOmr4
         E2IXI7enC6iV3u23MwCKl3eAnnFrOYtWDEhjvrLcM1Bm65iJ9GYlTGFS1nVdLGQ+bUTi
         gKyw==
X-Gm-Message-State: AFqh2kohphDd8jrkrYZRfr01WggF/BgfPsS7i53UnrlzbWFrFS+3LvSv
	4/Qz+QSpXkwyHz+VTzNZTxlmbr2eha44kwVD6dg=
X-Google-Smtp-Source: AMrXdXsTfYzF/mNIbtw/jbBNz9V+0UzWRMo7knP6zY00y5i3+eufxK5EaGQYCuPdnXREQz/M4vEBnA==
X-Received: by 2002:a17:903:230a:b0:189:d3d9:9308 with SMTP id d10-20020a170903230a00b00189d3d99308mr101120251plh.34.1673490811506;
        Wed, 11 Jan 2023 18:33:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902cecb00b00192d389db91sm11006719plg.75.2023.01.11.18.33.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 18:33:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/11] bind: upgrade 9.18.9 -> 9.18.10
Date: Wed, 11 Jan 2023 16:33:06 -1000
Message-Id: <180b8b72513dcfe23bb75d00a7ceb1dfeffa8279.1673490673.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673490673.git.steve@sakoman.com>
References: <cover.1673490673.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 02:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175778

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
The key file IO locks objects would never get deleted from the hashtable due to
off-by-one error.

ANY responses could sometimes have the wrong TTL.

Speed up the named shutdown time by explicitly canceling all recursing ns_client
objects for

Removing a catalog zone from catalog-zones without also removing the referenced
zone could leave a dangling pointer. [GL #3683]

nslookup and host were not honoring the selected port in TCP mode. [GL #3721]

Deprecate alt-transfer-source, alt-transfer-source-v6 and
use-alt-transfer-source. [GL #3694]

Move the "final reference detached" log message from dns_zone unit to the
DEBUG(1) log level.

Fix assertion failure in isc_http API used by statschannel if the read callback
would be called on HTTP request that has been already closed.

Deduplicate time unit conversion factors.

Copy TLS identifier when setting up primaries for catalog member zones.

Deprecate 'auto-dnssec'. [GL #3667]

The decompression implementation in dns_name_fromwire() is now smaller and
faster. [GL #3655]

Use the current domain name when checking answers from a dual-stack-server.

Ensure 'named-checkconf -z' respects the check-wildcard option when loading a
zone.  [GL #1905]

Deprecate 'coresize', 'datasize', 'files', and 'stacksize' named.conf options.

The view's zone table was not locked when it should have been leading to race
conditions when external extensions that manipulate the zone table where in use.

Some browsers (Firefox) send more than 10 HTTP headers.  Bump the number of
allowed HTTP headers to 100. [GL #3670]

NXDOMAIN cache records are no longer retained in the cache after expiry,
even when serve-stale is in use. [GL #3386]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c093c38e247b522f279f616d16373795a4cdf89)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 410d69c684ba4eb6dd279a40436043259f94b6b9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.9 => bind-9.18.10}/bind9                    | 0
 .../bind/{bind-9.18.9 => bind-9.18.10}/conf.patch               | 0
 .../bind/{bind-9.18.9 => bind-9.18.10}/generate-rndc-key.sh     | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.9 => bind-9.18.10}/named.service            | 0
 .../bind/{bind_9.18.9.bb => bind_9.18.10.bb}                    | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.9.bb => bind_9.18.10.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.10/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.10/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.10/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.10/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/bind9 b/meta/recipes-connectivity/bind/bind-9.18.10/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.10/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.10/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.10/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.10/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.10/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.10/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.10/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.10/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.10/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.9/named.service b/meta/recipes-connectivity/bind/bind-9.18.10/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.9/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.10/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.9.bb b/meta/recipes-connectivity/bind/bind_9.18.10.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.9.bb
rename to meta/recipes-connectivity/bind/bind_9.18.10.bb
index b95b900069..2432131f5c 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.9.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.10.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "6a9665998d568604460df0918fc8ccfad7d29388d4d842560c056cc211cbb243"
+SRC_URI[sha256sum] = "f415a92feb62568b50854a063cb231e257351f8672186d0ab031a49b3de2cac6"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


