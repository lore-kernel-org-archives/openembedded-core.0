Return-Path: <mporter@konsulko.com>
Received: from mail-it1-f169.google.com (mail-it1-f169.google.com
	[209.85.166.169])
	by mail.openembedded.org (Postfix) with ESMTP id D81FE7D015
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 16:50:48 +0000 (UTC)
Received: by mail-it1-f169.google.com with SMTP id u65so163760itc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:subject:date:message-id;
	bh=JwOMnORN6va7ck5pQFgn4KkmrNRjl+XPCtBNZRGWlF4=;
	b=h47I8iTpmVOtXl+Kh18BzootTeEQi3JvbYUFdkPfNSiDsO2j/sPc3+kqB0udOktHGA
	8MAJeJGo1g0OFXppw2Xc8P8FhEY1HtF9wL0IU2zBEz+0MAuh92AEdYTItf+URCvn+gfS
	QBRgFVSOjohBqt9xZdDGN4eyk/pEWIPymvWgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JwOMnORN6va7ck5pQFgn4KkmrNRjl+XPCtBNZRGWlF4=;
	b=FUfaEH9JIKMa0Quie/pu1yR7vt+VlTgaFTb86oTO+zf7uYjlVz7X6UwrfABwlHgot3
	YHPiDPo/zstyYQJOeNtNO1Hw1Tu5b9EzEzgncO9zguZoMc3RnCN4TMi1HE8mSd8NfBJI
	gXiXbYnYtge0fDxDEdxjyKDCLVPXbzW8YwW+L85x8cwAhnfpcqNlPcNmASa1LAcN1uJI
	Q4+1RcA2fEYoeyUqYsfySyEnXIabnp1zuoUhgXixOECM84309qDUuZwHjKuu9UTFSPrK
	kJEF9L+EDoQDAKzPb/OLWTP3nASmpQDBW5q3S6CKqlJC5F+BGgETp9X1GKKtBK3Io2z2
	WT+w==
X-Gm-Message-State: APjAAAVeys/1G1/8uMseNvnn71H3XPyH5J1Olg0wgi8EP+lvq9ZOG4Ux
	/ARkgAWZmTrb/EqT6L+vhu3Mvr4ZBCquXw==
X-Google-Smtp-Source: APXvYqySMYrGshXDcXZB6qDwdN9BcFUVi30rRI0SmdOtKiAPQUhIoooLhhBO7CykAlvQJr1b6XwjNA==
X-Received: by 2002:a24:b214:: with SMTP id u20mr361735ite.134.1554137449367; 
	Mon, 01 Apr 2019 09:50:49 -0700 (PDT)
Received: from beef.ohporter.com (cpe-173-90-206-207.neo.res.rr.com.
	[173.90.206.207]) by smtp.gmail.com with ESMTPSA id
	d143sm5836377itd.44.2019.04.01.09.50.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 09:50:47 -0700 (PDT)
From: Matt Porter <mporter@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 12:50:34 -0400
Message-Id: <20190401165034.11426-1-mporter@konsulko.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] busybox: fix CONFIG_RFKILL enable logic
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
X-List-Received-Date: Mon, 01 Apr 2019 16:50:49 -0000

Currently CONFIG_RFKILL is enabled only if both bluetooth *and* wifi
distro features are present. It should be enabled when either feature
is present. Fix this by switching to use of bb.utils.contains_any().

Signed-off-by: Matt Porter <mporter@konsulko.com>
---
 meta/recipes-core/busybox/busybox.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 24c15e4aee..c9d25ff1ca 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -75,8 +75,7 @@ def features_to_busybox_settings(d):
     busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'nls', True, False, d), 'CONFIG_LOCALE_SUPPORT', cnf, rem)
     busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv4', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
     busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv6', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
-    busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'wifi', True, False, d), 'CONFIG_RFKILL', cnf, rem)
-    busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'bluetooth', True, False, d), 'CONFIG_RFKILL', cnf, rem)
+    busybox_cfg(bb.utils.contains_any('DISTRO_FEATURES', 'bluetooth wifi', True, False, d), 'CONFIG_RFKILL', cnf, rem)
     return "\n".join(cnf), "\n".join(rem)
 
 # X, Y = ${@features_to_busybox_settings(d)}
-- 
2.11.0


