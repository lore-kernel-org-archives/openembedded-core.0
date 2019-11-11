Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id D7E6B7F1BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 13:36:51 +0000 (UTC)
Received: from paloverde.toradex.int (31-10-206-124.static.upc.ch
	[31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id EFB185C0785;
	Mon, 11 Nov 2019 14:36:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1573479412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=Z4BqlKNiYaLWSjSc7R0Y7wNHuSvG1oKJKYvokSPilk4=;
	b=L2t3s8zkO/RAibUBOEl6H5cRLK1ZxTLcVUFAZDPDExU8Wxw1YzWUXvDWptfwtaM+wyEJ2U
	0r9n3lNOBU57Gr+vMKKJuNGwEipYEhm61+t5mhZdXuQ6Qd5Jw4yMKdEXd1jMFd4OJkYl8Y
	ILpeYEH+iz4USRNNX1/ODvwbimbgmLo=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 13:36:26 +0000
Message-Id: <20191111133626.9887-1-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH] dbus: drop unused group netdev
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
X-List-Received-Date: Mon, 11 Nov 2019 13:36:52 -0000

From: Stefan Agner <stefan.agner@toradex.com>

The whole D-Bus source has no reference to the netdev group. It
seems that the netdev group is nowhere used. Early avahi package
versions used this group for the D-Bus specific rules. However,
today avahi uses --with-avahi-priv-access-group=adm and hence
uses the adm group for its D-Bus policy rules.

If a package is using the netdev group in its D-Bus policy rules,
that package should add the group instead.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-core/dbus/dbus_1.12.16.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.12.16.bb b/meta/recipes-core/dbus/dbus_1.12.16.bb
index f4fec2365c..96b5036870 100644
--- a/meta/recipes-core/dbus/dbus_1.12.16.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.16.bb
@@ -32,7 +32,6 @@ python __anonymous() {
 }
 
 USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "-r netdev"
 USERADD_PARAM_${PN} = "--system --home ${localstatedir}/lib/dbus \
                        --no-create-home --shell /bin/false \
                        --user-group messagebus"
-- 
2.17.1


