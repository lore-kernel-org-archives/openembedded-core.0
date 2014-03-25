Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 610B96FB21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 03:05:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2P3531H016807
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 20:05:04 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 24 Mar 2014 20:05:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Mar 2014 11:10:52 +0800
Message-ID: <5d70928a37ce6dbebf41d42ca1f09d99b272a728.1395717014.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1395717014.git.liezhi.yang@windriver.com>
References: <cover.1395717014.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] base-files: do_install.sigdata: remove the depends on DATE
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
X-List-Received-Date: Tue, 25 Mar 2014 03:05:05 -0000
Content-Type: text/plain

If we run "bitbake -S base-files" today, and re-run it tomorrow with
nothing changed, we would see that the do_install.sigdata changes
because of:

do_intall -> do_install_basefilesissue -> DISTRO_VERSION -> DATE

We had set:
IMAGE_NAME[vardepsexclude] += "DATETIME"
in meta/conf/bitbake.conf, we can set a similar line in
base-files_3.0.14.bb to fix the problem.

[YOCTO #6032]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index cee19a1..9699e31 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -103,6 +103,7 @@ do_install () {
 	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
 }
 
+DISTRO_VERSION[vardepsexclude] += "DATE"
 do_install_basefilesissue () {
 	if [ "${hostname}" != "" ]; then
 		if [ -n "${MACHINE}" -a "${hostname}" = "openembedded" ]; then
-- 
1.8.3.1


