Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Greylist: delayed 593 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 03 May 2019 14:37:48 UTC
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
	by mail.openembedded.org (Postfix) with ESMTP id 37E177D70B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 14:37:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,426,1549926000"; 
   d="scan'208";a="7282713"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
	by mx1-pgp.tq-group.com with ESMTP; 03 May 2019 16:27:55 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
	by tq-pgp-pr1.tq-net.de (PGP Universal service);
	Fri, 03 May 2019 16:27:55 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 03 May 2019 16:27:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
	t=1556893675; x=1588429675;
	h=from:to:cc:subject:date:message-id;
	bh=7pgLkJ+k+KeD/nZR5PtLSoco5PGic7ZxE+hZQr7l74o=;
	b=ZNgtAREIEr4lRAVGLz7CWb9eU9LUkLDe50w/zj6H2kKuVFyulaDj6dvV
	5qG01t4tAXDt+zIj5qJ6UJgf3O5njVWN0gJc9qDQncHdgNjZDXVYe2q4/
	mLPOgaxk/STSFRkDE2ivKYaI7/m/EZLJMemp7GyVsqqcdbFRGN8E5nlLw
	EIVbwUlyxKI+EOX0Lnniivg7eI2N1Y4+/HjSvg+cTjlBeDvg+sqKIdaA7
	nePAo+xrmCueKWeyyImyCtfY7b6WQGWI/y5WVt/lQsL6hfzeA69/1gbkZ
	WzBueeilJSAjk8Yow7ff6dItqEDOVOytVCYUs/EdjlI9SCPpGEWQ8Ws24 w==;
X-IronPort-AV: E=Sophos;i="5.60,426,1549926000"; 
   d="scan'208";a="7282712"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
	by mx1.tq-group.com with ESMTP; 03 May 2019 16:27:55 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
	[10.117.49.26])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id D5DE9280074;
	Fri,  3 May 2019 16:27:54 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2019 16:27:33 +0200
Message-Id: <20190503142733.1974-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] systemd: move "machines" symlinks to systemd-container
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
X-List-Received-Date: Fri, 03 May 2019 14:37:48 -0000

Move symlinks to the machines.target and var-lib-machines.mount units to
the systemd-container package, where the pointed at units are located as
well.

This avoids an implicit dependency of the systemd package on
systemd-container, which prevented the use of systemd without installing
systemd-container.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: rebased to master, slightly improved commit message wording.

Applicable to all branches (at least back to Rocko) when the recipe name
is adjusted to the used systemd version.

 meta/recipes-core/systemd/systemd_242.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index a6b39d57e8..b1c0fed72f 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -402,12 +402,15 @@ SYSTEMD_SERVICE_${PN}-remote = "systemd-journal-remote.socket"
 
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


