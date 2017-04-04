Return-Path: <liu.ming50@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 416346093D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 15:12:58 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id p77so9384380ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Apr 2017 08:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=B77BXN7UQppWWd59o6nUWJYowS/p7quqBukYUeEvdIk=;
	b=SBKYQqCjUaFe7mvkvRvXOUpt1kTrfk+PntYEp4VCAg6DEA+gSWXDV7PNh5xUJzRjcO
	WPqMgRfibzCyUW4udI6XSz0A7RCJANqEJCcRp2dmb7tyfVxyvlHFiOfrnkF8DJjoz7jH
	YC1sUH8QYhEhOQup2V2T9/TD6rE10mpjo/LmSaN9b/aBendsmvkVYLJRx3S4v/BAWCcU
	Acw5ouyJFT406LcyW+0ORGHmlAyeVsBuaijzhhkc8jerjXwwCr9MxLy+UieeWl8V1Nq5
	qtnehc/eOIvAgYlfEvUYJLwbAoGFYYb9dWp0kL5ESiW2wseSSWTe0g4EdHXnkYM3N3F3
	TAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=B77BXN7UQppWWd59o6nUWJYowS/p7quqBukYUeEvdIk=;
	b=H/NYW1tP77kURBeiPOGbZGI0B3SMnpqDkGQuJ9epgY3NHUoc1dZD6KJn+/cKKmECuZ
	Mdc4o6JO1p91OZmKpTXeSetsRAHYu+TpdT5DkA+S7KNgGXenyFnorA7wgsCBewkKu8ty
	hNLaD5gFcyYqJw+CPbYR3cwgvn16xluwSI/mxr71QbiIdWPh6TGID9S7SmWwLDGDKU3T
	scxGXKVZkg59JtcpD0+/7WBSM+7WoVcEQ/fuQkXSsKty6OHA+8nFsawNWIcJnSBQbxxN
	XTDiz+Nppy0uaI5AFVMo2ZyVNi3g0FPCgmFjCg9rOLB7fjl40/1gzOnJP4FUD3rLfJ7a
	xJjQ==
X-Gm-Message-State: AFeK/H3Oi6X+SUpyngvgc3g4nz2PiT1zuFxSyc64yBgygCAOB6up3BjzZFeAE2bABLoK6Q==
X-Received: by 10.13.202.22 with SMTP id m22mr14777660ywd.68.1491318779736;
	Tue, 04 Apr 2017 08:12:59 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.167]) by smtp.gmail.com with ESMTPSA id
	z194sm8155190ywg.73.2017.04.04.08.12.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Apr 2017 08:12:58 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 17:12:37 +0200
Message-Id: <1491318757-6375-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] glibc: fix nativesdk ldd RTLDLIST
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
X-List-Received-Date: Tue, 04 Apr 2017 15:12:59 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Override RTLDLIST for nativesdk, or else ldd would fail to run on
SDK targets.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-core/glibc/glibc-ld.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-ld.inc b/meta/recipes-core/glibc/glibc-ld.inc
index b89b70a..c1d635d 100644
--- a/meta/recipes-core/glibc/glibc-ld.inc
+++ b/meta/recipes-core/glibc/glibc-ld.inc
@@ -44,4 +44,5 @@ def glibc_dl_info(d):
 
 EGLIBC_KNOWN_INTERPRETER_NAMES = "${@glibc_dl_info(d)['ldconfig']}"
 RTLDLIST = "${@glibc_dl_info(d)['lddrewrite']}"
+RTLDLIST_class-nativesdk = "${base_libdir}/${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
 glibc_dl_info[vardepsexclude] = "OVERRIDES"
-- 
2.7.4


