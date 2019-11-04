Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 263D37F87B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 12:15:02 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n1so16794956wra.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 04:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=sJkY+x+G9K5dgSRgoWD7sFFmhdGSWuPryLIIBp5Sou4=;
	b=UG2+V3ynxhzzAIfWWDq2KgwjuQaZkz7VjY6uorJ1uD3785fmIyED2KKFBVzYy6Uj8V
	rcTB6M/3BU5v1umiVYSZtzjhdSXgO/eawMabIrZkGvWn58+9ZI2/COqoLQMgmekatpMy
	HZ2oyIkYbTDpGUspCJHRp+rNaCmo70569fPSG0eT92+loUsilBK1svMfViX6I4Ztk2VP
	tLJQu6XiO/wMKmp0ENcQr6SjzmL0lpD/rbNnCY+fB20cjcLYiUa8rGt+MkBGQRdENnv5
	2Hr6/zlj5ARAb2KVu1OKCfYZhAfgmnk85qZ2z3lGCSX5IsGrXK7bIBBv9QEWwZPCCTKz
	RTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sJkY+x+G9K5dgSRgoWD7sFFmhdGSWuPryLIIBp5Sou4=;
	b=sGNAXDWjNlOUnV5NfqSA7CC68x90//UdYOV80P+m3ale4oV6nUtwZb/KqjzDSuFQz9
	4Hwxb4SMElRX4fQWHpOwuV2H7zHC73aAN9i6Br3Db+xItgIxefRjdZdauFKbSY95w/Oe
	g35bcrdbDZ/xhtbDXMsB2RToK97a+Cg0wxauQav4pKCn3rLHeH/k8acSJOp3jnx34cU7
	YI9SIISWmuRCi/ZrXAmvlg+OHOrYa/Eem0q0NjH76Ovdqd2PYORaKKAfQrja4zqX3jW/
	CzmgFv6bXqPoRZwWYWY6VyuNptkowcpQZzHtAYLyW1nyS54IxTxfVMf7ZZMx4WbmO6xg
	9ZYQ==
X-Gm-Message-State: APjAAAVNUHcey4CwThiL/q0+42KroGix7fJU65FbpZS/cnpS2ITLLOQP
	AhEBuaqDSECeV16aXpNTA3U8GSmH0YQ=
X-Google-Smtp-Source: APXvYqzQbCMdXbvrogcF7GgL+1GXeD8LMgzvvbYj6SSVk4T3yaH2iNmu+R7F4kcfu8H8M9xYljYLBQ==
X-Received: by 2002:a5d:4649:: with SMTP id j9mr11645318wrs.248.1572869702841; 
	Mon, 04 Nov 2019 04:15:02 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b3sm15388077wma.13.2019.11.04.04.15.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 04:15:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 12:14:57 +0000
Message-Id: <20191104121457.22123-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191104121457.22123-1-ross.burton@intel.com>
References: <20191104121457.22123-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] file: run test suite when building natively
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
X-List-Received-Date: Mon, 04 Nov 2019 12:15:02 -0000
Content-Transfer-Encoding: 8bit

As we apply the same patches to native and target builds of file, we can verify
that the patches are not breaking by executing the test suite during the build
of file-native.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/file/file_5.37.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/file/file_5.37.bb b/meta/recipes-devtools/file/file_5.37.bb
index 80e8b91058b..a96ccc0d399 100644
--- a/meta/recipes-devtools/file/file_5.37.bb
+++ b/meta/recipes-devtools/file/file_5.37.bb
@@ -29,6 +29,10 @@ EXTRA_OEMAKE_append_class-nativesdk = "-e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/
 
 FILES_${PN} += "${datadir}/misc/*.mgc"
 
+do_compile_append_class-native() {
+	oe_runmake check
+}
+
 do_install_append_class-native() {
 	create_cmdline_wrapper ${D}/${bindir}/file \
 		--magic-file ${datadir}/misc/magic.mgc
-- 
2.20.1


