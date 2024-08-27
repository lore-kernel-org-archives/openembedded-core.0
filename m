Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039ECC54739
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:20 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.70882.1724736253316448462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H59AT1Fq;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3718eaf4046so3696919f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736252; x=1725341052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fU/hYe2hF5M7Fc/nVkMjm/pTHaE+s4LdAvt1Y43O2cQ=;
        b=H59AT1FqKa72TNfQVFfU9vV+B3+QBl7rV94YeEhYNzNag98GPTinYxIL8ByxQNnACA
         qd2/2pL09PYOChrkzDP5RmACO3uSgqzB/Xe2XRl8TqqysxxGpguimvbsHrc+Ps6PELoK
         VzqmcLnzSw8hK/PHHVQc+mlMJebgn45d5HgvaxaDUE/WkOkripC3ndpSz67/jSO4Nxem
         hbG4gwn8CBFJxMpkx/2P9FZ8WYSzNn2vVKjsDg9mY47KeOdPLFi1gdrUj1zTmoK+OlHC
         ycKKlxF8LJshrVK4t3o3kRU167CxnyKRTsvfB9eE9WVQ+Hoxvac059JmMdElZodB7/oB
         158A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736252; x=1725341052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fU/hYe2hF5M7Fc/nVkMjm/pTHaE+s4LdAvt1Y43O2cQ=;
        b=eqNOpiDqaK63CP8RlcnKPLo3b1nlUzG5s4MhJNAbg1HB+GI8D1CndfUzVS2kJj6Wla
         w3PxjoaXpm3yVojvNS+1L3lWU7pzDQqqzsvHmzMBpOD70gdPXCSrJXPsl7bab3gxpiwz
         m9Oa4flIXqb/gNXJfUw+tIurwyQ2TpqKXsN6ZjSqBEOqugV4BoMo14zfaKadHXMXda6j
         tSOJL4ESNWjgrBtFzHZitnw/Hc19VoWtcnILDCNutdpg5bvheCNzPNXmypbeEJqiRfCu
         O6tCF99XbyrrPDyke6fhmhB4d18MMNSRsDzjtAiJt+0IBHy3ZAB9m601joVGSX/gG9KV
         SvXw==
X-Gm-Message-State: AOJu0YxrHQXMvfLKUDpdRfaaiz3MV4Ifdc1voWWyzYilDfV4DxhgMEvI
	UCNBbBGzmVEbwCbQLrpSnp3Gff+XrSbjG/WKqkEjD1kqSWbddmcuj9SniA==
X-Google-Smtp-Source: AGHT+IEx6cP20JRabMkZ1J+hc/420CJhL6i9uD0lm3+MDuosFLedv6rKu+33orFLXSDsr+Cvo0BJCg==
X-Received: by 2002:adf:e9cd:0:b0:368:4def:921a with SMTP id ffacd0b85a97d-373118c8424mr8852494f8f.48.1724736251217;
        Mon, 26 Aug 2024 22:24:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/34] iproute2: upgrade 6.9.0 -> 6.10.0
Date: Tue, 27 Aug 2024 07:23:43 +0200
Message-Id: <20240827052354.1319810-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203799

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...nk.h-add-missing-include-for-htobe64.patch | 24 +++++++++++++++++++
 .../{iproute2_6.9.0.bb => iproute2_6.10.0.bb} |  6 +++--
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_6.9.0.bb => iproute2_6.10.0.bb} (94%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
new file mode 100644
index 00000000000..555d63b2403
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -0,0 +1,24 @@
+From f3c574b27000fd887cee84ab47adf23f767cbea1 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sat, 24 Aug 2024 15:32:25 +0200
+Subject: [PATCH] include/libnetlink.h: add missing include for htobe64
+ definitions
+
+Upstream-Status: Submitted [by email to stephen@networkplumber.org netdev@vger.kernel.org]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ include/libnetlink.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/libnetlink.h b/include/libnetlink.h
+index 30f0c2d..77e8181 100644
+--- a/include/libnetlink.h
++++ b/include/libnetlink.h
+@@ -12,6 +12,7 @@
+ #include <linux/neighbour.h>
+ #include <linux/netconf.h>
+ #include <arpa/inet.h>
++#include <endian.h>
+ 
+ struct rtnl_handle {
+ 	int			fd;
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb
similarity index 94%
rename from meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb
index d21885cd73a..9f0c9aab59e 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb
@@ -11,9 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 DEPENDS = "flex-native bison-native iptables libcap"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
+           file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch \
+           "
 
-SRC_URI[sha256sum] = "2f643d09ea11a4a2a043c92e2b469b5f73228cbf241ae806760296ed0ec413d0"
+SRC_URI[sha256sum] = "91a62f82737b44905a00fa803369c447d549e914e9a2a4018fdd75b1d54e8dce"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.39.2


