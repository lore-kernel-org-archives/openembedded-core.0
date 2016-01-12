Return-Path: <ejo@pengutronix.de>
X-Greylist: delayed 1088 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Jan 2016 13:14:38 UTC
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 0D3FA6FF7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 13:14:38 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:RSA_AES_128_CBC_SHA1:128) (Exim 4.80)
	(envelope-from <ejo@pengutronix.de>)
	id 1aIyUv-0004rV-BR; Tue, 12 Jan 2016 13:56:29 +0100
Received: from ejo by dude.hi.pengutronix.de with local (Exim 4.86)
	(envelope-from <ejo@pengutronix.de>)
	id 1aIyUv-0003Ek-4V; Tue, 12 Jan 2016 13:56:29 +0100
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 13:55:43 +0100
Message-Id: <1452603343-30895-1-git-send-email-ejo@pengutronix.de>
X-Mailer: git-send-email 2.6.4
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: fix systemctl enable script for template units
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
X-List-Received-Date: Tue, 12 Jan 2016 13:14:42 -0000

The systemctl script supports enabling template units by evaluating
"DefaultInstance" parameter. Unfortunately, due to the sed replacement
mechanism, all escaping used in the DefaultInstance string, e.g. for
giving path names with dashes, is expanded too early.

Thus for

  DefaultInstance=-path\x2dwith\x2ddashes

a path unit `foobar@.path` will be installed with a symlink named

  foobar@-path-with-dashed.path

that is interpreted as the path `/path/with/dashes` instead of the
intended path nam `/path-with-dashes`.

To fix this behavior additional escaping of the backslashes in the
`DefaultInstance` string is required so that sed does not expand the
escaped characters.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 6e163bd..697fbd5 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -136,7 +136,7 @@ for service in $services; do
 					continue
 				else
 					echo "Found DefaultInstance $default_instance, enabling it"
-					enable_service=$(echo $service | sed "s/@/@$default_instance/")
+					enable_service=$(echo $service | sed "s/@/@$(echo $default_instance | sed 's/\\/\\\\/g')/")
 				fi
 			fi
 			mkdir -p $ROOT/etc/systemd/system/$r.wants
-- 
2.6.4


