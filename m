Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211ADC44506
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:24:43 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1264.1783747481970397930
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=EQ+Iefzu;
 spf=pass (domain: underview.tech, ip: 74.125.224.48, mailfrom: vince@underview.tech)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66666bad8beso2395519d50.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747481; x=1784352281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtVo9jS/+2GoPtPsm1XS68LN1j6eakm0Xf476rZLL7I=;
        b=EQ+Iefzu1Hwa7LR23US2STkZM/BW88hTLTalGSuxBQ6oCKEH5Km2imnwv/+GovwuKA
         QaRoj36+a/NOO+cAhknBDgE9sVcPAYpjyDXGyIIoTdJDG5GI1l8nrsYUrA0vQ8Wa/Sg+
         fI+KPgJU2VK4wJKEsNUteRbxyU8EhttPOhfDIM4pjLt54bRczUjBsYxPbPMHK1JSPAkU
         QaIf1HmBQsEsCqdXxMa+LnqYc7TO9ZfsvVIX5p/d3n/gSsSTXOqPZ+ssT7Ig0G3Y4bOR
         BkstIhHDM+z3dyU76s4hYS0+FYyNRpUCfcgi66zAU7DkJO8pdrCB8YUSLDw33bvt6cJz
         ccEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747481; x=1784352281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RtVo9jS/+2GoPtPsm1XS68LN1j6eakm0Xf476rZLL7I=;
        b=prja6zrreEniJzSGY3pEgexL7vBA9TzrmKdlH2A/H5ELEoXZJg7FS5uOu/Ika+MyJE
         6jSEfzNLVkaf4hOM2O5aYwXlKqDTVw2aQcV6QzAvch4d+n1fXjXw6PaDZ9jzusIFavzq
         /oJBtGjvMlQkNj1JFlKzhJVW4MdexGnifhxl0ZP91MZ5fD/rkUNMvh8FkfReuA8oFXY/
         5MLLmEWs8Hz38V8TDEyzyFY6np9C53EyfF1pBG73IMtrflw8zyV6pej3k6rVbB8xP9mH
         bbzlBmsUbUEL1MJNW6HJLnxmUYNglxI6DKfGuFYXQPqPhtoej/aUC6El/yk80dBfxncq
         RF/w==
X-Gm-Message-State: AOJu0YzmyauDmRZmSJZQhZEL5ijaOE9WZ5B9kPHLIfhQxhIPxH4o9W8E
	/P4f7Q0hJMk6DTA8FYY2nCbCYNvAz4PJRLL5HytGRs3ikPwRZwtiZu56dCywsWPLWyrkB1gYlVm
	vKmXBDdw=
X-Gm-Gg: AfdE7ckEpgjrHBLXACyiUHWCHN+badqS3wMcgC66knx+doeDOPBps1thfE/7P/wsSn2
	6JSoDk2S+MV6P3nCAdosCFZnIzPvJ1U/QwXXS9EpTbuyo+TCk0+T41typ3lfozIHiSw6I5VWhP+
	OOTo20zeT7I/F/YDUH2YjLSfQ3lNuOUyniwZVqP57YVv6Oe5Hy8oQgjJFEm9KOA4+20OwGXJ5TS
	MnbnKViO+HJJZohVrhTty1Czk77mH1qEknS0FyZqSj7+T2DzWfahVylz5CO1uY7X8CZymjJDNrb
	0pYMLQZu7MLOM/gVZsJ13YU9wdDmtJnvtHbZ5tKBRXrYW6FnWWBwIOIQoubpXFOzPyJEvNLygD1
	ZEbIcQG+11XO7g4oUx9d+OsxvWUErIMN1656vaxZqV1Aq7WaUa5HWQ4rsB/uMFRsRMhiwsiDkt5
	TA0SvTMmr7RI6IPA==
X-Received: by 2002:a05:690e:d01:b0:667:dc6d:7346 with SMTP id 956f58d0204a3-667dc6d7778mr556156d50.20.1783747481046;
        Fri, 10 Jul 2026 22:24:41 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:39 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 10/19] mdadm: rename kernel prefix
Date: Sat, 11 Jul 2026 01:23:54 -0400
Message-ID: <20260711052403.1292286-10-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240690

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uninformative with builds if
KERNEL_PACKAGE_NAME variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/mdadm/mdadm_4.6.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.6.bb b/meta/recipes-extended/mdadm/mdadm_4.6.bb
index b1d0a27c7f..85e275659a 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.6.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.6.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=https;bra
 
 SRCREV = "8b414a0d4753693d67b9a5822994e5f0c91b0b0a"
 
-inherit pkgconfig ptest systemd
+inherit pkgconfig ptest systemd kernel-vars
 
 DEPENDS = "udev"
 
@@ -85,12 +85,12 @@ RDEPENDS:${PN}-ptest += " \
 "
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
-    kernel-module-loop \
-    kernel-module-linear \
-    kernel-module-raid0 \
-    kernel-module-raid1 \
-    kernel-module-raid10 \
-    kernel-module-raid456 \
+    ${KERNEL_PACKAGE_NAME}-module-loop \
+    ${KERNEL_PACKAGE_NAME}-module-linear \
+    ${KERNEL_PACKAGE_NAME}-module-raid0 \
+    ${KERNEL_PACKAGE_NAME}-module-raid1 \
+    ${KERNEL_PACKAGE_NAME}-module-raid10 \
+    ${KERNEL_PACKAGE_NAME}-module-raid456 \
 "
 
 FILES:${PN} += "${systemd_unitdir}/*"
-- 
2.43.0


