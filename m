Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 166E065D01
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 10:31:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3BAVqiT014661
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Apr 2014 03:31:52 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 11 Apr 2014 03:31:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 11 Apr 2014 18:31:38 +0800
Message-ID: <39ac7eb730c134523693a741987c1f744fb73673.1397212050.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1397212050.git.hongxu.jia@windriver.com>
References: <cover.1397212050.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] apr: remove the use of ${SHELL} to avoid bash/dash confliction
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
X-List-Received-Date: Fri, 11 Apr 2014 10:31:55 -0000
Content-Type: text/plain

While multible hosts sharing a common sstate cache, the fist host using
bash as default shell and build apr, the second host using dash as
default shell and build apr-util, there was a failure in apr-util:
...
| /bin/sh: 0: Can't open i586-poky-linux-libtool
| make[1]: *** [dbm/apr_dbm_gdbm.lo] Error 127
| make[1]: *** Waiting for unfinished jobs....
| make[1]: Leaving directory
`tmp/work/i586-poky-linux/apr-util/1.5.2-r0/apr-util-1.5.2'
...

The quick way to reproduce the defect in Ubuntu 1204:
1. Create a new build
2. sudo dpkg-reconfigure dash <set bash as /bin/sh>
3. bitbake apr
4. sudo dpkg-reconfigure dash <set dash as /bin/sh>
5. bitbake apr-util

Remove the use of $(SHELL) in the apr could avoid this issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/apr/apr_1.4.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr_1.4.8.bb b/meta/recipes-support/apr/apr_1.4.8.bb
index 4d36585..7a130d1 100644
--- a/meta/recipes-support/apr/apr_1.4.8.bb
+++ b/meta/recipes-support/apr/apr_1.4.8.bb
@@ -56,7 +56,7 @@ apr_sysroot_preprocess () {
 	cp ${S}/build/apr_rules.mk $d/
 	sed -i s,apr_builddir=.*,apr_builddir=,g $d/apr_rules.mk
 	sed -i s,apr_builders=.*,apr_builders=,g $d/apr_rules.mk
-	sed -i s,LIBTOOL=.*,LIBTOOL=\$\(SHELL\)\ ${HOST_SYS}-libtool,g $d/apr_rules.mk
+	sed -i s,LIBTOOL=.*,LIBTOOL=${HOST_SYS}-libtool,g $d/apr_rules.mk
 	sed -i s,\$\(apr_builders\),${STAGING_DATADIR}/apr/,g $d/apr_rules.mk
 	cp ${S}/build/mkdir.sh $d/
 	cp ${S}/build/make_exports.awk $d/
-- 
1.8.1.2


