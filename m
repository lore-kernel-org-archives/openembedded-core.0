Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD1A7DF5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 11:49:16 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id i3so3292160wml.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 04:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5gzCv2fbYXaglfC0q4vYx5ZIJoXSiAWN7efflLC/K18=;
	b=EULR3HJoZJohIwSug7Car8bgmFJLOjxW+DpQOxGuOL5VQHCynRQWyhg2U6y5EsLs/M
	ZxZJMYp9dv19LD3OLqZZ4dlTlBpfpNawN2ljEB50KexhG23d9EuxIPH53ouhzK1DPpvp
	UXGQHxtjAeaqRxAT2oLgrHWwCIKItbCXLfGRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5gzCv2fbYXaglfC0q4vYx5ZIJoXSiAWN7efflLC/K18=;
	b=S3y8jgwJswdpsUDf16zzM5Pdqhhp+bf/P1c2nm0PMfWrkKGe92qFIY9cmbgDVEpJzt
	3g7TdgPPNuvqksMtFq5IIk90RBf68+LC0GZdHQiA5xMpnORSKA1WVwgTIGbyCK6QULp0
	lRrnX4FXdRCj9kzNlqS44sHp5kmxWF3Jr4u7RLDSaXjIMs0h8RFnHQp6+1Fv9djzWGeP
	ESF0+SwqkYsWNKeiEaWWP1NA+HR+GJY8K9UqNJmb5B+EkQmzQHmKa2URdIT5zefV8Z+4
	vAaHCw1nXHVZSDg2rMzGHiwL5oKSS2HOKudWVRz37lNm7ErMxsmCxpdLOI2HaWspqD/v
	mR+Q==
X-Gm-Message-State: APjAAAVTvQspvBKmOGolCk0sw69zHkw+pseowiEKHZqAHo3DwEJFFHBj
	PX6ocgDUvAVs2hnerjLwqrJg3ppzqzA=
X-Google-Smtp-Source: APXvYqzNVo+LkhaQJG8y7RYCzcaWvJpG0JF8IxJrebcJnY3CkkCAfwnqmWbkH0dZWrTVvOZS45ToIg==
X-Received: by 2002:a1c:b782:: with SMTP id h124mr28366320wmf.5.1558007356961; 
	Thu, 16 May 2019 04:49:16 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f6sm5561990wro.12.2019.05.16.04.49.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 04:49:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 12:49:14 +0100
Message-Id: <20190516114914.12427-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516114914.12427-1-richard.purdie@linuxfoundation.org>
References: <20190516114914.12427-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] apr/apr-util: Add ptest dependency on libgcc
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
X-List-Received-Date: Thu, 16 May 2019 11:49:16 -0000
Content-Transfer-Encoding: 8bit

Avoid:

libgcc_s.so.1 must be installed for pthread_cancel to work

when running the ptest without libgcc.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/apr/apr-util_1.6.1.bb | 1 +
 meta/recipes-support/apr/apr_1.7.0.bb      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
index 0c90f8d2527..1f9fea25d87 100644
--- a/meta/recipes-support/apr/apr-util_1.6.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
@@ -79,6 +79,7 @@ INSANE_SKIP_${PN} += "dev-so"
 inherit ptest
 
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-gconv-iso8859-1 glibc-gconv-iso8859-2 glibc-gconv-utf-7"
+RDEPENDS_${PN}-ptest += "libgcc"
 
 do_compile_ptest() {
 	cd ${B}/test
diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
index a58651d0774..09a65bfdd68 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -53,6 +53,8 @@ do_configure_prepend() {
 FILES_${PN}-dev += "${libdir}/apr.exp ${datadir}/build-1/*"
 RDEPENDS_${PN}-dev += "bash"
 
+RDEPENDS_${PN}-ptest += "libgcc"
+
 #for some reason, build/libtool.m4 handled by buildconf still be overwritten
 #when autoconf, so handle it again.
 do_configure_append() {
-- 
2.20.1


