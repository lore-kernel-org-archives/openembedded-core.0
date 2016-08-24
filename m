Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D66006AC37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 09:12:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7O9Cpn4023664
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 24 Aug 2016 02:12:51 -0700
Received: from pek-zgao-d1.corp.ad.wrs.com (128.224.162.171) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 24 Aug 2016 02:12:50 -0700
From: Zhenbo Gao <zhenbo.gao@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, <zhenbo.gao@windriver.com>
Date: Wed, 24 Aug 2016 17:12:38 +0800
Message-ID: <1472029958-18720-1-git-send-email-zhenbo.gao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] groff: correct the location path for awk
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
X-List-Received-Date: Wed, 24 Aug 2016 09:12:55 -0000
Content-Type: text/plain

awk is located at /usr/bin/, but not /bin/

Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
---
 meta/recipes-extended/groff/groff_1.22.3.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/groff/groff_1.22.3.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
index 4bffa81..af5acbe 100644
--- a/meta/recipes-extended/groff/groff_1.22.3.bb
+++ b/meta/recipes-extended/groff/groff_1.22.3.bb
@@ -56,6 +56,12 @@ do_install_append() {
 	if [ -e ${D}${libdir}/charset.alias ]; then
 		rm -rf ${D}${libdir}/charset.alias
 	fi
+
+	# awk is located at /usr/bin/, not /bin/
+	SPECIAL_AWK=`find ${D} -name special.awk`
+	if [ -f ${SPECIAL_AWK} ]; then
+		sed -i -e 's:#!.*awk:#! ${USRBINPATH}/awk:' ${SPECIAL_AWK}
+	fi
 }
 
 do_install_append_class-native() {
-- 
1.9.1


