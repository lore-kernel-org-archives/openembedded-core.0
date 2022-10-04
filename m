Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BDDC43219
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:38 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.12605.1664898679229440494
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=E9ULicA2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id
 i7-20020a17090a65c700b0020ad9666a86so2245880pjs.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=9zKdaVeb4c3mU9OYtHAAN2OARekd6HVOjlqlyFA0IU0=;
        b=E9ULicA2frFAbtenqGb+hZM7YdK0PaCW1Est75+o8pY3/WoOPVZrAJVC/80is4xQ0u
         emCwgn8id2kl/b/d+7R2FtCo2KFmj/J0Jc8wXunHxz1J19SKcYS80AR14WCL1/G8kHdc
         ZlignkudQ/Wal2LqJF7IPbNDyoBp0cV8UiXVRRmG2YgupB6clDa7bKib/uekGSmkzKrx
         7bKIJ6fyxNteF4rnU87kUa5Fv6jL/CLfxpkgyCl8pWeFSKBVSKbN2fyH2APpd/emlAMK
         CpuZpCkXwGerMjoTNJS8mIBfDX763JqSoLXzkhyElT/0zS5ZqlNiy1RXBEtX5ZBXt5V6
         /wbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9zKdaVeb4c3mU9OYtHAAN2OARekd6HVOjlqlyFA0IU0=;
        b=2sd3ZRSzjkrgw4HR8DWjOOhv/Pd2h4cLRHa51OSRgcAgZFPwmb+9wG5Toa3iwhbNWG
         Ec03el6mH3ZU2tzqOUwK3FJZmi4x+np598cpa2buA2/Ln+PESoPr9XVXJ0N+a5CzXQHC
         vzc75SbmKxH8MhyAZWAgoX5fgRmFVONJK7+JU6BJlwl6evsrkf3QftRMrDLaZY3ZPq6y
         mbXcR4pioCpYOtQnhNHO4unXZyfZGBPxUW/98ePo7Ql51rTTFHVh8y26VsoTy6d3u4mK
         bUxh9CKk/uzv8ESxLdh6jJRJ23R6qeb4WCsSyorZzKU6E4KDBXTocVYrMB//ZVEozgzf
         UYBg==
X-Gm-Message-State: ACrzQf36xTe/fqHjFlm0ZiDvdcM0kfa2cx8A5Q9lJK1w5k54eru1tl/h
	Wpib1j87bmA8l6mKRF0Sz/7gkmc2bKUSOres
X-Google-Smtp-Source: 
 AMsMyM6A29zUXpKjVhyEl9w0L9z3Br2RpBa/LwAJTXW+BSbfHnpK9JR6ZWEtkMQuOL7Kmzd/1S2CaA==
X-Received: by 2002:a17:902:b70a:b0:179:f94b:568d with SMTP id
 d10-20020a170902b70a00b00179f94b568dmr27945323pls.173.1664898688657;
        Tue, 04 Oct 2022 08:51:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/18] bind: upgrade 9.18.6 -> 9.18.7
Date: Tue,  4 Oct 2022 05:50:39 -1000
Message-Id: 
 <01710ddade6cf20a5ddbbf9599843e8753baff51.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171417

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

CVE fixed :
-CVE-2022-2795
-CVE-2022-2881
-CVE-2022-2906
-CVE-2022-3080
-CVE-2022-38178

Notes for BIND 9.18.7 [https://downloads.isc.org/isc/bind9/9.18.7/doc/arm/html/notes.html#notes-for-bind-9-18-7]

(From OE-Core rev: 5b87b79c6bb155d23ad4eab3243118b98a3b5906)

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.6 => bind-9.18.7}/bind9                     | 0
 .../bind/{bind-9.18.6 => bind-9.18.7}/conf.patch                | 0
 .../bind/{bind-9.18.6 => bind-9.18.7}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.6 => bind-9.18.7}/named.service             | 0
 .../bind/{bind_9.18.6.bb => bind_9.18.7.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.6 => bind-9.18.7}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.6.bb => bind_9.18.7.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.7/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.7/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.7/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.7/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/bind9 b/meta/recipes-connectivity/bind/bind-9.18.7/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.7/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.7/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.7/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.7/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.7/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.7/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.7/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.7/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.7/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.6/named.service b/meta/recipes-connectivity/bind/bind-9.18.7/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.6/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.7/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.6.bb b/meta/recipes-connectivity/bind/bind_9.18.7.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.6.bb
rename to meta/recipes-connectivity/bind/bind_9.18.7.bb
index 9adcdc2508..11c8a4e9d3 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.6.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.7.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "d43a0fed03c774d1685d203598218c0b7774a88fcc390a0170710d5feb7fbff1"
+SRC_URI[sha256sum] = "9e2acf1698f49d70ad12ffbad39ec6716a7da524e9ebd98429c7c70ba1262981"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


