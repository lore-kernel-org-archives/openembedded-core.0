Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id DB0507040F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 14:35:39 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so691583wgh.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jul 2014 07:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pZ6psLBhWHHdosJW+AUl6L7OeyF9pbPCR1zhuPDButM=;
	b=gL09RwO/4KLetJvc96CHkH4ljIE2aywogvxdCCpCP/fMSgsD1ZUm4s2R0vTu8iD7RZ
	F4UbthvIeF3jnrHsar82+ETOHrRcO09s1r/ZF9164Sa0i2d4INA6rCTK9QpZIXWxy+NK
	2hyj+FG+hYh/s+lPTe4XM5c3XYlxyMhF7bB7Tv0gNpHD+ETuLRR5w2JCEmQBtXKGKQhR
	d1kYNXJpJI33hSNjGhssATAkloEmyR+kdGbDfbv9JAbRM0mu1bNy8p9boh5NDp4NAotm
	M+vqOBT+RbO4eIUoZHbKhql9+wkrvaDgW7Pb8P7+g6bHQRft6PrNUm/LK0PEhUXn7dc0
	JUhA==
X-Gm-Message-State: ALoCoQli4+V0LP76uuBmTv1OFgaaVyhTX11fUUqpmqMgG0kBATa5Qgs6uBaG2D7xu4mKFbIxu2uZ
X-Received: by 10.194.250.37 with SMTP id yz5mr39321588wjc.47.1404830140080;
	Tue, 08 Jul 2014 07:35:40 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id 19sm96805388wjz.3.2014.07.08.07.35.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 08 Jul 2014 07:35:39 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jul 2014 16:35:27 +0200
Message-Id: <1404830127-12742-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1404830127-12742-1-git-send-email-koen@dominion.thruhere.net>
References: <1404830127-12742-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/2] libnss-mdns: replace hardcoded /etc with ${sysconfdir}
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
X-List-Received-Date: Tue, 08 Jul 2014 14:35:40 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
index df7d196..0b936ef 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
@@ -28,11 +28,11 @@ RDEPENDS_${PN} = "avahi-daemon"
 pkg_postinst_${PN} () {
 	sed -e '/^hosts:/s/\s*\<mdns\>//' \
 		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 mdns4_minimal [NOTFOUND=return]\3\4 mdns\5/' \
-		-i $D/etc/nsswitch.conf
+		-i $D${sysconfdir}/nsswitch.conf
 }
 
 pkg_prerm_${PN} () {
 	sed -e '/^hosts:/s/\s*\<mdns\>//' \
 		-e '/^hosts:/s/\s*mdns4_minimal\s\+\[NOTFOUND=return\]//' \
-		-i $D/etc/nsswitch.conf
+		-i $D${sysconfdir}/nsswitch.conf
 }
-- 
1.9.0


