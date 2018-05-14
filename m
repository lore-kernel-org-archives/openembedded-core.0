Return-Path: <stefan@agner.ch>
X-Greylist: delayed 344 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 14 May 2018 14:50:16 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id E347474D1F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 14:50:16 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id D920A5C19DB;
	Mon, 14 May 2018 16:44:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1526309072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=tCV5/D8j88KBsryDPp0jAvslfwRhXM2Gystc0LbJySo=;
	b=gypmOZkDXmeaMGh2P4IfpgPVbP45fPJUEEHRiYZt1AKGxMFugj7J2r1GEEfONx8OA05Z4B
	Fdxuy5a/yyYNc6MeVFXCj6Nv3yW0Z3f/PIuQHiDBmT6cglxtNp/zSmjFxdVflhWUDfQCzT
	SoScAHyxuDkhy/JS+s+CO8zp5vJv35o=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2018 16:44:15 +0200
Message-Id: <20180514144415.40730-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
X-Spamd-Result: default: False [-2.10 / 15.00]; RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:6830, ipnet:46.140.0.0/17, country:AT];
	ARC_NA(0.00)[]; MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[]; DKIM_SIGNED(0.00)[];
	MID_CONTAINS_FROM(1.00)[]; RCVD_COUNT_ZERO(0.00)[0];
	BAYES_HAM(-3.00)[100.00%]; FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[]
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH] busybox: udhcpc: fix IPv6 support when using udhcpc
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
X-List-Received-Date: Mon, 14 May 2018 14:50:17 -0000

From: Stefan Agner <stefan.agner@toradex.com>

The udhcpc script calls ip addr flush .. which flushes addresses
of any address family, including IPv6. However, busybox udhcpc is
IPv4 only and should not influence IPv6 addressing. Hence use ip
addr flush with family constrait.

The script particularly broke IPv6 SLAAC: Typically when udhcpc
calls the script the kernel already assigned the IPv6 link-local
address. The flush removes the link-local IPv6 address again and
prohibits proper IPv6 operation such as SLAAC since neighbor
discovery protocol relies on IPv6 link-local addressing.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-core/busybox/files/simple.script | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
index 6ed0293525..8b5eb53633 100644
--- a/meta/recipes-core/busybox/files/simple.script
+++ b/meta/recipes-core/busybox/files/simple.script
@@ -28,7 +28,7 @@ case "$1" in
 		fi
 		if ! root_is_nfs ; then
                         if [ $have_bin_ip -eq 1 ]; then
-                                /SBIN_DIR/ip addr flush dev $interface
+                                /SBIN_DIR/ip -4 addr flush dev $interface
                                 /SBIN_DIR/ip link set dev $interface up
                         else
                                 /SBIN_DIR/ifconfig $interface 0.0.0.0
-- 
2.13.6


