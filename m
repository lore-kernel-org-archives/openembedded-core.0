Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817C1C6FD1F
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:45 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.5699.1678402723487235764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=hq6I/i6y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id ay18so2551254pfb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xOeqrhLgxemRFQ0nwYp5E91Be/2z6J+yZvzkMVnyrY=;
        b=hq6I/i6ypMGfjiDIBMiTulWNZOD9Z4fRQBO7g3/hlqjXRjVjo+NuLz2NmOg2FryfxJ
         TPVZ/yMB57sKgGiKWjbLrQntMl4Ldqej83pA8PiYkxZrZTdeMkRcQKp3hqC069hURxuA
         sto2qlJe04bjBa/JlG8mlJ/iVIUrnY+okNPYF3s9FqGUIiSSLtN7yPdPJF8YMfqZ0A+B
         WhNvVIFB363XEZFZ6XFXbJE7xn7DYtY+EH00ZRmtNS7u+UKZtiR1fdUpdECGryufKjUE
         v8bHEqQUCMCD3RWztQx29619F8M2Id4HU4/IriPVSvfXowdOxS+yaGm4PMLAXOWK01ih
         tepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xOeqrhLgxemRFQ0nwYp5E91Be/2z6J+yZvzkMVnyrY=;
        b=BRBFAkxB21T+D70LLAmJOQ/02lqCeceti2NuTTPM67PDniKsH+jirELN5QeY8xYwG4
         CvMVKfBK588QaCkU3iMvrPVH6/9vHZcjdSLiFz0XcqnqGojqkbeCsKFVlvCUBPz+PEcN
         FeV1eiobdq+VNCpAHRS9bsOkp1n8heXX+SzoBWYBfar8jjTevh+vuTZ0DWdahNhQk+l5
         onejCIRG+6bWdnP0E5JYZc/OT3iBpreTKmLMu7g3Zb4ZSwlI8mUu2Vt1ibjz2AigD9xG
         9PGq7Ix09kBiON7CyHCqG9M8TVlWdL6I9+41hk74aH3OWNvCKXgNkK2RtokPoUMNUzzn
         8bFQ==
X-Gm-Message-State: AO0yUKXCWjFLvBvquEn9sF1jx36TpCC2J4iLWfdO3b968YdN++JsjVHj
	kC7OxArbzXdXQsL60krLAHdfweuBGrvvj6p6VGo=
X-Google-Smtp-Source: AK7set/plKs2XD2O3RW+aCrhW9PgDQQJsKo/XZZD4feuty6b9S+4u34etVHM5bAWE9Bh+5InRuGgdg==
X-Received: by 2002:a62:1b0a:0:b0:5ab:bf5d:a0d1 with SMTP id b10-20020a621b0a000000b005abbf5da0d1mr19783314pfb.7.1678402722586;
        Thu, 09 Mar 2023 14:58:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 17/27] systemd: add group sgx to udev package
Date: Thu,  9 Mar 2023 12:57:52 -1000
Message-Id: <73abbc8b7069ddaf9bdacabc3c4e027dd9579807.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178290

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
 meta/recipes-core/systemd/systemd_251.8.bb | 2 +-
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
diff --git a/meta/recipes-core/systemd/systemd_251.8.bb b/meta/recipes-core/systemd/systemd_251.8.bb
index 8f2fb90455..3c87e71485 100644
--- a/meta/recipes-core/systemd/systemd_251.8.bb
+++ b/meta/recipes-core/systemd/systemd_251.8.bb
@@ -401,7 +401,7 @@ USERADD_PACKAGES = "${PN} ${PN}-extra-utils \
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


