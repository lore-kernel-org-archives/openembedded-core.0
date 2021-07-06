Received: from mailrelay3-2.pub.mailoutpod1-cph3.one.com (mailrelay3-2.pub.mailoutpod1-cph3.one.com [46.30.212.2])
 by mx.groups.io with SMTP id smtpd.web09.8191.1625586969655378114
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 08:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=q7ex/nnw;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.2, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=5EF8KWGkS1xb2750aIxDOYV/4czaEJ3QsOFqtZ1Vksk=;
	b=q7ex/nnwiQKEJLeAiG/PGf1/NfcAWbyR+rU3UKHG8q/eWRtD+x0FU/Y4aXkGVdBznQZ72qP4sUnif
	 w/dGXtCb5Y6dmWOMZtBkj4fIcqYkbDXFZ7KmymFHsaXkoM6OTQaUS2juLOma9yktvUx+07ZyBN00dj
	 UwVN8nYeG+aPGvICkEIN7f28vPMno8BDpjR/oGmAXhaOaJoHLxf0t3XCzKXeshIe7Ka7x77dRM/55W
	 ZsEDwPv1saFOGTKX3tiHpn+Wc7MziCa8+vPbOMvjgDlcOf/4wgpqjGt1hlcREUe/FZ6HtFRLjUka1I
	 r61ykmUMGEmcPjL1IjXyLGgxm8gBtiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=5EF8KWGkS1xb2750aIxDOYV/4czaEJ3QsOFqtZ1Vksk=;
	b=GdcO6u+MzbptXID9EbLHuHR+IRGWPi6fJFVHurc8W288M76IJhDPoobeLLuppkNyyPfx6AFZhIlnp
	 Qxz2PasZRJZtMbZxCBYeQqCMmaJhK7qS3skHHUPfgg4z4mrSVwt1uB273Y90RKMZ9izKYbAZaO2ITe
	 weX2s5ZRtjQBxuT3GZTqpGXluqNkVSOkGfN+ynvAwDyQ0ec8/1AdmNxTDfKtcwIWOS8v6tJonlMgSY
	 Wzz7NSxXJtUjQVpGCK6mjU6jYWOQfyESoLd3eP8353gJkcMxJK+28LYtc00O6s4A0SjGi5BSx0eEDh
	 ZNWNbunZsjJ7bk7NhmsCPMrlyxT5+ew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=5EF8KWGkS1xb2750aIxDOYV/4czaEJ3QsOFqtZ1Vksk=;
	b=eLkXBqEXffAbVmbJQcWNbKrXQm2uCu8hcjWjTNWHQqMdE89QMVnKOWKezGVDDWQ3qJEnxx2lcjM1h
	 bAKfU4xCA==
X-HalOne-Cookie: f9db52b2790f2d1794e89ae4193ddb0b7be91d0f
X-HalOne-ID: aa19cd75-de72-11eb-8cdd-d0431ea8bb03
Received: from localhost.localdomain (ua-85-227-233-29.bbcust.telenor.se [85.227.233.29])
	by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id aa19cd75-de72-11eb-8cdd-d0431ea8bb03;
	Tue, 06 Jul 2021 15:56:07 +0000 (UTC)
From: "Peter Bergin" <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	richard.purdie@linuxfoundation.org,
	otavio@ossystems.com.br,
	Peter Bergin <peter@berginkonsult.se>
Subject: [RFC][PATCH] libubootenv: exclude from world build if no u-boot config
Date: Tue,  6 Jul 2021 17:55:51 +0200
Message-Id: <20210706155551.8958-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As a fix for failing the world build for targets not using u-boot
as boot loader libubootenv is excluded from world builds if
both UBOOT_MACHINE and UBOOT_CONFIG variables are empty.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
index 306296922c..6774290ea5 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
@@ -28,3 +28,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 RRECOMMENDS_${PN}-bin_append_class-target = " u-boot-default-env"
 
 BBCLASSEXTEND = "native"
+
+# Exclude this package from world build if there is no config for u-boot
+EXCLUDE_FROM_WORLD = "${@'1' if not d.getVar('UBOOT_MACHINE') and not (d.getVar('UBOOT_CONFIG') or '').split() else '0'}"
-- 
2.25.1

