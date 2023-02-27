Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB7AC6FA8E
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 03:29:29 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.82470.1677468568997410281
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 19:29:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dX85XAbL;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: vkumbhar@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id 132so2709174pgh.13
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 19:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GM/4vkQfh5LQ9MMaugShj1d4GmQ21yC359FeYofJNs4=;
        b=dX85XAbLDzWHbYayuY++5DNBB9fwy0CBjoz85p1VFWZDO1P1de4SG8b3jV7pP+yg4+
         H8XOSZ34Akj0S83QMA9Xcdo6eykF8rv5N7fqG4qHR2eSNpJPo+jaClay4xtrZbehtOg9
         Ad5HPl6NdgdmaqFe9CFyrNzQVVPJpSN/0O3VI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GM/4vkQfh5LQ9MMaugShj1d4GmQ21yC359FeYofJNs4=;
        b=2czVV95xBDIGwilsDF1xc2eGA/hFWF4ygIkR04rGyaQveA0Ofbj9W4ntw4pgTzVxW4
         jlhWXnnQLOrFSvtZVgQcYY/ZPxDTkLtel8uNtc9emwCZH+u+ZiQ5+KEJG5tSla9dhhG6
         soTVrWYdC1FsGzTC3tiF1gz/U2IlKxREoJQ6WGaY0zyt9M42+uIx5hOn+JxmZVi/SMgE
         WCDQ+9V7h1T6UDnyI/GugBtZS+Dgtjdg4lwzKGGqMGhQSPYFiTZxVLGZ/0w3OQv6/R3b
         GIIDifrPYdV7FHyIJXzWYPJEaRB5Jek0JdSc8BGWIoZWu6azTrqWIEVjPI6jBVmJU4eu
         5fyA==
X-Gm-Message-State: AO0yUKUW1iZpX7JHaTeEQth8kwi7CcUEhMGDpRrxbfSCvXjXyIksNThq
	NqEjx8xb8lxwzwNXJSI0RnZuDozWGVgPSF9c
X-Google-Smtp-Source: AK7set8/nE1MEJP1XYAB7Kx9X5QaWXEXt+C6kkuplmbVgvQ20N4OIsEmxviTZkeRmLgCHXqoAstosg==
X-Received: by 2002:a05:6a00:9aa:b0:590:7330:353c with SMTP id u42-20020a056a0009aa00b005907330353cmr8358782pfg.6.1677468567927;
        Sun, 26 Feb 2023 19:29:27 -0800 (PST)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.75.163.148])
        by smtp.gmail.com with ESMTPSA id l12-20020a62be0c000000b005da23d8cbffsm3083928pff.158.2023.02.26.19.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 19:29:27 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][master][PATCH] Upgrade bind-9.18.11 -> bind-9.19.9
Date: Mon, 27 Feb 2023 08:59:17 +0530
Message-Id: <20230227032917.6940-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 03:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177771

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
index 55a06eae5f..375f24e222 100644
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


