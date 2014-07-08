Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 827BA65CC9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 14:35:38 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id cc10so1118216wib.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jul 2014 07:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JOMU/W7bz/aSOcfb1/+TItGRhChsvj0DWbVH8YPjqdI=;
	b=XPIwD+zHT+/C52FQyjQWHed0z6OAjA9cqdaJJC2ZhFik3h5u7sjF9pBYAurt0mpvsL
	EiaVkIomxYbZVcpyVJrMXpFdkQroOooWF5NbiEExGnnZ86UO4ty9+3UWX7HGkTl4FkrB
	kMmiQK1S/3wVPgkyRCUwWXBKgMKOL9ed5+Grm/Fc4dFiXEZs/9NProeNIRTcK6otawJZ
	4w5SiE3HT5zXsJRb8U8QZqvBCXITKckPrkXNkBJU9uVydT0ZoQTChOhIFuygtGhZST+a
	GtJ+D0rPRxR7oMmzN8Jk/s79sAaJJro0dQ0kf6ntgcmuxr9zzY1kCQkspUKfQRh4t7mn
	HYTw==
X-Gm-Message-State: ALoCoQkC5WJ5dBtO5F2CU1PFfxOrYOHiWemubU8nWl3ceKbARRZGShdrg5Er4zdGRehNfrcgjKJa
X-Received: by 10.180.19.138 with SMTP id f10mr4522600wie.38.1404830137948;
	Tue, 08 Jul 2014 07:35:37 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id lo18sm7775882wic.1.2014.07.08.07.35.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 08 Jul 2014 07:35:37 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jul 2014 16:35:26 +0200
Message-Id: <1404830127-12742-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] libnss-mdns: support ipv6 in lookups
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

It nothing can resolve the hostname as ipv4 it will also try ipv6.
Ideally the mdns4_minimal should get replaced as well, but there's some
handwaving on the internet stating it will slow things down if your ipv6
network is misconfigured.
Since I can't verify that slowdown I've opted for the safe way and only
do ipv6 lookup in the fallback entry.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
index 5b8c700..df7d196 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
@@ -26,13 +26,13 @@ DEBIANNAME_${PN} = "libnss-mdns"
 RDEPENDS_${PN} = "avahi-daemon"
 
 pkg_postinst_${PN} () {
-	sed -e '/^hosts:/s/\s*\<mdns4\>//' \
-		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 mdns4_minimal [NOTFOUND=return]\3\4 mdns4\5/' \
+	sed -e '/^hosts:/s/\s*\<mdns\>//' \
+		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 mdns4_minimal [NOTFOUND=return]\3\4 mdns\5/' \
 		-i $D/etc/nsswitch.conf
 }
 
 pkg_prerm_${PN} () {
-	sed -e '/^hosts:/s/\s*\<mdns4\>//' \
+	sed -e '/^hosts:/s/\s*\<mdns\>//' \
 		-e '/^hosts:/s/\s*mdns4_minimal\s\+\[NOTFOUND=return\]//' \
 		-i $D/etc/nsswitch.conf
 }
-- 
1.9.0


