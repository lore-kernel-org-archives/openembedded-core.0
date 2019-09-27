Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 222487F22D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 01:18:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8R1I4Ks020247
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 18:18:15 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 26 Sep 2019 18:17:53 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Sep 2019 21:17:53 -0400
Message-ID: <20190927011753.4718-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v2] lighttpd: remove fam as a PACKAGECONFIG option
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
X-List-Received-Date: Fri, 27 Sep 2019 01:18:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

lighttpd builds fail if "fam" (and therefore gamin) is enabled.

In conf/local.conf:

    CORE_IMAGE_EXTRA_INSTALL += "lighttpd"
    PACKAGECONFIG_append_pn-lighttpd = " fam"

bitbake error:

    ERROR: Nothing PROVIDES 'gamin' (but /yow-lpggp31/tgamblin/oe-core.git/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb DEPENDS on or otherwise requires it)
    NOTE: Runtime target 'lighttpd' is unbuildable, removing...
    Missing or unbuildable dependency chain was: ['lighttpd', 'gamin']
    ERROR: Required build target 'core-image-minimal' has no buildable providers.
    Missing or unbuildable dependency chain was: ['core-image-minimal', 'lighttpd', 'gamin']

Since gamin hasn't been maintained for several years, this should
be removed from the list of lighttpd PACKAGECONFIG options.
--without-fam is hard-coded in EXTRA_OECONF for good measure.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
index 72990d02e5..2e83c821a6 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
@@ -39,14 +39,13 @@ PACKAGECONFIG[krb5] = "--with-krb5,--without-krb5,krb5"
 PACKAGECONFIG[pcre] = "--with-pcre,--without-pcre,libpcre"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
-PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
 PACKAGECONFIG[webdav-props] = "--with-webdav-props,--without-webdav-props,libxml2 sqlite3"
 PACKAGECONFIG[webdav-locks] = "--with-webdav-locks,--without-webdav-locks,util-linux"
 PACKAGECONFIG[gdbm] = "--with-gdbm,--without-gdbm,gdbm"
 PACKAGECONFIG[memcache] = "--with-memcached,--without-memcached,libmemcached"
 PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua"
 
-EXTRA_OECONF += "--enable-lfs"
+EXTRA_OECONF += "--enable-lfs --without-fam"
 
 inherit autotools pkgconfig update-rc.d gettext systemd
 
-- 
2.21.0


