Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id E21B877952
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 11:35:33 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id j90so66106024lfk.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 04:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=NnPbflwj6xaFRPAu7OmaIvt3niVRPQt7TdYnnqRoghs=;
	b=UM4oC+1FxRKX5IndfJngqAxu/DOlBuejonRVLr7lylsGoQp0tdqVIeq7vDSqgg1pZy
	1VgVZusRdA2RwDVUokvpOYSaqoyP1goSqeZ7THqrq8vnJqBU4sNdWDWsc9hSvJcVkNTp
	kdsPo5PI6+jRFaJhv9+OJYWkNkG2pOPVsAopCJIIlxGEQ9sLZsT093EB+/GPjpxcbDIE
	FWZcJ1LW9Sylo4TtN557YsKxa4ppBtnYcPlyHVzrCHLqCaVElyt9iaWV/65yf7siGbVD
	bdH4sCWYW/mI8xDQGiP+g7sLZ/4kjffcxZ/an83C+BmUdlkbC6wk4v5g9+QqTVPAYvUD
	Ssrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=NnPbflwj6xaFRPAu7OmaIvt3niVRPQt7TdYnnqRoghs=;
	b=QTtYj7BrhpcTLZ9t5LwA+j7+dFDnnsK81z1b6nMynl37Ov6ve74GDOKX1iyw/SYfF9
	EVoLzGvQOvelyxfXQwsnvx9I7+cxOpSgHZQfEcUskFo7O/hoLxwEq1QHarG3AUib/6L8
	CexXHBhmkQFD5XLrC25Eznh9/bGY6+oNPUcAY4yMGpBfIXeKaLC/Y8qKAvc9UACwIp5J
	LFdVTlY5ohuIczA0eyCTbrvasw+zR8JAy9P3wuqBPXjzXQRuYuWnvqZQduS11TtmSe8H
	0WPdPhA8XxHNDxPushQF6K8VA8A3MHj12J+cW4WZ4UPmD9CSNMr/fg/5eOtfarME1MKU
	aSOA==
X-Gm-Message-State: AFeK/H1kuIN58CizqM3v97n+3FnVPu89DcJTyl1hwRl3YDrAN2x168Tak6KoqVXlENAkBQ==
X-Received: by 10.46.5.68 with SMTP id 65mr11091586ljf.49.1490096134465;
	Tue, 21 Mar 2017 04:35:34 -0700 (PDT)
Received: from localhost.localdomain (staticline-31-182-60-238.toya.net.pl.
	[31.182.60.238]) by smtp.gmail.com with ESMTPSA id
	f28sm3516079lfi.52.2017.03.21.04.35.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Mar 2017 04:35:33 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 12:35:01 +0100
Message-Id: <922271f9b39edd7a632e8e5902f4256f8a26e30f.1490095649.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1490095649.git.maciej.borzecki@rndity.com>
References: <20170317144027.GA22297@linux.intel.com>
	<cover.1490095649.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1490095649.git.maciej.borzecki@rndity.com>
References: <cover.1490095649.git.maciej.borzecki@rndity.com>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v4 1/5] selftest: wictestdisk: machine agnostic WKS for use with selftest
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
X-List-Received-Date: Tue, 21 Mar 2017 11:35:34 -0000

Add a kickstart for an image that is not limited to use on x86 compatible
machines. This allows us to run more wic tests on non-x86 architectures.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta-selftest/wic/wictestdisk.wks | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-selftest/wic/wictestdisk.wks

diff --git a/meta-selftest/wic/wictestdisk.wks b/meta-selftest/wic/wictestdisk.wks
new file mode 100644
index 0000000000000000000000000000000000000000..d4de24d83097dab2851dbf5f2b6884679de7c77c
--- /dev/null
+++ b/meta-selftest/wic/wictestdisk.wks
@@ -0,0 +1,7 @@
+# short-description: image for use in machine agnostic wic test cases
+
+# /boot is intentionally an empty partition
+part /boot --ondisk sda --label boot --active --align 1024 --size 16
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
+
+# bootloader is intentionally left out
-- 
2.9.3


