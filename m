Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1A7972B1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 06:03:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2P63IWD021416
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 23:03:20 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 24 Mar 2015 23:03:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Mar 2015 14:03:25 +0800
Message-ID: <4493f45f7db4274425f6eee908543f82b63dd6e5.1427263291.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1427263291.git.Qi.Chen@windriver.com>
References: <cover.1427263291.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: fix SULOGIN path
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
X-List-Received-Date: Wed, 25 Mar 2015 06:03:19 -0000
Content-Type: text/plain

Fix SULOGIN path so that rescue.service doesn't use `sulogin' from the sysroot
part of the build on host, which would lead to errors like below when booting
into rescue mode.

    /bin/sh: /buildarea2/chenqi/poky/build-systemd/tmp/sysroots/x86_64-linux/sbin/sulogin: not found

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_219.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index f2d3c13..843e30b 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -123,6 +123,7 @@ do_configure_prepend() {
 	export AR="${HOST_PREFIX}gcc-ar"
 	export RANLIB="${HOST_PREFIX}gcc-ranlib"
 	export KMOD="${base_bindir}/kmod"
+	export SULOGIN="${base_sbindir}/sulogin"
 	if [ -d ${S}/units.pre_sed ] ; then
 		cp -r ${S}/units.pre_sed ${S}/units
 	else
-- 
1.9.1


