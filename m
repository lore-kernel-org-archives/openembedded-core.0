Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0435CFD2D73
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 12:58:08 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39291.1773147478041253593
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 05:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z0C6J6YS;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439af7d77f0so8291850f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 05:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773147476; x=1773752276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhEp7nbmr2/EvEZ0wl7c648yvCqAcrhOpTh9pXD5kF4=;
        b=Z0C6J6YScbAcpPg7TqSI22/DgaH+f/WjJb3uS7yiqK5WiGXLOkLbSO1YKB969JXhXV
         yRVcU+2uIzzd7PrjiYZWe98CNW0TE8+1FIdTwK8PWVD+S64CETwimv1nCyuyRlS2lyQj
         6l3eeoPtz1W/w8TsCAJFe/h+Uzg3ZmihVID66vmn547w2sanAAuy/eRA4hxDqkSjoBGa
         7YUBwLhBMvfD2Sdhim3DJpwqMQQWx6P5f6FTsSJbY6O21Qq+aDC5AD+q+vAPz1ks38rW
         eyCnV101La1HugzJsuqhm5UzCbF2Qn3xN6Ye8jZdpewgPfVtbNHpvcHFK8bWKVO+QC74
         w72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147476; x=1773752276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lhEp7nbmr2/EvEZ0wl7c648yvCqAcrhOpTh9pXD5kF4=;
        b=mWMisfqQprQKOZiVN27Re0XGQXLnw45JIn4c2IR8o+rTGjXD5AVLbd4AvRnwAz/FFx
         zdrl9Tgob4dc6hG74Eu6GTOHqYyv4MHEUtRadEONmFslR9nRISa6nlaHhgxfrGmbxjbI
         N+wjvbEJFatp58UYezleAnsSNxxZYGsB3sN6YTkqq6X1cZeOzBd/BWGL0TZLD2WuZhFJ
         iN3UETT76Nisf/AHvwfJI3aEWqwdeshAoOa8CSWLybZlcOKvMplNr+zdtUzWT6bWP62E
         M8JDOyQRk7eLDI2y3qhHs20ZXyEwf73BQEI6I2hT9iEJlgy36DT98a2LBf/OZZ/luv0G
         vzbA==
X-Gm-Message-State: AOJu0Yz2tcW0CryGzBpP4iGkUjaH8t8XhAqmnbq4cp54nnzsDfQUXZzK
	1wdvFhI0jXqfP+kn3LJmkMoZprNi3lukHSf7s37RtrJ3JOjYkOol2oVIUWuQ1w==
X-Gm-Gg: ATEYQzxP/KGLfwb9NGpniekRmURqW5zE+ggUGmsmqKjLq/+fzzwDFEwOdAGBhqCefgS
	VqSGnhatbadm0teTswMhuUxQrp4uWKYDGhquj9gHw6R3KNSs+gSsqxFamKSCHvfkk282tJsYs0k
	/hRW04GLtrkkWHeg3S1YC6QAaoZDCwZix6JFqoxt3+WLEIfu08d2TVE1E4nF3cSUks3L3RE1HA2
	gTX8vd6LfNNG4wpE+3NFOv8zqN+TalBLlNH1bwI0kQ7fdRQYjmufu3QK2C5ogdUF7um8AkwUa6b
	URMERujn7w85LnqZup6NwcZC8AiSm1YKoQLvTvMP2Xr9tYgMEqgsE1KuVH188/PZXBA/ArSs+wp
	ngFBSQp3JGV38+/n0poepGb9IHMK9XZ+lR/2u03yhxV+Rywr6H98mbLcNbyFl22xA4PlDUtljuH
	GrL6FPb3z3ujok1VgxGrR16vtGXjSnukFyeo5xwPRoScVlXm1lWhF0kqm4c+E=
X-Received: by 2002:a05:6000:2010:b0:439:d6ea:7cff with SMTP id ffacd0b85a97d-439da354a83mr28808705f8f.4.1773147476372;
        Tue, 10 Mar 2026 05:57:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae57401sm29782290f8f.38.2026.03.10.05.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 05:57:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] iptables/libmnl: fix upstream version check
Date: Tue, 10 Mar 2026 13:57:49 +0100
Message-ID: <20260310125750.2240849-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310125750.2240849-1-alex.kanavin@gmail.com>
References: <20260310125750.2240849-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 12:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232781

From: Alexander Kanavin <alex@linutronix.de>

The original locations still exist, but no longer allow
directory listings.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/iptables/iptables_1.8.13.bb | 2 +-
 meta/recipes-extended/libmnl/libmnl_1.0.5.bb      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.13.bb b/meta/recipes-extended/iptables/iptables_1.8.13.bb
index 003b1c1421..11b287ed3b 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.13.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.13.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d0f763df2a12dc \
 "
 
-SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
+SRC_URI = "http://netfilter.org/pub/iptables/iptables-${PV}.tar.xz \
            file://iptables.service \
            file://iptables.rules \
            file://ip6tables.service \
diff --git a/meta/recipes-extended/libmnl/libmnl_1.0.5.bb b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
index 66b30d7f60..4a0c55ffaa 100644
--- a/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
+++ b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "https://netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2"
+SRC_URI = "https://netfilter.org/pub/libmnl/libmnl-${PV}.tar.bz2"
 SRC_URI[sha256sum] = "274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525"
 
 inherit autotools pkgconfig
-- 
2.47.3


