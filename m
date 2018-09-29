Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 25BDA7998B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 06:25:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T6PcPa003462
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2018 23:25:38 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 23:25:37 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 13:43:54 +0800
Message-ID: <7cf91a3e20704f362f975a75775fd864bdb2731c.1538199671.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538199671.git.kai.kang@windriver.com>
References: <cover.1538199671.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/10] os-release: fix install file conflict for multilib
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
X-List-Received-Date: Sat, 29 Sep 2018 06:25:37 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to create image when install os-release and lib32-os-release both:

| file /etc/os-release conflicts between attempted installs of
| os-release-1.0-r0.core2_64 and lib32-os-release-1.0-r0.x86

The /etc/os-release is a symlink link to ${libdir}/os-release. Actually
the content of files are identical and make /etc/os-release to be hard
link could fix the issue. But according to os-release (5), symlink link
is necessary for initrd environment such as dracut.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/os-release/os-release.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index bf4f815a10..4d5487c06d 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -1,10 +1,12 @@
-inherit allarch
-
 SUMMARY = "Operating system identification"
 DESCRIPTION = "The /usr/lib/os-release file contains operating system identification data."
 LICENSE = "MIT"
 INHIBIT_DEFAULT_DEPS = "1"
 
+inherit allarch multilib_script
+
+MULTILIB_SCRIPTS = "${PN}:${sysconfdir}/os-release"
+
 do_fetch[noexec] = "1"
 do_unpack[noexec] = "1"
 do_patch[noexec] = "1"
-- 
2.18.0


