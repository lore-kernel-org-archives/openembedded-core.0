Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE2EC7618D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:02:00 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.8792.1678888913174123509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=YJmxzZmr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso1791171pjb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5WDytCACUHNdbdmGc4drXNeaWu2rIHTEdgV/mdGzew=;
        b=YJmxzZmrGGxeoSE33krx6+NdCvmUakdgBN6GrMzSQ0tvVSCLoUjExKhnvAQzasrFEj
         NOHz8uHf8nGCwzWk0bxLvzWQHqy0zL053lHnYXxFVzNJWusMb1sQFFUJRn/m4YaWSPxa
         GNQ3iwxwQAlQKQb436q+iQ6Uw71D4fUbN/juNL3uY1qcYWHGLiiJvFlWIm8hd50pEQsr
         V1IVhhyZs2eMEDaQoJp7CjQZEf3ltABWbuyZyagNthvL6EbQb6JOpSRT+qeecjZblKDb
         PSQo3FCI19E6ZgTAeZBjJpuNW0SE7LlvM1o7e3tmvwlG7goO6ZOPGHAwo27pi2qRaXJL
         LTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5WDytCACUHNdbdmGc4drXNeaWu2rIHTEdgV/mdGzew=;
        b=sIoCzCJ7oUElbeo3NcjBVNu72rBp+rr1XbDV9RxdZhSPrTrU6NIZGk66hqbDpdjkWr
         5UpD4EyaWUGKrQUPhqVYFVg+KYmKMzgooavbjFJFweTdGNJC/+9dRJ8Xl6NaAyZ/JCeg
         rwAE5RKXpM4/K2LwKxXOp3U2KfUjgi9AWdDpbhfeUDGQNRaXoiY8cWOYh1PMgAWXgcy4
         vYOxrGnQkRCUFKhJFL5tKhiXoIcMGf6xIyBJxAkA0+UW4DPtAKZJ7kG1Q15V1IkBoe9H
         J5eYQFxlgnhPUcXMilabIsRyo6lQ7FTqcfCkRXpC6J4UGcvHKSWG/sx86Q4LaytGl8qA
         efWw==
X-Gm-Message-State: AO0yUKWInd8dldgepsibffmJa51WkNF6NCFc9LDzlljgiR9/3ayXCdKz
	w3kgZpi14Zj78OdFi5Bt4Vq0Tk6I/y1AbQuvbxM=
X-Google-Smtp-Source: AK7set8VJ1MMBolGtDyb7UhA+agM9bi/Is4rAIHgUcpSaMVLJ7c3Qk66S+YNcsyj/Js5lUHCIKS0dw==
X-Received: by 2002:a17:903:138d:b0:19b:2332:18cb with SMTP id jx13-20020a170903138d00b0019b233218cbmr2513341plb.1.1678888912115;
        Wed, 15 Mar 2023 07:01:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/22] systemd: add group sgx to udev package
Date: Wed, 15 Mar 2023 04:01:07 -1000
Message-Id: <3fd47697df858d4093d9cb4c6a378fc07aa4d064.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178567

From: Peter Marko <peter.marko@siemens.com>

>From NEWS for v250:
* Device nodes for the Software Guard eXtension enclaves (sgx_vepc) are
  now also owned by the system group "sgx".

>From NEWS for v248:
* Intel SGX enclave device nodes (which expose a security feature of
  newer Intel CPUs) will now be owned by a new system group "sgx".

Fixes following journal error entry during startup:
  /lib/udev/rules.d/50-udev-default.rules:43 Unknown group 'sgx', ignoring
This is seen already on kirkstone.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bab455cd9b1b82e778f8523a767eb281edf6689e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/files/static-group           | 1 +
 meta/recipes-core/systemd/systemd_250.5.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index b13dde3218..cbec6f1377 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -24,3 +24,4 @@ weston-launch:x:524:
 weston:x:525:
 wayland:x:526:
 render:x:527:
+sgx:x:528:
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 7df7bca4cc..ef524e0e3d 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -397,7 +397,7 @@ USERADD_PACKAGES = "${PN} ${PN}-extra-utils \
                     ${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-upload', '', d)} \
 "
 GROUPADD_PARAM:${PN} = "-r systemd-journal;"
-GROUPADD_PARAM:udev = "-r render"
+GROUPADD_PARAM:udev = "-r render;-r sgx;"
 GROUPADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /sbin/nologin systemd-network;', '', d)}"
-- 
2.34.1


