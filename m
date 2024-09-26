Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F4A3CDE017
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 15:41:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.46909.1727365313475875064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 08:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=rNL/0c1t;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.128.43, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb0d0311fso1783825e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 08:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1727365312; x=1727970112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cSm+LcOuIaoQhiUSxk+0nvvZcfMedgUbtaY5YInpwoc=;
        b=rNL/0c1tP4AEb3WWHOTfGUw49WKBXhcwBSODVdZ3Y2T3KbLNSl31CigrvC8EOzMwoq
         d0d7JqB+H0uxZmSXtvK/zwhl92w3CbA3oFwEX3UxI1CHxgkz2BWpv+ye8XKB5BiFiHFY
         iPosjYAk4FJURALuVydFAxXsNy6eAowyvopZ7YNd3xZAZ6GfCO+00sFa9scE7pHsxy05
         30/AtyKwCA1DfrzwbvJO/hLTty3/c9zN3Maw390E6e616pDHutLnc4rB7g0Oudmskcc3
         iOhdffk/JCLgjukH+Fr6C4mX3vn05wKryNLwIBE6IFMA7F85nQ/sO18dHildpGYQC+IA
         T9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727365312; x=1727970112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cSm+LcOuIaoQhiUSxk+0nvvZcfMedgUbtaY5YInpwoc=;
        b=W4hlrg1g5HGhxjeGAspAjEK+nnBdxct5AkF/gNQwZrzMyO5VAY80C9r05tF5YAQ2+G
         OIfP916sn1AQKOPELpB+NxJG6NDVEtc+JARPJOgfFT3/GFzGFv7ZO5al9i0hSi10qIUi
         b9udjXN7SlUaezevLY0d7gHNfmvHL/qemk7Ii6oR9KMb5Pej/uacpDxQVx3oLW6txNaG
         x/61zBz0o4VHYdwDe3Qya045ThIY3CCpOrchJcCjhtPxhrrnHk6tgsiLaX9JhNGHJvXi
         wZoL83w4n8237UB3sva4uN7cbpYCtd539+HQvpvvX+pNyIj1xA+WxvUSGOw1BOv2MOYU
         BmXg==
X-Gm-Message-State: AOJu0Yzh6iuYxrvt7TQYWYT+Tw8XjU2B4zjHB/a9DO1wv68PQNRmqaMF
	BdFMdb2kAUTtWhnbLKKmDU3p34OSOR6p55vmc8Nw4aO3WeUvP9ELheFlunYnYhpBAkit+kq9wft
	wJaVxD54ytjRJiuFJH4YR1HPRGJnuj0nYTHIHiTj0fhO/KPbls+Fird4wxZFIY/0wtXvaJ38May
	czFRjIZamH
X-Google-Smtp-Source: AGHT+IETiwIgqbRwWE0w3EfPF61jvSOwjwDC13VLTuNWRA0EzgBSOx//ev+ndYdWhWbOYfLfz3fEFQ==
X-Received: by 2002:a05:6000:1861:b0:374:cd01:8b73 with SMTP id ffacd0b85a97d-37ccdd3d1d6mr1305639f8f.10.1727365311435;
        Thu, 26 Sep 2024 08:41:51 -0700 (PDT)
Received: from localhost (dslb-002-200-173-220.002.200.pools.vodafone-ip.de. [2.200.173.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e6488sm158004f8f.46.2024.09.26.08.41.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 08:41:51 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rootfs-postcommands.bbclass: make opkg status reproducible
Date: Thu, 26 Sep 2024 17:41:35 +0200
Message-ID: <20240926154135.576457-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 15:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204992

opkg stores the current time as Installed-Time in its status file when
installing packages to the rootfs. Make this reproducible by replacing
Installed-Time with ${REPRODUCIBLE_TIMESTAMP_ROOTFS}, which then also
matches the files' datestamps.

Based on OpenWrt's approach for the issue [1].

[1] https://github.com/openwrt/openwrt/blob/main/include/rootfs.mk#L103

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes=
-recipe/rootfs-postcommands.bbclass
index 920da94ba2c8..5f4d67f93ca8 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -487,6 +487,10 @@ rootfs_reproducible () {
 			find ${IMAGE_ROOTFS}${sysconfdir}/gconf -name '%gconf.xml' -print0 | xa=
rgs -0r \
 			sed -i -e 's@\bmtime=3D"[0-9][0-9]*"@mtime=3D"'${REPRODUCIBLE_TIMESTAMP=
_ROOTFS}'"@g'
 		fi
+
+		if [ -f ${IMAGE_ROOTFS}${localstatedir}/lib/opkg/status ]; then
+			sed -i 's/^Installed-Time: .*/Installed-Time: ${REPRODUCIBLE_TIMESTAMP_=
ROOTFS}/' ${IMAGE_ROOTFS}${localstatedir}/lib/opkg/status
+		fi
 	fi
 }
=20
--=20
2.46.0


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294


