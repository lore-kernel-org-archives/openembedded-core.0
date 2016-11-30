Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD9371B03
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 22:43:10 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 35DF9B81FA3; Wed, 30 Nov 2016 23:43:07 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 23:43:06 +0100
Message-Id: <1480545786-5069-6-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480545786-5069-1-git-send-email-obi@opendreambox.org>
References: <1480545786-5069-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 6/6] nfs-utils: sync systemd unit files with nfs-utils.git
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
X-List-Received-Date: Wed, 30 Nov 2016 22:43:10 -0000

nfs-server failed to start after installation from a package feed.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../nfs-utils/nfs-utils/nfs-mountd.service                    |  7 +++++--
 .../nfs-utils/nfs-utils/nfs-server.service                    | 11 ++++++++---
 .../nfs-utils/nfs-utils/nfs-statd.service                     |  9 +++++----
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
index 28b7388..27ea58d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
@@ -1,7 +1,10 @@
 [Unit]
 Description=NFS Mount Daemon
-After=rpcbind.service nfs-server.service
-Requires=rpcbind.service nfs-server.service
+DefaultDependencies=no
+Requires=proc-fs-nfsd.mount
+After=proc-fs-nfsd.mount
+After=network.target local-fs.target
+BindsTo=nfs-server.service
 ConditionPathExists=@SYSCONFDIR@/exports
 
 [Service]
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
index b9dfe74..6481377 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
@@ -1,7 +1,11 @@
 [Unit]
-Description=NFS Server
-Requires=rpcbind.service nfs-mountd.service
-After=rpcbind.service
+Description=NFS server and services
+DefaultDependencies=no
+Requires=network.target proc-fs-nfsd.mount
+Requires=nfs-mountd.service
+Wants=rpcbind.service
+After=local-fs.target
+After=network.target proc-fs-nfsd.mount rpcbind.service nfs-mountd.service
 ConditionPathExists=@SYSCONFDIR@/exports
 
 [Service]
@@ -10,6 +14,7 @@ EnvironmentFile=-@SYSCONFDIR@/nfs-utils.conf
 ExecStartPre=@SBINDIR@/exportfs -r
 ExecStart=@SBINDIR@/rpc.nfsd $NFSD_OPTS $NFSD_COUNT
 ExecStop=@SBINDIR@/rpc.nfsd 0
+ExecStopPost=@SBINDIR@/exportfs -au
 ExecStopPost=@SBINDIR@/exportfs -f
 ExecReload=@SBINDIR@/exportfs -r
 StandardError=syslog
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
index 746dacf..6e196b8 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
@@ -1,8 +1,9 @@
 [Unit]
-Description=NFS file locking service
-After=rpcbind.service
-Requires=rpcbind.service
-Before=remote-fs-pre.target
+Description=NFS status monitor for NFSv2/3 locking.
+DefaultDependencies=no
+Conflicts=umount.target
+Requires=nss-lookup.target rpcbind.service
+After=network.target nss-lookup.target rpcbind.service
 
 [Service]
 EnvironmentFile=-@SYSCONFDIR@/nfs-utils.conf
-- 
2.7.4


