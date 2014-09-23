Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40B45714C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 04:31:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8N4VeJS018449
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 21:31:40 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 22 Sep 2014 21:31:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Sep 2014 21:31:39 -0700
Message-ID: <fef1ff5442c6c1f0d4f7f8f600c996b2d0685fa9.1411446614.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1411446614.git.liezhi.yang@windriver.com>
References: <cover.1411446614.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ncurses: enable-pc-files requires PKG_CONFIG_LIBDIR existed
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
X-List-Received-Date: Tue, 23 Sep 2014 04:31:41 -0000
Content-Type: text/plain

Fixed ncurses.do_configure:
configure: WARNING: did not find library /path/to/tmp/sysroots/qemuarm/usr/lib/pkgconfig

And then anyone requires ncurses.pc will fail.

The configure.in checks:
[snip]
if test -n "$PKG_CONFIG_LIBDIR" && test -d "$PKG_CONFIG_LIBDIR" ; then
[snip]

Create PKG_CONFIG_LIBDIR in do_configure will fix the problem.

We can reproduce the problem by:
Set SSTATE_DIR=/path/to/sstate-cache
1) In build1, make sure everything is ready in SSTATE_DIR
$ bitbake ncurses
2) In build2, rebuild ncurses only:
$ bitbake ncurses -ccleansstate && bitbake ncurses

Then we will see the warning in log.do_configure.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/ncurses/ncurses.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 521d0e4..10f7dd1 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -98,6 +98,8 @@ do_configure() {
         # not the case for /dev/null redirections)
         export cf_cv_working_poll=yes
 
+	# The --enable-pc-files requires PKG_CONFIG_LIBDIR existed
+	mkdir -p ${PKG_CONFIG_LIBDIR}
 	( cd ${S}; gnu-configize --force )
 	ncurses_configure "narrowc" || \
 		return 1
-- 
1.7.9.5


