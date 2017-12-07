Return-Path: <gael.portay@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 74FA4605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 21:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CE6D09C1BB3;
	Thu,  7 Dec 2017 16:15:32 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id rZMsd9fS9Wla; Thu,  7 Dec 2017 16:15:32 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 451209C2F43;
	Thu,  7 Dec 2017 16:15:32 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id DHUhPMxh8UFf; Thu,  7 Dec 2017 16:15:32 -0500 (EST)
Received: from archlinux.mtl.sfl (unknown [192.168.50.172])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 182199C1BB3;
	Thu,  7 Dec 2017 16:15:32 -0500 (EST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org,
	Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Thu,  7 Dec 2017 16:16:10 -0500
Message-Id: <20171207211610.19158-1-gael.portay@savoirfairelinux.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Cc: Ash Charles <ash.charles@savoirfairelinux.com>
Subject: [PATCH 1/1] package_manager.py: fix opkg custom config path
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
X-List-Received-Date: Thu, 07 Dec 2017 21:15:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The opkg custom config feature has moved to the package_manager python
module. This feature is broken since commit 19c538f57c.

The python function os.path.join joins path components. If a component
is an absolute path, all previous components are thrown away.

The sysconfdir variable is an absolute path component. It causes the
leading target rootfs component to be removed. As a result, the
package-manager module tries to write in the real root filesystem
instead of the temporary work directory for the rootfs image.

This fixes the issue by prepending the target rootfs component using the
string concatenation operator when the file is opened (without using
os.path module).

Cc: Ash Charles <ash.charles@savoirfairelinux.com>
Signed-off-by: Ga=C3=ABl PORTAY <gael.portay@savoirfairelinux.com>
---
 meta/lib/oe/package_manager.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager=
.py
index 6cbb61fd84..ac29593f88 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -953,12 +953,11 @@ class OpkgPM(OpkgDpkgPM):
             """
             if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI') or "") !=3D "":
                 for arch in self.pkg_archs.split():
-                    cfg_file_name =3D os.path.join(self.target_rootfs,
-                                                 self.d.getVar("sysconfd=
ir"),
+                    cfg_file_name =3D os.path.join(self.d.getVar("syscon=
fdir", True),
                                                  "opkg",
                                                  "local-%s-feed.conf" % =
arch)
=20
-                    with open(cfg_file_name, "w+") as cfg_file:
+                    with open(self.target_rootfs + cfg_file_name, "w+") =
as cfg_file:
                         cfg_file.write("src/gz local-%s %s/%s" %
                                        (arch,
                                         self.d.getVar('FEED_DEPLOYDIR_BA=
SE_URI'),
--=20
2.15.0


