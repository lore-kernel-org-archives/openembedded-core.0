Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A17A77FC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 07:22:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9V7MBp1023846
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 00:22:11 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 31 Oct 2017 00:22:10 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Oct 2017 15:20:36 +0800
Message-ID: <01beedbbf87cc11031763ab24838907610fdc4d6.1509434339.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1509434339.git.jackie.huang@windriver.com>
References: <cover.1509434339.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] glibc/nscd: do not cache for netgroup by default
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
X-List-Received-Date: Tue, 31 Oct 2017 07:22:10 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

We don't have /etc/netgroup by default, so do not
cache for netgroup by default to avoid:
nscd[529]: 529 disabled inotify-based monitoring for file `/etc/netgroup': No such file or directory
nscd[529]: 529 stat failed for file `/etc/netgroup'; will try again later: No such file or directory

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 1c3782dbb0..c4ca94c981 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -98,6 +98,7 @@ do_install_append () {
 	install -m 0755 ${S}/nscd/nscd.init ${D}${sysconfdir}/init.d/nscd
 	install -m 0755 ${S}/nscd/nscd.conf ${D}${sysconfdir}/nscd.conf
 	sed -i "s%daemon%start-stop-daemon --start --exec%g" ${D}${sysconfdir}/init.d/nscd
+	sed -i "s|\(enable-cache\t\+netgroup\t\+\)yes|\1no|" ${D}${sysconfdir}/nscd.conf
 
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${S}/nscd/nscd.service ${D}${systemd_unitdir}/system/
-- 
2.11.0


