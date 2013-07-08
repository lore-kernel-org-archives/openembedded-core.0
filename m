Return-Path: <net147@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB2B6AF13
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 13:16:06 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id xb12so4259171pbc.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2013 06:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=CjMv1esorj2V/TaYEvN5e6sIuxZnzlYFezzMSMX/tfg=;
	b=Ps3Kg/Nn9A60G2/UmE9LHvLHEdJrlvL1+thghGAAFAGzrh00bmLYR5lZqd4QHCp9Wq
	CA5QcnLyF7XIUkHNfQEXGpnw1Cjk6Lmfn0CCchOWxg5q3qKGOhM77Mc0FjB8X/SK24ig
	KNiIe2YLKQVd6a4NsDBSH8867vzxxcEHEMCOKhIGZra2iwEjM0mhlQq2sISrl7HThru5
	LAT0vLdkHXfclE8BTn+SIbP0myWe3VhT5m2TUkAEgEdVMSb18yzJWtx5tvSCVQEsH1kH
	7CJZYZO/Vhc2fhqOjAL7tWu4Wv0NAkYil7nkToAWELPDdQrV++thmEI9raV/drqhokD7
	2Guw==
X-Received: by 10.68.230.40 with SMTP id sv8mr21314456pbc.30.1373289367604;
	Mon, 08 Jul 2013 06:16:07 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id wg6sm22509613pbc.3.2013.07.08.06.16.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 06:16:06 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2013 23:31:41 +1000
Message-Id: <1373290301-16657-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] resolvconf: check if running systemd in postinst
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
X-List-Received-Date: Mon, 08 Jul 2013 13:16:06 -0000

Check if running systemd in postinst by testing for existence of
/sys/fs/cgroup/systemd instead of checking if systemd-tmpfiles
exists in PATH. This is so populate-volatile.sh update is called
instead of systemd-tmpfiles --create if the system has
systemd-tmpfiles installed but was booted using sysvinit.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.73.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.73.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.73.bb
index ea5b6dd..c8f510b 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.73.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.73.bb
@@ -44,7 +44,7 @@ do_install () {
 
 pkg_postinst_${PN} () {
 	if [ -z "$D" ]; then
-		if command -v systemd-tmpfiles >/dev/null; then
+		if [ -e /sys/fs/cgroup/systemd ]; then
 			systemd-tmpfiles --create
 		elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
 			${sysconfdir}/init.d/populate-volatile.sh update
-- 
1.8.3.2


