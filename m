Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 0049561223
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 09:39:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,817,1367942400"; 
   d="scan'208";a="8121601"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 05 Aug 2013 17:36:07 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r759d4uL005456
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Aug 2013 17:39:08 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013080517374437-410477 ;
	Mon, 5 Aug 2013 17:37:44 +0800 
Message-ID: <51FF72B7.9070706@cn.fujitsu.com>
Date: Mon, 05 Aug 2013 17:39:03 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/08/05 17:37:44,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/08/05 17:37:48,
	Serialize complete at 2013/08/05 17:37:48
Subject: [PATCH] icu: fix configure error
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
X-List-Received-Date: Mon, 05 Aug 2013 09:39:11 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

If we don't create ${STAGING_ICU_DIR_NATIVE} before doing 
do_configure for cross target, the following will be caught.

 |configure: error: No such directory ${cross_buildroot} supplied as
 | the argument to --with-cross-build. Use an absolute path.
 |Configure failed. The contents of all config.log files follows to
 | aid debugging
 |ERROR: oe_runconf failed

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>

---
 meta/recipes-support/icu/icu.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index e3944cd..3987e42 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -27,6 +27,7 @@ EXTRA_OECONF_class-native = ""
 # http://bugs.icu-project.org/trac/ticket/9790
 do_configure_prepend() {
     [ -f ${S}/acinclude.m4 ] || cp ${S}/aclocal.m4 ${S}/acinclude.m4
+    [ -d ${STAGING_ICU_DIR_NATIVE} ] || mkdir -p ${STAGING_ICU_DIR_NATIVE}
 }
 
 do_install_append_class-native() {
-- 
1.7.7




