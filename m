Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 55D1F7519B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 07:58:41 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 8B3442804CC; Fri, 15 Jun 2018 00:54:33 -0700 (PDT)
Date: Fri, 15 Jun 2018 00:54:33 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180615075433.GK31886@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-core@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH] coreutils: fix nativesdk install failure
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
X-List-Received-Date: Fri, 15 Jun 2018 07:58:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The change "fix hostname conflict with other packages" moved the
hostname util to the list of base_bindir_progs, so do_install_append()
now expects hostname to have been built.

coreutils do_install_append() is shared between target and nativesdk
builds (though not used by native build, see comment) so hostname should
be enabled to build on both of them.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta/recipes-core/coreutils/coreutils_8.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.29.bb b/meta/recipes-core/coreutils/coreutils_8.29.bb
index 0b8acc5..4704f32 100644
--- a/meta/recipes-core/coreutils/coreutils_8.29.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.29.bb
@@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "92d0fa1c311cacefa89853bdb53c62f4110cdfda3820346b59cbd098f4
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch,hostname --libexecdir=${libdir}"
-EXTRA_OECONF_class-nativesdk = "--enable-install-program=arch"
+EXTRA_OECONF_class-nativesdk = "--enable-install-program=arch,hostname"
 
 # acl and xattr are not default features
 #
-- 
1.9.4


