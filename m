Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE66C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 09:42:25 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.9463.1714642935362495168
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 02:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=0y+TUm+i;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=r+271MWGsLiHLvERRFkR/zyruILVJAkuReYUWTk/mXo=; b=0y+TUm+i3ao1x0CBUGoqWcVkGP
	230rLrAQGHupzhJ80UYAEsGagUbQA6cQujRK5MbTCfwxq+qdbIxmNdQnBKBC7oA2pXPEl0U8OOqzu
	4rQ82QiKIYNq/sHQQSADioLsW6dw6MSO7fkhRrP+XQHmBmyAL/Kuq0G+vNI+QHMQRTheUSAxY38gr
	10kehBqRvs6vjOKSVlhT+BN38J1mS1DzMwF8EhCvnFZu5Zemgg1fSTJOg4SwIKYhXmut6iwywm5Ym
	y9FtiuoxwCq+WvtHbwXRfKFKdqSRWXLzoj1Ayay4vpOT65qKKoPyHZziFmT4LfUZ71coOKFZrdtA/
	V9iyl20g==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1s2SxA-000PD2-It; Thu, 02 May 2024 11:42:12 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1s2SxA-000NVU-0n;
	Thu, 02 May 2024 11:42:12 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Christian=20Br=C3=A4uner=20S=C3=B8rensen?= <yocto@bsorensen.net>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [scarthgap v2] systemd: sed ROOT_HOME only if sysusers PACKAGECONFIG is set
Date: Thu,  2 May 2024 11:42:04 +0200
Message-ID: <20240502094204.3865267-1-martin@geanix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240502093549.3851817-1-martin@geanix.com>
References: <20240502093549.3851817-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27263/Thu May  2 10:23:13 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 09:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198909

From: Christian Bräuner Sørensen <yocto@bsorensen.net>

Fixes a bug introducted in ebafe46379 systemd: upgrade to 255.1.

Besides updating systemd, that commit also made other changes. One of them
being when to perform the replacement in order to fix ROOT_HOME.

Previously, that happened on a configure prefunc and on
${S}/sysusers.d/basic.conf.in.
Now it happens in install and on image/usr/lib/sysusers.d/basic.conf.

However, that file is not present if sysusers is not in PACKAGECONFIG,
since that file in that case is not installed hence resulting in:
sed: can't read <redactedpath>/image/usr/lib/sysusers.d/basic.conf: No such file or directory

Previously, in the case of sysusers not being in PACKAGECONFIG, that was a
"silent error" since the replacement was done but the file was not really
used since the file was not installed.

Signed-off-by: Christian Bräuner Sørensen <yocto@bsorensen.net>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Hundebøll <martin@geanix.com>
---

Added Signed-off-by.

 meta/recipes-core/systemd/systemd_255.4.bb | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-core/systemd/systemd_255.4.bb
index e7498c802d..f58a1bc2b6 100644
--- a/meta/recipes-core/systemd/systemd_255.4.bb
+++ b/meta/recipes-core/systemd/systemd_255.4.bb
@@ -271,14 +271,16 @@ WATCHDOG_TIMEOUT ??= "60"
 
 do_install() {
 	meson_do_install
-	# Change the root user's home directory in /lib/sysusers.d/basic.conf.
-	# This is done merely for backward compatibility with previous systemd recipes.
-	# systemd hardcodes root user's HOME to be "/root". Changing to use other values
-	# may have unexpected runtime behaviors.
-	if [ "${ROOT_HOME}" != "/root" ]; then
-		bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully supported by systemd"
-		sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/basic.conf
-	fi
+	if ${@bb.utils.contains('PACKAGECONFIG', 'sysusers', 'true', 'false', d)}; then
+            # Change the root user's home directory in /lib/sysusers.d/basic.conf.
+            # This is done merely for backward compatibility with previous systemd recipes.
+            # systemd hardcodes root user's HOME to be "/root". Changing to use other values
+            # may have unexpected runtime behaviors.
+            if [ "${ROOT_HOME}" != "/root" ]; then
+                    bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully supported by systemd"
+                    sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/basic.conf
+            fi
+        fi
 	install -d ${D}/${base_sbindir}
 	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'false', 'true', d)}; then
 		# Provided by a separate recipe
-- 
2.44.0


