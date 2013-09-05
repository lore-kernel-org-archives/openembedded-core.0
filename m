Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 539FA6BBC4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:48:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r85CmcKX006382
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Sep 2013 05:48:39 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 5 Sep 2013 05:48:38 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Sep 2013 20:49:07 +0800
Message-ID: <c2178953aaad8b6c2c14991af17eb6da9d0df2c9.1378385266.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378385266.git.Qi.Chen@windriver.com>
References: <cover.1378385266.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ptest.bbclass: add cleandirs flag to do_install_ptest_base
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
X-List-Received-Date: Thu, 05 Sep 2013 12:48:36 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The do_install_ptest_base task should have cleandirs flag, just like
the do_install task. The ${D}${PTEST_PATH} directory should be cleaned,
Otherwise, there would be similar errors like below if the
do_install_ptest_base task is rerun.

    ln: failed to create symbolic link `xxx': File exists

[YOCTO #5129]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/ptest.bbclass |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 71183af..188afcd 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -48,6 +48,8 @@ do_install_ptest_base() {
     fi
 }
 
+do_install_ptest_base[cleandirs] = "${D}${PTEST_PATH}"
+
 addtask configure_ptest_base after do_configure before do_compile
 addtask compile_ptest_base   after do_compile   before do_install
 addtask install_ptest_base   after do_install   before do_package
-- 
1.7.9.5


