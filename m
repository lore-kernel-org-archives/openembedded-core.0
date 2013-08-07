Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id B98F46066A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 03:33:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,829,1367942400"; 
   d="scan'208";a="8139884"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 07 Aug 2013 11:30:17 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r773XJrJ006438
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Aug 2013 11:33:19 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013080711315657-474888 ;
	Wed, 7 Aug 2013 11:31:56 +0800 
Message-ID: <5201BFFF.6040209@cn.fujitsu.com>
Date: Wed, 07 Aug 2013 11:33:19 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/08/07 11:31:56,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/08/07 11:31:57,
	Serialize complete at 2013/08/07 11:31:57
Subject: [PATCH]bash: reference acl*.m4 from ${S}
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
X-List-Received-Date: Wed, 07 Aug 2013 03:33:22 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

bash: reference acl*.m4 from ${S}.

The build directory had been moved to ${WORKDIR}/build,
so we should reference acl*.m4 from ${S}.
Otherwise, the following configure error will be caught.

  | cat: aclocal.m4: No such file or directory
  | ERROR: Function failed: do_configure (log file is located at ...)

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>

---
 meta/recipes-extended/bash/bash.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 2f4519c..64b476f 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -20,8 +20,8 @@ export AUTOHEADER = "true"
 RDEPENDS_${PN}-ptest += "make"
 
 do_configure_prepend () {
-	if [ ! -e acinclude.m4 ]; then
-		cat aclocal.m4 > acinclude.m4
+	if [ ! -e ${S}/acinclude.m4 ]; then
+		cat ${S}/aclocal.m4 > ${S}/acinclude.m4
 	fi
 }
 
-- 
1.7.7



