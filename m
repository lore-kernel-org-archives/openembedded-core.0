Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Greylist: delayed 591 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 Feb 2019 13:30:14 UTC
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
	by mail.openembedded.org (Postfix) with ESMTP id 02AB8745D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 13:30:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,415,1544482800"; 
   d="scan'208";a="6390594"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
	by mx1-pgp.tq-group.com with ESMTP; 26 Feb 2019 14:20:23 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
	by tq-pgp-pr1.tq-net.de (PGP Universal service);
	Tue, 26 Feb 2019 14:20:23 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Tue, 26 Feb 2019 14:20:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
	t=1551187223; x=1582723223;
	h=from:to:cc:subject:date:message-id;
	bh=ZAS/JIvwvDNeiBx3Yg40/TB8Z1wBXFTfE1V1oMgkZq4=;
	b=pCFFVWAtILhlIPQzWcrC/etYjEl+72VzDhLZPTwwV9j6Hs4zHD5R354L
	dn6LvkK2i9HtjgP1qOyxyN2jStEfpmPSfZUohLmYs//ksvfJlJz7mqQ8n
	+Rjw/1iRZufpxNyRBjbvgtWFaKGIwXrwcOoyRn1e+VuuauDRgC1hGBwl4
	KeW+Keh+nX5Bnfc939DeqgOLvZ+KfW52kypuRKmII15AmxUUPbaY+f8wH
	PWVjveune/mXJ1G/mpZRRYh9zfIfvKsfYuSmjx2M+VnCxcprJ/sKyNa6X
	wD/YJ7rjaiI2f3qH0gzhMA6K8MZ8TnHylyys3l56pNC8QrJJ7sw9Pgorr w==;
X-IronPort-AV: E=Sophos;i="5.58,415,1544482800"; 
   d="scan'208";a="6390593"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
	by mx1.tq-group.com with ESMTP; 26 Feb 2019 14:20:23 +0100
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
	[10.117.49.26])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 4015F280074;
	Tue, 26 Feb 2019 14:20:30 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2019 14:19:31 +0100
Message-Id: <20190226131931.9755-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH master thud] systemd: move "machines" symlinks to systemd-container
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
X-List-Received-Date: Tue, 26 Feb 2019 13:30:15 -0000

Move symlinks to the machines.target and var-lib-machines.mount units to
the systemd-container package, where the pointed at units are located as
well.

This avoids an implicit dependency of the systemd package on
systemd-container, preventing the use of systemd without pulling in
container support.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 meta/recipes-core/systemd/systemd_239.bb | 3 +++
 1 file changed, 3 insertions(+)

The fix can also be cherry-picked to Sumo without conflicts (in fact, Rocko
is affected as well, but I think that's EOL?). Please let me know if you
want me to submit a separate patch for Sumo, or if fixing this in the older
releases is not desired.

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 7af297245a..ef5020040c 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -421,12 +421,15 @@ SYSTEMD_SERVICE_${PN}-remote = "systemd-journal-remote.socket"
 
 FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.conf \
                          ${sysconfdir}/dbus-1/system.d/org.freedesktop.machine1.conf \
+                         ${sysconfdir}/systemd/system/multi-user.target.wants/machines.target \
                          ${base_bindir}/machinectl \
                          ${bindir}/systemd-nspawn \
                          ${nonarch_libdir}/systemd/import-pubring.gpg \
                          ${systemd_system_unitdir}/busnames.target.wants/org.freedesktop.import1.busname \
                          ${systemd_system_unitdir}/busnames.target.wants/org.freedesktop.machine1.busname \
                          ${systemd_system_unitdir}/local-fs.target.wants/var-lib-machines.mount \
+                         ${systemd_system_unitdir}/machines.target.wants/var-lib-machines.mount \
+                         ${systemd_system_unitdir}/remote-fs.target.wants/var-lib-machines.mount \
                          ${systemd_system_unitdir}/machine.slice \
                          ${systemd_system_unitdir}/machines.target \
                          ${systemd_system_unitdir}/org.freedesktop.import1.busname \
-- 
2.17.1


