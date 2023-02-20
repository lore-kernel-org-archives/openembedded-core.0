Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CAFC64EC7
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:18:50 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.14058.1676902729285837393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=JW9T8G1U;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id dw16so420310pfb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lo+puxxMyKevbHJ3baeIrZnG2uNrKsSXDeAxwa3Mm78=;
        b=JW9T8G1UeZLNP4pTt16TsB91EilYcthhftWSOI6ZC88XGp7AV3b6IOfrqSwaSLkzsH
         sHQRAelYZBGp+1Ko4EYx1PzsM5Fy/HG3SqKr5I1JGqtEALMcEacjBUUdcrQ+muQvsLNq
         Vy+3efzwUbr9HrPFHoxmxjb/uogubulCQQP7HonQF1aLpeAnXpQArQkKG1BFdvMmqwGl
         JhkMhImUxDq6tKkXF/EQ28PEMupuN4pREiGi+P4ymRR6l1SG3lNceKpklqIT551Ao7Ro
         M/LU7YAdgXO5beDeRJLOl08JgeMH+FMkpuq3gEYze41Auvg7QsvdKOmKXFxYIoH3stbj
         Ftow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lo+puxxMyKevbHJ3baeIrZnG2uNrKsSXDeAxwa3Mm78=;
        b=RIQ6HtC2guwkyrzgZe0xRijLKsAsk+6Lk2SP3gzEY3djSDD5f8zupBu1V+zfkdnleg
         thv8rVqp5niStym8uycuf3upcZQSRu8xJn9vQnxzF0CtGq3qOi/Xfu838iJFJG9zd0BO
         lLsdtgE5d3q2ZbiFK7h41rYs46jyooOKoh+0gv9NXFZo0fmqiLisgZBRSyJ7KOoiDI6O
         efW9Pc9ieMBOppE84VS3+UyIBe081646m9ByqVLGrtp7YhM3YxPsm1GhuDksFvNx3zIP
         fTIsG69zy07xBQdMq4+Cpv9jQy+vOf8w6X08KOcKLffxR8n0E6cOZBdJUf7eqQn+OxNb
         ShCQ==
X-Gm-Message-State: AO0yUKWEHtsXBzbdR9ozcrQvtDyC1/pbb1gty4mbfZsk1b+YRyBgyfcr
	lGT1H8n3ThpWpx7DJfGYhdixkDsGhmXGa6DYA1U=
X-Google-Smtp-Source: AK7set/Xi8S0M1IgU6y8xei3pX/YjxZcIaELR3EeOtaly3Rnequa/kO2ZpUffTPWlVXOx2R0ckWzgg==
X-Received: by 2002:a62:1513:0:b0:5a9:9263:76ec with SMTP id 19-20020a621513000000b005a9926376ecmr2070026pfv.9.1676902728241;
        Mon, 20 Feb 2023 06:18:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.18.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:18:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/22] bind: upgrade 9.18.10 -> 9.18.11
Date: Mon, 20 Feb 2023 04:18:13 -1000
Message-Id: <3aea7767cc0c3eceb748699ecead324fab4284a3.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177412

From: Alexander Kanavin <alex.kanavin@gmail.com>

Stable branch update

License-update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 63e8a8952c3d1b3b5c481be6bba52a3f4d65648e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch             | 0
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 0
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 0
 .../bind/{bind-9.18.10 => bind-9.18.11}/bind9                 | 0
 .../bind/{bind-9.18.10 => bind-9.18.11}/conf.patch            | 0
 .../bind/{bind-9.18.10 => bind-9.18.11}/generate-rndc-key.sh  | 0
 .../init.d-add-support-for-read-only-rootfs.patch             | 0
 .../make-etc-initd-bind-stop-work.patch                       | 0
 .../bind/{bind-9.18.10 => bind-9.18.11}/named.service         | 0
 .../bind/{bind_9.18.10.bb => bind_9.18.11.bb}                 | 4 ++--
 10 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.10.bb => bind_9.18.11.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/bind9 b/meta/recipes-connectivity/bind/bind-9.18.11/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.11/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.11/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/named.service b/meta/recipes-connectivity/bind/bind-9.18.11/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.11/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.10.bb b/meta/recipes-connectivity/bind/bind_9.18.11.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.18.10.bb
rename to meta/recipes-connectivity/bind/bind_9.18.11.bb
index cb0e251d51..55a06eae5f 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.10.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.11.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
 SECTION = "console/network"
 
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9a4a897f202c0710e07f2f2836bc2b62"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d8cf7bd9c4fd5471a588e7e66e672408"
 
 DEPENDS = "openssl libcap zlib libuv"
 
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "f415a92feb62568b50854a063cb231e257351f8672186d0ab031a49b3de2cac6"
+SRC_URI[sha256sum] = "8ff3352812230cbcbda42df87cad961f94163d3da457c5e4bef8057fd5df2158"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


