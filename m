Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3186E7DE8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 18:40:07 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id o189so1073936wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 11:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=X7sxWL/tCl4jF+JeOUz+srdq1kW7clp8Q3RfOcfNaJk=;
	b=p6jf9yaX3m11s71KYZfsL8dUkvLRf5U2ycddiDBj2xmXuqZw/qA8e8GQNRQlUXLibD
	plM2CaJ0B4vYPvEc/elymHORhD9SqMKU5/FTkVmzerAjkuGqmHblsz7lVU6QjUhdYmCA
	93Nxcp5mWOSkc/8Fogivk/CT27NIR/XHSulbef12QZFDcDX+ps+xQf6KnpbAPPE7xp51
	i+SHwO4BhpS9zn+COQ9y+EP02VEhZ08sMsZbsN0HI5QJEHL1SeScTy5jeEoLK4siJbzI
	ABC3Y2nvEL7fY7bCjTsOJOfsFKViFMWVwYaiLeXbz6pnpIXCJvDB7McQLdo86HbZwCOU
	n4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X7sxWL/tCl4jF+JeOUz+srdq1kW7clp8Q3RfOcfNaJk=;
	b=tVSLC5R7d2vNyyom2phsd57KObfVwAfMDPGKjrAqBPFxjebBORmG5IRfX2rgOOuvoN
	69AANyi4xA+cYI2/8lfQGvsxHRQgBxAYNmomAh4bTTxO6U/snlnbVHyT7SEaaN6pCjKe
	qks0tVj2iC82EGbTX4DSkxmAEEDqIMQ482Ki1Bpxz30bbTu7NaWZHY8GW4j7wSel8lX2
	/nTG+c9nmlZ7nTl4vUgeBFwNfbUCtLcEopJoP0NmjZqwhMKHKViGY2n4mTykUeAxWnc4
	xK7EDu04r7N7gpDwp9YujJVZa0BDGL/ush0uviVpWVx+SeID2Qv8JOKPUIP3qJFDZrDc
	PeNw==
X-Gm-Message-State: APjAAAUVYgq8RBJ3u3OiS3MHDXF7VvQ7e5iJDpVT/p/fs5c7yKMiMJzJ
	BC50O28uQRmBKd9NFBJnaxRa93Bj
X-Google-Smtp-Source: APXvYqw8tk+wnYsVQmCmqEuwRrXTpSe8IrK8NfIo3hyyXbsiLGXPx5oxmxPFog7nwRQXt52t8szL3Q==
X-Received: by 2002:a7b:c5c4:: with SMTP id n4mr24814892wmk.151.1557945607600; 
	Wed, 15 May 2019 11:40:07 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	y40sm4743764wrd.96.2019.05.15.11.40.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 May 2019 11:40:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 May 2019 18:40:03 +0000
Message-Id: <20190515184004.20564-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH 1/2] glib-networking: add PACKAGECONFIG for openssl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2019 18:40:07 -0000

* gnutls from meta-gplv2 isn't new enough for this version of glib-networking:
  meson.build:74:0: ERROR:  Invalid version of dependency, need 'gnutls' ['>= 3.4.6'] found '3.3.30'

* disabling gnutls PACKAGECONFIG isn't an option either:
  meson.build:131:2: ERROR:  Problem encountered: No TLS backends enabled. Please enable at least one TLS backend

* add an option to replace gnutls with openssl

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glib-networking/glib-networking_2.60.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
index 09af229d69..e2b4cffb2b 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
@@ -15,6 +15,7 @@ SRC_URI[archive.sha256sum] = "d71c6b2faa5ac29100314f08a1be020a2afd0291f025614c0a
 PACKAGECONFIG ??= "gnutls"
 
 PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
+PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
 PACKAGECONFIG[libproxy] = "-Dlibproxy=enabled,-Dlibproxy=disabled,libproxy"
 
 EXTRA_OEMESON = "-Dgnome_proxy=disabled"
-- 
2.17.1


