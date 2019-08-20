Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 240D97E18C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 05:47:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7K5kVwq023264
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Aug 2019 22:46:41 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 19 Aug 2019 22:46:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <armccurdy@gmail.com>,
	<alex.kanavin@gmail.com>
Date: Tue, 20 Aug 2019 01:45:18 -0400
Message-ID: <1566279918-9733-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <CAJ86T=WtuV46YbMMcGigKRrsvTNTtgWWdNLDp2P27-Zx6Rn+Yw@mail.gmail.com>
References: <CAJ86T=WtuV46YbMMcGigKRrsvTNTtgWWdNLDp2P27-Zx6Rn+Yw@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH V3] nfs-utils: decrease RLIMIT_NOFILE to 4k for systemd
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
X-List-Received-Date: Tue, 20 Aug 2019 05:47:25 -0000
Content-Type: text/plain

On systemd, it set RLIMIT_NOFILE to 512k, since do_testimage
for core-image-sato-sdk has memory limitation (256Mib) which
caused rpc.statd failed with out of memory.
[  531.306146] Out of memory: Kill process 193 (rpc.statd) score 200 or sacrifice child

The rpc.statd and rpc.mountd allocates memory according to
RLIMIT_NOFILE, so decrease it to 4k to keep sync with sysvinit

After applying the patch, the memory cost is the same with sysvinit:

root@qemux86-64:~# systemctl status nfs-statd
* nfs-statd.service - NFS status monitor for NFSv2/3 locking.
   Loaded: loaded (/lib/systemd/system/nfs-statd.service; enabled; vendor preset: enabled)
   Active: active (running) since Tue 2019-08-20 03:16:18 UTC; 3min 26s ago
 Main PID: 343 (rpc.statd)
    Tasks: 1 (limit: 271)
   Memory: 1.0M

root@qemux86-64:~# systemctl status nfs-mountd
* nfs-mountd.service - NFS Mount Daemon
   Loaded: loaded (/etc/systemd/system/nfs-mountd.service; enabled; vendor preset: enabled)
   Active: active (running) since Tue 2019-08-20 03:19:01 UTC; 1min 21s ago
 Main PID: 451 (rpc.mountd)
    Tasks: 1 (limit: 271)
   Memory: 736.0K

Suggested-by: Chen Qi <qi.chen@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service | 1 +
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service  | 1 +
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb           | 4 ++++
 3 files changed, 6 insertions(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
index 3c3a802..c01415d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
@@ -11,6 +11,7 @@ ConditionPathExists=@SYSCONFDIR@/exports
 [Service]
 EnvironmentFile=-@SYSCONFDIR@/nfs-utils.conf
 ExecStart=@SBINDIR@/rpc.mountd -F $MOUNTD_OPTS
+LimitNOFILE=@HIGH_RLIMIT_NOFILE@
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
index 6e196b8..4fa64e1 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
@@ -8,6 +8,7 @@ After=network.target nss-lookup.target rpcbind.service
 [Service]
 EnvironmentFile=-@SYSCONFDIR@/nfs-utils.conf
 ExecStart=@SBINDIR@/rpc.statd -F $STATD_OPTS
+LimitNOFILE=@HIGH_RLIMIT_NOFILE@
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
index ac4437b..28f9898 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
@@ -119,6 +119,9 @@ do_compile_prepend() {
 	make clean
 }
 
+# Works on systemd only
+HIGH_RLIMIT_NOFILE ??= "4096"
+
 do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
@@ -133,6 +136,7 @@ do_install_append () {
 	install -m 0644 ${WORKDIR}/nfs-statd.service ${D}${systemd_unitdir}/system/
 	sed -i -e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
+		-e 's,@HIGH_RLIMIT_NOFILE@,${HIGH_RLIMIT_NOFILE},g' \
 		${D}${systemd_unitdir}/system/*.service
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 	    install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_unitdir}/system/
-- 
2.8.1


