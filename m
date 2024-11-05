Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0A3D36124
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 19:49:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29424.1730836145987724411
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 11:49:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48DAA1063
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 11:49:35 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0A9753F528
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 11:49:04 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] local.conf.sample: use explicit IMAGE_FEATURES instead of debug-tweaks
Date: Tue,  5 Nov 2024 19:48:57 +0000
Message-Id: <20241105194857.3351281-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105194857.3351281-1-ross.burton@arm.com>
References: <20241105194857.3351281-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 19:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206751

debug-tweaks is vague and doesn't give any indication that the root user
can login over SSH without a password.  This behaviour is incredibly
dangerous if used unwittingly, so discourage it by using the underlying
features explicitly to spell out exactly what is being done.

This is not the complete set of features that debug-tweaks enables,
but I don't think we need to enable serial-autologin-root or
post-install-logging by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-poky/conf/templates/default/local.conf.sample | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-poky/conf/templates/default/local.conf.sample b/meta-po=
ky/conf/templates/default/local.conf.sample
index 72d35662940..cfa77106ab3 100644
--- a/meta-poky/conf/templates/default/local.conf.sample
+++ b/meta-poky/conf/templates/default/local.conf.sample
@@ -145,8 +145,8 @@ DISTRO ?=3D "poky"
 # There are other application targets that can be used here too, see
 # meta/classes-recipe/image.bbclass and
 # meta/classes-recipe/core-image.bbclass for more details.
-# We default to enabling the debugging tweaks.
-EXTRA_IMAGE_FEATURES ?=3D "debug-tweaks"
+# We default to allowing root login without a password for convenience.
+EXTRA_IMAGE_FEATURES ?=3D "allow-empty-password empty-root-password allo=
w-root-login"
=20
 #
 # Additional image features
--=20
2.34.1


