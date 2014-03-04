Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0F9186EFC3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 10:07:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s24A7Mdh000543
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Mar 2014 02:07:22 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 4 Mar 2014 02:07:22 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Mar 2014 18:07:57 +0800
Message-ID: <1393927677-18898-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] rpcbind: add rpc user and run rpcbind daemon with rpc user
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
X-List-Received-Date: Tue, 04 Mar 2014 10:07:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

For security policy, change to run rpcbind daemon with rpc user
just like Redhat does, so set the --with-rpcuser to rpc and add rpc user.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
index d9eb1a2..23219e0 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
@@ -37,7 +37,13 @@ INITSCRIPT_PARAMS = "start 12 2 3 4 5 . stop 60 0 1 6 ."
 SYSTEMD_SERVICE_${PN} = "rpcbind.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-EXTRA_OECONF += " --enable-warmstarts "
+inherit useradd
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --no-create-home \
+                       --shell /bin/false --user-group rpc"
+
+EXTRA_OECONF += " --enable-warmstarts --with-rpcuser=rpc"
 
 do_install_append () {
 	mv ${D}${bindir} ${D}${sbindir}
-- 
1.7.9.5


