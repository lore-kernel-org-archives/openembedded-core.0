Return-Path: <gyurco@freemail.hu>
X-Greylist: delayed 495 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 08 Jul 2016 20:59:40 UTC
Received: from mail-outd.mail.t-online.hu (mail-outd.mail.t-online.hu
	[195.228.240.57])
	by mail.openembedded.org (Postfix) with ESMTP id 880A7605BA
	for <Openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 20:59:40 +0000 (UTC)
Received: from fsmeopfe.local (1F2EA8E2.dsl.pool.telekom.hu [31.46.168.226])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail01d.mail.t-online.hu (Postfix) with ESMTPSA id 3rmRVM0TCFzJkC
	for <Openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 22:51:22 +0200 (CEST)
From: Szombathelyi =?ISO-8859-1?Q?Gy=F6rgy?= <gyurco@freemail.hu>
To: Openembedded-core@lists.openembedded.org
Date: Fri, 08 Jul 2016 22:51:22 +0200
Message-ID: <1659240.gic3gn4U7I@gyurco.localdomain>
User-Agent: KMail/5.2.2 (Linux/4.6.3-300.fc24.x86_64; KDE/5.23.0; x86_64; ; )
MIME-Version: 1.0
X-DCC--Metrics: mail01d.mail.t-online.hu 1308; Body=1 Fuz1=1 Fuz2=1
X-Spam-Probability: 1.71976682894e-07
Subject: [PATCH]nfs-utils: fix systemd nfs-server dependencies
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
X-List-Received-Date: Fri, 08 Jul 2016 20:59:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

    
    - Fix a circular dependency between nfs-mountd and nfs-server
    - Add proc-fs-nfsd.mount dependency to nfs-mountd and nfs-server
    - Start nfs-server after local-fs.target and network.target
    
    Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service 
b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
index 613ddc0..7f01e01 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
@@ -1,7 +1,7 @@
 [Unit]
 Description=NFS Mount Daemon
-After=rpcbind.service nfs-server.service
-Requires=rpcbind.service nfs-server.service
+After=rpcbind.service proc-fs-nfsd.mount
+Requires=rpcbind.service proc-fs-nfsd.mount
 
 [Service]
 EnvironmentFile=-@SYSCONFDIR@/nfs-utils.conf
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service 
b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
index 147d7a7..e8b065d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
@@ -1,7 +1,12 @@
 [Unit]
 Description=NFS Server
-Requires=rpcbind.service nfs-mountd.service
-After=rpcbind.service
+
+Requires=rpcbind.service nfs-mountd.service proc-fs-nfsd.mount
+After=local-fs.target network.target
+After=rpcbind.service nfs-mountd.service proc-fs-nfsd.mount
+
+# start/stop server before/after client
+Before=remote-fs-pre.target
 
 [Service]
 Type=oneshot


