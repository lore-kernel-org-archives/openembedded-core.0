Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21EDC07480
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:52:19 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.58049.1697817139199900256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yiBA4d4F;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c9d922c039so7790955ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817138; x=1698421938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdTwX6JATSeDgIqIcn8fSrm0gk8wtpBj+5XBID+i6Y8=;
        b=yiBA4d4FmitXGiX6k1trNpXSbvrHQySsww0INUU0JvR1/qvtxEUz6ktvjFz48GOgwW
         rwvF9iJBmRtp68csLkd5AlPXyb6SQHUMZ8OvPEQwMqY60VcXFbQJx1TBTkTRTicwBEaG
         dztL6Wgv9EcmvfqLgF2Otk1UETbOZn2rcVqGbNR+nEIDzPFSGL3pEkXGuplqIn+ThwbQ
         7eBzJNZEf7oaDtoJu+4lXXx3lFYYT9QfxRXG86EAkH7IkBlac83jCKcFiOOnzbwOEVD5
         z280HGjrDWh3euTQOXWxJ6LHrOzZI14kVW47iO2Mk/ZkwYoftUyQ+cR/yyaxexACL7gC
         teEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817138; x=1698421938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdTwX6JATSeDgIqIcn8fSrm0gk8wtpBj+5XBID+i6Y8=;
        b=A5IyzN29yUxLYddzvDee//neZFUsE39z4WbpjdcTGMAIZjaxahCnXWHut7wOXtYXnQ
         mdMPiPXT5SvNSTZ+Qw5acp06Rj8YDlAHxbQb8Z9cXw3e30oC3BIvC0UJHLtlYHYdxXZQ
         vqaB02pBENRa5uwjtB//Q49sHYy2F809WQZ4dle//oufxQAaXyUZJumg9X0a1scjuV/v
         f7+PU/X3NpdM+gRCN01FguH/WdWWskHs16nx8GG34/twLlBUKg0xIkYrHhXmu/ypR6J0
         BRJKenQfih4+VFxzGkgyPeUs1dm06C+BM7xHgKXjo1DJRCFBbgFTp/npjMGTrn90zG+G
         Wwlw==
X-Gm-Message-State: AOJu0Yw3uBzsWM8T7lnFJ4O3GNIDGxvGvepr1AUTtefPFsCIRHHkAX3n
	/daSDi4yEyie0+IarEyrp1vSNf++JmGitSrpGdY=
X-Google-Smtp-Source: AGHT+IEKmT14CCeNp8s3QTigBCUCPMWeFT1T2J8y+vM4wKRVj3HjzzdlKh8fYO6pZSMz2CgIhQrpVA==
X-Received: by 2002:a17:902:f685:b0:1c9:bca2:d653 with SMTP id l5-20020a170902f68500b001c9bca2d653mr2174109plg.11.1697817138315;
        Fri, 20 Oct 2023 08:52:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.52.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:52:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 24/24] busybox: Set PATH in syslog initscript
Date: Fri, 20 Oct 2023 05:51:26 -1000
Message-Id: <e9ca1405b732720ff72d379e0262a78bfd2e7d53.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189569

From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>

This script is not always called with /sbin and /usr/sbin in the PATH
already, for example when called via ssh. Explicitly set PATH to make
sure it includes /sbin and /usr/sbin since that's where start-stop-daemon
is located.

Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fa53f898eaba15dff030f9eadf86e5bca7d954fa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/busybox/files/syslog | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/busybox/files/syslog b/meta/recipes-core/busybox/files/syslog
index 2208613e8c..a4fea30ab7 100644
--- a/meta/recipes-core/busybox/files/syslog
+++ b/meta/recipes-core/busybox/files/syslog
@@ -10,6 +10,8 @@
 
 set -e
 
+PATH="/bin:/usr/bin:/sbin:/usr/sbin"
+
 if [ -f /etc/syslog-startup.conf ]; then
 	. /etc/syslog-startup.conf
 	LOG_LOCAL=0
-- 
2.34.1


