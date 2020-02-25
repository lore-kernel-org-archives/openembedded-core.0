Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0126027B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 09:06:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01P96ZoG003363
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 01:06:35 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 25 Feb 2020 01:06:22 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Feb 2020 17:06:19 +0800
Message-ID: <20200225090619.25118-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] ruby: install required files for ptest
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
X-List-Received-Date: Tue, 25 Feb 2020 09:06:34 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

After update to 2.7.0, it fails to start ptest of ruby with errors:

| ./test/runner.rb:11:in `require_relative': cannot load such file --
    /usr/lib64/ruby/ptest/tool/test/runner (LoadError)

and

| test/rdoc/test_rdoc_attr.rb: cannot load such file -- rdoc/version
| test/did_you_mean/spell_checking/test_key_name_check.rb: cannot load
    such file -- /usr/lib64/ruby/ptest/lib/did_you_mean

Install the required files for the ptest.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/ruby/ruby_2.7.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.0.bb b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
index c796318717..268b4bebd9 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
@@ -45,6 +45,12 @@ do_install_append_class-target () {
 
 do_install_ptest () {
     cp -rf ${S}/test ${D}${PTEST_PATH}/
+
+    install -D ${S}/tool/test/runner.rb ${D}${PTEST_PATH}/tool/test/runner.rb
+    cp -r ${S}/tool/lib ${D}${PTEST_PATH}/tool/
+    mkdir -p ${D}${PTEST_PATH}/lib
+    cp -r ${S}/lib/did_you_mean ${S}/lib/rdoc ${D}${PTEST_PATH}/lib
+
     # install test-binaries
     find $(find ./.ext -path '*/-test-') -name '*.so' -print0 \
         | tar --no-recursion --null -T - --no-same-owner --preserve-permissions -cf - \
-- 
2.17.1


