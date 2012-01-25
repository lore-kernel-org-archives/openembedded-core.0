Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rpxyg-0006ri-Rs
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 09:13:10 +0100
Received: by eaal12 with SMTP id l12so963508eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 00:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=s3hrzsnEo9rt8mmH6ASCwKXAPTRpd1GDLLHg8IwJHoE=;
	b=vhCf9sfoaFuHDiZFmNttDZZCwFbq8A1BM/4wjCADYCRT1VFo2j2CcK2qm548dXcLrZ
	xt67dicyicrmWuMGF9vxlbhVYmtHSvK8GohQop6623CrDrLdOKAUGo3gY9X2V22jQqxu
	pTgLstRgwZ/3MYTKokrcVBvM6LBJoAIsnZ/8Y=
Received: by 10.213.9.65 with SMTP id k1mr952415ebk.142.1327478724531;
	Wed, 25 Jan 2012 00:05:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm78388117eei.3.2012.01.25.00.05.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 00:05:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2012 09:05:15 +0100
Message-Id: <1327478715-11214-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [PATCH] rootfs_ipk: remove runtime_script_required usage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jan 2012 08:13:10 -0000

* it was introduced in 87780fc09b066525e47d0f50ee5497db54d304cd
* then partially removed in 2feba313c991170747381c7cf821a45c2cd04632
* so remove this use too as runtime_script_required is not initialized anymore and results in
  run.do_rootfs.6328: line 235: [: -eq: unary operator expected

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/rootfs_ipk.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 48fb2fb..5342035 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -90,7 +90,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 	rm -f ${IMAGE_ROOTFS}${opkglibdir}/lists/*
 
 	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
-		if [ $runtime_script_required -eq 0 ]; then
+		if ! grep Status:.install.ok.unpacked ${IMAGE_ROOTFS}${opkglibdir}status; then
 			# All packages were successfully configured.
 			# update-rc.d, base-passwd are no further use, remove them now
 			opkg-cl ${IPKG_ARGS} --force-depends remove update-rc.d base-passwd || true
-- 
1.7.8.4



