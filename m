Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrew_Gabbasov@mentor.com>) id 1R8t36-0004Jh-69
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 14:15:40 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1R8sxp-00025T-Cx from Andrew_Gabbasov@mentor.com ;
	Wed, 28 Sep 2011 05:10:13 -0700
Received: from [172.30.176.48] ([172.30.176.48]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 28 Sep 2011 05:00:34 -0700
Message-ID: <4E830E90.6010607@mentor.com>
Date: Wed, 28 Sep 2011 16:09:52 +0400
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-OriginalArrivalTime: 28 Sep 2011 12:00:34.0702 (UTC)
	FILETIME=[3AA13AE0:01CC7DD6]
Subject: [PATCH] apr: use ${HOST_SYS}-libtool
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Sep 2011 12:15:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

libtool-cross uses ${HOST_SYS}- prefix while building and installing.
In some cases that may be different from ${TARGET_PREFIX}, that is currently
used in apr recipe. It's better to have them consistent.

Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
---
 meta/recipes-support/apr/apr_1.4.5.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/apr/apr_1.4.5.bb b/meta/recipes-support/apr/apr_1.4.5.bb
index b65e042..173402a 100644
--- a/meta/recipes-support/apr/apr_1.4.5.bb
+++ b/meta/recipes-support/apr/apr_1.4.5.bb
@@ -47,7 +47,7 @@ apr_sysroot_preprocess () {
 	cp ${S}/build/apr_rules.mk $d/
 	sed -i s,apr_builddir=.*,apr_builddir=,g $d/apr_rules.mk
 	sed -i s,apr_builders=.*,apr_builders=,g $d/apr_rules.mk
-	sed -i s,LIBTOOL=.*,LIBTOOL=\$\(SHELL\)\ ${TARGET_PREFIX}libtool,g $d/apr_rules.mk
+	sed -i s,LIBTOOL=.*,LIBTOOL=\$\(SHELL\)\ ${HOST_SYS}-libtool,g $d/apr_rules.mk
 	sed -i s,\$\(apr_builders\),${STAGING_DATADIR}/apr/,g $d/apr_rules.mk
 	cp ${S}/build/mkdir.sh $d/
 	cp ${S}/build/make_exports.awk $d/


