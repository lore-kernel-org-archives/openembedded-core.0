Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB91C677F1
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 08:53:48 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.13627.1677228817619680945
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 00:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XhqY2iSh;
 spf=pass (domain: mvista.com, ip: 209.85.216.44, mailfrom: vkumbhar@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id u10so15743579pjc.5
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 00:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MFd/OLmj3gXfqGNPEoE9H9DOyutf4c8ZSHkRMZQ0AJU=;
        b=XhqY2iShEAiz3ipvSskwkoOte8xcBaUU74Kqt7gtN2mpMa8wtKMgxQy4+grpg8R1Cz
         jPBRwVhUtyG5IdhVZiEAdCBZd7xyrtcxeQ2d6XHZDUwXPrj6MflXifN4P5QpiIrO8CAw
         y8+F2CD5ucoPRXXxusk+0/RefPiuSWKRHdea4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFd/OLmj3gXfqGNPEoE9H9DOyutf4c8ZSHkRMZQ0AJU=;
        b=ZVcudug+qVm+8JsF3b6YwhmCK5SZYpofR8tAIL4O0u4s5DHQ7c8cgmKf4MYSHSbhKL
         NLl1OSAUpF1UTMludLHrWpy/B3eX8WSgt/75TKsSXlDCOvy7KMWH5f3ukCXuoZPAL3zW
         HEbSDBqTsGWq3JLq/GU0lkJ1hxe4jzkxwv5QHhAcLi6iBXslEHS1Tn9eQ7iwvsaBDESa
         83zIebsI5u7o0sxEG0XRbUOliSiQfAZuCCpd1OCYLpvnGKqEt8B3/8olg/coLbZzjmDQ
         bwjFdM1M1S8BhWtGQI8odG6SaVlIUMTAojXdTJOhiUgrHR5vVrjpsHbNQGxgJ5RoHoGQ
         hO1A==
X-Gm-Message-State: AO0yUKXBF9Hbz9mQ8UJuJAbknTWLvxcSWBefm8lcp3zG9/Y8OukMc/h8
	KZn8GyyxVbqzrPROEUW7DxX3leuKW6J4L4dH
X-Google-Smtp-Source: AK7set8RKSRgtWguQihOlDufkPWVBUJ/WZNEs0NtmD3T+QtdT+CVs9FAci6sLrq1JZPigSQGJTi2FA==
X-Received: by 2002:a17:902:7484:b0:19c:9fa5:af00 with SMTP id h4-20020a170902748400b0019c9fa5af00mr9304464pll.2.1677228816583;
        Fri, 24 Feb 2023 00:53:36 -0800 (PST)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.74.166.135])
        by smtp.gmail.com with ESMTPSA id a3-20020a1709027d8300b001994e74c094sm4068153plm.275.2023.02.24.00.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 00:53:36 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] bind: Upgrade bind-9.18.11 -> bind-9.19.9
Date: Fri, 24 Feb 2023 14:23:17 +0530
Message-Id: <20230224085317.2931394-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 08:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177662

Fix below security CVEs:
CVE-2022-3094
CVE-2022-3736
CVE-2022-3924

Fix serve-stale crash when recursive clients soft quota
is reached. (CVE-2022-3924) [GL #3619]

Handle RRSIG lookups when serve-stale is active.
(CVE-2022-3736) [GL #3622]

An UPDATE message flood could cause named to exhaust all
available memory. This flaw was addressed by adding a
new "update-quota" statement that controls the number of
simultaneous UPDATE messages that can be processed or
forwarded. The default is 100. A stats counter has been
added to record events when the update quota is
exceeded, and the XML and JSON statistics version
numbers have been updated. (CVE-2022-3094) [GL #3523]

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.11 => bind-9.19.9}/bind9                    | 0
 .../bind/{bind-9.18.11 => bind-9.19.9}/conf.patch               | 0
 .../bind/{bind-9.18.11 => bind-9.19.9}/generate-rndc-key.sh     | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.11 => bind-9.19.9}/named.service            | 0
 .../bind/{bind_9.18.11.bb => bind_9.19.9.bb}                    | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.11.bb => bind_9.19.9.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.19.9/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.19.9/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.19.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.19.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.19.9/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.19.9/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/bind9 b/meta/recipes-connectivity/bind/bind-9.19.9/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/bind9
rename to meta/recipes-connectivity/bind/bind-9.19.9/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/conf.patch b/meta/recipes-connectivity/bind/bind-9.19.9/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.19.9/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.19.9/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.19.9/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.19.9/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.19.9/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.19.9/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.19.9/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/named.service b/meta/recipes-connectivity/bind/bind-9.19.9/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/named.service
rename to meta/recipes-connectivity/bind/bind-9.19.9/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.11.bb b/meta/recipes-connectivity/bind/bind_9.19.9.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.11.bb
rename to meta/recipes-connectivity/bind/bind_9.19.9.bb
index 0618129318..7bb7bbce7f 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.11.bb
+++ b/meta/recipes-connectivity/bind/bind_9.19.9.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "8ff3352812230cbcbda42df87cad961f94163d3da457c5e4bef8057fd5df2158"
+SRC_URI[sha256sum] = "d8916799832370edeeaa216111b5577675b99d47fc2554e0f93656afa8d5fb71"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


