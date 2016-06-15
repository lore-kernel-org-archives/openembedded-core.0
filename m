Return-Path: <j.remmet@phytec.de>
X-Greylist: delayed 528 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Jun 2016 13:47:07 UTC
Received: from root.phytec.de (mail.microcatalog.org.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 4760265CBB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 13:47:07 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 1628AA00301
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 15:39:14 +0200 (CEST)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016061515380913-316977 ;
	Wed, 15 Jun 2016 15:38:09 +0200 
From: Jan Remmet <j.remmet@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jun 2016 15:36:37 +0200
Message-Id: <1465997797-6613-1-git-send-email-j.remmet@phytec.de>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 15.06.2016 15:38:09,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 15.06.2016 15:38:09,
	Serialize complete at 15.06.2016 15:38:09
X-TNEFEvaluated: 1
Subject: [PATCH] rootfs-postcommands: generate /var/lib/systemd/clock
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
X-List-Received-Date: Wed, 15 Jun 2016 13:47:08 -0000

systemd timesyncd check /var/lib/systemd/clock instead of
/etc/timestamp.
If this file is missing it defaults to TIME_EPOCH. It's set while
configuring systemd.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 meta/classes/rootfs-postcommands.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index db8b551..0c7b764 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -234,6 +234,12 @@ python write_image_manifest () {
 # sane default time setting
 rootfs_update_timestamp () {
 	date -u +%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/timestamp
+
+	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
+		# touch needs timestamp as [[CC]YY]MMDDhhmm[.ss]
+		TS=$(sed 's/[.]*/&./13' ${IMAGE_ROOTFS}/etc/timestamp)
+		touch -t $TS ${IMAGE_ROOTFS}/var/lib/systemd/clock
+	fi
 }
 
 # Prevent X from being started
-- 
1.9.1


