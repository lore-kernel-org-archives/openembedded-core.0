Return-Path: <net147@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 09A1F6065B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 03:44:10 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id bj1so433259pad.29
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2013 20:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=mJEJWw5JZzkfmJzoa8LTjb+eRzr4hPqHVZz+d7/jg9A=;
	b=sbXuxVnwbuCV+Nv7F1WevmA9AXb8sNOPT3ClLsB+Dh3W4STHJy4DhhXxcQIDLFMJjA
	YQ7R5Zpi2hzkfCVMTXFgMsQNoGfgJWCeB92EYSDfqCrluW4Acv1V9KeelJwFQ3ogZsPQ
	IOKxiujM+9O9XCN/FZg7tyZIGpdov7+QB5PkeZ2QnLGi8tWpwS0fvX/gMWJ7KZeoiICc
	eZ/Xt4RpK8j3/2ANYq5HJf1KXp5nhylzdJ/0TbjPoNU9LYm4JFn9O/cb7ccLuOLDA5/O
	MSBjR7gBz5n719k1zSlOc0JzGIFfmpC6/g5bZUahJMKmTvIB59fwMhghonjfPUAh7yAR
	XN0Q==
X-Received: by 10.66.248.7 with SMTP id yi7mr24668707pac.41.1369539851005;
	Sat, 25 May 2013 20:44:11 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	vb8sm22806599pbc.11.2013.05.25.20.44.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 25 May 2013 20:44:10 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2013 13:57:33 +1000
Message-Id: <1369540653-3939-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] bind: remove empty /var/run directory
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
X-List-Received-Date: Sun, 26 May 2013 03:44:10 -0000

The /var/run directory is already created by base-files.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-connectivity/bind/bind_9.8.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
index 18cbb99..0663313 100644
--- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
@@ -39,6 +39,8 @@ FILES_${PN}-dev += "${bindir}/isc-config.h"
 do_install_append() {
 	rm "${D}${bindir}/nslookup"
 	rm "${D}${mandir}/man1/nslookup.1"
+	rmdir "${D}${localstatedir}/run"
+	rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
 	install -d "${D}${sysconfdir}/bind"
 	install -d "${D}${sysconfdir}/init.d"
 	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
-- 
1.8.2.3


