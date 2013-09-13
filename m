Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2004761864
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 05:33:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8D5XMRQ015012
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 22:33:22 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 12 Sep 2013 22:33:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 13:33:12 +0800
Message-ID: <d3c924e16dee61ab6f9b53212879ae9b08d94240.1379049723.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1379049723.git.hongxu.jia@windriver.com>
References: <cover.1379049723.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] shadow: move su to /bin for lsb command check test
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
X-List-Received-Date: Fri, 13 Sep 2013 05:33:20 -0000
Content-Type: text/plain

In busybox, util-linux and shadow, su has been moved to /usr/bin/,
but lsb cmdchk needs su in /bin.

Move su to /bin could fix this issue.

[YOCTO#5175]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index 31cef20..3abb325 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -113,6 +113,7 @@ do_install() {
 	fi
 	if [ "${bindir}" != "${base_bindir}" ]; then
 		mv ${D}${bindir}/login ${D}${base_bindir}/login
+		mv ${D}${bindir}/su ${D}${base_bindir}/su
 	fi
 
 	# Handle link properly after rename, otherwise missing files would
@@ -129,7 +130,7 @@ ALTERNATIVE_LINK_NAME[chpasswd] = "${sbindir}/chpasswd"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
 ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
 ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
-ALTERNATIVE_LINK_NAME[su] = "${bindir}/su"
+ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
 
 pkg_postinst_${PN} () {
 	if [ "x$D" != "x" ]; then
-- 
1.8.1.2


