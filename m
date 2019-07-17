Return-Path: <mcfrisk@kapsi.fi>
X-Greylist: delayed 1274 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 17 Jul 2019 09:30:07 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 7B61C7ECCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nswuiSoqOHvt5+exEJpT37olUNdwjPGF5A1XznYrKqs=;
	b=zYWF2Ay1dH0itjZqKX3QzhyzjR
	pJmNNea+Dq4d/UI29oH2StdI2v0+OyI7HrlZdv0ceTecB0dDZlGp5GmfIY6U2bag4kaN52pqC/6kA
	fFu2UZXRiXgSxKTyyGUe6E0idITwldXryt1hPWByElSgIrWjzRde5YhERu23IFPyofICTOhT7Uwt9
	qpnbbGNLukCdUp6BiW5xfhJn0cnNppbcIkih6LSJ+fS9Mw08WQZjwo2hG++E8iay5ZdIg8mrntMZE
	00y9wKwWJlll6eA1LdD2+gURg9mHIDN2DJWUoCHZcAIhkn9bkNOhWJMAMqDq9stK35kbhY5FrNWbV
	NB7muHSA==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1hnfvf-0005EV-R2; Wed, 17 Jul 2019 12:08:52 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1hnfvV-0008Q0-HZ; Wed, 17 Jul 2019 12:08:41 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 12:08:36 +0300
Message-Id: <1563354517-31850-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-Rspam-Score: 1.2 (+)
X-Rspam-Report: Action: no action Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: R_SPF_NEUTRAL(0.00)
	Symbol: FROM_HAS_DN(0.00) Symbol: TO_DN_SOME(0.00)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00) Symbol: MIME_GOOD(-0.10)
	Symbol: RCVD_TLS_LAST(0.00) Symbol: NEURAL_SPAM(0.00)
	Symbol: IP_SCORE(-0.08) Symbol: RCPT_COUNT_TWO(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf neutral
	Message-ID: 1563354517-31850-1-git-send-email-mikko.rapeli@bmw.de
X-Rspam-Bar: +
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 1/2] busybox: enable unicode support
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
X-List-Received-Date: Wed, 17 Jul 2019 09:30:07 -0000

While creating and deleting files with unicode or other
encodings works, it's annoying when ls and other core utils
show questionmarks instead of the unicode characters.
In 2019, it's quite common that users of embedded devices
based on yocto need unicode support. Debugging a box with
unicode encoded file names is a bit annoying when core utils
from busybox don't support them.

The unicode config fragment has the same config as Debian in their
deb and udeb builds of version 1:1.30.1-4.

If developers do not want this or other default yocto features in busybox,
or optimize the configuration for size, then they likely run a completely
custom configuration. Thus I think it's safe to enable unicode support
by default.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-core/busybox/busybox/unicode.cfg | 10 ++++++++++
 meta/recipes-core/busybox/busybox_1.31.0.bb   |  1 +
 2 files changed, 11 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/unicode.cfg

diff --git a/meta/recipes-core/busybox/busybox/unicode.cfg b/meta/recipes-core/busybox/busybox/unicode.cfg
new file mode 100644
index 0000000..ecb5a64
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/unicode.cfg
@@ -0,0 +1,10 @@
+CONFIG_UNICODE_SUPPORT=y
+# CONFIG_UNICODE_USING_LOCALE is not set
+CONFIG_FEATURE_CHECK_UNICODE_IN_ENV=y
+CONFIG_SUBST_WCHAR=63
+CONFIG_LAST_SUPPORTED_WCHAR=767
+CONFIG_UNICODE_COMBINING_WCHARS=y
+CONFIG_UNICODE_WIDE_WCHARS=y
+# CONFIG_UNICODE_BIDI_SUPPORT is not set
+# CONFIG_UNICODE_NEUTRAL_TABLE is not set
+# CONFIG_UNICODE_PRESERVE_BROKEN is not set
diff --git a/meta/recipes-core/busybox/busybox_1.31.0.bb b/meta/recipes-core/busybox/busybox_1.31.0.bb
index f018543..c1da372 100644
--- a/meta/recipes-core/busybox/busybox_1.31.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.0.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
            ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
            file://syslog.cfg \
+           file://unicode.cfg \
            file://inittab \
            file://rcS \
            file://rcK \
-- 
1.9.1


