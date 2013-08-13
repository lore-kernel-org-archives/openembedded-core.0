Return-Path: <Qi.Chen@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 99C196A9E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 06:11:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7D6Bvps002471
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 02:11:58 -0400 (EDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 12 Aug 2013 23:11:56 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Aug 2013 14:11:50 +0800
Message-ID: <3c474c960bcd4be9cc9c780298f4f44935a732a3.1376363071.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1376363071.git.Qi.Chen@windriver.com>
References: <cover.1376363071.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 2/3] image.bbclass: create device table after package installation
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
X-List-Received-Date: Tue, 13 Aug 2013 06:11:58 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Now that the makedevs supports using user/group names in the devcie
table files, and it uses passwd and group files under the rootfs which
is provided by the base-passwd package, we should let package installation
finish first, so that makedevs can get a correct mapping from user/group
names to uid/gid.

The check for existence of ${IMAGE_ROOTFS}/dev is removed. This is because
do_rootfs doesn't have 'nostamp' flag any more, so the do_rootfs task will
not be rerun for every build. Checking for the existence of ${IMAGE_ROOTFS}/dev
is not necessary any more. Besides, as base-files package also installs the
/dev directory, this checking does not serve as a good criteria.

[YOCTO #1159]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index cf02f88..af10332 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -292,9 +292,9 @@ fakeroot do_rootfs () {
 	# copy the intercept scripts
 	cp ${COREBASE}/scripts/postinst-intercepts/* ${WORKDIR}/intercept_scripts/
 
-	# If "${IMAGE_ROOTFS}/dev" exists, then the device had been made by
-	# the previous build
-	if [ "${USE_DEVFS}" != "1" -a ! -r "${IMAGE_ROOTFS}/dev" ]; then
+	rootfs_${IMAGE_PKGTYPE}_do_rootfs
+
+	if [ "${USE_DEVFS}" != "1" ]; then
 		for devtable in ${@get_devtable_list(d)}; do
 			# Always return ture since there maybe already one when use the
 			# incremental image generation
@@ -302,8 +302,6 @@ fakeroot do_rootfs () {
 		done
 	fi
 
-	rootfs_${IMAGE_PKGTYPE}_do_rootfs
-
 	# remove unneeded packages/files from the final image
 	rootfs_remove_unneeded
 
-- 
1.7.9.5


