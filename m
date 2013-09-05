Return-Path: <net147@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id B095061625
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 05:28:06 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id r10so1326231pdi.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 22:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FWzwUTr/hoPEDW9/GmyrPLzWHlstGxcjKISse3LhsVg=;
	b=UjzEkpEzHi3cIwaS10/HuagXVGiBMQZxVEO4UEYs7qOTtxmaaAlOhQtJxY0/lhHVsO
	VlKlQloC/flJsYqST1VBTP4GTtVdt6NUgnhTJNy/881QKMflwJ4QJkM9TwiCodln5wXn
	m2SwVTrdNbryhM3wzcf6XuSkShkIpcPvX7YP7ms3mzhsS1wsOrQ7h+9X+6CbO+kvBZuF
	UIiWkhXWhII++dpxBY0OS2Ec4AMyIMwcVN8R/4DXrP2u/eqIRDOtIPq6GDQ+t3qwdQN2
	GJM7u0QF0oS8DLKv3G1anvmt48j5DX9ALGmyGpWLVVZE64XUSmGLPKfH3GynGzCzjXqD
	/BPQ==
X-Received: by 10.68.113.99 with SMTP id ix3mr7017203pbb.180.1378358888826;
	Wed, 04 Sep 2013 22:28:08 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	yk1sm34078967pac.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 22:28:08 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2013 15:24:39 +1000
Message-Id: <1378358679-4832-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH] resolvconf: specify configuration for systemd-tmpfiles --update
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
X-List-Received-Date: Thu, 05 Sep 2013 05:28:06 -0000

Running systemd-tmpfiles --update without specifying a configuration
file results in all tmpfiles.d configuration files being processed.

/usr/lib/tmpfiles.d/systemd.conf creates /run/nologin on boot to
prevent non-root users from logging in while the system is booting.
If systemd-tmpfiles --update is run after the system has started,
it will still create /run/nologin which would prevent non-root users
from logging in with the message "System is booting up.".

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb
index eb1ce8d..5897e40 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb
@@ -45,7 +45,7 @@ do_install () {
 pkg_postinst_${PN} () {
 	if [ -z "$D" ]; then
 		if command -v systemd-tmpfiles >/dev/null; then
-			systemd-tmpfiles --create
+			systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/resolvconf.conf
 		elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
 			${sysconfdir}/init.d/populate-volatile.sh update
 		fi
-- 
1.8.4


