Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB50C54EBC
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 16:22:01 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.28308.1673454111734448976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 08:21:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FTA5l5oH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id n12so16393173pjp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 08:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ho3aiLEwdE2wC7Id8k5qUbKLKsLB0LE/mTYZa7YrUns=;
        b=FTA5l5oHgcA9z4BKMPXLAdf2CeeXIBzoLP4vzlUchNka8NFii0+onjnbT4T6Q8mgVy
         dip90m04jKlrPYFnBf6SpS4GroIqb0QVxX/w75xL2q/5SaiCivNfwdHdTRs8GrfmFtY0
         S5edaiXHtgRtQo6KiOQCQ64YZa1j7cXQzL8GMjz9holHjCVjmHT7ZGH2rX7RwX/yCWnT
         UDzUn9De5pdP9uo84owO0kU59EYfMOCPOL49k6rgcmg73OWw32e5Libfh37buIVpO4Jj
         y2JCKbucrlTPEExzWntZ9N3yVNXCd7+jIAfwSTC4mioqefzVGAdj8EXaju8L1LKjOoYW
         IiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ho3aiLEwdE2wC7Id8k5qUbKLKsLB0LE/mTYZa7YrUns=;
        b=DwnUsQ1tNZTW5mYgl4ugzBMvVNf7aLL/G5Zgb6nhxghc7JDgmODb5SwAeKqbDXYrWW
         z4MFTZjKfwONB+PrKGKDCOzR52wdqBo8XrOddagcHaFcPz+MW/shORgBs4cq67JaqbnV
         cVqmGt5k0iuOVQBiIiFKx+mjgRyTdffHujcGi4VdEAc3Bh+BS+ZwwAAEYlqusQD3gH80
         c1ne/QZUFdFti4WIgRwgwDgUf81zXBt5tv7xQnAabK5iZtvPszNX+TtESq57PqtUo8nE
         K8+3oqvVioMFx7fzf5dDF+/6keA76s7raCL00Aw/4fzael3lMD7M3HGBluHJ1K0kBHPb
         JhdQ==
X-Gm-Message-State: AFqh2krNxOtF2oUESQ4WB16owGMxxq2oCwmvUlQOfcrIJQPv5TRz0siv
	UNz6rf6j/t64zp9A9N2l6BcmHr5hiTNTC9XDOz4=
X-Google-Smtp-Source: AMrXdXuiPvuMDc+nkCafkRlFIHd58CwxPLDaJk8AP4s7UBr+mh6bxUkmutcFu+oQ4tZdkzF5GQCf8g==
X-Received: by 2002:a05:6a20:b047:b0:ac:10:adfe with SMTP id dx7-20020a056a20b04700b000ac0010adfemr67754759pzb.30.1673454110624;
        Wed, 11 Jan 2023 08:21:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id u14-20020a63ef0e000000b0046feca0883fsm8685384pgh.64.2023.01.11.08.21.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 08:21:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/11] bind: upgrade 9.18.9 -> 9.18.10
Date: Wed, 11 Jan 2023 06:21:30 -1000
Message-Id: <6c2b904f22a629880681a26550022764c170541a.1673453368.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673453368.git.steve@sakoman.com>
References: <cover.1673453368.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 16:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175760

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
index 160986eb53..cb0e251d51 100644
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


