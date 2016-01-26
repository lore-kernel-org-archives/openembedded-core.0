Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id A1323761D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 16:20:02 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id b14so139162793wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 08:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PGYwTYvgvriuiPiMO83sFmD9cO6rHcboyO8TV8YBH6U=;
	b=ll/3rWTZHlaggOvx+wEEhEcJEb9YyJ2BlbzsU00/txzNvrL8vdLMG58rp+FllqzqCl
	Rd5zZ/NvfqdHtS39u5hRLfTFT7miy52hrNcLSpg+kzKJIqJtrEQduFnZkDm1SNZFfwy5
	12hsOWCoATUVN+lVeot2QnDKbkyGosIR+5juWKSxDZTxq5cbXtPUxhzBWLyRxoJM9F5g
	vomEWJ59LQUxNZ9xQtkFjxcsd21W1xBRdsl5PU/Mx/PTURAoP5FnWjU6sOTYA8KUwRsj
	xj8ufNRju5obEmF6sbbhyrKBAY8/A59ULGPnO/M3lg3nHY6ERJIZmnogNs9v6EESMusQ
	PVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PGYwTYvgvriuiPiMO83sFmD9cO6rHcboyO8TV8YBH6U=;
	b=Wk04FJsHVyTpkINeN9r54npG9vSWaNbEsvBVFtUOAD4oi7gO/QZRwZXvfkLrw7s9o+
	c82eKo4lpdFQTiJRFkAJSzoBOck4e2ya/e/4xoCBuUhBz3niIQU9wEtrkJ75h1c9f005
	3gmgUwM2xjRMwBKu7Yf8UNnmuy4pAOW1uQh/4n5QCGBrGdcPG7OoVH6daI6Dih5Vterw
	p/f8tvtLgjoIM4v+Rsqcsho3llunEsoQFpDs0+TRRLJa3wKBGMtPXm6eVmShr6HONBD4
	ALUHNOZExP/AWSjzl27d6OgrDBKg6coAlvQaa1xsnbKxzk76zAwlNpv4hjtMlt0ebsAa
	4rDA==
X-Gm-Message-State: AG10YORnu/gJO6eAdf3wNN3c84O/9PfKwekcjgj+CQv2XczovJjUrFFt9CK3JtIiZXKOwDnD
X-Received: by 10.194.240.234 with SMTP id wd10mr27454006wjc.129.1453825202634;
	Tue, 26 Jan 2016 08:20:02 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w23sm4234395wmd.1.2016.01.26.08.20.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 08:20:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 16:20:00 +0000
Message-Id: <1453825200-32675-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] rootfs-postcommands: fix allow-empty-password on read-only rootfs
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
X-List-Received-Date: Tue, 26 Jan 2016 16:20:03 -0000

When a read-only rootfs is being used sshd uses a different sshd_config file,
which also needs to be editted.

[ YOCTO #8680 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 0736d6c..f5d6147 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -113,8 +113,8 @@ zap_empty_root_password () {
 #
 ssh_allow_empty_password () {
 	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
-		sed -i 's/^[#[:space:]]*PermitRootLogin.*/PermitRootLogin yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
-		sed -i 's/^[#[:space:]]*PermitEmptyPasswords.*/PermitEmptyPasswords yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
+		sed -i 's/^[#[:space:]]*PermitRootLogin.*/PermitRootLogin yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config_readonly
+		sed -i 's/^[#[:space:]]*PermitEmptyPasswords.*/PermitEmptyPasswords yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config_readonly
 	fi
 
 	if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
-- 
2.6.4


