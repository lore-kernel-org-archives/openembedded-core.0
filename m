Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id CC99B6150B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 14:14:58 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s10so9140558wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 06:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b+riXfgbt1CI8po4EzjfylfDaYk3gPopCRmNLhh9ZwM=;
	b=wRSkSauS207kff8wyu4Qc5z8T0+YWs8AFX5dHX5bx5ryEi6PfQ03bSG9YJY0eScf3K
	cqid/KJ4iemBz09nw0WcQrk5AQpZsEfC+I1x6BWHhNtqT3XY0yotCeObEHm1OURDZx+c
	QmpE8rP/l1fEv8eCzsvtiCvN0FyWwGkGLH5fRh03PGy3lR6pGrK+JndoBjqfhSmXj+lk
	KjheLSPUJUa9WSU571z1d67yhCclDFkc3FVXg+mzvrYKWRRcx2XRKgT/8SmqdrYNZMo/
	l+sVsvhxQaVJFKffo8o+gNLIcCW3C/0y4GE2EjoJ2+5jV41kf8btDCSodpKDn/+DpPlG
	p84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b+riXfgbt1CI8po4EzjfylfDaYk3gPopCRmNLhh9ZwM=;
	b=sDIEevFsZ0Sb/eqp7KY8BP7bXhbT9GWWyfUdgSBt5Q1APYCMC1W6It1LU9nMRigtF+
	L2h6gIGdl6qiWaaLMRuTHoKRY0DIZnmL3tbJa5LAw8FtAlOPpJ7FcBefFCaAhAunYckd
	8gDh+pTWyXev7H/2sNezoJR0k5OkfhZnll0o/q8f4TRF8KcUaQ2SCJVZOPP2BeYcKaMh
	KNCyE69p45fSs4HnWQZpd5V6uCZhaH0j7IOAE2RHFgZKv5MpVSYx0HXvz7U0iXSmcT3N
	j3gf2RYwSTqSPDhT/olIVP67VX5L9Gex61npdZ4vjs8lB+tlEcv7aFDVW0yjYWBPpTvc
	5Ykw==
X-Gm-Message-State: APjAAAWuvCaX8kuiEw6CgwiPidkFYJAHcTc4pQpz6/KzXMDNfvMPYwo9
	Rtvboqt5kQJEFJv4wVnsnviZPg==
X-Google-Smtp-Source: APXvYqwqTybSIxNY2W9aHeZlS6OYTlhUgQcMfyBaO45gG3CHaIWVzo2WXmFSP8q+IB3jWzp7OtZtiw==
X-Received: by 2002:a05:600c:2944:: with SMTP id
	n4mr22138994wmd.22.1582553699691; 
	Mon, 24 Feb 2020 06:14:59 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-188-94.w2-15.abo.wanadoo.fr.
	[2.15.37.94]) by smtp.gmail.com with ESMTPSA id
	z10sm17721474wmk.31.2020.02.24.06.14.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 06:14:59 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 24 Feb 2020 15:14:57 +0100
Message-Id: <20200224141457.10825-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] image_types: fix checksum conversion dependencies
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
X-List-Received-Date: Mon, 24 Feb 2020 14:15:00 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Only md5sum and sha256sum tools are provided by HOSTTOOLS. For other
checksum utils, the conversions need to depend on coreutils-native.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta/classes/image_types.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index f82f1d8862..63ffbac7e6 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -315,6 +315,10 @@ CONVERSION_DEPENDS_lzo = "lzop-native"
 CONVERSION_DEPENDS_zip = "zip-native"
 CONVERSION_DEPENDS_zst = "zstd-native"
 CONVERSION_DEPENDS_sum = "mtd-utils-native"
+CONVERSION_DEPENDS_sha1sum = "coreutils-native"
+CONVERSION_DEPENDS_sha224sum = "coreutils-native"
+CONVERSION_DEPENDS_sha384sum = "coreutils-native"
+CONVERSION_DEPENDS_sha512sum = "coreutils-native"
 CONVERSION_DEPENDS_bmap = "bmap-tools-native"
 CONVERSION_DEPENDS_u-boot = "u-boot-tools-native"
 CONVERSION_DEPENDS_vmdk = "qemu-system-native"
-- 
2.19.1


