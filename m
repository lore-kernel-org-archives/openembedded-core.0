Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 738F460851
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 04:48:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w724mnXx007752
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2018 21:48:49 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 21:48:49 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Aug 2018 12:52:43 +0800
Message-ID: <8cdd92b9174133a4e0ea9636bd2678a9629bf225.1533185524.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1533185524.git.Qi.Chen@windriver.com>
References: <cover.1533185524.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] man-db: remove '--disable-cache-owner' option
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
X-List-Received-Date: Thu, 02 Aug 2018 04:48:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The following error appeared at boot.

  systemd-tmpfiles[115]: [/usr/lib/tmpfiles.d/man-db.conf:1] Unknown user '1w'

By default cache owner is enabled and defaults to 'man'. Users could
supply '--enable-cache-owner=[ARG]' to change the default cache owner.
Using '--disable-cache-owner' leaves the ownership of system-wide
cache files unconstrained, and users will allowed to modify them.

We'd better keep the default behavior, just like other distros do.

I can guess that we used '--disable-cache-owner' to bypass the following
error at do_install.

  | chown: invalid user: ‘man:man’

The 'man' user is provided by base-passwd recipe, so add it to DEPENDS.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/man-db/man-db_2.8.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/man-db/man-db_2.8.3.bb b/meta/recipes-extended/man-db/man-db_2.8.3.bb
index 412e572..a214bd7 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.3.bb
+++ b/meta/recipes-extended/man-db/man-db_2.8.3.bb
@@ -8,14 +8,14 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz"
 SRC_URI[md5sum] = "6f3055e18fdd1ce5cbbdb30403991ec7"
 SRC_URI[sha256sum] = "5932a1ca366e1ec61a3ece1a3afa0e92f2fdc125b61d236f20cc6ff9d80cc4ac"
 
-DEPENDS = "libpipeline gdbm groff-native"
+DEPENDS = "libpipeline gdbm groff-native base-passwd"
 
 # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
 USE_NLS_libc-musl = "no"
 
 inherit gettext pkgconfig autotools
 
-EXTRA_OECONF = "--with-pager=less --disable-cache-owner"
+EXTRA_OECONF = "--with-pager=less"
 
 do_install_append_libc-musl() {
         rm -f ${D}${libdir}/charset.alias
-- 
1.9.1


