Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDB1C3F6B0
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:42:56 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.22450.1659940971095808254
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bzY467xk;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id j8so14771349ejx.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TLFpAg7qwGg/myR5Xfj43gryFmUt8qMZ/G/yiusNDN4=;
        b=bzY467xkOdTkRDRxcD1l+QPICGdHlt1XGP1cjsNTY4J/pOH+K37y8z/2YQ33Fgmex/
         z2gfFQ9D77L2i3YEF3Fy4nxZhFR/7r3yNAhsE7uQx3g06JPPGAF3LIrHTodJyonmDCO3
         6xgK1SKadO5XQOdR5/hQf1JpFYIIxmIZFRAc2srB3fZPv4So+jfV/VRNWnXjuozci4xb
         +qjSQhy47ccUFXUuOdzfOWbG9ckxcdL4QkmLWG8YWHhgTI8Ny8YRag3rcb/jw67Hg2Xz
         05eMHJ9aIHEA+r2XHKQ4e5bz0R1FgfOOXGeaUwWPcl2uJ3MM2ZiMti515GQJ4ry9GImC
         QUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TLFpAg7qwGg/myR5Xfj43gryFmUt8qMZ/G/yiusNDN4=;
        b=OF3/5TPVilewJrb5ghdWoQooBXoh3I7nbpMuw+by0eNnwUST6tO7SYqBd0xv6tVeVg
         /B5j+RkxaqZcyFkzkRiTYaT9KvJm/0slmZ/C0rrQYKL8IW7uMLNjHZlJuHiJ1iTZK4nr
         0C1af/YODRHg/ZucvDv6IlmfAks5kO1UEizfiwShzjN1LGhFntB2qwD5tWjSzT72Sm9K
         erlpx0nalBKWrxSkmxE1eX+X60ImgG0yhPe1DZkkNNA6fjAJoiuVkgF4NZAO5S49NoQ+
         hGuF1GCvailjQ+mAz6VQV9ducSiMtFy83F/Yl8KyzseIJA8yqGtrvI4SaWxpHOTJ0EHE
         vG5A==
X-Gm-Message-State: ACgBeo2SoiNX/95bC2zbpQJrOVbYO9sxuhduVWPS6sfMpH67ia/DDgYw
	XaEWeoFPwv7SJwMMrKs8NfzBy1KvEos=
X-Google-Smtp-Source: 
 AA6agR4z0ORknVdYuOyVw4fHRJn1674OKN+z/GLYHUC94mySx+57rAasbv438bOvaU8I9v/RxIVA/A==
X-Received: by 2002:a17:906:6086:b0:731:3970:48d0 with SMTP id
 t6-20020a170906608600b00731397048d0mr5364789ejj.16.1659940974535;
        Sun, 07 Aug 2022 23:42:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 15/44] bind: upgrade 9.18.4 -> 9.18.5
Date: Mon,  8 Aug 2022 08:42:08 +0200
Message-Id: <20220808064237.3975347-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:42:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169038

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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
index 8c62fc771d..6059ca6a33 100644
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
2.30.2


