Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.7235.1631610107561604844
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 02:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18E91kkh032641
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 02:01:46 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 02:01:45 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 14 Sep 2021 02:01:45 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 14 Sep 2021 02:01:45 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 2/2] ruby: fix CVE-2021-31799
Date: Tue, 14 Sep 2021 16:57:18 +0800
Message-ID: <20210914085718.1198-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210914085718.1198-1-mingli.yu@windriver.com>
References: <20210914085718.1198-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch to fix CVE-2021-31799.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../ruby/ruby/CVE-2021-31799.patch            | 57 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.0.1.bb      |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2021-31799.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2021-31799.patch b/meta/recipes-devtools/ruby/ruby/CVE-2021-31799.patch
new file mode 100644
index 0000000000..83064e85ab
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2021-31799.patch
@@ -0,0 +1,57 @@
+From b1c73f239fe9af97de837331849f55d67c27561e Mon Sep 17 00:00:00 2001
+From: aycabta <aycabta@gmail.com>
+Date: Sun, 2 May 2021 20:52:23 +0900
+Subject: [PATCH] [ruby/rdoc] Use File.open to fix the OS Command Injection
+ vulnerability in CVE-2021-31799
+
+https://github.com/ruby/rdoc/commit/a7f5d6ab88
+
+CVE: CVE-2021-31799
+
+Upstream-Status: Backport[https://github.com/ruby/ruby/commit/b1c73f239fe9af97de837331849f55d67c27561e]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/rdoc/rdoc.rb            |  2 +-
+ test/rdoc/test_rdoc_rdoc.rb | 12 ++++++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/lib/rdoc/rdoc.rb b/lib/rdoc/rdoc.rb
+index 680a8612f7..904625f105 100644
+--- a/lib/rdoc/rdoc.rb
++++ b/lib/rdoc/rdoc.rb
+@@ -444,7 +444,7 @@ def remove_unparseable files
+     files.reject do |file, *|
+       file =~ /\.(?:class|eps|erb|scpt\.txt|svg|ttf|yml)$/i or
+         (file =~ /tags$/i and
+-         open(file, 'rb') { |io|
++         File.open(file, 'rb') { |io|
+            io.read(100) =~ /\A(\f\n[^,]+,\d+$|!_TAG_)/
+          })
+     end
+diff --git a/test/rdoc/test_rdoc_rdoc.rb b/test/rdoc/test_rdoc_rdoc.rb
+index 3910dd4656..a83d5a1b88 100644
+--- a/test/rdoc/test_rdoc_rdoc.rb
++++ b/test/rdoc/test_rdoc_rdoc.rb
+@@ -456,6 +456,18 @@ def test_remove_unparseable_tags_vim
+     end
+   end
+ 
++  def test_remove_unparseable_CVE_2021_31799
++    temp_dir do
++      file_list = ['| touch evil.txt && echo tags']
++      file_list.each do |f|
++        FileUtils.touch f
++      end
++
++      assert_equal file_list, @rdoc.remove_unparseable(file_list)
++      assert_equal file_list, Dir.children('.')
++    end
++  end
++
+   def test_setup_output_dir
+     Dir.mktmpdir {|d|
+       path = File.join d, 'testdir'
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.0.1.bb b/meta/recipes-devtools/ruby/ruby_3.0.1.bb
index ae953a0a89..4ac7383a97 100644
--- a/meta/recipes-devtools/ruby/ruby_3.0.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.0.1.bb
@@ -8,6 +8,7 @@ SRC_URI += " \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            file://CVE-2021-31810.patch \
            file://CVE-2021-32066.patch \
+           file://CVE-2021-31799.patch \
            "
 
 SRC_URI[sha256sum] = "369825db2199f6aeef16b408df6a04ebaddb664fb9af0ec8c686b0ce7ab77727"
-- 
2.32.0

