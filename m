Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB78C001B2
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 22:43:24 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.4578.1670539403306978227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 14:43:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PQjo1mTc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id y17so2988143plp.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 14:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqdVRTU3ttke6KL1A8jIOHzndVuNNFFsUM9KDzu3Bzw=;
        b=PQjo1mTcZKh0K+GDN9RchQ20LTcIXYHYT0U8KUfYqvgLj6Fy8e3/xdFHveU3gks5cD
         L5yC5ZqU+vc8/UTeXyLKA+CDz2wJzHn+dBWOGQdliTF/bFS/DAcLm3rwKDrMlN2QLxHg
         UDz27ElAyNq0Lcmhs0nLLbiu8PxsC3r+QqTY2N32sfj/9jChY4FIje4CXsdNOPr3HRNn
         qi2N4CMkpz3GJP1AES2URS0zUb8qy/pi1qCiTlcyGmnXLT7mNfnQ+nhg4aQEfDB/v+cz
         EBjV3PttqnKWzOa4IhGeqn2WgnajI0mbCG9Gtm/O+CR+PYHTf1/RQCkFQEe6pWgzeqxj
         yhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqdVRTU3ttke6KL1A8jIOHzndVuNNFFsUM9KDzu3Bzw=;
        b=otYr6rl+x0IPDcIDmPaoFFRhFYHTrQ+ny9fTWN9QJGt2DtFcPnpsqP5nySeKt8+2I7
         c/AKsbRPPs2lnor8V6UeIbvo+S2+7oLkBdHi03+Y8i2YtyBhfBC12fvsRphE763doPdU
         Ix89r4TUe8xVDTv0bbnUDI7vj1hu+SKBqaj7iPICK6/KbI/cvmcI5sgk4MFO/CKbc8cc
         t3ZBCCZzAI8zVVPiKYaVwcIPkzEV+nw4tSvxLwJvqabQ3497Z8Tn3qrkVzk4/gts5noT
         lMpSfeQY72T/GO2y9Z8WpFb7x4BQh21e6su59WHA7gTMf8QsF1M3IK5j0znR3er9TGO9
         Cj+g==
X-Gm-Message-State: ANoB5pn7Do+HNeveAZx6wbo+nv7rdQvTPBHWmYEUgmrr6RB+PITKysA9
	XXIKIT0R70AAymCLxCJ8XNfa8HKc5gPuH/qc7rUeHg==
X-Google-Smtp-Source: AA0mqf4YQVMoVn8+D08ax07RHRf0su0t7GkvUGmfCxvvCKwsSOx6dc/vt1Nja9jhXK8LHsKRaAhdHQ==
X-Received: by 2002:a17:902:b215:b0:189:7d5:26f5 with SMTP id t21-20020a170902b21500b0018907d526f5mr2962468plr.23.1670539402309;
        Thu, 08 Dec 2022 14:43:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709027ec100b00172973d3cd9sm1675980plb.55.2022.12.08.14.43.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 14:43:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/12] psplash: consider the situation of psplash not exist for systemd
Date: Thu,  8 Dec 2022 12:42:52 -1000
Message-Id: <e63e570eaca663acff620627c339eeff27a3bcc2.1670539237.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1670539235.git.steve@sakoman.com>
References: <cover.1670539235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 22:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174424

From: Chen Qi <Qi.Chen@windriver.com>

In current psplash framework, the psplash might not exist at all.
For example, in case DSITRO is set to nodistro, the psplash does
not exist.

In our psplash recipe, we have:
SPLASH_IMAGES = "file://psplash-poky-img.h;outsuffix=default"
This variable is parsed to if psplash-poky-img.h exists, a package
named psplash-default is created and is added to RDEPENDS:${PN}.

We can see that the psplash-poky-img.h resides in meta-poky,
and in psplash_git.bbappend file in meta-poky, we have:
FILESEXTRAPATHS:prepend:poky := "${THISDIR}/files:"
So this file is only available in case poky distro is used.

To fix this issue, add condition check in the corresponding systemd
services.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7a62ff9ed39c179d2b9b0c40f4f8423ced413063)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/psplash/files/psplash-start.service   | 1 +
 meta/recipes-core/psplash/files/psplash-systemd.service | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/psplash/files/psplash-start.service b/meta/recipes-core/psplash/files/psplash-start.service
index 36c2bb38e0..bec9368427 100644
--- a/meta/recipes-core/psplash/files/psplash-start.service
+++ b/meta/recipes-core/psplash/files/psplash-start.service
@@ -2,6 +2,7 @@
 Description=Start psplash boot splash screen
 DefaultDependencies=no
 RequiresMountsFor=/run
+ConditionFileIsExecutable=/usr/bin/psplash
 
 [Service]
 Type=notify
diff --git a/meta/recipes-core/psplash/files/psplash-systemd.service b/meta/recipes-core/psplash/files/psplash-systemd.service
index 082207f232..e93e3deb35 100644
--- a/meta/recipes-core/psplash/files/psplash-systemd.service
+++ b/meta/recipes-core/psplash/files/psplash-systemd.service
@@ -4,6 +4,7 @@ DefaultDependencies=no
 After=psplash-start.service
 Requires=psplash-start.service
 RequiresMountsFor=/run
+ConditionFileIsExecutable=/usr/bin/psplash
 
 [Service]
 ExecStart=/usr/bin/psplash-systemd
-- 
2.25.1


