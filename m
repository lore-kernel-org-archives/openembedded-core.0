Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E2A6F780A3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 08:02:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8582twD006567
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Sep 2017 01:02:55 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 5 Sep 2017 01:02:54 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Sep 2017 16:08:00 +0800
Message-ID: <99820d1de43a39dedd1cdba647d6ad66f8b65751.1504598502.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1504598502.git.Qi.Chen@windriver.com>
References: <cover.1504598502.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] systemd-serialgetty: remove systemd from RDEPENDS
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
X-List-Received-Date: Tue, 05 Sep 2017 08:02:55 -0000
Content-Type: text/plain

By setting systemd-serialgetty to rdepend on systemd, we are making
configuration files have runtime dependency on the main utility that
uses those configuration files. Applied with the same logic, we should
make any package that provides service files under /etc/init.d/ to have
runtime dependency on sysvinit. And this is not right.

So we should remove systemd from RDEPENDS of systemd-serialgetty.

Besides, as we have changed systemd to have systemd-serialgetty in its
RDEPENDS by default, we should avoid circular dependency issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 768b130..8d1ec7c 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -38,8 +38,6 @@ do_install() {
 	fi
 }
 
-RDEPENDS_${PN} = "systemd"
-
 # This is a machine specific file
 FILES_${PN} = "${systemd_unitdir}/system/*.service ${sysconfdir}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.9.1


