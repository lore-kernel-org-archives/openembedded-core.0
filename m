Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE24C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 12:46:18 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.93729.1701089170153863613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 04:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=0MBIdwrn;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=arSuPNYlJpBZLoDBal/pCfVjoErgj4IKiOiOZjLxhvw=; b=0MBIdwrn8V6MsdhsjBJCbkzSlq
	IaSRh+4Nnj6DoRAlsH2ALLRnyP0mo1xwvj+Z5tsv3N5XFpl2W1rTUxxW34mbShNAE4bBL5IaeJvkV
	tb3+Ml5Auz1Ql0lv5vb8ISb3ebwlcL20P4vSK0TjM7MfOcHSEOwXXusYLnl1s25xoiAU8J/hhy4IK
	LaICrFd9kbvVo7/noB9goo9UCK1zUbryeKK7oJYxBXYHOyNuYksQf1lynbjWXra6C1Vai7l2BRSF1
	AiYs4Yf6zP8tK9lq0k1Q9NKBOSL2YixbtjSk/5hLOh1s5D4WDnHyXELmj87PadHz4MqnFHP75E9eS
	OWS+u7xg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1r7b04-0004CW-4O; Mon, 27 Nov 2023 13:46:08 +0100
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <martin@geanix.com>)
	id 1r7b03-0000Na-Uo; Mon, 27 Nov 2023 13:46:07 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH v2] libpam: split /etc/environment into pam-plugin-env package
Date: Mon, 27 Nov 2023 13:45:57 +0100
Message-ID: <20231127124557.2116286-1-martin@geanix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27106/Mon Nov 27 09:39:12 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 12:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191297

Since systemd-v255, pam-plugin-umask is pulled in by by the logind
package config for systemd. This causes /etc/environment to be installed
as part of libpam-runtime. In our case, this broke do_rootfs for our
image, because /etc/environment is already provided by another (custom)
recipe.

Fix this by making the /etc/environment file part of the pam-plugin-env
package, which isn't automatically pulled in by systemd-logind. It also
happens to be the where it should be, as the file is installed as part
of the pam_env plugin.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---

Changes in v2:
 * fixed typos in commit message
 * replaced changes to FILES:${PN}-runtime with prepend=True in
   do_split_packages()

 meta/recipes-extended/pam/libpam_1.5.3.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-extended/pam/libpam_1.5.3.bb
index 1aa307af4d..3183bb018f 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -54,6 +54,11 @@ FILES:${PN}-dev += "${base_libdir}/security/*.la ${base_libdir}/*.la ${base_libd
 FILES:${PN}-runtime = "${sysconfdir} ${sbindir} ${systemd_system_unitdir}"
 FILES:${PN}-xtests = "${datadir}/Linux-PAM/xtests"
 
+# libpam installs /etc/environment for use with the pam_env plugin. Make sure it is
+# packaged with the pam-plugin-env package to avoid breaking installations which
+# install that file via other packages
+FILES:pam-plugin-env = "${sysconfdir}/environment"
+
 PACKAGES_DYNAMIC += "^${MLPREFIX}pam-plugin-.*"
 
 def get_multilib_bit(d):
@@ -110,7 +115,7 @@ python populate_packages:prepend () {
     pam_pkgname = mlprefix + 'pam-plugin%s'
 
     do_split_packages(d, pam_libdir, r'^pam(.*)\.so$', pam_pkgname,
-                      'PAM plugin for %s', hook=pam_plugin_hook, extra_depends='')
+                      'PAM plugin for %s', hook=pam_plugin_hook, extra_depends='', prepend=True)
     do_split_packages(d, pam_filterdir, r'^(.*)$', 'pam-filter-%s', 'PAM filter for %s', extra_depends='')
 }
 
-- 
2.42.0


