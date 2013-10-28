Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id F13A26D2C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 17:52:44 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id y10so7040872wgg.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 10:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0uKYXfJv0BMXPi4FMwkuVbieVtu/EanZWpcoRGstei4=;
	b=Pd3POH0t8o4Re3vWTI47VOASfxfv5CP8j1gVkVNn76yp0HMBx0HWDUlcIwiEghs+3i
	Q+yeCiHagI4D1zWOuKyBxG7Qn4+tyN1Qux2kxxdW7v9KqAOT/vq2zGilu/jzJlBXOTA9
	VhjLsYUkZsn8dSJS1bnpkQ0BZGDZPVzE+tOu8BT/tHgPuom/Amrn/rmBzuWrCcpyF7DE
	7E5LJ9IGTN4RMZV33EeWyD9wTc6q3b9B7USdfeuD2Qi4uxhWMPveKbbQqANubUcYrNtA
	viRBWw6wnfk+v3lrwrVUDMiO99QP269CK8039E9NyQCmo8JnuTB2a9WcpwMowydtQq/3
	+Cmg==
X-Gm-Message-State: ALoCoQnpQ9UygnfBil1Wf6RMpvylgxTH0GdIlz09btXS8USgvdICMdo07PO9s0bdHU58YxVjW3s3
X-Received: by 10.180.160.212 with SMTP id xm20mr10034115wib.23.1382982766496; 
	Mon, 28 Oct 2013 10:52:46 -0700 (PDT)
Received: from flashheart.burtonini.com (188.29.164.220.threembb.co.uk.
	[188.29.164.220])
	by mx.google.com with ESMTPSA id q3sm858284wib.5.2013.10.28.10.52.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Oct 2013 10:52:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 17:52:31 +0000
Message-Id: <1382982751-1187-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] xorg-proto-common: set UNKNOWN_CONFIGURE_WHITELIST
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
X-List-Received-Date: Mon, 28 Oct 2013 17:52:45 -0000

This include adds configure options globally but not all X libraries support
them, so to avoid unknown-configure-option warnings add them to the whitelist.

Also change the options from --enable-foo=no to --disable-foo as they're clearer
and the whitelist would have to contain --enable-foo.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-proto/xorg-proto-common.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
index 856f4d8..4680d0e 100644
--- a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
+++ b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
@@ -14,7 +14,9 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 DEPENDS = "util-macros"
 
 inherit autotools pkgconfig
-EXTRA_OECONF = "--with-fop=no --without-xmlto"
+EXTRA_OECONF = "--without-fop --without-xmlto"
+
+UNKNOWN_CONFIGURE_WHITELIST += "--without-fop --without-xmlto"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
-- 
1.7.10.4


