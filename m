Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B07BC61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 14:12:38 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.137805.1700835150485420691
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 06:12:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=LPziipla;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=8JipkBN4sdGzYnysuW9oVRcx3UoJxzYSfU/tr2MccIo=; b=LPziiplasIztRB3xHQwMfXMbip
	fzMzu6o97ySYcrfHynV6a7MxmVVa8YFrMPVF6Myp4qJFQIGG506+2EdCna/OGRBwRjDU4VmYR90Oi
	eQK1yTPbNo0rP7KrEuKU+QGXz9KsjKiInHNj1uPZF8MgInwUVEedIgFJGSepi1z5cR1M6JhGh7iCy
	KBG2DxZVIOPCIGYpk9VDaOQIvw8xWPobLf4XHvj4VLPtdEhQHX1BCfwdFBEh9j4HgRtr5l69Yvv90
	ri4J/v05gftybK9otjqV/iEEeXeo9RVmoaplWM2C75fAImFOPTiv2zX+HLDeF4Y9NcCPRVyRrvVEl
	jSIUM+WA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1r6Wuy-0003xE-LB; Fri, 24 Nov 2023 15:12:28 +0100
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <martin@geanix.com>)
	id 1r6Wuy-000W7O-Do; Fri, 24 Nov 2023 15:12:28 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH] libpam: split /etc/environment into pam-plugin-env package
Date: Fri, 24 Nov 2023 15:12:13 +0100
Message-ID: <20231124141213.2071910-1-martin@geanix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27103/Fri Nov 24 09:40:22 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 14:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191201

Since systemd-v255, pam-plugin-umask is pulled in by by the logind
package config for systemd. This causes /etc/environment to by installed
as part of libpam-runtime. In our case, this broke do_rootfs for our
image, because /etc/environment is already provided another (custom)
recipe.

Fix this by making the /etc/environment file part of the pam-plugin-env
package, which isn't automatically pulled in by systemd-logind. It also
happens to be the where it should be, as the file is installed as by the
pam_env plugin.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 meta/recipes-extended/pam/libpam_1.5.3.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-extended/pam/libpam_1.5.3.bb
index 1aa307af4d..c2ba1e6899 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -51,9 +51,14 @@ PACKAGECONFIG[userdb] = "--enable-db=db,--enable-db=no,db,"
 PACKAGES += "${PN}-runtime ${PN}-xtests"
 FILES:${PN} = "${base_libdir}/lib*${SOLIBS}"
 FILES:${PN}-dev += "${base_libdir}/security/*.la ${base_libdir}/*.la ${base_libdir}/lib*${SOLIBSDEV}"
-FILES:${PN}-runtime = "${sysconfdir} ${sbindir} ${systemd_system_unitdir}"
+FILES:${PN}-runtime = "${sysconfdir}/pam.d ${sysconfdir}/security ${sysconfdir}/tmpfiles.d ${sbindir} ${systemd_system_unitdir}"
 FILES:${PN}-xtests = "${datadir}/Linux-PAM/xtests"
 
+# libpam installs /etc/environment for use with the pam_env plugin. Make sure it is
+# packaged with the pam-plugin-env package to avoid breaking installations which
+# install that file via other packages
+FILES:pam-plugin-env = "/etc/environment"
+
 PACKAGES_DYNAMIC += "^${MLPREFIX}pam-plugin-.*"
 
 def get_multilib_bit(d):
-- 
2.42.0


