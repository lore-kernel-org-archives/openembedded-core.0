Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9A8D712FC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 08:04:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s98844GP029510
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Oct 2014 01:04:04 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 8 Oct 2014 01:04:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Oct 2014 01:04:03 -0700
Message-ID: <f179be5fbb3674fdb89904ec8e2e14b9849a2cfb.1412755402.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1412755402.git.liezhi.yang@windriver.com>
References: <cover.1412755402.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] git: fix do_install error
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
X-List-Received-Date: Wed, 08 Oct 2014 08:04:05 -0000
Content-Type: text/plain

Fixed when MACHINE = qemux86-64 and libdir = /usr/lib64:
mv: cannot stat `/path/to/image/usr/lib64/perl-native/perl': No such file or directory

The perl-native files are always installed to /usr/lib on both 32/64
bits targets.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git.inc |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 2515833..5396628 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -36,8 +36,11 @@ perl_native_fixup () {
 	sed -i -e 's#${STAGING_BINDIR_NATIVE}/perl-native/#${bindir}/#' \
 	       -e 's#${libdir}/perl-native/#${libdir}/#' \
 	    ${@d.getVar("PERLTOOLS", True).replace(' /',d.getVar('D', True) + '/')}
-	mv ${D}${libdir}/perl-native/perl ${D}${libdir}
-	rmdir ${D}${libdir}/perl-native || true
+
+	# ${libdir} is not applicable here, perl-native files are always
+	# installed to /usr/lib on both 32/64 bits targets.
+	mv ${D}${exec_prefix}/lib/perl-native/perl ${D}${libdir}
+	rmdir -p ${D}${exec_prefix}/lib/perl-native || true
 }
 
 REL_GIT_EXEC_PATH = "${@os.path.relpath(libexecdir, bindir)}/git-core"
-- 
1.7.9.5


