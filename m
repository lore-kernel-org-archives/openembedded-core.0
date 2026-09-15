Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7300AC982C1
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 00:11:03 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12266.1789431057399678906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 17:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KNl6n7K+;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: michalwsieron@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4858303de5dso3949436f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 17:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789431055; x=1790035855; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y58HVYoyS6u7toyfGNWNeW8wSnKXsbtP7At9TH/ZJew=;
        b=KNl6n7K+pH8r52+sVBEDxNFqTSYIqqUurTqOgnmQ0IFGsWHxlE5S6/2Ym74Yp4bi14
         l697G159oQg2HLSkywJ92k8YMamoSqNzGhykO0uyu2Hrhw5M0Je51HblnrIBAR9eN+va
         TxoH9jh7a+E7CZ/L5ukzS7rh6yV72JvaW62ijpkDrVfnYv6ZZMg8hY/quDQwnNDV4+82
         9XZF/dVz7WLZ591jYGVSePzkFfIirlL3tIJdhSXoFHyUh0oopxgS383igSFMEjKUImnK
         bryQiJ89DAiFaw5e0wtUYFh0EknFOudWR3m/VBxPIhqs9qWyxpsGzF9/PYaile3aajvp
         xbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789431055; x=1790035855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y58HVYoyS6u7toyfGNWNeW8wSnKXsbtP7At9TH/ZJew=;
        b=LOJJS5AW41Q0GWNteUrNDJjWYv82EanXL2JxsfNyGXrLjfHcITNszlHwinxl3LwPBn
         dHv6WY7AcSl2fpj4I0ZFDhvZE3fSocG5nmEa7kNzAASpkKCG8MN6koDXgR+iiJ+UOqAi
         FgJ9jgCt0J+DKHSEEKGsV5xcfXfkTlxCSwqdAUl2YJg7YDTB452ckLTH0D/TSWij/Uxy
         BZny2+BFIHNjBcEBnHhDuGjimM3o/g/Sv+GmxavnfgqkUJMOshw1MbRDch+85dM8H/Iq
         uXKTG30pLDwCkod8qsIqTl21gDMxefMpeRjNPG4SPELE1glRIhmR1xyC3oTCQuIk1jda
         /mog==
X-Gm-Message-State: AFuF++nXyC39bvnwvvdEnyoR4p59FvlW4SPHC/cbMmKJ7/juj3m8bcoM
	evpk0OPW8R5rJ4xg/pSUJCLyAZybjUbj2By0M6DrpYYq14IiyptuMfKFiMBHJA==
X-Gm-Gg: AYBFou1C4mUrDMdvccZjvT+OROG1k3MRJPc4O9/ixRl0U5fhgTFBphIYNLzxkL+HQ+g
	4EKcTSI+IJBQprOXlfbA1xW8c/FNLTp0JHJednJdfN8ygmGdu5F93o2hdlcINKhXHjiCxViH0ph
	q0mfe3BH7oXTOaCcXR/1NTudoTZyUZ8ZYSxS6vvO5cbu42M2f++iIVeCWBxKfz10b5PchMB8LkE
	O6VH/os73u5XvgltbkAA30PkB85CwK7FTP6ISrwdTuKQIc7qz2FVOEPzY3zCfLXs6SriGVHGaK9
	NbSR9SQEsLiEMP7koSzMXmMEDbBUEEeHEajakvKRv5we6h6cIuSnUUrWR/nfbgdtA/wPw4eucTR
	iW4iRn5Q++gt+JPIvBmDRAcC4kxGDNPsDHNbPYNVkE4Z6YiBe4ym5MHoF7ne1kJ/hvz3RoWeXF6
	6uMxKobjd+wL9BZcKGrQ//SBXAqcyrsvioxzmiq92rzRcPnCOnM548YKhmv84k4YNXtGToRxFcO
	w==
X-Received: by 2002:a05:6000:603:b0:485:8c16:a341 with SMTP id ffacd0b85a97d-48702b6d32amr5237878f8f.54.1789431055569;
        Mon, 14 Sep 2026 17:10:55 -0700 (PDT)
Received: from [127.0.1.1] ([193.28.84.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed106sm29287221f8f.1.2026.09.14.17.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 17:10:55 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
X-Google-Original-From: Michal Sieron <michal.sieron@nokia.com>
Date: Tue, 15 Sep 2026 02:10:36 +0200
Subject: [PATCH 1/6] iproute2: Add subpackage for dpll command
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-msieron-some-packageconfigs-v1-1-44dcf1145d3d@nokia.com>
References: <20260915-msieron-some-packageconfigs-v1-0-44dcf1145d3d@nokia.com>
In-Reply-To: <20260915-msieron-some-packageconfigs-v1-0-44dcf1145d3d@nokia.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michal.sieron@nokia.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 00:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245800

The dpll command is part of iproute2 and is used to configure and
monitor Digital Phase Locked Loop (DPLL) devices and pins.
This patch adds options to build and include it.

Signed-off-by: Michal Sieron <michal.sieron@nokia.com>
---
 meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb b/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb
index b6f155d03f..aef7057946 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb
@@ -28,8 +28,9 @@ PACKAGECONFIG[iptables] = ",,iptables"
 PACKAGECONFIG[rdma] = ",,libmnl,"
 PACKAGECONFIG[selinux] = ",,libselinux"
 PACKAGECONFIG[dcb] = ",,libmnl,"
+PACKAGECONFIG[dpll] = ",,libmnl,"
 
-IPROUTE2_MAKE_SUBDIRS = "lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc rdma dcb', d)}"
+IPROUTE2_MAKE_SUBDIRS = "lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc rdma dcb dpll', d)}"
 
 # This is needed with GCC-14 and musl
 CFLAGS += "-Wno-error=incompatible-pointer-types"
@@ -81,6 +82,7 @@ IPROUTE2_PACKAGES =+ "\
     ${PN}-tipc \
     ${PN}-rdma \
     ${PN}-dcb \
+    ${PN}-dpll \
 "
 
 PACKAGE_BEFORE_PN += "${IPROUTE2_PACKAGES}"
@@ -103,6 +105,7 @@ FILES:${PN}-rdma = "${base_sbindir}/rdma"
 FILES:${PN}-routel = "${base_sbindir}/routel"
 FILES:${PN}-bridge = "${base_sbindir}/bridge"
 FILES:${PN}-dcb = "${base_sbindir}/dcb"
+FILES:${PN}-dpll = "${base_sbindir}/dpll"
 
 RDEPENDS:${PN}-routel = "python3-core"
 

-- 
2.43.0


