Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D82EC4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:28 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.12356.1664898687674186702
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YRvG3omV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id f140so8219948pfa.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=+rxncuUMMpjOkfvtjy1fAhQ4r3zrDyOrTcb/JQKulNA=;
        b=YRvG3omVzdDmYbD3MV73rmhhpNSom6rfp5YAhgbKmjqb0suHGStmbG2YNAJMrnG33O
         keBtlQtDAmlm1B87mk60EW2DNLLi+CyhhWj7BS0lpIxQhpdhYclW/byWmOKKVTRHbxpn
         Dn+38bBMFQzBlRieMWDhDUSYvezMyO+DIAWch9g/3gD+IsMural4oIOTdk92G3lcxTx+
         hIjqR7nc432rVDfYAJ4aDr4o1o5Xn1kAWwH7F30KeiyMoJUtKzc/cBFIHOagNh13/kfV
         rKlm6XYKK6MyQCiLPIAZFGEydQfVqTJFb7cX41A0UZLl8DLleKxBJigOZ/1yKUsRPLt/
         pKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+rxncuUMMpjOkfvtjy1fAhQ4r3zrDyOrTcb/JQKulNA=;
        b=ueKiew//45dfC+02lDno85vamYV/iiWLEWPUFcis9AG9aXWqd7K5TibfWPFt3YqC7d
         7kcJOV60CrvPkuNWo0Tz1qeeupst6eO4+cPfauUQ7Mtpi975vpHrjwYVOwmkcruMb11i
         rYhsyzmlWj7XgaZOI25auRM3FzJ04uOk6z73rORIF1L/0+9rJ8ecfClvGJSnIe6ynT79
         w/c/Pe4pfgWoRsytFg0e9bLRh1vYXTTocUP1yMGZ5I1EuhUmm5fE6BusQvLEj5Lk1oXh
         n7T4rK9Fu7xL0SLFmyvR0Ge20Rq7jNAYeuHHwOi/X5YnVAA1HD0/MA8T4Tz5+nx7Cl1l
         FglA==
X-Gm-Message-State: ACrzQf1uKmiLREvNFiUuHfktQudpJvJIp7kopEJieSvCxSV2XYU7lu4Y
	o6m5KFCskA6kZZoLQy1X+wspvtSDambeQHE0
X-Google-Smtp-Source: 
 AMsMyM6AQPbnxBR9aLYXZjLUh8BdScdOX5+f/NqhEJtDkKg+NYfc3or196p1MgG9ysPfTNeWSqnW6g==
X-Received: by 2002:a63:4651:0:b0:43c:1cb7:5c09 with SMTP id
 v17-20020a634651000000b0043c1cb75c09mr24511832pgk.259.1664898686599;
        Tue, 04 Oct 2022 08:51:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/18] bind: upgrade 9.18.5 -> 9.18.6
Date: Tue,  4 Oct 2022 05:50:38 -1000
Message-Id: 
 <daae4cada71b197a353b7f0446d43f98e17bcbaa.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171416

From: wangmy <wangmy@fujitsu.com>

(From OE-Core rev: f7061fc14cbc4388b1fd0cf6233b1a2e743e20e5)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.5 => bind-9.18.6}/bind9                     | 0
 .../bind/{bind-9.18.5 => bind-9.18.6}/conf.patch                | 0
 .../bind/{bind-9.18.5 => bind-9.18.6}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.5 => bind-9.18.6}/named.service             | 0
 .../bind/{bind_9.18.5.bb => bind_9.18.6.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.6}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.5.bb => bind_9.18.6.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.6/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.6/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.6/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/bind9 b/meta/recipes-connectivity/bind/bind-9.18.6/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.6/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.6/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.6/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.6/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.6/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.6/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.6/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.5/named.service b/meta/recipes-connectivity/bind/bind-9.18.6/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.5/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.6/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.5.bb b/meta/recipes-connectivity/bind/bind_9.18.6.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.5.bb
rename to meta/recipes-connectivity/bind/bind_9.18.6.bb
index 28acecc507..9adcdc2508 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.6.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "0cee078d74f0bdc4ec374435026b25de7892f26540a18b22a02ef728a11dcae7"
+SRC_URI[sha256sum] = "d43a0fed03c774d1685d203598218c0b7774a88fcc390a0170710d5feb7fbff1"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


